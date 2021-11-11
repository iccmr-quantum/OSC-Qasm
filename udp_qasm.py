# UDP-Qasm
# A simple UDP Python interface for executing Qasm code.
# Or a simple bridge to connect _The QAC Toolkit_ with real quantum hardware.
#
# Omar Costa Hamido / Paulo Vitor Itaboraí (2021-11-09)
# https://github.com/iccmr-quantum/UDP-Qasm
#

from pythonosc import dispatcher, osc_server, udp_client
from qiskit import *
from qiskit.tools import job_monitor
import sys
import argparse

def run_circuit(qc, shots, backend_name):

    print("Running circuit on {}...".format(backend_name))
    if backend_name != 'qasm_simulator':
        if not provider:
            client.send_message("error", "You need to start UDP-Qasm with the following arguments: --token (--hub, --group, --project).")
            raise ValueError('You need to start UDP-Qasm with the following arguments: --token (--hub, --group, --project).')
        backend = provider.get_backend(backend_name)
        job = execute(qc, shots=shots, backend=backend)
        job_monitor(job)
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
        shots=1000

    if len(args)>3:
        backend_name = args[3]
    else:
        backend_name='qasm_simulator'

    counts = run_circuit(qc, shots, backend_name)
    print("Sending result counts back to Max")
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

def main(UDP_IP, RECEIVE_PORT, SEND_PORT, TOKEN, HUB, GROUP, PROJECT):

    global client, provider
    provider=None

    if TOKEN:
        IBMQ.enable_account(TOKEN, 'https://auth.quantum-computing.ibm.com/api', HUB, GROUP, PROJECT)
        provider=IBMQ.get_provider(hub=HUB, group=GROUP, project=PROJECT)
        # IBMQ(hub='ibm-q', group='open', project='main')
        pass
    if UDP_IP=="localhost":
        UDP_IP="127.0.0.1"
        pass

    #OSC server and client
    callback = dispatcher.Dispatcher()
    server = osc_server.ThreadingOSCUDPServer(("127.0.0.1", RECEIVE_PORT), callback)
    client = udp_client.SimpleUDPClient(UDP_IP, SEND_PORT)

    callback.map("/QuTune", parse_qasm)
    print("Server Receiving on {} port {}".format(server.server_address[0], server.server_address[1]))
    print("Server Sending back on {} port {}".format(client._address,  client._port))
    server.serve_forever()

if __name__ == '__main__':



    p = argparse.ArgumentParser()

    p.add_argument('receive_port', type=int, nargs='?', default=1416, help='The port where the UDP-Qasm Server will listen for incoming messages')
    p.add_argument('send_port', type=int, nargs='?', default=1417, help='The port that UDP-Qasm will use to send messages back to Max')
    p.add_argument('ip', nargs='?', default='127.0.0.1', help='The IP address where the client (Max/MSP) is located')
    p.add_argument('--token', help='If you want to run circuits on real quantum hardware, you need to provide your IBMQ token (see https://quantum-computing.ibm.com/account)')
    p.add_argument('--hub')
    p.add_argument('--group')
    p.add_argument('--project')

    args = p.parse_args()

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

    print('UDP_QASM')
    #if len(sys.argv) > 1:
    #print(args.ip, args.receive_port, args.send_port, args.token, args.hub, args.group, args.project)
    main(args.ip, args.receive_port, args.send_port, args.token, args.hub, args.group, args.project)
    # else:
        # main()
