# UDP-Qasm SaaS Client
A UDP-Qasm SaaS Max Client. Based on [OSC-Qasm](https://zenodo.org/record/6426326), this is a simple UDP-based interface for executing Qasm code. (or a simple bridge to connect [The QAC Toolkit](https://www.quantumland.art/qac) with real quantum hardware)


## Installation
In order to try this Max abstraction, make sure you have [Max](http://cycling74.com) installed, together with [_The QAC Toolkit_](http://quantumland.art/qac) Max package.

Clone or [download](https://github.com/Quantumland-art/OSC-Qasm/archive/refs/heads/SaaS.zip) and unzip this repo.

Copy the `UDP-Qasm_SaaS-Client` folder into the `Max 8/Library` folder. Restart Max.

## Running
Create a new object and type `udp_qasm`.

This abstraction defaults to connect to the deployed version of OSC-Qasm server at udp-qasm.och.pw.

This server requires a password in order to connect, which is available in the QuTune slack channel.

## Acknowledgements
UDP-Qasm SaaS Client is a spinoff of the original [OSC-Qasm](https://github.com/iccmr-quantum/OSC-Qasm/) Max client.

This branch was created by Omar Costa Hamido as part of the [QuTune Project](https://iccmr-quantum.github.io/).