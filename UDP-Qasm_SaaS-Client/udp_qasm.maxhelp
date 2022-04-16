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
		"rect" : [ 770.0, 114.0, 640.0, 480.0 ],
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
					"hidden" : 1,
					"id" : "obj-41",
					"linecount" : 2,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 52.0, 384.0, 203.0, 35.0 ],
					"text" : ";\rmax showdoc udp_qasm.maxref.xml"
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
					"patching_rect" : [ 52.0, 331.0, 100.0, 20.0 ],
					"text" : "Open reference",
					"texton" : "Open reference"
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"bubblepoint" : 0.0,
					"bubbleside" : 0,
					"bubbletextmargin" : 8,
					"id" : "obj-24",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 479.5, 96.0, 79.0, 58.0 ],
					"text" : "click me!\nchange me!"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 2,
					"id" : "obj-22",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 52.0, 74.0, 173.0, 20.0 ],
					"text" : "a UDP-Qasm SaaS Max Client"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-20",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 170.0, 126.5, 165.0, 20.0 ],
					"text" : "instant access to real devices"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-19",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 194.0, 167.5, 141.0, 20.0 ],
					"text" : "server-specific password"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 3,
					"id" : "obj-16",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 507.0, 399.0, 73.0, 20.0 ],
					"text" : "OCH (2022)"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontsize" : 15.87574835350401,
					"id" : "obj-15",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 52.0, 45.0, 173.0, 24.0 ],
					"text" : "udp_qasm"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 52.0, 125.5, 112.0, 22.0 ],
					"text" : "backend ibmq_lima"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-10",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 52.0, 275.5, 125.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 66.0, 167.5, 122.0, 22.0 ],
					"text" : "pass serverpassword"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.152941176470588, 0.631372549019608, 1.0, 1.0 ],
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 52.0, 222.0, 65.0, 22.0 ],
					"text" : "udp_qasm"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"linecount" : 9,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 442.0, 222.0, 138.0, 129.0 ],
					"text" : "qasm \"OPENQASM 2.0;\ninclude \\\"qelib1.inc\\\"; \nqreg q[2]; \ncreg c[2]; \nh q[0]; \ncx q[0],q[1]; \nmeasure q[0] -> c[0]; \nmeasure q[1] -> c[1]; \n\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"linecount" : 3,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 414.0, 45.0, 169.0, 49.0 ],
					"text" : "QuantumCircuit qc 2 2, qc h 0, qc cx 0 1, qc m 0 0, qc m 1 1, sim get_qasm"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 414.0, 165.5, 166.0, 22.0 ],
					"text" : "och.microqiskit qc 2 2 sim 1 1"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 1 ],
					"midpoints" : [ 423.5, 204.25, 570.5, 204.25 ],
					"order" : 0,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"midpoints" : [ 423.5, 204.25, 61.5, 204.25 ],
					"order" : 1,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-11", 0 ]
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
					"destination" : [ "obj-41", 0 ],
					"hidden" : 1,
					"source" : [ "obj-39", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 1 ],
					"midpoints" : [ 61.5, 259.25, 167.5, 259.25 ],
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"midpoints" : [ 75.5, 205.25, 61.5, 205.25 ],
					"source" : [ "obj-8", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "och.microqiskit.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "och.udp.maxpat",
				"bootpath" : "~/Documents/Max 8/Library/och.udp",
				"patcherrelativepath" : "../och.udp",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "udp.js",
				"bootpath" : "~/Documents/Max 8/Library/och.udp",
				"patcherrelativepath" : "../och.udp",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "udp_qasm.maxpat",
				"bootpath" : "~/Documents/Max 8/Library/udp_qasm",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
 ],
		"autosave" : 0
	}

}
