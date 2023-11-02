from abstract_classes import QuantumHardwareInterface
from qiskit_aer import AerProvider
from qiskit import execute
#from qiskit_ibm_provider import IBMProvider

class LocalSimulatorInterface(QuantumHardwareInterface):
    def __init__(self):
        self.provider = None
        self.backend = None

    def connect(self):
        self.provider = AerProvider()

    def get_backend(self, backend_name="aer_simulator"):
        self.backend = self.provider.get_backend(backend_name)

    def execute(self, qcirc, shots=1024):
        job = execute(qcirc, backend=self.backend, shots=shots, memory=True)
        return job
    
    def optimize(self, qcirc):
        pass

