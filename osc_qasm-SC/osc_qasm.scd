// If you are using sclang/SCIDE, you don't need to boot the SC server
// for sending/receiving OSC messages.
// s.boot;
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
");
'Sending script to OSC-Qasm'.postln;
);
// =====================================================================
// s.quit;