# UDP-Qasm
# A simple UDP Python interface for executing Qasm code.
# Or a simple bridge to connect _The QAC Toolkit_ with real quantum hardware.
#
# Omar Costa Hamido / Paulo Vitor Itaboraí (2021-11-09)
# https://github.com/iccmr-quantum/UDP-Qasm
#

from pythonosc import dispatcher, osc_server, udp_client
from qiskit import *
import random
import sys

def parse_qasm(*args):
    global qc
    qc=QuantumCircuit().from_qasm_str(args[1])
    client.send_message("/QuTune", random.random())

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
