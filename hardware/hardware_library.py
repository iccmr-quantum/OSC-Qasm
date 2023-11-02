from abstract_classes import QuantumHardwareInterface
from hardware.local import LocalSimulatorInterface
from hardware.iqm import IQMHardwareInterface

class HardwareLibrary():
    def __init__(self):
        self._qh_interfaces = {
            "local": LocalSimulatorInterface, 
            "aer": LocalSimulatorInterface, 
            "iqm": IQMHardwareInterface,
            #"ibm": IBMHardwareInterface,
        }
    def get_hardware_interface(self, interface_name: str) -> QuantumHardwareInterface:
        """Returns: hardware interface class associated with name.
        """
        hardw_i = self._qh_interfaces.get(interface_name)
        if not hardw_i:
            raise ValueError(f'"{interface_name}" is not a valid name. Valid names are: {list(self._qh_interfaces.keys())}')
        return hardw_i()


