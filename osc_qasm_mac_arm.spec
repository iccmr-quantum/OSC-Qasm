# -*- mode: python ; coding: utf-8 -*-

datas = [('OSCQasm/lib/python3.9/site-packages/eel/eel.js', 'eel'), ('GUI', 'GUI')]
datas += [('OSCQasm/lib/python3.9/site-packages/qiskit', 'qiskit')]
datas += [('OSCQasm/lib/python3.9/site-packages/qiskit_terra-0.21.2.dist-info', 'qiskit_terra-0.21.2.dist-info')]
datas += [('OSCQasm/lib/python3.9/site-packages/qiskit_ibmq_provider-0.19.2.dist-info', 'qiskit_ibmq_provider-0.19.2.dist-info')]
datas += [('OSCQasm/lib/python3.9/site-packages/qiskit_aer-0.10.4.dist-info', 'qiskit_aer-0.10.4.dist-info')]
datas += [('OSCQasm/lib/python3.9/site-packages/qiskit_ignis-0.7.1.dist-info', 'qiskit_ignis-0.7.1.dist-info')]

block_cipher = None


a = Analysis(
    ['osc_qasm.py'],
    pathex=[],
    binaries=[],
    datas=datas,
    hiddenimports=['bottle_websocket'],
    hookspath=[],
    hooksconfig={},
    runtime_hooks=[],
    excludes=['pyinstaller'],
    win_no_prefer_redirects=False,
    win_private_assemblies=False,
    cipher=block_cipher,
    noarchive=False,
)


pyz = PYZ(a.pure, a.zipped_data, cipher=block_cipher)


# Avoid warning
to_remove = ["qiskit._accelerate", "backends.controller_wrappers", "controllers.pulse_utils"]
for val in to_remove:
    for b in a.binaries:
          nb = b[0]
          if str(nb).endswith(val):
                print("removed  " + b[0])
                a.binaries.remove(b)

exe = EXE(
    pyz,
    a.scripts,
    a.binaries,
    a.zipfiles,
    a.datas,
    [],
    name='OSC_Qasm_2',
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=True,
    upx_exclude=[],
    runtime_tmpdir=None,
    console=False,
    disable_windowed_traceback=False,
    argv_emulation=False,
    target_arch='arm64',
    codesign_identity=None,
    entitlements_file=None,
    icon='icon.icns',
)
app = BUNDLE(
    exe,
    name='OSC_Qasm_2.app',
    icon='icon.icns',
    bundle_identifier=None,
)
