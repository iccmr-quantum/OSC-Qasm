
from abstract_classes import QuantumHardwareInterface
from iqm.qiskit_iqm import IQMProvider
from qiskit import execute
#from qiskit_ibm_provider import IBMProvider

server_url = 'https://demo.qc.iqm.fi/cocos'

class IQMHardwareInterface(QuantumHardwareInterface):
    def __init__(self):
        self.provider = None
        self.backend = None
        self.url = None

    def connect(self, url=None):
        if url is None:
            self.provider = IQMProvider(server_url)
            self.url = server_url
        else:
            self.provider = IQMProvider(url)
            print(f'Connecting to {url}')
            self.url = url
        

    def get_backend(self, backend_name=None):
        self.backend = self.provider.get_backend()

    def execute(self, qcirc, shots=1024):
        print(f'running on {self.url}')
        job = execute(qcirc, backend=self.backend, shots=shots)
        return job
    
    def optimize(self, qcirc):
        pass

