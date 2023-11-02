from abc import ABC, abstractmethod

class QuantumHardwareInterface(ABC):
    
    @abstractmethod
    def __init__(self, n):
        self.provider = None
        self.backend = None

    @abstractmethod
    def execute(self, n):
        pass
    @abstractmethod
    def connect(self, n):
        pass
    @abstractmethod
    def get_backend(self, n):
        pass
    @abstractmethod
    def optimize(self, n):
        pass
