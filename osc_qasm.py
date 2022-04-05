# OSC-Qasm
# A simple OSC Python interface for executing Qasm code.
# Or a simple bridge to connect _The QAC Toolkit_ with real quantum hardware.
#
# Omar Costa Hamido / Paulo Vitor Itaboraí (2022-02-23)
# https://github.com/iccmr-quantum/OSC-Qasm
#

from pythonosc import dispatcher, osc_server, udp_client
from qiskit import *
from qiskit.test.mock import *
from qiskit.tools import job_monitor
import argparse
import sys
import socket


class FileLikeOutputOSC(object):
    ''' This class emulates a File-Like object
        with a "write()" method that can be used
        by print() and qiskit.tools.job_monitor()
        as an alternative output (replacing sys.stdout)
        to send messages through the OSC-Qasm client

        usage: print("foo", file=FileLikeOutputOSC())
        '''
    def __init__(self):
        pass

    def write(self, text):
        if text != f'\n' and text != "": # Skips end='\n'|'' argument messages
            print(text) # Print back to console
            # Send message body back to Max on info channel
            client.send_message("info", text[12:])

class FileLikeErrorOSC(object):
    ''' This class emulates a File-Like object
        with a "write()" method that can be used
        to pipe Qiskit error messages through
        the OSC-Qasm client

        usage: sys.stderr = FileLikeErrorOSC()
        '''
    def __init__(self):

        self.older="" # stderr 'memory'

    def write(self, text):
        if text != f'\n' and text != "": # Skips end='\n'|'' argument messages
            print(text) # Print back to console

            if text == ERR_SEP and self.older != ERR_SEP and self.older != "": # There is a line like ERR_SEP both at the begining and end of a qiskit error log!
                # Print the last entry before the ending ERR_SEP
                client.send_message("error", "error in osc_qasm.py: \n(...) "+self.older+"switch to python console to learn more")

            elif "KeyboardInterrupt" in text:
                # When closing the program with Ctrl+c, There is a 'KeyboardInterrupt' error message.
                client.send_message("error", "osc_qasm.py has been terminated in the Python environment.")

            self.older=text # Update memory

def run_circuit(qc, shots, backend_name):

    print("Running circuit on {}...".format(backend_name))
    client.send_message("info", "Running circuit on {}...".format(backend_name) )

    flosc = FileLikeOutputOSC() # Use this only for job_monitor output

    if backend_name != 'qasm_simulator':
        if backend_name in ('FakeAlmaden', 'FakeArmonk', 'FakeAthens', 'FakeBelem', 'FakeBoeblingen', 'FakeBogota', 'FakeBrooklyn', 'FakeBurlington', 'FakeCambridge', 'FakeCambridgeAlternativeBasis', 'FakeCasablanca', 'FakeEssex', 'FakeGuadalupe', 'FakeJakarta', 'FakeJohannesburg', 'FakeLagos', 'FakeLima', 'FakeLondon', 'FakeManhattan', 'FakeManila', 'FakeMelbourne', 'FakeMontreal', 'FakeMumbai', 'FakeOurense', 'FakeParis', 'FakePoughkeepsie', 'FakeQuito', 'FakeRochester', 'FakeRome', 'FakeRueschlikon', 'FakeSantiago', 'FakeSingapore', 'FakeSydney', 'FakeTenerife', 'FakeTokyo', 'FakeToronto', 'FakeValencia', 'FakeVigo', 'FakeYorktown'):
            backend_name+='()'
            backend = eval(backend_name) # this is definitely a security hazard... use at your own risk!
                # a very interesting alternative is to use: backend = globals()[backend_name]
            available_qubits = backend.configuration().n_qubits
            requested_qubits = qc.num_qubits
            if requested_qubits > available_qubits: # verify if the qubit count is compatible with the selected backend
                client.send_message("error", "The circuit submitted is requesting {} qubits but the {} backend selected only has {} available qubits.".format(requested_qubits,backend_name[:-2],available_qubits) )
                print('The circuit submitted is requesting {} qubits but the {} backend selected only has {} available qubits.'.format(requested_qubits,backend_name[:-2],available_qubits))
                sys.exit()
            job = execute(qc, shots=shots, backend=backend)
            pass
        else: #we then must be naming a realdevice
            if not provider: #for which we definitely need credentials! D:
                client.send_message("error", "You need to start osc_qasm.py with the following arguments: --token (--hub, --group, --project).")
                print('You need to start osc_qasm.py with the following arguments: --token (--hub, --group, --project).')
                sys.exit()
            backend = provider.get_backend(backend_name)
            job = execute(qc, shots=shots, backend=backend)
            job_monitor(job, output=flosc, line_discipline="") # 'flosc' (FileLikeOutputOSC) reroutes the output from stdout to the OSC client
    else:
        backend = Aer.get_backend('qasm_simulator')
        job = execute(qc, shots=shots, backend=backend)
    print("Done!")
    return job.result().get_counts()

