from pythonosc import dispatcher, osc_server, udp_client
import argparse
import eel
import socket
import asyncio

def parse_qasm(address, *args):
	print("Just received, via OSC:",args)
	eel.print("Just received, via OSC:"+str(args))
	# client.send_message("info", "Just received, via OSC:"+str(args))

callback = dispatcher.Dispatcher()
callback.map("/QuTune", parse_qasm)

def CMD(UDP_IP, RECEIVE_PORT, SEND_PORT, REMOTE):
	print("running headless with params:",UDP_IP,RECEIVE_PORT,SEND_PORT,REMOTE)

async def server_process(args):
	#OSC server and client
	print("serverstart args:",args)
	local_ip = "127.0.0.1"
	wRECEIVE_PORT = int(args[0])
	print("wRECEIVE_PORT",wRECEIVE_PORT)
	wUDP_IP = args[1]
	print("wUDP_IP",wUDP_IP)
	wSEND_PORT = int(args[2])
	print("wSEND_PORT",wSEND_PORT)
	# server = osc_server.ThreadingOSCUDPServer((local_ip, wRECEIVE_PORT), callback)
	server = osc_server.AsyncIOOSCUDPServer((local_ip, wRECEIVE_PORT), callback, asyncio.get_event_loop())
	global transport
	transport, protocol = await server.create_serve_endpoint()
	# global client
	# client = udp_client.SimpleUDPClient(wUDP_IP, wSEND_PORT)
	# client.send_message("info", "osc_qasm.py is now running")
	# print("Server Receiving on {} port {}".format(server.server_address[0], server.server_address[1]))
	print("Server Receiving on {} port {}".format(server._server_address[0], server._server_address[1]))
	# print("Server Sending back on {} port {}".format(client._address,  client._port))
	# server.serve_forever()
	# server.serve()
	while server_on:
		eel.sleep(2.0)
		print("still alive")
	print("after server loop")

def GUI():
	global transport

	eel.init('GUI')
	@eel.expose
	def pythonprint(message):
	    print("received",message)
	    eel.print("all good from python side!")

	@eel.expose
	def start(*args):
		# # eel.spawn(serverstart,args)
		# print("before")
		# eel.spawn(asyncio.run(init_main(args)))
		global server_on
		server_on = True
		# asyncio.run(server_process(args))
		# eel.spawn(server_process(args))
		# print("after")

	@eel.expose
	def stop():
		transport.close()
		global server_on
		server_on = False
		# server.stop()
		print("Server has stopped now.")

	eel.start('index.html', cmdline_args=['-incognito'],size=(640,480),block=False)
	while True:
		print("I'm a GUI loop")
		eel.sleep(2.0)
	print("this usually don't print")


if __name__ == '__main__':
	p = argparse.ArgumentParser()
	p.add_argument('receive_port', type=int, nargs='?', default=1416, help='The port where the osc_qasm.py Server will listen for incoming messages. Default port is 1416')
	p.add_argument('send_port', type=int, nargs='?', default=1417, help='The port that osc_qasm.py will use to send messages back to Max/MSP. Default port is 1417')
	p.add_argument('ip', nargs='?', default='127.0.0.1', help='The IP address to where the retrieved results will be sent (Where Max/MSP is located). Default IP is 127.0.0.1 (localhost)')
	p.add_argument('--remote', nargs='?', default=False, help='Declare this is a remote server. In this case osc_qasm.py will be listenning to messages coming into the network adapter address. If there is a specific network adapter IP you want to listen in, add it as an argument here')
	p.add_argument('--headless', nargs='?', type=bool, const=True, default=False, help='Run osc_qasm.py in headless mode. This is useful if you don\'t want to launch the GUI and only work in the terminal.will be listenning to messages coming into the network adapter address. If there is a specific network adapter IP you want to listen in, add it as an argument here')
	args = p.parse_args()
	if args.headless:
		CMD(args.ip, args.receive_port, args.send_port, args.remote)
	else:
		GUI()
