{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 2,
			"revision" : 2,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 68.0, 211.0, 520.0, 485.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"assistshowspatchername" : 0,
		"boxes" : [ 			{
				"box" : 				{
					"color" : [ 0.254901960784314, 0.890196078431372, 0.43921568627451, 1.0 ],
					"fontface" : 3,
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 2,
							"revision" : 2,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 625.0, 334.0, 640.0, 173.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"assistshowspatchername" : 0,
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-8",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 525.0, 32.0, 50.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 525.0, 68.5, 54.0, 22.0 ],
									"text" : "shots $1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 407.5, 68.5, 101.0, 22.0 ],
									"text" : "prepend backend"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-4",
									"items" : [ "FakeAlmaden", ",", "FakeArmonk", ",", "FakeAthens", ",", "FakeBelem", ",", "FakeBoeblingen", ",", "FakeBogota", ",", "FakeBrooklyn", ",", "FakeBurlington", ",", "FakeCambridge", ",", "FakeCambridgeAlternativeBasis", ",", "FakeCasablanca", ",", "FakeEssex", ",", "FakeGuadalupe", ",", "FakeJakarta", ",", "FakeJohannesburg", ",", "FakeLagos", ",", "FakeLima", ",", "FakeLondon", ",", "FakeManhattan", ",", "FakeManila", ",", "FakeMelbourne", ",", "FakeMontreal", ",", "FakeMumbai", ",", "FakeOurense", ",", "FakeParis", ",", "FakePoughkeepsie", ",", "FakeQuito", ",", "FakeRochester", ",", "FakeRome", ",", "FakeRueschlikon", ",", "FakeSantiago", ",", "FakeSingapore", ",", "FakeSydney", ",", "FakeTenerife", ",", "FakeTokyo", ",", "FakeToronto", ",", "FakeValencia", ",", "FakeVigo", ",", "FakeYorktown" ],
									"maxclass" : "umenu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 367.0, 32.0, 100.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-3",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 407.5, 105.0, 138.0, 22.0 ],
									"text" : "osc_qasm 1419 @info 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-2",
									"linecount" : 7,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 31.0, 32.0, 316.0, 100.0 ],
									"text" : "New in 1.1:\n- you can now use Qiskit's fake backends to quickly run simulations that emulate the noise in real machines\n- you can now hotswap the number of shots and backend without the need to re-initialize the object\n- you can enable or disable info mode by setting the @info attribute to 1 or 0, respecitvely"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"source" : [ "obj-4", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"midpoints" : [ 534.5, 97.25, 417.0, 97.25 ],
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"source" : [ "obj-8", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 41.0, 353.0, 82.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p New in 1.1!"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 41.0, 270.5, 58.0, 22.0 ],
					"text" : "set $1 $2"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 3,
					"id" : "obj-42",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 329.0, 417.0, 149.0, 33.0 ],
					"text" : "QuTune \niccmr-quantum.github.io",
					"textjustification" : 2
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "obj-41",
					"linecount" : 2,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 275.0, 380.0, 202.0, 35.0 ],
					"text" : ";\rmax showdoc osc_qasm.maxref.xml"
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"bubbleside" : 0,
					"id" : "obj-40",
					"linecount" : 4,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 157.5, 264.0, 165.0, 79.0 ],
					"text" : "you can also use attributes or positional arguments to configure your object! See reference for a complete list."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-39",
					"maxclass" : "textbutton",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 190.0, 353.0, 100.0, 20.0 ],
					"text" : "Open reference",
					"texton" : "Open reference"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-38",
					"linecount" : 2,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 150.0, 227.0, 184.0, 35.0 ],
					"text" : "osc_qasm 1418 @shots 100000 @backend ibmq_belem @info 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-19",
					"linecount" : 9,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 340.0, 227.0, 138.0, 129.0 ],
					"text" : "qasm \"OPENQASM 2.0;\ninclude \\\"qelib1.inc\\\"; \nqreg q[2]; \ncreg c[2]; \nh q[0]; \ncx q[0],q[1]; \nmeasure q[0] -> c[0]; \nmeasure q[1] -> c[1]; \n\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-35",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 41.0, 227.0, 63.0, 22.0 ],
					"text" : "osc_qasm"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-15",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 100.0, 270.5, 32.0, 22.0 ],
					"text" : "print"
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"bubblepoint" : 0.0,
					"bubbleside" : 2,
					"id" : "obj-10",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 150.0, 68.5, 155.0, 52.0 ],
					"text" : "2 - retrieve qasm definition \n(click again to resend !)"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.72156862745098, 0.431372549019608, 0.243137254901961, 1.0 ],
					"bgcolor2" : [ 0.2, 0.2, 0.2, 1.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0.0,
					"bgfillcolor_color" : [ 0.72156862745098, 0.431372549019608, 0.243137254901961, 1.0 ],
					"bgfillcolor_color1" : [ 0.72156862745098, 0.431372549019608, 0.243137254901961, 1.0 ],
					"bgfillcolor_color2" : [ 0.2, 0.2, 0.2, 1.0 ],
					"bgfillcolor_proportion" : 0.5,
					"bgfillcolor_type" : "gradient",
					"fontsize" : 12.0,
					"gradient" : 1,
					"id" : "obj-7",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 73.0, 109.0, 83.0, 22.0 ],
					"text" : "sim get_qasm"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"linecount" : 2,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 41.0, 294.5, 91.0, 35.0 ],
					"text" : "counts \"00 511 11 513\""
				}

			}
