# UDP-Qasm
A simple UDP Python interface for executing Qasm code.
Or a simple bridge to connect _The QAC Toolkit_ with real quantum hardware.

## Installation
Before starting, make sure you have [Python](https://www.python.org/) 3.6+ in your system.

In order to try our example maxpatch, make sure you also have [Max](http://cycling74.com) installed, and [_The QAC toolkit_](http://quantumland.art) Max package available.

Clone or [download](https://github.com/iccmr-quantum/UDP-Qasm/archive/refs/heads/main.zip) and unzip this repo.

Open the Terminal (Mac) or Command Prompt (Windows) and navigate to the folder  where you saved the repo.
- see here a refresher on how to navigate using the terminal [[1](https://computers.tutsplus.com/tutorials/navigating-the-terminal-a-gentle-introduction--mac-3855)][[2](https://www.macworld.com/article/221277/command-line-navigating-files-folders-mac-terminal.html)]

Create a python virtual environment
- on the terminal, type: `python3 -m venv UDPQasm`

Enter your new python virtual environment
- on mac: `source UDPQasm/bin/activate`
- on windows: `source UDPQasm\script\activate.bat`

Update pip and setuptools
- `pip install --upgrade pip setuptools`

Install qiskit and python-osc
- `pip install qiskit python-osc`

## Running

First, open a Terminal (Mac) or Command Prompt (Windows) and start you python environment.
{-starting python}
{-python venv}

Then run the python module: `python udp_qasm.py`
Wait until the program outputs the following lines:
```console
UDP_QASM
Server Receiving on 127.0.0.1 port PPPP
Server Sending back on x.x.x.x port QQQQ
```
Now you can open the [udp_qasm.maxpat](udp_qasm.maxpat) in Max 8 and start sending messages with _The QAC Toolkit_.


### Additional arguments
You can also set some additional arguments and flags in front of `python udp_qasm.py`:

```console
usage: udp_qasm.py [-h] [--token TOKEN] [--hub HUB] [--group GROUP]
                   [--project PROJECT]
                   [receive_port] [send_port] [ip]

positional arguments:
  receive_port       The port where the udp_qasm.py Server will listen for
                     incoming messages
  send_port          The port that udp_qasm.py will use to send messages back
                     to Max
  ip                 The IP address where the client (Max/MSP) is located

optional arguments:
  -h, --help         show this help message and exit
  --token TOKEN      If you want to run circuits on real quantum hardware, you
                     need to provide your IBMQ token (see https://quantum-
                     computing.ibm.com/account)
  --hub HUB          If you want to run circuits on real quantum hardware, you
                     need to provide your IBMQ Hub
  --group GROUP      If you want to run circuits on real quantum hardware, you
                     need to provide your IBMQ Group
  --project PROJECT  If you want to run circuits on real quantum hardware, you
                     need to provide your IBMQ Project
```



## Feedback and Getting help
Please open a [new issue](https://github.com/iccmr-quantum/UDP-Qasm/issues/new).

Also, please consider learning more about Max [here](https://cycling74.com/get-started), and Qiskit [here](https://qiskit.org/learn), as well as explore [The Quantum Computer Music Tutorial](https://github.com/iccmr-quantum/The-Quantum-Computer-Music-Tutorial).

## Acknowledgements
This repo was created as part of the [QuTune Project](https://iccmr-quantum.github.io/).
_The QAC Toolkit_ is the work of [Omar Costa Hamido](https://omarcostahamido.com).
