# UDP-Qasm
# A simple UDP Python interface for executing Qasm code.
# Or a simple bridge to connect _The QAC Toolkit_ with real quantum hardware.
#
# Omar Costa Hamido / Paulo Vitor Itaboraí (2021-11-09)
# https://github.com/iccmr-quantum/UDP-Qasm
#

from pythonosc import dispatcher, osc_server, udp_client
from qiskit import *
import sys

def run_circuit(qc, shots=1000, backend_name='qasm_simulator', provider=Aer):

    backend = provider.get_backend(backend_name)
    print("Running circuit on {}...".format(backend_name))
    job = execute(qc, shots=shots, backend=backend)
    print("Done!")
    return job.result().get_counts()

def parse_qasm(*args):
    global qc
    qc=QuantumCircuit().from_qasm_str(args[1])
    counts = run_circuit(qc)
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

def main(UDP_IP="127.0.0.1", RECEIVE_PORT=1416, SEND_PORT=1417):
    global client

    if UDP_IP=="localhost":
        UDP_IP="127.0.0.1"
        pass

    #OSC server and client
    callback = dispatcher.Dispatcher()
    server = osc_server.ThreadingOSCUDPServer((UDP_IP, RECEIVE_PORT), callback)
    client = udp_client.SimpleUDPClient(UDP_IP, SEND_PORT)

    callback.map("/QuTune", parse_qasm)
    print("Server Receiving on {} port {}".format(server.server_address[0], server.server_address[1]))
    print("Server Sending back on {} port {}".format(client._address,  client._port))
    server.serve_forever()

if __name__ == '__main__':

    print('UDP_QASM')
    if len(sys.argv) > 1:
        main(sys.argv[1], int(sys.argv[2]), int(sys.argv[3]))
    else:
        main()
