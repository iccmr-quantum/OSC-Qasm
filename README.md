# OSC-Qasm
[![DOI](https://zenodo.org/badge/432225522.svg)](https://zenodo.org/badge/latestdoi/432225522)

A simple OSC Python interface for executing Qasm code.
(or a simple bridge to connect _The QAC Toolkit_ with real quantum hardware)

## Installation
Before starting, make sure you have [Python](https://www.python.org/) 3.7+ in your system.
- when using the installer on windows make sure to select the option `Add Python X to PATH`

In order to try our Max patches, make sure you also have [Max](http://cycling74.com) installed, and [_The QAC Toolkit_](http://quantumland.art/qac) Max package available.

Clone or [download](https://github.com/iccmr-quantum/OSC-Qasm/archive/refs/heads/main.zip) and unzip this repo.

Open the Terminal (Mac) or Command Prompt (Windows) and navigate to the folder  where you saved the repo.
- see here a refresher on how to navigate using the terminal [[1](https://computers.tutsplus.com/tutorials/navigating-the-terminal-a-gentle-introduction--mac-3855)][[2](https://www.macworld.com/article/221277/command-line-navigating-files-folders-mac-terminal.html)]

Create a python virtual environment
- on the terminal, type: `python3 -m venv OSCQasm`
- depending on your system, you may simply use: `python -m venv OSCQasm`

Enter your new python virtual environment
- on mac: `source OSCQasm/bin/activate`
- on windows: `OSCQasm\Scripts\activate`

At the start of your terminal prompt, it should show `(OSCQasm)`, indicating that you're in your new virtual environment.

Update pip and setuptools
- `pip install --upgrade pip setuptools`
- Note: if for some reason you don't have pip, please [install it](https://phoenixnap.com/kb/install-pip-windows)

Install qiskit and python-osc
- `pip install qiskit python-osc`

Copy the [osc_qasm-Max](./osc_qasm-Max/) folder to your Max library
- usually located in Documents/Max 8/Library

## Running

First, open a Terminal (Mac) or Command Prompt (Windows) and start you python environment.

Then run the python module: `python osc_qasm.py`
Wait until the program outputs the following lines:
```console
================================================
 OSC_QASM by OCH & Itaborala @ QuTune (v1.x.x)
 https://iccmr-quantum.github.io               
================================================
Server Receiving on 127.0.0.1 port PPPP
Server Sending back on x.x.x.x port QQQQ
```
Now you can open the [example.maxpat](example.maxpat) or [osc_qasm.maxhelp](osc_qasm-Max/osc_qasm.maxhelp) in Max 8 and start sending messages with QuantumCircuits in Qasm, to the OSC-Qasm python module.

When you're done working with osc_qasm.py you can leave the virtual environment with
- on mac & windows: `deactivate`

### Additional arguments
You can also set some additional arguments and flags in front of `python osc_qasm.py`:

```console
usage: osc_qasm.py [-h] [--token TOKEN] [--hub HUB] [--group GROUP]
                   [--project PROJECT]
                   [receive_port] [send_port] [ip]

positional arguments:
  receive_port       The port where the osc_qasm.py Server will listen for
                     incoming messages. Default port is 1416
  send_port          The port that osc_qasm.py will use to send messages back
                     to Max. Default port is 1417
  ip                 The IP address where the client (Max/MSP) is located.
                     Default IP is 127.0.0.1 (localhost)

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

The `osc_qasm.maxpat` abstraction also allows customization using several attributes and positional arguments. Make sure to check out the help patch and the reference page!

![osc_qasm-help](./osc_qasm-help.png)




## Feedback and Getting help
Please open a [new issue](https://github.com/iccmr-quantum/OSC-Qasm/issues/new).

Also, please consider learning more about Max [here](https://cycling74.com/get-started), and Qiskit [here](https://qiskit.org/learn), as well as explore the [Intro to Quantum Computer Music](https://github.com/iccmr-quantum/Intro-to-Quantum-Computer-Music) Tutorial (video recording [here](https://youtu.be/6UrNguY8zGY?t=1143)) and the other projects in [QuTune's Github](https://github.com/iccmr-quantum).

## Acknowledgements
OSC-Qasm is inspired by Jack Woehr's [Qisjob project](https://zenodo.org/record/4554481), and the och.qisjob [experimental object](https://www.quantumland.art/phd).

This repo was created by Omar Costa Hamido and Paulo Itaboraí as part of the [QuTune Project](https://iccmr-quantum.github.io/).
