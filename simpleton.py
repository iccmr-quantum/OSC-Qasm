from pythonosc.osc_server import AsyncIOOSCUDPServer
from pythonosc.dispatcher import Dispatcher
import asyncio
import time

global server_on
server_on = True

def message_handler(address, *args):
    print(f"{address}: {args}")
    if args[0]=="stop":
        # transport.close()
        global server_on
        server_on = False
    if args[0]=="start":
        transport.open()


dispatcher = Dispatcher()
dispatcher.map("/QuTune", message_handler)

ip = "127.0.0.1"
port = 1416


# exclusive, not working
# def init_main():
#     server = AsyncIOOSCUDPServer((ip, port), dispatcher, asyncio.get_event_loop())
#     print("before")
#     server.serve()
#     # print("transport",transport)

#     while True:
#         print("I'm a main loop")
#         time.sleep(2.0)
# asyncio.run(init_main())
# asyncio.run(init_main())

#concurrent
# async def loop():
#     """Example main loop that only runs for 10 iterations before finishing"""
#     for i in range(10):
#         print(f"Loop {i}")
#         await asyncio.sleep(2)

async def init_main():
    global transport
    server = AsyncIOOSCUDPServer((ip, port), dispatcher, asyncio.get_event_loop())
    transport, protocol = await server.create_serve_endpoint()  # Create datagram endpoint and start serving
    print("transport",transport)
    print("protocol",protocol)
    # await loop()  # Enter main loop of program
    # server_on = True
    while server_on:
        print("server_on loop",server_on)
        print(f"Loop")
        await asyncio.sleep(2)
    transport.close()  # Clean up serve endpoint

def main():
    asyncio.run(init_main())

if __name__ == '__main__':
    main()
