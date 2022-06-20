// =====================================================================
//                     OSC-Qasm SuperCollider Client
//    Running Quantum Circuits (openQASM scripts) on OSC-Qasm using SC
//                       by Itaborala @ QuTune (2022)
//                     https://iccmr-quantum.github.io
// =====================================================================

// If you are using sclang/SCIDE, you don't need to boot the SC server
// for sending/receiving OSC messages.
// s.boot;
// ============================ Variables ==============================
// You can use a simulator for testing quantum circuits and avoiding
// IBMQ job traffic. The first one - 'qasm_simulator' - simulates ideal Qubits, whereas the Fake* backends simulate typical noises and errors that are found in real IBMQ hardware.
(
~backendsSimulators = ['qasm_simulator', 'FakeAlmaden', 'FakeArmonk', 'FakeAthens', 'FakeBelem', 'FakeBoeblingen', 'FakeBogota', 'FakeBrooklyn', 'FakeBurlington', 'FakeCambridge', 'FakeCambridgeAlternativeBasis', 'FakeCasablanca', 'FakeEssex', 'FakeGuadalupe', 'FakeJakarta', 'FakeJohannesburg', 'FakeLagos', 'FakeLima', 'FakeLondon', 'FakeManhattan', 'FakeManila', 'FakeMelbourne', 'FakeMontreal', 'FakeMumbai', 'FakeOurense', 'FakeParis', 'FakePoughkeepsie', 'FakeQuito', 'FakeRochester', 'FakeRome', 'FakeRueschlikon', 'FakeSantiago', 'FakeSingapore', 'FakeSydney', 'FakeTenerife', 'FakeTokyo', 'FakeToronto', 'FakeValencia', 'FakeVigo', 'FakeYorktown'];
// If you have an IBM-Quantum account you can use real quantum machines.
// Be sure to load your IBMQ credentials on OSC-Qasm before starting
// the OSC server. Here are some publicly available backends (you can
// check your specific IBMQ provider for additional backends)
~backendsRealHardware = ['ibmq_manila', 'ibmq_bogota', 'ibmq_santiago', 'ibmq_quito', 'ibmq_belem', 'ibmq_lima', 'ibmq_armonk'];
);

// ============ OSC Callback function / Message Processing =============
(
~callback = { |msg, time, addr|

	"%: %\n".postf(msg[0].asString.basename, msg[1]);
};

 // Setting the callback function to different paths
OSCdef(\info, ~callback, '/info');
OSCdef(\error, ~callback, '/error');
OSCdef(\counts, ~callback, '/counts');
);

// ====== Open send/receive UDP IP & ports for OSC communnication ======
(
thisProcess.openUDPPort(1417); // Receive Port
~sendAddr = NetAddr.new("127.0.0.1", 1416); // Send IP & Port
~shots = 1024; // The number of times the circuit will be run
~backend = ~backendsSimulators[0];
);

// ==================== Send Qasm Code to OSC-Qasm! ====================
(
~sendAddr.sendMsg("/QuTune", "OPENQASM 2.0;
include \"qelib1.inc\";
qreg q[2];
creg c[2];
h q[0];
cx q[0],q[1];
measure q[0] -> c[0];
measure q[1] -> c[1];
", ~shots, ~backend);
'Sending script to OSC-Qasm'.postln;
);
// =====================================================================
// s.quit;