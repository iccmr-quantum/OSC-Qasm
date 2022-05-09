# eelargs.py

import argparse
import sys
import eel

if __name__ == '__main__':
    p = argparse.ArgumentParser()

    p.add_argument('--headless', nargs='?', type=bool, const=True, default=False, help='trying to check ')

    args = p.parse_args()

    HEADLESS = args.headless

    if not HEADLESS:
        print("Great! we are running in headless mode!")
        eel.init('GUI')
        @eel.expose
        def pythonPrint(message):
            print("received",message)
        @eel.expose
        def start(*args):
            server_on = True
        @eel.expose
        def stop():
            server_on = False
        eel.start('index.html', cmdline_args=['-incognito'],size=(840,480),block=True)
    else:
        print("not running in headless mode.")
