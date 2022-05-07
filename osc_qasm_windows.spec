# -*- mode: python ; coding: utf-8 -*-

datas = [('OSCQasm\\lib\\site-packages\\eel\\eel.js', 'eel'), ('GUI', 'GUI')]
datas += [('OSCQasm\\lib\\site-packages\\qiskit', 'qiskit')]
datas += [('OSCQasm\\lib\\site-packages\\qiskit_terra-0.20.1.dist-info', 'qiskit_terra-0.20.1.dist-info')]
datas += [('OSCQasm\\lib\\site-packages\\qiskit_ibmq_provider-0.19.1.dist-info', 'qiskit_ibmq_provider-0.19.1.dist-info')]
datas += [('OSCQasm\\lib\\site-packages\\qiskit_aer-0.10.4.dist-info', 'qiskit_aer-0.10.4.dist-info')]
datas += [('OSCQasm\\lib\\site-packages\\qiskit_ignis-0.7.0.dist-info', 'qiskit_ignis-0.7.0.dist-info')]

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



# Avoid warning. Can we change this accordingly?
#to_remove = ["_accelerate", "controller_wrappers", "pulse_utils"]
to_remove = ["qiskit._accelerate", "backends.controller_wrappers", "controllers.pulse_utils"]
for val in to_remove:
    for b in a.binaries:
          nb = b[0]
          if str(nb).endswith(val):
                print("removed  " + b[0])
                a.binaries.remove(b)
# for b in a.binaries:
#     print(b)
#
#     found = any(
#         f'{crypto}.cp310-win_amd64.pyd' in b[1]
#         for crypto in to_remove
#     )
#     if found:
#         print(f"Removing {b[1]}")
#         a.binaries.remove(b)


exe = EXE(
    pyz,
    a.scripts,
    a.binaries,
    a.zipfiles,
    a.datas,
    [],
    name='osc_qasm',
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=True,
    upx_exclude=[],
    runtime_tmpdir=None,
    console=False,
    disable_windowed_traceback=False,
    argv_emulation=False,
    target_arch=None,
    codesign_identity=None,
    entitlements_file=None,
    icon='icon.ico',
)