def parse_qasm(*args):
    global qc
    qc=QuantumCircuit().from_qasm_str(args[1])

    if len(args)>2:
        shots = args[2]
        pass
    else:
        shots=1024

    if len(args)>3:
        backend_name = args[3]
    else:
        backend_name='qasm_simulator'

    counts = run_circuit(qc, shots, backend_name)
    print("Sending result counts back to Max")
    client.send_message("info", "Retrieving results from osc_qasm.py..." )
    # list comprehension that converts a Dict into an
    # interleaved string list: [key1, value1, key2, value2...]
    sorted_counts = {}
    for key in sorted(counts):
        #print ("%s: %s" % (key, counts[key]) )
        sorted_counts[key]=counts[key]
    counts_list = [str(x) for z in zip(sorted_counts.keys(), sorted_counts.values()) for x in z]
    # and then into a string
    counts_list = " ".join(counts_list)
    client.send_message("counts", counts_list)

def main(UDP_IP, RECEIVE_PORT, SEND_PORT, TOKEN, HUB, GROUP, PROJECT, REMOTE):

    global client, provider, ERR_SEP
    ERR_SEP = '----------------------------------------' # For FileLikeErrorOSC() class
    provider=None
    local_ip="127.0.0.1"

    if TOKEN:
        IBMQ.enable_account(TOKEN, 'https://auth.quantum-computing.ibm.com/api', HUB, GROUP, PROJECT)
        provider=IBMQ.get_provider(hub=HUB, group=GROUP, project=PROJECT)
        pass
    if UDP_IP=="localhost":
        UDP_IP="127.0.0.1"
        pass

    # find local IP address
    if not REMOTE:
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.connect(("8.8.8.8", 80))#THIS THROWS an error if machine is not connected to any network
        local_ip = s.getsockname()[0]#this prints 0.0.0.0 if machine is not connected to any network
        pass

    #OSC server and client
    callback = dispatcher.Dispatcher()
    server = osc_server.ThreadingOSCUDPServer((local_ip, RECEIVE_PORT), callback)
    # server2 = osc_server.ThreadingOSCUDPServer(("127.0.0.1", RECEIVE_PORT), callback)
    client = udp_client.SimpleUDPClient(UDP_IP, SEND_PORT)
    client.send_message("info", "osc_qasm.py is now running")

    callback.map("/QuTune", parse_qasm)
    print("Server Receiving on {} port {}".format(server.server_address[0], server.server_address[1]))
    # print("Server Receiving on {} port {}".format(server2.server_address[0], server2.server_address[1]))
    print("Server Sending back on {} port {}".format(client._address,  client._port))
    server.serve_forever()
    print("server 1 esta correndo, sera que ele vai chegar a correr o server 2?")


if __name__ == '__main__':

    p = argparse.ArgumentParser()

    p.add_argument('receive_port', type=int, nargs='?', default=1416, help='The port where the osc_qasm.py Server will listen for incoming messages. Default port is 1416')
    p.add_argument('send_port', type=int, nargs='?', default=1417, help='The port that osc_qasm.py will use to send messages back to Max. Default port is 1417')
    p.add_argument('ip', nargs='?', default='127.0.0.1', help='The IP address where the client (Max/MSP) is located. Default IP is 127.0.0.1 (localhost)')
    p.add_argument('--token', help='If you want to run circuits on real quantum hardware, you need to provide your IBMQ token (see https://quantum-computing.ibm.com/account)')
    p.add_argument('--hub', help='If you want to run circuits on real quantum hardware, you need to provide your IBMQ Hub')
    p.add_argument('--group', help='If you want to run circuits on real quantum hardware, you need to provide your IBMQ Group')
    p.add_argument('--project', help='If you want to run circuits on real quantum hardware, you need to provide your IBMQ Project')
    p.add_argument('--remote', help='declare this is a remote server. In this case osc_qasm.py will be listenning to messages coming into the network adapter address.', action='store_true')

    args = p.parse_args()
    print("args.remote is:", args.remote)
    # Route sys.stderr to OSC
    flerr = FileLikeErrorOSC()
    sys.stderr = flerr

    if args.token:
        if not args.hub or not args.group or not args.project:
            if not args.hub and not args.group and not args.project:
                args.hub='ibm-q'
                args.group='open'
                args.project='main'
                pass
            else:
                raise ValueError('You need to specify both --hub, --group, and --project arguments.')
                args.hub=None
                args.group=None
                args.project=None

    print('================================================')
    print(' OSC_QASM by OCH & Itaborala @ QuTune (v1.2.0) ')
    print(' https://iccmr-quantum.github.io               ')
    print('================================================')
    main(args.ip, args.receive_port, args.send_port, args.token, args.hub, args.group, args.project, args.remote)