, 			{
				"box" : 				{
					"fontface" : 3,
					"id" : "obj-154",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 41.0, 403.0, 212.0, 47.0 ],
					"text" : "OSC-Qasm\nsending QuantumCircuits to Qiskit\nOCH & Itaborala (2022-02-23)"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-24",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 290.0, 26.5, 188.0, 47.0 ],
					"text" : "note that we started microqiskit object already with a default QuantumCircuit and Simulator",
					"textjustification" : 2
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"bubbletextmargin" : 8,
					"id" : "obj-22",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 150.0, 35.0, 109.0, 30.0 ],
					"text" : "1 - build circuit"
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"bubblepoint" : 0.1,
					"id" : "obj-17",
					"linecount" : 4,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 338.0, 109.0, 140.0, 64.0 ],
					"text" : "click here to recreate circuit if you'd like to build and send another circuit"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-14",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 208.0, 111.0, 128.0, 22.0 ],
					"text" : "QuantumCircuit qc 2 2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"linecount" : 2,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 41.0, 35.0, 107.0, 35.0 ],
					"text" : "qc h 0, qc cx 0 1, qc m 0 0, qc m 1 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 41.0, 162.0, 273.0, 22.0 ],
					"text" : "och.microqiskit qc 2 2 sim 1 1 @console_output 0"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 1 ],
					"midpoints" : [ 50.5, 205.0, 468.5, 205.0 ],
					"order" : 0,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"order" : 1,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"midpoints" : [ 217.5, 146.0, 50.5, 146.0 ],
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"midpoints" : [ 50.5, 259.25, 109.5, 259.25 ],
					"order" : 0,
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"order" : 1,
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-41", 0 ],
					"hidden" : 1,
					"midpoints" : [ 199.5, 376.0, 284.5, 376.0 ],
					"source" : [ "obj-39", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"midpoints" : [ 82.5, 146.0, 50.5, 146.0 ],
					"source" : [ "obj-7", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "och.microqiskit.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "osc_qasm.maxpat",
				"bootpath" : "~/Documents/GitHub/OSC-Qasm/osc_qasm-Max",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
 ],
		"autosave" : 0,
		"bgcolor" : [ 0.682352941176471, 0.709803921568627, 0.870588235294118, 1.0 ],
		"editing_bgcolor" : [ 0.682352941176471, 0.709803921568627, 0.870588235294118, 1.0 ]
	}

}
