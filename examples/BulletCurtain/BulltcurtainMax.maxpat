{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 378.0, 44.0, 1062.0, 723.0 ],
		"bglocked" : 0,
		"defrect" : [ 378.0, 44.0, 1062.0, 723.0 ],
		"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 0,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 0,
		"toolbarvisible" : 1,
		"boxanimatetime" : 200,
		"imprint" : 0,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"boxes" : [ 			{
				"box" : 				{
					"maxclass" : "flonum",
					"fontsize" : 12.0,
					"patching_rect" : [ 258.0, 90.0, 50.0, 20.0 ],
					"numinlets" : 1,
					"id" : "obj-58",
					"fontname" : "Arial",
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"fontsize" : 12.0,
					"patching_rect" : [ 486.0, 96.0, 50.0, 20.0 ],
					"numinlets" : 1,
					"id" : "obj-55",
					"fontname" : "Arial",
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route /BulletCurtain/OtherDestroyedAtY",
					"fontsize" : 12.0,
					"patching_rect" : [ 486.0, 53.0, 221.0, 20.0 ],
					"numinlets" : 1,
					"id" : "obj-52",
					"fontname" : "Arial",
					"numoutlets" : 2,
					"outlettype" : [ "", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r OSC_IN",
					"fontsize" : 12.0,
					"patching_rect" : [ 486.0, 30.0, 63.0, 20.0 ],
					"numinlets" : 0,
					"id" : "obj-53",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route /BulletCurtain/OtherDestroyedAtX",
					"fontsize" : 12.0,
					"patching_rect" : [ 258.0, 54.0, 221.0, 20.0 ],
					"numinlets" : 1,
					"id" : "obj-50",
					"fontname" : "Arial",
					"numoutlets" : 2,
					"outlettype" : [ "", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r OSC_IN",
					"fontsize" : 12.0,
					"patching_rect" : [ 258.0, 31.0, 63.0, 20.0 ],
					"numinlets" : 0,
					"id" : "obj-51",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess 115",
					"fontsize" : 12.0,
					"patching_rect" : [ 962.0, 405.0, 85.0, 20.0 ],
					"numinlets" : 1,
					"id" : "obj-175",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "gain~",
					"patching_rect" : [ 942.0, 430.0, 98.0, 19.0 ],
					"numinlets" : 2,
					"id" : "obj-172",
					"numoutlets" : 2,
					"outlettype" : [ "signal", "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p QuickPolyPatch",
					"fontsize" : 12.0,
					"patching_rect" : [ 942.0, 379.0, 105.0, 20.0 ],
					"numinlets" : 1,
					"id" : "obj-171",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 329.0, 121.0, 1111.0, 730.0 ],
						"bglocked" : 0,
						"defrect" : [ 329.0, 121.0, 1111.0, 730.0 ],
						"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 0,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 0,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"boxes" : [ 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "*~ 0.2",
									"fontsize" : 11.595187,
									"patching_rect" : [ 97.0, 392.0, 108.0, 20.0 ],
									"numinlets" : 2,
									"id" : "obj-94",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "signal" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "ezdac~",
									"patching_rect" : [ 66.0, 516.0, 45.0, 45.0 ],
									"numinlets" : 2,
									"id" : "obj-93",
									"numoutlets" : 0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "meter~",
									"patching_rect" : [ 9.0, 468.0, 80.0, 13.0 ],
									"numinlets" : 1,
									"id" : "obj-70",
									"numoutlets" : 1,
									"outlettype" : [ "float" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "gain~",
									"patching_rect" : [ 142.0, 465.0, 24.0, 98.0 ],
									"interp" : 135.0,
									"numinlets" : 2,
									"id" : "obj-51",
									"numoutlets" : 2,
									"outlettype" : [ "signal", "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "*~",
									"fontsize" : 12.0,
									"patching_rect" : [ 145.0, 435.0, 32.5, 20.0 ],
									"numinlets" : 2,
									"id" : "obj-50",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "signal" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "scale 0. 1. 0. 35.",
									"fontsize" : 12.0,
									"patching_rect" : [ 771.0, 124.0, 99.0, 20.0 ],
									"numinlets" : 6,
									"id" : "obj-11",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "scale 0. 1. 0. 35.",
									"fontsize" : 12.0,
									"patching_rect" : [ 648.0, 126.0, 99.0, 20.0 ],
									"numinlets" : 6,
									"id" : "obj-10",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "scale 0. 1. 0. 35.",
									"fontsize" : 12.0,
									"patching_rect" : [ 505.0, 127.0, 99.0, 20.0 ],
									"numinlets" : 6,
									"id" : "obj-9",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "scale 0. 1. 0. 35.",
									"fontsize" : 12.0,
									"patching_rect" : [ 374.0, 127.0, 99.0, 20.0 ],
									"numinlets" : 6,
									"id" : "obj-7",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "scale 0. 1. 0. 35.",
									"fontsize" : 12.0,
									"patching_rect" : [ 247.0, 129.0, 99.0, 20.0 ],
									"numinlets" : 6,
									"id" : "obj-6",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "scale 0. 1. 0. 35.",
									"fontsize" : 12.0,
									"patching_rect" : [ 118.0, 129.0, 99.0, 20.0 ],
									"numinlets" : 6,
									"id" : "obj-5",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "snapshot~ 1",
									"fontsize" : 12.0,
									"patching_rect" : [ 819.0, 357.0, 76.0, 20.0 ],
									"numinlets" : 2,
									"id" : "obj-31",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "float" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "127, 0 250",
									"fontsize" : 12.0,
									"patching_rect" : [ 819.0, 312.0, 67.0, 18.0 ],
									"numinlets" : 2,
									"id" : "obj-35",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "line~",
									"fontsize" : 12.0,
									"patching_rect" : [ 819.0, 332.0, 36.0, 20.0 ],
									"numinlets" : 2,
									"id" : "obj-39",
									"fontname" : "Arial",
									"numoutlets" : 2,
									"outlettype" : [ "signal", "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "snapshot~ 1",
									"fontsize" : 12.0,
									"patching_rect" : [ 695.0, 358.0, 76.0, 20.0 ],
									"numinlets" : 2,
									"id" : "obj-22",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "float" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "127, 0 300",
									"fontsize" : 12.0,
									"patching_rect" : [ 695.0, 313.0, 67.0, 18.0 ],
									"numinlets" : 2,
									"id" : "obj-23",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "line~",
									"fontsize" : 12.0,
									"patching_rect" : [ 695.0, 333.0, 36.0, 20.0 ],
									"numinlets" : 2,
									"id" : "obj-27",
									"fontname" : "Arial",
									"numoutlets" : 2,
									"outlettype" : [ "signal", "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "snapshot~ 1",
									"fontsize" : 12.0,
									"patching_rect" : [ 553.0, 358.0, 76.0, 20.0 ],
									"numinlets" : 2,
									"id" : "obj-19",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "float" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "127, 0 200",
									"fontsize" : 12.0,
									"patching_rect" : [ 553.0, 313.0, 67.0, 18.0 ],
									"numinlets" : 2,
									"id" : "obj-20",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "line~",
									"fontsize" : 12.0,
									"patching_rect" : [ 553.0, 333.0, 36.0, 20.0 ],
									"numinlets" : 2,
									"id" : "obj-21",
									"fontname" : "Arial",
									"numoutlets" : 2,
									"outlettype" : [ "signal", "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "snapshot~ 1",
									"fontsize" : 12.0,
									"patching_rect" : [ 421.0, 358.0, 76.0, 20.0 ],
									"numinlets" : 2,
									"id" : "obj-16",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "float" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "127, 0 1000",
									"fontsize" : 12.0,
									"patching_rect" : [ 421.0, 313.0, 74.0, 18.0 ],
									"numinlets" : 2,
									"id" : "obj-17",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "line~",
									"fontsize" : 12.0,
									"patching_rect" : [ 421.0, 333.0, 36.0, 20.0 ],
									"numinlets" : 2,
									"id" : "obj-18",
									"fontname" : "Arial",
									"numoutlets" : 2,
									"outlettype" : [ "signal", "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "snapshot~ 1",
									"fontsize" : 12.0,
									"patching_rect" : [ 287.0, 358.0, 76.0, 20.0 ],
									"numinlets" : 2,
									"id" : "obj-13",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "float" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "127, 0 100",
									"fontsize" : 12.0,
									"patching_rect" : [ 287.0, 313.0, 67.0, 18.0 ],
									"numinlets" : 2,
									"id" : "obj-14",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "line~",
									"fontsize" : 12.0,
									"patching_rect" : [ 287.0, 333.0, 36.0, 20.0 ],
									"numinlets" : 2,
									"id" : "obj-15",
									"fontname" : "Arial",
									"numoutlets" : 2,
									"outlettype" : [ "signal", "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "1, 0 100",
									"fontsize" : 12.0,
									"patching_rect" : [ 163.0, 313.0, 54.0, 18.0 ],
									"numinlets" : 2,
									"id" : "obj-8",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "line~",
									"fontsize" : 12.0,
									"patching_rect" : [ 163.0, 333.0, 36.0, 20.0 ],
									"numinlets" : 2,
									"id" : "obj-2",
									"fontname" : "Arial",
									"numoutlets" : 2,
									"outlettype" : [ "signal", "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "loadbang",
									"fontsize" : 12.0,
									"patching_rect" : [ 375.0, 2.0, 60.0, 20.0 ],
									"numinlets" : 1,
									"id" : "obj-1",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "Pitch Offset",
									"linecount" : 2,
									"fontsize" : 12.0,
									"patching_rect" : [ 8.0, 198.0, 69.0, 34.0 ],
									"numinlets" : 1,
									"id" : "obj-97",
									"fontname" : "Arial",
									"numoutlets" : 0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "This example uses (poorly hacks) VJ Manzo's Modal Object library\n\n",
									"linecount" : 2,
									"fontsize" : 12.0,
									"patching_rect" : [ 610.0, 595.0, 379.0, 34.0 ],
									"numinlets" : 1,
									"id" : "obj-95",
									"fontname" : "Arial",
									"numoutlets" : 0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "s tonic",
									"fontsize" : 12.0,
									"patching_rect" : [ 352.0, 63.0, 45.0, 20.0 ],
									"numinlets" : 1,
									"id" : "obj-92",
									"fontname" : "Arial",
									"numoutlets" : 0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "s mode",
									"fontsize" : 12.0,
									"patching_rect" : [ 428.0, 65.0, 50.0, 20.0 ],
									"numinlets" : 1,
									"id" : "obj-91",
									"fontname" : "Arial",
									"numoutlets" : 0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "r mode",
									"fontsize" : 12.0,
									"patching_rect" : [ 723.0, 201.0, 48.0, 20.0 ],
									"numinlets" : 0,
									"id" : "obj-88",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "r tonic",
									"fontsize" : 12.0,
									"patching_rect" : [ 686.0, 181.0, 43.0, 20.0 ],
									"numinlets" : 0,
									"id" : "obj-89",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "p modalChange",
									"fontsize" : 12.0,
									"patching_rect" : [ 648.0, 223.0, 95.0, 20.0 ],
									"numinlets" : 3,
									"id" : "obj-90",
									"fontname" : "Arial",
									"numoutlets" : 2,
									"outlettype" : [ "int", "int" ],
									"patcher" : 									{
										"fileversion" : 1,
										"rect" : [ 461.0, 44.0, 1093.0, 691.0 ],
										"bglocked" : 0,
										"defrect" : [ 461.0, 44.0, 1093.0, 691.0 ],
										"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
										"openinpresentation" : 0,
										"default_fontsize" : 12.0,
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"gridonopen" : 0,
										"gridsize" : [ 15.0, 15.0 ],
										"gridsnaponopen" : 0,
										"toolbarvisible" : 1,
										"boxanimatetime" : 200,
										"imprint" : 0,
										"enablehscroll" : 1,
										"enablevscroll" : 1,
										"devicewidth" : 0.0,
										"boxes" : [ 											{
												"box" : 												{
													"maxclass" : "inlet",
													"hint" : "Mode Name",
													"patching_rect" : [ 926.0, 38.0, 25.0, 25.0 ],
													"numinlets" : 0,
													"id" : "obj-2",
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"comment" : ""
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "inlet",
													"hint" : "Tonic (Note or Number)",
													"annotation" : "",
													"patching_rect" : [ 865.0, 38.0, 25.0, 25.0 ],
													"numinlets" : 0,
													"id" : "obj-1",
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"comment" : ""
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "outlet",
													"patching_rect" : [ 828.0, 440.0, 25.0, 25.0 ],
													"numinlets" : 1,
													"id" : "obj-161",
													"numoutlets" : 0,
													"comment" : ""
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "outlet",
													"patching_rect" : [ 776.0, 440.0, 25.0, 25.0 ],
													"numinlets" : 1,
													"id" : "obj-160",
													"numoutlets" : 0,
													"comment" : ""
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "inlet",
													"patching_rect" : [ 776.0, 290.0, 25.0, 25.0 ],
													"numinlets" : 0,
													"id" : "obj-159",
													"numoutlets" : 1,
													"outlettype" : [ "float" ],
													"comment" : ""
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "bpatcher",
													"patching_rect" : [ 619.0, 579.0, 195.0, 148.0 ],
													"name" : "modal_change_related_objects.maxpat",
													"numinlets" : 0,
													"args" : [  ],
													"id" : "obj-13",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "< - Get scale data in a table",
													"linecount" : 2,
													"fontsize" : 12.0,
													"patching_rect" : [ 732.0, 477.0, 141.0, 34.0 ],
													"numinlets" : 1,
													"id" : "obj-119",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "<-- send data to any table",
													"fontsize" : 10.0,
													"patching_rect" : [ 712.0, 508.0, 122.0, 18.0 ],
													"numinlets" : 1,
													"id" : "obj-123",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Look at these table uses:",
													"fontsize" : 12.0,
													"patching_rect" : [ 631.0, 534.0, 153.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-113",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "modal_table_filter",
													"fontsize" : 12.0,
													"patching_rect" : [ 625.0, 477.0, 105.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-33",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"outlettype" : [ "int", "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "table my_table",
													"fontsize" : 12.0,
													"patching_rect" : [ 625.0, 506.0, 89.0, 20.0 ],
													"numinlets" : 2,
													"color" : [ 0.019608, 0.137255, 0.823529, 1.0 ],
													"id" : "obj-11",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"outlettype" : [ "int", "bang" ],
													"showeditor" : 0,
													"editor_rect" : [ 473.0, 481.0, 588.0, 619.0 ],
													"saved_object_attributes" : 													{
														"embed" : 0,
														"signed" : 0,
														"notename" : 0,
														"name" : "my_table",
														"size" : 128,
														"showeditor" : 0,
														"range" : 128
													}

												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "< - Get filtered scale data in a coll list. ",
													"linecount" : 2,
													"fontsize" : 12.0,
													"patching_rect" : [ 722.0, 347.0, 155.0, 34.0 ],
													"numinlets" : 1,
													"id" : "obj-150",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "<-- send data to any coll",
													"fontsize" : 10.0,
													"patching_rect" : [ 697.0, 383.0, 122.0, 18.0 ],
													"numinlets" : 1,
													"id" : "obj-148",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "modal_coll_filter",
													"fontsize" : 12.0,
													"patching_rect" : [ 627.0, 350.0, 97.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-145",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "loadmess set",
													"hidden" : 1,
													"fontsize" : 8.0,
													"patching_rect" : [ 559.0, 314.0, 58.0, 16.0 ],
													"numinlets" : 1,
													"id" : "obj-144",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "4 6 8 9 11 13 15 16",
													"fontsize" : 12.0,
													"gradient" : 1,
													"patching_rect" : [ 449.0, 346.0, 150.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-141",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.8, 0.729412, 0.87451, 1.0 ],
													"outlettype" : [ "" ],
													"bgcolor2" : [ 1.0, 1.0, 1.0, 1.0 ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "list out",
													"textcolor" : [ 0.4, 0.4, 0.8, 1.0 ],
													"frgb" : [ 0.4, 0.4, 0.8, 1.0 ],
													"fontsize" : 12.0,
													"patching_rect" : [ 479.0, 329.0, 53.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-140",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "umenu",
													"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
													"fontsize" : 12.0,
													"items" : [ "C", ",", "C#", ",", "D", ",", "D#", ",", "E", ",", "F", ",", "F#", ",", "G", ",", "G#", ",", "A", ",", "A#", ",", "B" ],
													"patching_rect" : [ 52.0, 175.0, 56.0, 20.0 ],
													"numinlets" : 1,
													"labelclick" : 1,
													"id" : "obj-3",
													"fontname" : "Arial",
													"numoutlets" : 3,
													"types" : [  ],
													"bgcolor" : [ 0.94902, 0.894118, 0.984314, 1.0 ],
													"outlettype" : [ "int", "", "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "control modality in Max",
													"fontsize" : 12.0,
													"patching_rect" : [ 53.0, 83.0, 164.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-6",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Look at these coll list uses:",
													"fontsize" : 12.0,
													"patching_rect" : [ 629.0, 409.0, 153.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-12",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "takes mode names",
													"fontsize" : 12.0,
													"patching_rect" : [ 298.0, 216.0, 160.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-14",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "even takes scale degree distances (in half steps)",
													"linecount" : 2,
													"fontsize" : 12.0,
													"patching_rect" : [ 567.0, 159.0, 161.0, 34.0 ],
													"numinlets" : 1,
													"id" : "obj-15",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 374.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-16",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 338.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-17",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 302.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-18",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 266.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-19",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 230.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-20",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 194.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-21",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 158.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-22",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 374.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-23",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 338.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-24",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 302.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-25",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 266.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-26",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 230.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-27",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 194.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-28",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 158.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-29",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 122.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-30",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 122.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-31",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "2 1 2 2 2 2 1",
													"fontsize" : 12.0,
													"patching_rect" : [ 567.0, 193.0, 82.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-34",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 7",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 669.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-35",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 7",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 669.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-36",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 7",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 669.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-37",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 7",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 669.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-38",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 6",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 634.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-39",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 6",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 634.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-40",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 6",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 634.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-41",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 6",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 634.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-42",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 5",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 602.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-43",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 5",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 602.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-44",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 5",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 602.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-45",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 5",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 602.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-46",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 4",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 569.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-47",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 4",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 569.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-48",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 4",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 569.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-49",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 4",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 569.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-50",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 3",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 536.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-51",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 3",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 536.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-52",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 3",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 536.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-53",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 3",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 536.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-54",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 2",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 496.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-55",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 2",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 496.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-56",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 2",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 496.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-57",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 2",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 496.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-58",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 1",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 462.0, 130.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-59",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 1",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 462.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-60",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 1",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 462.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-61",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 1",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 462.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-62",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Melodic Minor Modes",
													"fontface" : 1,
													"fontsize" : 11.0,
													"patching_rect" : [ 454.0, 416.0, 131.0, 19.0 ],
													"numinlets" : 1,
													"id" : "obj-63",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Harmonic Minor Modes",
													"fontface" : 1,
													"fontsize" : 11.0,
													"patching_rect" : [ 313.0, 416.0, 145.0, 19.0 ],
													"numinlets" : 1,
													"id" : "obj-64",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Harmonic Major Modes",
													"fontface" : 1,
													"fontsize" : 11.0,
													"patching_rect" : [ 173.0, 416.0, 145.0, 19.0 ],
													"numinlets" : 1,
													"id" : "obj-65",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"minimum" : 0,
													"fontsize" : 12.0,
													"maximum" : 11,
													"patching_rect" : [ 192.0, 176.0, 29.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-66",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "umenu",
													"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
													"fontsize" : 12.0,
													"items" : [ "ionian", ",", "dorian", ",", "phrygian", ",", "lydian", ",", "mixolydian", ",", "aeolian", ",", "locrian", ",", "harmonic_major", ",", "dorian_b5", ",", "phrygian_b4", ",", "lydian_b3", ",", "mixolydian_b2", ",", "aeolian_b1", ",", "locrian_b7", ",", "harmonic_minor", ",", "locrian_#6", ",", "ionian_#5", ",", "dorian_#4", ",", "phrygian_#3", ",", "lydian_#2", ",", "mixolydian_#1", ",", "melodic_minor", ",", "dorian_b2", ",", "lydian_#5", ",", "lydian_b7", ",", "mixolydian_b6", ",", "locrian_#2", ",", "locrian_b4" ],
													"patching_rect" : [ 438.0, 173.0, 100.0, 20.0 ],
													"numinlets" : 1,
													"labelclick" : 1,
													"id" : "obj-67",
													"fontname" : "Arial",
													"numoutlets" : 3,
													"types" : [  ],
													"bgcolor" : [ 0.94902, 0.894118, 0.984314, 1.0 ],
													"outlettype" : [ "int", "", "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "p table_uses",
													"fontsize" : 12.0,
													"patching_rect" : [ 772.0, 534.0, 79.0, 20.0 ],
													"numinlets" : 0,
													"id" : "obj-68",
													"fontname" : "Arial",
													"numoutlets" : 0,
													"patcher" : 													{
														"fileversion" : 1,
														"rect" : [ 79.0, 111.0, 387.0, 438.0 ],
														"bglocked" : 0,
														"defrect" : [ 79.0, 111.0, 387.0, 438.0 ],
														"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
														"openinpresentation" : 0,
														"default_fontsize" : 12.0,
														"default_fontface" : 0,
														"default_fontname" : "Arial",
														"gridonopen" : 0,
														"gridsize" : [ 15.0, 15.0 ],
														"gridsnaponopen" : 0,
														"toolbarvisible" : 1,
														"boxanimatetime" : 200,
														"imprint" : 0,
														"enablehscroll" : 1,
														"enablevscroll" : 1,
														"devicewidth" : 0.0,
														"boxes" : [ 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "loadmess 4",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 108.0, 180.0, 56.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-1",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "32nd note",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 159.0, 44.0, 58.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-2",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "16th note",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 157.0, 65.0, 58.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-3",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "8th",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 156.0, 84.0, 58.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-4",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "quarter note",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 144.0, 104.0, 58.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-5",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "half note",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 145.0, 129.0, 58.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-6",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "whole note",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 143.0, 147.0, 58.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-7",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "message",
																	"text" : "1",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 128.0, 145.0, 16.0, 15.0 ],
																	"numinlets" : 2,
																	"id" : "obj-8",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "message",
																	"text" : "2",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 128.0, 124.0, 16.0, 15.0 ],
																	"numinlets" : 2,
																	"id" : "obj-9",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "message",
																	"text" : "4",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 128.0, 103.0, 16.0, 15.0 ],
																	"numinlets" : 2,
																	"id" : "obj-10",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "message",
																	"text" : "tempo $1",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 39.0, 94.0, 56.0, 15.0 ],
																	"numinlets" : 2,
																	"id" : "obj-11",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "flonum",
																	"minimum" : 5.0,
																	"fontsize" : 9.0,
																	"maximum" : 300.0,
																	"patching_rect" : [ 39.0, 74.0, 45.0, 17.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-12",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "float", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "button",
																	"patching_rect" : [ 27.0, 150.0, 15.0, 15.0 ],
																	"numinlets" : 1,
																	"id" : "obj-13",
																	"numoutlets" : 1,
																	"outlettype" : [ "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "toggle",
																	"patching_rect" : [ 27.0, 37.0, 15.0, 15.0 ],
																	"numinlets" : 1,
																	"id" : "obj-14",
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "message",
																	"text" : "8",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 128.0, 82.0, 27.0, 15.0 ],
																	"numinlets" : 2,
																	"id" : "obj-15",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "message",
																	"text" : "16",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 128.0, 61.0, 27.0, 15.0 ],
																	"numinlets" : 2,
																	"id" : "obj-16",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "message",
																	"text" : "32",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 128.0, 41.0, 27.0, 15.0 ],
																	"numinlets" : 2,
																	"id" : "obj-17",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "tempo 120 1 4",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 27.0, 119.0, 68.0, 17.0 ],
																	"numinlets" : 4,
																	"id" : "obj-18",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "number",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 28.0, 263.0, 35.0, 17.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-19",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "int", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "slider",
																	"patching_rect" : [ 89.0, 206.0, 15.0, 18.0 ],
																	"relative" : 1,
																	"numinlets" : 1,
																	"orientation" : 2,
																	"size" : 11.0,
																	"id" : "obj-20",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"mult" : 12.0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "+ 0",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 37.0, 236.0, 27.0, 17.0 ],
																	"numinlets" : 2,
																	"id" : "obj-21",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "number",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 27.0, 206.0, 35.0, 17.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-22",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "int", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "table my_table",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 27.0, 180.0, 69.0, 17.0 ],
																	"numinlets" : 2,
																	"color" : [ 1.0, 0.890196, 0.090196, 1.0 ],
																	"id" : "obj-23",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"outlettype" : [ "int", "bang" ],
																	"showeditor" : 0,
																	"editor_rect" : [ 100.0, 100.0, 300.0, 300.0 ],
																	"saved_object_attributes" : 																	{
																		"embed" : 0,
																		"signed" : 0,
																		"notename" : 0,
																		"name" : "my_table",
																		"size" : 128,
																		"showeditor" : 0,
																		"range" : 128
																	}

																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "noteout",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 28.0, 324.0, 40.0, 17.0 ],
																	"numinlets" : 3,
																	"id" : "obj-24",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "makenote 100 100",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 28.0, 289.0, 85.0, 17.0 ],
																	"numinlets" : 3,
																	"id" : "obj-25",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"outlettype" : [ "float", "float" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "octave",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 106.0, 206.0, 39.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-26",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "tempo",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 41.0, 58.0, 35.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-27",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "START",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 18.0, 21.0, 43.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-28",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
 ],
														"lines" : [ 															{
																"patchline" : 																{
																	"source" : [ "obj-11", 0 ],
																	"destination" : [ "obj-18", 0 ],
																	"hidden" : 0,
																	"midpoints" : [ 48.5, 114.0, 36.5, 114.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-14", 0 ],
																	"destination" : [ "obj-18", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-18", 0 ],
																	"destination" : [ "obj-13", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-21", 0 ],
																	"destination" : [ "obj-19", 0 ],
																	"hidden" : 0,
																	"midpoints" : [ 46.5, 258.0, 37.5, 258.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-19", 0 ],
																	"destination" : [ "obj-25", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-25", 0 ],
																	"destination" : [ "obj-24", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-22", 0 ],
																	"destination" : [ "obj-21", 0 ],
																	"hidden" : 0,
																	"midpoints" : [ 36.5, 229.0, 46.5, 229.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-12", 0 ],
																	"destination" : [ "obj-11", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-25", 1 ],
																	"destination" : [ "obj-24", 1 ],
																	"hidden" : 0,
																	"midpoints" : [ 103.5, 315.0, 48.0, 315.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-20", 0 ],
																	"destination" : [ "obj-21", 1 ],
																	"hidden" : 0,
																	"midpoints" : [ 98.0, 230.0, 54.5, 230.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-9", 0 ],
																	"destination" : [ "obj-18", 3 ],
																	"hidden" : 1,
																	"midpoints" : [ 137.5, 111.0, 85.5, 111.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-10", 0 ],
																	"destination" : [ "obj-18", 3 ],
																	"hidden" : 1,
																	"midpoints" : [ 137.5, 90.0, 85.5, 90.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-15", 0 ],
																	"destination" : [ "obj-18", 3 ],
																	"hidden" : 1,
																	"midpoints" : [ 137.5, 69.0, 85.5, 69.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-17", 0 ],
																	"destination" : [ "obj-18", 3 ],
																	"hidden" : 1,
																	"midpoints" : [ 137.5, 27.0, 85.5, 27.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-16", 0 ],
																	"destination" : [ "obj-18", 3 ],
																	"hidden" : 1,
																	"midpoints" : [ 137.5, 49.0, 85.5, 49.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-8", 0 ],
																	"destination" : [ "obj-18", 3 ],
																	"hidden" : 1,
																	"midpoints" : [ 137.5, 133.0, 120.0, 133.0, 120.0, 111.0, 85.5, 111.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-1", 0 ],
																	"destination" : [ "obj-20", 0 ],
																	"hidden" : 0,
																	"midpoints" : [ 117.5, 201.0, 98.0, 201.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-23", 0 ],
																	"destination" : [ "obj-22", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-13", 0 ],
																	"destination" : [ "obj-23", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
 ]
													}
,
													"saved_object_attributes" : 													{
														"default_fontface" : 0,
														"fontface" : 0,
														"fontsize" : 12.0,
														"default_fontname" : "Arial",
														"default_fontsize" : 12.0,
														"fontname" : "Arial",
														"globalpatchername" : ""
													}

												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "p coll_uses",
													"fontsize" : 12.0,
													"patching_rect" : [ 776.0, 409.0, 71.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-69",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"outlettype" : [ "int", "int" ],
													"patcher" : 													{
														"fileversion" : 1,
														"rect" : [ 160.0, 156.0, 344.0, 479.0 ],
														"bglocked" : 0,
														"defrect" : [ 160.0, 156.0, 344.0, 479.0 ],
														"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
														"openinpresentation" : 0,
														"default_fontsize" : 12.0,
														"default_fontface" : 0,
														"default_fontname" : "Arial",
														"gridonopen" : 0,
														"gridsize" : [ 15.0, 15.0 ],
														"gridsnaponopen" : 0,
														"toolbarvisible" : 1,
														"boxanimatetime" : 200,
														"imprint" : 0,
														"enablehscroll" : 1,
														"enablevscroll" : 1,
														"devicewidth" : 0.0,
														"boxes" : [ 															{
																"box" : 																{
																	"maxclass" : "outlet",
																	"patching_rect" : [ 237.0, 427.0, 25.0, 25.0 ],
																	"numinlets" : 1,
																	"id" : "obj-22",
																	"numoutlets" : 0,
																	"comment" : ""
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "outlet",
																	"patching_rect" : [ 144.0, 429.0, 25.0, 25.0 ],
																	"numinlets" : 1,
																	"id" : "obj-21",
																	"numoutlets" : 0,
																	"comment" : ""
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "inlet",
																	"patching_rect" : [ 25.0, 31.0, 25.0, 25.0 ],
																	"numinlets" : 0,
																	"id" : "obj-20",
																	"numoutlets" : 1,
																	"outlettype" : [ "float" ],
																	"comment" : ""
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "data stored in list",
																	"linecount" : 2,
																	"fontsize" : 12.0,
																	"patching_rect" : [ 253.0, 244.0, 72.0, 34.0 ],
																	"numinlets" : 1,
																	"id" : "obj-1",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "this patch filters all unrelated notes to ones from the selected mode",
																	"linecount" : 2,
																	"fontsize" : 12.0,
																	"patching_rect" : [ 62.0, 21.0, 199.0, 34.0 ],
																	"numinlets" : 1,
																	"id" : "obj-2",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "number",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 182.0, 277.0, 41.0, 20.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-3",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "int", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "number",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 182.0, 213.0, 38.0, 20.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-4",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "int", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "number",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 25.0, 213.0, 34.0, 20.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-5",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "int", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "* 12",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 25.0, 241.0, 51.0, 20.0 ],
																	"numinlets" : 2,
																	"id" : "obj-6",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "kslider",
																	"patching_rect" : [ 25.0, 359.0, 196.0, 34.0 ],
																	"numinlets" : 2,
																	"id" : "obj-7",
																	"numoutlets" : 2,
																	"outlettype" : [ "int", "int" ],
																	"presentation_rect" : [ 0.0, 0.0, 196.0, 35.0 ],
																	"hkeycolor" : [ 0.666667, 0.666667, 0.666667, 1.0 ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "noteout",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 25.0, 419.0, 58.0, 20.0 ],
																	"numinlets" : 3,
																	"id" : "obj-8",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "pitch class",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 222.0, 213.0, 72.0, 20.0 ],
																	"numinlets" : 1,
																	"id" : "obj-9",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "number",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 25.0, 331.0, 45.0, 20.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-10",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "int", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "+",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 25.0, 305.0, 31.0, 20.0 ],
																	"numinlets" : 2,
																	"id" : "obj-11",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "coll my_coll",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 182.0, 246.0, 73.0, 20.0 ],
																	"numinlets" : 1,
																	"color" : [ 0.0, 0.133333, 0.882353, 1.0 ],
																	"id" : "obj-12",
																	"fontname" : "Arial",
																	"numoutlets" : 4,
																	"outlettype" : [ "", "", "", "" ],
																	"saved_object_attributes" : 																	{
																		"embed" : 0
																	}

																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "number",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 25.0, 135.0, 40.0, 20.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-13",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "int", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "% 12",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 182.0, 184.0, 46.0, 20.0 ],
																	"numinlets" : 2,
																	"id" : "obj-14",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "/ 12",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 25.0, 185.0, 41.0, 20.0 ],
																	"numinlets" : 2,
																	"id" : "obj-15",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "kslider",
																	"patching_rect" : [ 25.0, 94.0, 196.0, 34.0 ],
																	"numinlets" : 2,
																	"id" : "obj-16",
																	"numoutlets" : 2,
																	"outlettype" : [ "int", "int" ],
																	"presentation_rect" : [ 0.0, 0.0, 196.0, 35.0 ],
																	"hkeycolor" : [ 0.501961, 0.501961, 0.501961, 1.0 ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "MIDI Note",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 64.0, 135.0, 78.0, 20.0 ],
																	"numinlets" : 1,
																	"id" : "obj-18",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "octave register",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 56.0, 213.0, 90.0, 20.0 ],
																	"numinlets" : 1,
																	"id" : "obj-19",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
 ],
														"lines" : [ 															{
																"patchline" : 																{
																	"source" : [ "obj-13", 0 ],
																	"destination" : [ "obj-15", 0 ],
																	"hidden" : 0,
																	"midpoints" : [ 34.5, 175.0, 34.5, 175.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-15", 0 ],
																	"destination" : [ "obj-5", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-5", 0 ],
																	"destination" : [ "obj-6", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-6", 0 ],
																	"destination" : [ "obj-11", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-11", 0 ],
																	"destination" : [ "obj-10", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-10", 0 ],
																	"destination" : [ "obj-7", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-3", 0 ],
																	"destination" : [ "obj-11", 1 ],
																	"hidden" : 0,
																	"midpoints" : [ 191.5, 300.0, 46.5, 300.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-16", 0 ],
																	"destination" : [ "obj-13", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-13", 0 ],
																	"destination" : [ "obj-14", 0 ],
																	"hidden" : 0,
																	"midpoints" : [ 34.5, 175.0, 191.5, 175.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-14", 0 ],
																	"destination" : [ "obj-4", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-16", 1 ],
																	"destination" : [ "obj-7", 1 ],
																	"hidden" : 1,
																	"midpoints" : [ 211.5, 309.0, 211.5, 309.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-7", 1 ],
																	"destination" : [ "obj-8", 1 ],
																	"hidden" : 0,
																	"midpoints" : [ 211.5, 404.0, 54.0, 404.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-7", 0 ],
																	"destination" : [ "obj-8", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-4", 0 ],
																	"destination" : [ "obj-12", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-12", 0 ],
																	"destination" : [ "obj-3", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-7", 0 ],
																	"destination" : [ "obj-21", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-7", 1 ],
																	"destination" : [ "obj-22", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-20", 0 ],
																	"destination" : [ "obj-16", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
 ]
													}
,
													"saved_object_attributes" : 													{
														"default_fontface" : 0,
														"fontface" : 0,
														"fontsize" : 12.0,
														"default_fontname" : "Arial",
														"default_fontsize" : 12.0,
														"fontname" : "Arial",
														"globalpatchername" : ""
													}

												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "F#",
													"fontsize" : 12.0,
													"patching_rect" : [ 166.0, 176.0, 23.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-70",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 374.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-71",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 338.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-72",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 302.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-73",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 266.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-74",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 230.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-75",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 194.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-76",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 158.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-77",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 122.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-78",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "locrian_b7",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 651.0, 75.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-79",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "locrian_b4",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 651.0, 75.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-80",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "mixolydian_#1",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 651.0, 101.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-81",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "locrian",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 651.0, 51.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-82",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "aeolian_b1",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 617.0, 79.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-83",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "locrian_#2",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 617.0, 75.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-84",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "lydian_#2",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 617.0, 71.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-85",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "aeolian",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 617.0, 55.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-86",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "mixolydian_b2",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 583.0, 101.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-87",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "mixolydian_b6",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 583.0, 101.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-88",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "phrygian_#3",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 583.0, 87.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-89",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "mixolydian",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 583.0, 77.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-90",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "lydian_b3",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 551.0, 71.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-91",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "lydian_b7",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 551.0, 71.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-92",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "dorian_#4",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 551.0, 71.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-93",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "lydian",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 551.0, 47.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-94",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "phrygian_b4",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 517.0, 87.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-95",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "lydian_#5",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 517.0, 71.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-96",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "ionian_#5",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 517.0, 72.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-97",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "phrygian",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 517.0, 63.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-98",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "dorian_b5",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 479.0, 71.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-99",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "dorian_b2",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 479.0, 71.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-100",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "locrian_#6",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 479.0, 75.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-101",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "dorian",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 479.0, 47.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-102",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "harmonic_major",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 443.0, 111.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-103",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "melodic_minor",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 443.0, 103.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-104",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "harmonic_minor",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 443.0, 111.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-105",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "ionian",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 443.0, 48.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-106",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "mode names",
													"textcolor" : [ 0.4, 0.4, 0.8, 1.0 ],
													"frgb" : [ 0.4, 0.4, 0.8, 1.0 ],
													"fontsize" : 12.0,
													"patching_rect" : [ 619.0, 225.0, 81.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-107",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "coll my_coll",
													"fontsize" : 12.0,
													"patching_rect" : [ 627.0, 381.0, 73.0, 20.0 ],
													"numinlets" : 1,
													"color" : [ 0.4, 0.4, 0.8, 1.0 ],
													"id" : "obj-108",
													"fontname" : "Arial",
													"numoutlets" : 4,
													"outlettype" : [ "", "", "", "" ],
													"saved_object_attributes" : 													{
														"embed" : 0
													}

												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "lydian_b7",
													"fontsize" : 12.0,
													"patching_rect" : [ 358.0, 191.0, 68.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-110",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "minor",
													"fontsize" : 12.0,
													"patching_rect" : [ 332.0, 171.0, 39.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-111",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "c",
													"fontsize" : 12.0,
													"patching_rect" : [ 143.0, 176.0, 20.5, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-112",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "major",
													"fontsize" : 12.0,
													"patching_rect" : [ 292.0, 191.0, 43.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-114",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "4",
													"fontsize" : 12.0,
													"patching_rect" : [ 120.0, 176.0, 18.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-115",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "send a MIDI pitch class number (C=0, C#=1, etc) 0-11 in the left inlet or simply send a message box with a letter. This will determine the tonic of the 7 note mode. \nNext send a message box with a mode name in the right inlet. ",
													"linecount" : 3,
													"fontsize" : 12.0,
													"patching_rect" : [ 53.0, 103.0, 478.0, 48.0 ],
													"numinlets" : 1,
													"id" : "obj-117",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "tonic",
													"textcolor" : [ 0.4, 0.4, 0.8, 1.0 ],
													"frgb" : [ 0.4, 0.4, 0.8, 1.0 ],
													"fontsize" : 12.0,
													"patching_rect" : [ 78.0, 226.0, 34.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-118",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "modes are named using traditional Greek names and variations of these names that reflect the least amount of chromatic inflections for the 7 modes of the Major Scale, the Harmonic Minor Scale, the Harmonic Major Scale, and the Melodic Minor Scale",
													"linecount" : 3,
													"fontsize" : 12.0,
													"patching_rect" : [ 57.0, 693.0, 529.0, 48.0 ],
													"numinlets" : 1,
													"id" : "obj-121",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "3.1",
													"fontsize" : 12.0,
													"patching_rect" : [ 228.0, 54.0, 31.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-124",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Major Modes",
													"fontface" : 1,
													"fontsize" : 11.0,
													"patching_rect" : [ 67.0, 416.0, 131.0, 19.0 ],
													"numinlets" : 1,
													"id" : "obj-125",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "panel",
													"mode" : 1,
													"patching_rect" : [ 65.0, 410.0, 93.0, 285.0 ],
													"numinlets" : 1,
													"id" : "obj-126",
													"numoutlets" : 0,
													"grad2" : [ 1.0, 1.0, 1.0, 1.0 ],
													"bgcolor" : [ 0.937255, 0.956863, 1.0, 1.0 ],
													"rounded" : 30
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "panel",
													"mode" : 1,
													"patching_rect" : [ 167.0, 410.0, 136.0, 284.0 ],
													"numinlets" : 1,
													"id" : "obj-127",
													"numoutlets" : 0,
													"grad2" : [ 1.0, 1.0, 1.0, 1.0 ],
													"bgcolor" : [ 0.819608, 0.87451, 0.996078, 1.0 ],
													"rounded" : 30
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "panel",
													"mode" : 1,
													"patching_rect" : [ 306.0, 410.0, 137.0, 283.0 ],
													"numinlets" : 1,
													"id" : "obj-128",
													"numoutlets" : 0,
													"grad2" : [ 1.0, 1.0, 1.0, 1.0 ],
													"bgcolor" : [ 0.694118, 0.768627, 0.988235, 1.0 ],
													"rounded" : 30
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "pitch classes only (reduced to one octave)",
													"fontsize" : 12.0,
													"patching_rect" : [ 170.0, 379.0, 272.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-130",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "complete mode list",
													"fontsize" : 12.0,
													"patching_rect" : [ 436.0, 151.0, 112.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-131",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "takes numbers or letters",
													"fontsize" : 12.0,
													"patching_rect" : [ 111.0, 156.0, 140.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-132",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "modal_change",
													"textcolor" : [ 0.047059, 0.0, 0.454902, 1.0 ],
													"frgb" : [ 0.047059, 0.0, 0.454902, 1.0 ],
													"fontsize" : 26.0,
													"patching_rect" : [ 53.0, 53.0, 181.0, 36.0 ],
													"numinlets" : 1,
													"id" : "obj-133",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "pitches at each scale degree",
													"fontsize" : 11.0,
													"patching_rect" : [ 195.0, 344.0, 201.0, 19.0 ],
													"numinlets" : 1,
													"id" : "obj-134",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "panel",
													"mode" : 1,
													"patching_rect" : [ 618.0, 340.0, 262.0, 94.0 ],
													"numinlets" : 1,
													"grad1" : [ 0.894118, 0.917647, 1.0, 1.0 ],
													"id" : "obj-137",
													"numoutlets" : 0,
													"angle" : 1.16,
													"bgcolor" : [ 0.937255, 0.956863, 1.0, 1.0 ],
													"rounded" : 30
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "panel",
													"mode" : 1,
													"patching_rect" : [ 444.0, 410.0, 136.0, 284.0 ],
													"numinlets" : 1,
													"id" : "obj-129",
													"numoutlets" : 0,
													"grad2" : [ 1.0, 1.0, 1.0, 1.0 ],
													"bgcolor" : [ 0.576471, 0.643137, 0.980392, 1.0 ],
													"rounded" : 30
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "panel",
													"mode" : 1,
													"patching_rect" : [ 618.0, 466.0, 262.0, 94.0 ],
													"numinlets" : 1,
													"grad1" : [ 0.894118, 0.917647, 1.0, 1.0 ],
													"id" : "obj-109",
													"numoutlets" : 0,
													"angle" : 1.16,
													"bgcolor" : [ 0.937255, 0.956863, 1.0, 1.0 ],
													"rounded" : 30
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "modal_change",
													"varname" : "modal_change",
													"patching_rect" : [ 68.0, 247.0, 556.0, 65.0 ],
													"numinlets" : 2,
													"background" : 1,
													"id" : "obj-139",
													"numoutlets" : 9,
													"fontcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
													"outlettype" : [ "int", "int", "int", "int", "int", "int", "int", "int", "list" ]
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"source" : [ "obj-33", 0 ],
													"destination" : [ "obj-11", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-33", 1 ],
													"destination" : [ "obj-11", 1 ],
													"hidden" : 0,
													"midpoints" : [ 720.5, 501.5, 704.5, 501.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 8 ],
													"destination" : [ "obj-33", 0 ],
													"hidden" : 0,
													"midpoints" : [ 614.5, 453.0, 634.5, 453.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-66", 0 ],
													"destination" : [ "obj-139", 0 ],
													"hidden" : 0,
													"midpoints" : [ 201.5, 220.5, 77.5, 220.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-70", 0 ],
													"destination" : [ "obj-139", 0 ],
													"hidden" : 0,
													"midpoints" : [ 175.5, 220.5, 77.5, 220.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-115", 0 ],
													"destination" : [ "obj-139", 0 ],
													"hidden" : 0,
													"midpoints" : [ 129.5, 220.5, 77.5, 220.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-112", 0 ],
													"destination" : [ "obj-139", 0 ],
													"hidden" : 0,
													"midpoints" : [ 152.5, 220.5, 77.5, 220.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-3", 0 ],
													"destination" : [ "obj-139", 0 ],
													"hidden" : 0,
													"midpoints" : [ 61.5, 213.5, 77.5, 213.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 0 ],
													"destination" : [ "obj-78", 0 ],
													"hidden" : 0,
													"midpoints" : [ 77.5, 317.5, 131.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-78", 0 ],
													"destination" : [ "obj-31", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-31", 0 ],
													"destination" : [ "obj-30", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 1 ],
													"destination" : [ "obj-77", 0 ],
													"hidden" : 0,
													"midpoints" : [ 144.625, 317.5, 167.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-77", 0 ],
													"destination" : [ "obj-22", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-22", 0 ],
													"destination" : [ "obj-29", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 2 ],
													"destination" : [ "obj-76", 0 ],
													"hidden" : 0,
													"midpoints" : [ 211.75, 317.5, 203.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-76", 0 ],
													"destination" : [ "obj-21", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-21", 0 ],
													"destination" : [ "obj-28", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-34", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 0,
													"midpoints" : [ 576.5, 218.5, 614.5, 218.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-67", 1 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 0,
													"midpoints" : [ 488.0, 240.5, 614.5, 240.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-80", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-84", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-88", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-92", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-96", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-100", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-104", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-81", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-85", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-89", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-93", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-97", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-101", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-105", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-79", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-83", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-87", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-91", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-95", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-99", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-103", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-82", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-86", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-90", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-94", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-98", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-102", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-106", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-114", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 0,
													"midpoints" : [ 301.5, 218.5, 614.5, 218.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-111", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 0,
													"midpoints" : [ 341.5, 218.5, 614.5, 218.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-110", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 0,
													"midpoints" : [ 367.5, 218.5, 614.5, 218.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 3 ],
													"destination" : [ "obj-75", 0 ],
													"hidden" : 0,
													"midpoints" : [ 278.875, 317.5, 239.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-75", 0 ],
													"destination" : [ "obj-20", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-20", 0 ],
													"destination" : [ "obj-27", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 4 ],
													"destination" : [ "obj-74", 0 ],
													"hidden" : 0,
													"midpoints" : [ 346.0, 317.5, 275.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-74", 0 ],
													"destination" : [ "obj-19", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-19", 0 ],
													"destination" : [ "obj-26", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 5 ],
													"destination" : [ "obj-73", 0 ],
													"hidden" : 0,
													"midpoints" : [ 413.125, 317.5, 311.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-73", 0 ],
													"destination" : [ "obj-18", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-18", 0 ],
													"destination" : [ "obj-25", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 6 ],
													"destination" : [ "obj-72", 0 ],
													"hidden" : 0,
													"midpoints" : [ 480.25, 317.5, 347.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-72", 0 ],
													"destination" : [ "obj-17", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-17", 0 ],
													"destination" : [ "obj-24", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 7 ],
													"destination" : [ "obj-71", 0 ],
													"hidden" : 0,
													"midpoints" : [ 547.375, 317.5, 383.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-71", 0 ],
													"destination" : [ "obj-16", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-16", 0 ],
													"destination" : [ "obj-23", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 8 ],
													"destination" : [ "obj-141", 1 ],
													"hidden" : 0,
													"midpoints" : [ 614.5, 328.0, 589.5, 328.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-144", 0 ],
													"destination" : [ "obj-141", 0 ],
													"hidden" : 1,
													"midpoints" : [ 568.5, 328.0, 458.5, 328.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 8 ],
													"destination" : [ "obj-145", 0 ],
													"hidden" : 0,
													"midpoints" : [ 614.5, 335.5, 636.5, 335.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-145", 0 ],
													"destination" : [ "obj-108", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-159", 0 ],
													"destination" : [ "obj-69", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-69", 0 ],
													"destination" : [ "obj-160", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-69", 1 ],
													"destination" : [ "obj-161", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-1", 0 ],
													"destination" : [ "obj-139", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-2", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
 ]
									}
,
									"saved_object_attributes" : 									{
										"default_fontface" : 0,
										"fontface" : 0,
										"fontsize" : 12.0,
										"default_fontname" : "Arial",
										"default_fontsize" : 12.0,
										"fontname" : "Arial",
										"globalpatchername" : ""
									}

								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "r mode",
									"fontsize" : 12.0,
									"patching_rect" : [ 580.0, 201.0, 48.0, 20.0 ],
									"numinlets" : 0,
									"id" : "obj-85",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "r tonic",
									"fontsize" : 12.0,
									"patching_rect" : [ 543.0, 181.0, 43.0, 20.0 ],
									"numinlets" : 0,
									"id" : "obj-86",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "p modalChange",
									"fontsize" : 12.0,
									"patching_rect" : [ 505.0, 223.0, 95.0, 20.0 ],
									"numinlets" : 3,
									"id" : "obj-87",
									"fontname" : "Arial",
									"numoutlets" : 2,
									"outlettype" : [ "int", "int" ],
									"patcher" : 									{
										"fileversion" : 1,
										"rect" : [ 347.0, 228.0, 1093.0, 691.0 ],
										"bglocked" : 0,
										"defrect" : [ 347.0, 228.0, 1093.0, 691.0 ],
										"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
										"openinpresentation" : 0,
										"default_fontsize" : 12.0,
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"gridonopen" : 0,
										"gridsize" : [ 15.0, 15.0 ],
										"gridsnaponopen" : 0,
										"toolbarvisible" : 1,
										"boxanimatetime" : 200,
										"imprint" : 0,
										"enablehscroll" : 1,
										"enablevscroll" : 1,
										"devicewidth" : 0.0,
										"boxes" : [ 											{
												"box" : 												{
													"maxclass" : "inlet",
													"hint" : "Mode Name",
													"patching_rect" : [ 926.0, 38.0, 25.0, 25.0 ],
													"numinlets" : 0,
													"id" : "obj-2",
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"comment" : ""
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "inlet",
													"hint" : "Tonic (Note or Number)",
													"annotation" : "",
													"patching_rect" : [ 865.0, 38.0, 25.0, 25.0 ],
													"numinlets" : 0,
													"id" : "obj-1",
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"comment" : ""
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "outlet",
													"patching_rect" : [ 828.0, 440.0, 25.0, 25.0 ],
													"numinlets" : 1,
													"id" : "obj-161",
													"numoutlets" : 0,
													"comment" : ""
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "outlet",
													"patching_rect" : [ 776.0, 440.0, 25.0, 25.0 ],
													"numinlets" : 1,
													"id" : "obj-160",
													"numoutlets" : 0,
													"comment" : ""
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "inlet",
													"patching_rect" : [ 776.0, 290.0, 25.0, 25.0 ],
													"numinlets" : 0,
													"id" : "obj-159",
													"numoutlets" : 1,
													"outlettype" : [ "float" ],
													"comment" : ""
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "bpatcher",
													"patching_rect" : [ 619.0, 579.0, 195.0, 148.0 ],
													"name" : "modal_change_related_objects.maxpat",
													"numinlets" : 0,
													"args" : [  ],
													"id" : "obj-13",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "< - Get scale data in a table",
													"linecount" : 2,
													"fontsize" : 12.0,
													"patching_rect" : [ 732.0, 477.0, 141.0, 34.0 ],
													"numinlets" : 1,
													"id" : "obj-119",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "<-- send data to any table",
													"fontsize" : 10.0,
													"patching_rect" : [ 712.0, 508.0, 122.0, 18.0 ],
													"numinlets" : 1,
													"id" : "obj-123",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Look at these table uses:",
													"fontsize" : 12.0,
													"patching_rect" : [ 631.0, 534.0, 153.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-113",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "modal_table_filter",
													"fontsize" : 12.0,
													"patching_rect" : [ 625.0, 477.0, 105.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-33",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"outlettype" : [ "int", "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "table my_table",
													"fontsize" : 12.0,
													"patching_rect" : [ 625.0, 506.0, 89.0, 20.0 ],
													"numinlets" : 2,
													"color" : [ 0.019608, 0.137255, 0.823529, 1.0 ],
													"id" : "obj-11",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"outlettype" : [ "int", "bang" ],
													"showeditor" : 0,
													"editor_rect" : [ 473.0, 481.0, 588.0, 619.0 ],
													"saved_object_attributes" : 													{
														"embed" : 0,
														"signed" : 0,
														"notename" : 0,
														"name" : "my_table",
														"size" : 128,
														"showeditor" : 0,
														"range" : 128
													}

												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "< - Get filtered scale data in a coll list. ",
													"linecount" : 2,
													"fontsize" : 12.0,
													"patching_rect" : [ 722.0, 347.0, 155.0, 34.0 ],
													"numinlets" : 1,
													"id" : "obj-150",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "<-- send data to any coll",
													"fontsize" : 10.0,
													"patching_rect" : [ 697.0, 383.0, 122.0, 18.0 ],
													"numinlets" : 1,
													"id" : "obj-148",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "modal_coll_filter",
													"fontsize" : 12.0,
													"patching_rect" : [ 627.0, 350.0, 97.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-145",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "loadmess set",
													"hidden" : 1,
													"fontsize" : 8.0,
													"patching_rect" : [ 559.0, 314.0, 58.0, 16.0 ],
													"numinlets" : 1,
													"id" : "obj-144",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "4 6 8 9 11 13 15 16",
													"fontsize" : 12.0,
													"gradient" : 1,
													"patching_rect" : [ 449.0, 346.0, 150.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-141",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.8, 0.729412, 0.87451, 1.0 ],
													"outlettype" : [ "" ],
													"bgcolor2" : [ 1.0, 1.0, 1.0, 1.0 ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "list out",
													"textcolor" : [ 0.4, 0.4, 0.8, 1.0 ],
													"frgb" : [ 0.4, 0.4, 0.8, 1.0 ],
													"fontsize" : 12.0,
													"patching_rect" : [ 479.0, 329.0, 53.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-140",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "umenu",
													"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
													"fontsize" : 12.0,
													"items" : [ "C", ",", "C#", ",", "D", ",", "D#", ",", "E", ",", "F", ",", "F#", ",", "G", ",", "G#", ",", "A", ",", "A#", ",", "B" ],
													"patching_rect" : [ 52.0, 175.0, 56.0, 20.0 ],
													"numinlets" : 1,
													"labelclick" : 1,
													"id" : "obj-3",
													"fontname" : "Arial",
													"numoutlets" : 3,
													"types" : [  ],
													"bgcolor" : [ 0.94902, 0.894118, 0.984314, 1.0 ],
													"outlettype" : [ "int", "", "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "control modality in Max",
													"fontsize" : 12.0,
													"patching_rect" : [ 53.0, 83.0, 164.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-6",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Look at these coll list uses:",
													"fontsize" : 12.0,
													"patching_rect" : [ 629.0, 409.0, 153.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-12",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "takes mode names",
													"fontsize" : 12.0,
													"patching_rect" : [ 298.0, 216.0, 160.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-14",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "even takes scale degree distances (in half steps)",
													"linecount" : 2,
													"fontsize" : 12.0,
													"patching_rect" : [ 567.0, 159.0, 161.0, 34.0 ],
													"numinlets" : 1,
													"id" : "obj-15",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 374.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-16",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 338.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-17",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 302.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-18",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 266.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-19",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 230.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-20",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 194.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-21",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 158.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-22",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 374.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-23",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 338.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-24",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 302.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-25",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 266.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-26",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 230.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-27",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 194.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-28",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 158.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-29",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 122.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-30",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 122.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-31",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "2 1 2 2 2 2 1",
													"fontsize" : 12.0,
													"patching_rect" : [ 567.0, 193.0, 82.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-34",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 7",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 669.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-35",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 7",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 669.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-36",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 7",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 669.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-37",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 7",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 669.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-38",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 6",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 634.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-39",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 6",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 634.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-40",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 6",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 634.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-41",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 6",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 634.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-42",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 5",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 602.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-43",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 5",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 602.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-44",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 5",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 602.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-45",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 5",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 602.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-46",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 4",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 569.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-47",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 4",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 569.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-48",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 4",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 569.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-49",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 4",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 569.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-50",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 3",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 536.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-51",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 3",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 536.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-52",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 3",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 536.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-53",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 3",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 536.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-54",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 2",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 496.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-55",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 2",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 496.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-56",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 2",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 496.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-57",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 2",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 496.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-58",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 1",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 462.0, 130.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-59",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 1",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 462.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-60",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 1",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 462.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-61",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 1",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 462.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-62",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Melodic Minor Modes",
													"fontface" : 1,
													"fontsize" : 11.0,
													"patching_rect" : [ 454.0, 416.0, 131.0, 19.0 ],
													"numinlets" : 1,
													"id" : "obj-63",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Harmonic Minor Modes",
													"fontface" : 1,
													"fontsize" : 11.0,
													"patching_rect" : [ 313.0, 416.0, 145.0, 19.0 ],
													"numinlets" : 1,
													"id" : "obj-64",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Harmonic Major Modes",
													"fontface" : 1,
													"fontsize" : 11.0,
													"patching_rect" : [ 173.0, 416.0, 145.0, 19.0 ],
													"numinlets" : 1,
													"id" : "obj-65",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"minimum" : 0,
													"fontsize" : 12.0,
													"maximum" : 11,
													"patching_rect" : [ 192.0, 176.0, 29.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-66",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "umenu",
													"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
													"fontsize" : 12.0,
													"items" : [ "ionian", ",", "dorian", ",", "phrygian", ",", "lydian", ",", "mixolydian", ",", "aeolian", ",", "locrian", ",", "harmonic_major", ",", "dorian_b5", ",", "phrygian_b4", ",", "lydian_b3", ",", "mixolydian_b2", ",", "aeolian_b1", ",", "locrian_b7", ",", "harmonic_minor", ",", "locrian_#6", ",", "ionian_#5", ",", "dorian_#4", ",", "phrygian_#3", ",", "lydian_#2", ",", "mixolydian_#1", ",", "melodic_minor", ",", "dorian_b2", ",", "lydian_#5", ",", "lydian_b7", ",", "mixolydian_b6", ",", "locrian_#2", ",", "locrian_b4" ],
													"patching_rect" : [ 438.0, 173.0, 100.0, 20.0 ],
													"numinlets" : 1,
													"labelclick" : 1,
													"id" : "obj-67",
													"fontname" : "Arial",
													"numoutlets" : 3,
													"types" : [  ],
													"bgcolor" : [ 0.94902, 0.894118, 0.984314, 1.0 ],
													"outlettype" : [ "int", "", "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "p table_uses",
													"fontsize" : 12.0,
													"patching_rect" : [ 772.0, 534.0, 79.0, 20.0 ],
													"numinlets" : 0,
													"id" : "obj-68",
													"fontname" : "Arial",
													"numoutlets" : 0,
													"patcher" : 													{
														"fileversion" : 1,
														"rect" : [ 79.0, 111.0, 387.0, 438.0 ],
														"bglocked" : 0,
														"defrect" : [ 79.0, 111.0, 387.0, 438.0 ],
														"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
														"openinpresentation" : 0,
														"default_fontsize" : 12.0,
														"default_fontface" : 0,
														"default_fontname" : "Arial",
														"gridonopen" : 0,
														"gridsize" : [ 15.0, 15.0 ],
														"gridsnaponopen" : 0,
														"toolbarvisible" : 1,
														"boxanimatetime" : 200,
														"imprint" : 0,
														"enablehscroll" : 1,
														"enablevscroll" : 1,
														"devicewidth" : 0.0,
														"boxes" : [ 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "loadmess 4",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 108.0, 180.0, 56.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-1",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "32nd note",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 159.0, 44.0, 58.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-2",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "16th note",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 157.0, 65.0, 58.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-3",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "8th",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 156.0, 84.0, 58.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-4",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "quarter note",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 144.0, 104.0, 58.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-5",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "half note",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 145.0, 129.0, 58.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-6",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "whole note",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 143.0, 147.0, 58.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-7",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "message",
																	"text" : "1",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 128.0, 145.0, 16.0, 15.0 ],
																	"numinlets" : 2,
																	"id" : "obj-8",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "message",
																	"text" : "2",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 128.0, 124.0, 16.0, 15.0 ],
																	"numinlets" : 2,
																	"id" : "obj-9",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "message",
																	"text" : "4",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 128.0, 103.0, 16.0, 15.0 ],
																	"numinlets" : 2,
																	"id" : "obj-10",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "message",
																	"text" : "tempo $1",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 39.0, 94.0, 56.0, 15.0 ],
																	"numinlets" : 2,
																	"id" : "obj-11",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "flonum",
																	"minimum" : 5.0,
																	"fontsize" : 9.0,
																	"maximum" : 300.0,
																	"patching_rect" : [ 39.0, 74.0, 45.0, 17.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-12",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "float", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "button",
																	"patching_rect" : [ 27.0, 150.0, 15.0, 15.0 ],
																	"numinlets" : 1,
																	"id" : "obj-13",
																	"numoutlets" : 1,
																	"outlettype" : [ "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "toggle",
																	"patching_rect" : [ 27.0, 37.0, 15.0, 15.0 ],
																	"numinlets" : 1,
																	"id" : "obj-14",
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "message",
																	"text" : "8",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 128.0, 82.0, 27.0, 15.0 ],
																	"numinlets" : 2,
																	"id" : "obj-15",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "message",
																	"text" : "16",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 128.0, 61.0, 27.0, 15.0 ],
																	"numinlets" : 2,
																	"id" : "obj-16",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "message",
																	"text" : "32",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 128.0, 41.0, 27.0, 15.0 ],
																	"numinlets" : 2,
																	"id" : "obj-17",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "tempo 120 1 4",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 27.0, 119.0, 68.0, 17.0 ],
																	"numinlets" : 4,
																	"id" : "obj-18",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "number",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 28.0, 263.0, 35.0, 17.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-19",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "int", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "slider",
																	"patching_rect" : [ 89.0, 206.0, 15.0, 18.0 ],
																	"relative" : 1,
																	"numinlets" : 1,
																	"orientation" : 2,
																	"size" : 11.0,
																	"id" : "obj-20",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"mult" : 12.0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "+ 0",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 37.0, 236.0, 27.0, 17.0 ],
																	"numinlets" : 2,
																	"id" : "obj-21",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "number",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 27.0, 206.0, 35.0, 17.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-22",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "int", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "table my_table",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 27.0, 180.0, 69.0, 17.0 ],
																	"numinlets" : 2,
																	"color" : [ 1.0, 0.890196, 0.090196, 1.0 ],
																	"id" : "obj-23",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"outlettype" : [ "int", "bang" ],
																	"showeditor" : 0,
																	"editor_rect" : [ 100.0, 100.0, 300.0, 300.0 ],
																	"saved_object_attributes" : 																	{
																		"embed" : 0,
																		"signed" : 0,
																		"notename" : 0,
																		"name" : "my_table",
																		"size" : 128,
																		"showeditor" : 0,
																		"range" : 128
																	}

																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "noteout",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 28.0, 324.0, 40.0, 17.0 ],
																	"numinlets" : 3,
																	"id" : "obj-24",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "makenote 100 100",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 28.0, 289.0, 85.0, 17.0 ],
																	"numinlets" : 3,
																	"id" : "obj-25",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"outlettype" : [ "float", "float" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "octave",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 106.0, 206.0, 39.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-26",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "tempo",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 41.0, 58.0, 35.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-27",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "START",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 18.0, 21.0, 43.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-28",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
 ],
														"lines" : [ 															{
																"patchline" : 																{
																	"source" : [ "obj-13", 0 ],
																	"destination" : [ "obj-23", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-23", 0 ],
																	"destination" : [ "obj-22", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-1", 0 ],
																	"destination" : [ "obj-20", 0 ],
																	"hidden" : 0,
																	"midpoints" : [ 117.5, 201.0, 98.0, 201.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-8", 0 ],
																	"destination" : [ "obj-18", 3 ],
																	"hidden" : 1,
																	"midpoints" : [ 137.5, 133.0, 120.0, 133.0, 120.0, 111.0, 85.5, 111.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-16", 0 ],
																	"destination" : [ "obj-18", 3 ],
																	"hidden" : 1,
																	"midpoints" : [ 137.5, 49.0, 85.5, 49.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-17", 0 ],
																	"destination" : [ "obj-18", 3 ],
																	"hidden" : 1,
																	"midpoints" : [ 137.5, 27.0, 85.5, 27.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-15", 0 ],
																	"destination" : [ "obj-18", 3 ],
																	"hidden" : 1,
																	"midpoints" : [ 137.5, 69.0, 85.5, 69.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-10", 0 ],
																	"destination" : [ "obj-18", 3 ],
																	"hidden" : 1,
																	"midpoints" : [ 137.5, 90.0, 85.5, 90.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-9", 0 ],
																	"destination" : [ "obj-18", 3 ],
																	"hidden" : 1,
																	"midpoints" : [ 137.5, 111.0, 85.5, 111.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-20", 0 ],
																	"destination" : [ "obj-21", 1 ],
																	"hidden" : 0,
																	"midpoints" : [ 98.0, 230.0, 54.5, 230.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-25", 1 ],
																	"destination" : [ "obj-24", 1 ],
																	"hidden" : 0,
																	"midpoints" : [ 103.5, 315.0, 48.0, 315.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-12", 0 ],
																	"destination" : [ "obj-11", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-22", 0 ],
																	"destination" : [ "obj-21", 0 ],
																	"hidden" : 0,
																	"midpoints" : [ 36.5, 229.0, 46.5, 229.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-25", 0 ],
																	"destination" : [ "obj-24", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-19", 0 ],
																	"destination" : [ "obj-25", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-21", 0 ],
																	"destination" : [ "obj-19", 0 ],
																	"hidden" : 0,
																	"midpoints" : [ 46.5, 258.0, 37.5, 258.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-18", 0 ],
																	"destination" : [ "obj-13", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-14", 0 ],
																	"destination" : [ "obj-18", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-11", 0 ],
																	"destination" : [ "obj-18", 0 ],
																	"hidden" : 0,
																	"midpoints" : [ 48.5, 114.0, 36.5, 114.0 ]
																}

															}
 ]
													}
,
													"saved_object_attributes" : 													{
														"default_fontface" : 0,
														"fontface" : 0,
														"fontsize" : 12.0,
														"default_fontname" : "Arial",
														"default_fontsize" : 12.0,
														"fontname" : "Arial",
														"globalpatchername" : ""
													}

												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "p coll_uses",
													"fontsize" : 12.0,
													"patching_rect" : [ 776.0, 409.0, 71.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-69",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"outlettype" : [ "int", "int" ],
													"patcher" : 													{
														"fileversion" : 1,
														"rect" : [ 160.0, 156.0, 344.0, 479.0 ],
														"bglocked" : 0,
														"defrect" : [ 160.0, 156.0, 344.0, 479.0 ],
														"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
														"openinpresentation" : 0,
														"default_fontsize" : 12.0,
														"default_fontface" : 0,
														"default_fontname" : "Arial",
														"gridonopen" : 0,
														"gridsize" : [ 15.0, 15.0 ],
														"gridsnaponopen" : 0,
														"toolbarvisible" : 1,
														"boxanimatetime" : 200,
														"imprint" : 0,
														"enablehscroll" : 1,
														"enablevscroll" : 1,
														"devicewidth" : 0.0,
														"boxes" : [ 															{
																"box" : 																{
																	"maxclass" : "outlet",
																	"patching_rect" : [ 237.0, 427.0, 25.0, 25.0 ],
																	"numinlets" : 1,
																	"id" : "obj-22",
																	"numoutlets" : 0,
																	"comment" : ""
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "outlet",
																	"patching_rect" : [ 144.0, 429.0, 25.0, 25.0 ],
																	"numinlets" : 1,
																	"id" : "obj-21",
																	"numoutlets" : 0,
																	"comment" : ""
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "inlet",
																	"patching_rect" : [ 25.0, 31.0, 25.0, 25.0 ],
																	"numinlets" : 0,
																	"id" : "obj-20",
																	"numoutlets" : 1,
																	"outlettype" : [ "float" ],
																	"comment" : ""
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "data stored in list",
																	"linecount" : 2,
																	"fontsize" : 12.0,
																	"patching_rect" : [ 253.0, 244.0, 72.0, 34.0 ],
																	"numinlets" : 1,
																	"id" : "obj-1",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "this patch filters all unrelated notes to ones from the selected mode",
																	"linecount" : 2,
																	"fontsize" : 12.0,
																	"patching_rect" : [ 62.0, 21.0, 199.0, 34.0 ],
																	"numinlets" : 1,
																	"id" : "obj-2",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "number",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 182.0, 277.0, 41.0, 20.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-3",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "int", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "number",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 182.0, 213.0, 38.0, 20.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-4",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "int", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "number",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 25.0, 213.0, 34.0, 20.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-5",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "int", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "* 12",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 25.0, 241.0, 51.0, 20.0 ],
																	"numinlets" : 2,
																	"id" : "obj-6",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "kslider",
																	"patching_rect" : [ 25.0, 359.0, 196.0, 34.0 ],
																	"numinlets" : 2,
																	"id" : "obj-7",
																	"numoutlets" : 2,
																	"outlettype" : [ "int", "int" ],
																	"presentation_rect" : [ 0.0, 0.0, 196.0, 35.0 ],
																	"hkeycolor" : [ 0.666667, 0.666667, 0.666667, 1.0 ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "noteout",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 25.0, 419.0, 58.0, 20.0 ],
																	"numinlets" : 3,
																	"id" : "obj-8",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "pitch class",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 222.0, 213.0, 72.0, 20.0 ],
																	"numinlets" : 1,
																	"id" : "obj-9",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "number",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 25.0, 331.0, 45.0, 20.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-10",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "int", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "+",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 25.0, 305.0, 31.0, 20.0 ],
																	"numinlets" : 2,
																	"id" : "obj-11",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "coll my_coll",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 182.0, 246.0, 73.0, 20.0 ],
																	"numinlets" : 1,
																	"color" : [ 0.0, 0.133333, 0.882353, 1.0 ],
																	"id" : "obj-12",
																	"fontname" : "Arial",
																	"numoutlets" : 4,
																	"outlettype" : [ "", "", "", "" ],
																	"saved_object_attributes" : 																	{
																		"embed" : 0
																	}

																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "number",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 25.0, 135.0, 40.0, 20.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-13",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "int", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "% 12",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 182.0, 184.0, 46.0, 20.0 ],
																	"numinlets" : 2,
																	"id" : "obj-14",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "/ 12",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 25.0, 185.0, 41.0, 20.0 ],
																	"numinlets" : 2,
																	"id" : "obj-15",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "kslider",
																	"patching_rect" : [ 25.0, 94.0, 196.0, 34.0 ],
																	"numinlets" : 2,
																	"id" : "obj-16",
																	"numoutlets" : 2,
																	"outlettype" : [ "int", "int" ],
																	"presentation_rect" : [ 0.0, 0.0, 196.0, 35.0 ],
																	"hkeycolor" : [ 0.501961, 0.501961, 0.501961, 1.0 ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "MIDI Note",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 64.0, 135.0, 78.0, 20.0 ],
																	"numinlets" : 1,
																	"id" : "obj-18",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "octave register",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 56.0, 213.0, 90.0, 20.0 ],
																	"numinlets" : 1,
																	"id" : "obj-19",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
 ],
														"lines" : [ 															{
																"patchline" : 																{
																	"source" : [ "obj-20", 0 ],
																	"destination" : [ "obj-16", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-7", 1 ],
																	"destination" : [ "obj-22", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-7", 0 ],
																	"destination" : [ "obj-21", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-12", 0 ],
																	"destination" : [ "obj-3", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-4", 0 ],
																	"destination" : [ "obj-12", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-7", 0 ],
																	"destination" : [ "obj-8", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-7", 1 ],
																	"destination" : [ "obj-8", 1 ],
																	"hidden" : 0,
																	"midpoints" : [ 211.5, 404.0, 54.0, 404.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-16", 1 ],
																	"destination" : [ "obj-7", 1 ],
																	"hidden" : 1,
																	"midpoints" : [ 211.5, 309.0, 211.5, 309.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-14", 0 ],
																	"destination" : [ "obj-4", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-13", 0 ],
																	"destination" : [ "obj-14", 0 ],
																	"hidden" : 0,
																	"midpoints" : [ 34.5, 175.0, 191.5, 175.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-16", 0 ],
																	"destination" : [ "obj-13", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-3", 0 ],
																	"destination" : [ "obj-11", 1 ],
																	"hidden" : 0,
																	"midpoints" : [ 191.5, 300.0, 46.5, 300.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-10", 0 ],
																	"destination" : [ "obj-7", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-11", 0 ],
																	"destination" : [ "obj-10", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-6", 0 ],
																	"destination" : [ "obj-11", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-5", 0 ],
																	"destination" : [ "obj-6", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-15", 0 ],
																	"destination" : [ "obj-5", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-13", 0 ],
																	"destination" : [ "obj-15", 0 ],
																	"hidden" : 0,
																	"midpoints" : [ 34.5, 175.0, 34.5, 175.0 ]
																}

															}
 ]
													}
,
													"saved_object_attributes" : 													{
														"default_fontface" : 0,
														"fontface" : 0,
														"fontsize" : 12.0,
														"default_fontname" : "Arial",
														"default_fontsize" : 12.0,
														"fontname" : "Arial",
														"globalpatchername" : ""
													}

												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "F#",
													"fontsize" : 12.0,
													"patching_rect" : [ 166.0, 176.0, 23.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-70",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 374.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-71",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 338.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-72",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 302.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-73",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 266.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-74",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 230.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-75",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 194.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-76",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 158.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-77",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 122.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-78",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "locrian_b7",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 651.0, 75.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-79",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "locrian_b4",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 651.0, 75.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-80",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "mixolydian_#1",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 651.0, 101.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-81",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "locrian",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 651.0, 51.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-82",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "aeolian_b1",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 617.0, 79.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-83",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "locrian_#2",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 617.0, 75.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-84",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "lydian_#2",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 617.0, 71.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-85",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "aeolian",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 617.0, 55.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-86",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "mixolydian_b2",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 583.0, 101.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-87",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "mixolydian_b6",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 583.0, 101.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-88",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "phrygian_#3",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 583.0, 87.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-89",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "mixolydian",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 583.0, 77.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-90",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "lydian_b3",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 551.0, 71.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-91",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "lydian_b7",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 551.0, 71.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-92",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "dorian_#4",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 551.0, 71.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-93",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "lydian",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 551.0, 47.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-94",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "phrygian_b4",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 517.0, 87.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-95",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "lydian_#5",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 517.0, 71.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-96",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "ionian_#5",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 517.0, 72.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-97",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "phrygian",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 517.0, 63.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-98",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "dorian_b5",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 479.0, 71.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-99",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "dorian_b2",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 479.0, 71.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-100",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "locrian_#6",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 479.0, 75.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-101",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "dorian",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 479.0, 47.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-102",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "harmonic_major",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 443.0, 111.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-103",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "melodic_minor",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 443.0, 103.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-104",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "harmonic_minor",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 443.0, 111.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-105",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "ionian",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 443.0, 48.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-106",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "mode names",
													"textcolor" : [ 0.4, 0.4, 0.8, 1.0 ],
													"frgb" : [ 0.4, 0.4, 0.8, 1.0 ],
													"fontsize" : 12.0,
													"patching_rect" : [ 619.0, 225.0, 81.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-107",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "coll my_coll",
													"fontsize" : 12.0,
													"patching_rect" : [ 627.0, 381.0, 73.0, 20.0 ],
													"numinlets" : 1,
													"color" : [ 0.4, 0.4, 0.8, 1.0 ],
													"id" : "obj-108",
													"fontname" : "Arial",
													"numoutlets" : 4,
													"outlettype" : [ "", "", "", "" ],
													"saved_object_attributes" : 													{
														"embed" : 0
													}

												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "lydian_b7",
													"fontsize" : 12.0,
													"patching_rect" : [ 358.0, 191.0, 68.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-110",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "minor",
													"fontsize" : 12.0,
													"patching_rect" : [ 332.0, 171.0, 39.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-111",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "c",
													"fontsize" : 12.0,
													"patching_rect" : [ 143.0, 176.0, 20.5, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-112",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "major",
													"fontsize" : 12.0,
													"patching_rect" : [ 292.0, 191.0, 43.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-114",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "4",
													"fontsize" : 12.0,
													"patching_rect" : [ 120.0, 176.0, 18.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-115",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "send a MIDI pitch class number (C=0, C#=1, etc) 0-11 in the left inlet or simply send a message box with a letter. This will determine the tonic of the 7 note mode. \nNext send a message box with a mode name in the right inlet. ",
													"linecount" : 3,
													"fontsize" : 12.0,
													"patching_rect" : [ 53.0, 103.0, 478.0, 48.0 ],
													"numinlets" : 1,
													"id" : "obj-117",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "tonic",
													"textcolor" : [ 0.4, 0.4, 0.8, 1.0 ],
													"frgb" : [ 0.4, 0.4, 0.8, 1.0 ],
													"fontsize" : 12.0,
													"patching_rect" : [ 78.0, 226.0, 34.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-118",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "modes are named using traditional Greek names and variations of these names that reflect the least amount of chromatic inflections for the 7 modes of the Major Scale, the Harmonic Minor Scale, the Harmonic Major Scale, and the Melodic Minor Scale",
													"linecount" : 3,
													"fontsize" : 12.0,
													"patching_rect" : [ 57.0, 693.0, 529.0, 48.0 ],
													"numinlets" : 1,
													"id" : "obj-121",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "3.1",
													"fontsize" : 12.0,
													"patching_rect" : [ 228.0, 54.0, 31.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-124",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Major Modes",
													"fontface" : 1,
													"fontsize" : 11.0,
													"patching_rect" : [ 67.0, 416.0, 131.0, 19.0 ],
													"numinlets" : 1,
													"id" : "obj-125",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "panel",
													"mode" : 1,
													"patching_rect" : [ 65.0, 410.0, 93.0, 285.0 ],
													"numinlets" : 1,
													"id" : "obj-126",
													"numoutlets" : 0,
													"grad2" : [ 1.0, 1.0, 1.0, 1.0 ],
													"bgcolor" : [ 0.937255, 0.956863, 1.0, 1.0 ],
													"rounded" : 30
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "panel",
													"mode" : 1,
													"patching_rect" : [ 167.0, 410.0, 136.0, 284.0 ],
													"numinlets" : 1,
													"id" : "obj-127",
													"numoutlets" : 0,
													"grad2" : [ 1.0, 1.0, 1.0, 1.0 ],
													"bgcolor" : [ 0.819608, 0.87451, 0.996078, 1.0 ],
													"rounded" : 30
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "panel",
													"mode" : 1,
													"patching_rect" : [ 306.0, 410.0, 137.0, 283.0 ],
													"numinlets" : 1,
													"id" : "obj-128",
													"numoutlets" : 0,
													"grad2" : [ 1.0, 1.0, 1.0, 1.0 ],
													"bgcolor" : [ 0.694118, 0.768627, 0.988235, 1.0 ],
													"rounded" : 30
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "pitch classes only (reduced to one octave)",
													"fontsize" : 12.0,
													"patching_rect" : [ 170.0, 379.0, 272.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-130",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "complete mode list",
													"fontsize" : 12.0,
													"patching_rect" : [ 436.0, 151.0, 112.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-131",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "takes numbers or letters",
													"fontsize" : 12.0,
													"patching_rect" : [ 111.0, 156.0, 140.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-132",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "modal_change",
													"textcolor" : [ 0.047059, 0.0, 0.454902, 1.0 ],
													"frgb" : [ 0.047059, 0.0, 0.454902, 1.0 ],
													"fontsize" : 26.0,
													"patching_rect" : [ 53.0, 53.0, 181.0, 36.0 ],
													"numinlets" : 1,
													"id" : "obj-133",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "pitches at each scale degree",
													"fontsize" : 11.0,
													"patching_rect" : [ 195.0, 344.0, 201.0, 19.0 ],
													"numinlets" : 1,
													"id" : "obj-134",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "panel",
													"mode" : 1,
													"patching_rect" : [ 618.0, 340.0, 262.0, 94.0 ],
													"numinlets" : 1,
													"grad1" : [ 0.894118, 0.917647, 1.0, 1.0 ],
													"id" : "obj-137",
													"numoutlets" : 0,
													"angle" : 1.16,
													"bgcolor" : [ 0.937255, 0.956863, 1.0, 1.0 ],
													"rounded" : 30
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "panel",
													"mode" : 1,
													"patching_rect" : [ 444.0, 410.0, 136.0, 284.0 ],
													"numinlets" : 1,
													"id" : "obj-129",
													"numoutlets" : 0,
													"grad2" : [ 1.0, 1.0, 1.0, 1.0 ],
													"bgcolor" : [ 0.576471, 0.643137, 0.980392, 1.0 ],
													"rounded" : 30
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "panel",
													"mode" : 1,
													"patching_rect" : [ 618.0, 466.0, 262.0, 94.0 ],
													"numinlets" : 1,
													"grad1" : [ 0.894118, 0.917647, 1.0, 1.0 ],
													"id" : "obj-109",
													"numoutlets" : 0,
													"angle" : 1.16,
													"bgcolor" : [ 0.937255, 0.956863, 1.0, 1.0 ],
													"rounded" : 30
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "modal_change",
													"varname" : "modal_change",
													"patching_rect" : [ 68.0, 247.0, 556.0, 65.0 ],
													"numinlets" : 2,
													"background" : 1,
													"id" : "obj-139",
													"numoutlets" : 9,
													"fontcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
													"outlettype" : [ "int", "int", "int", "int", "int", "int", "int", "int", "list" ]
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"source" : [ "obj-2", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-1", 0 ],
													"destination" : [ "obj-139", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-69", 1 ],
													"destination" : [ "obj-161", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-69", 0 ],
													"destination" : [ "obj-160", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-159", 0 ],
													"destination" : [ "obj-69", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-145", 0 ],
													"destination" : [ "obj-108", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 8 ],
													"destination" : [ "obj-145", 0 ],
													"hidden" : 0,
													"midpoints" : [ 614.5, 335.5, 636.5, 335.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-144", 0 ],
													"destination" : [ "obj-141", 0 ],
													"hidden" : 1,
													"midpoints" : [ 568.5, 328.0, 458.5, 328.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 8 ],
													"destination" : [ "obj-141", 1 ],
													"hidden" : 0,
													"midpoints" : [ 614.5, 328.0, 589.5, 328.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-16", 0 ],
													"destination" : [ "obj-23", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-71", 0 ],
													"destination" : [ "obj-16", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 7 ],
													"destination" : [ "obj-71", 0 ],
													"hidden" : 0,
													"midpoints" : [ 547.375, 317.5, 383.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-17", 0 ],
													"destination" : [ "obj-24", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-72", 0 ],
													"destination" : [ "obj-17", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 6 ],
													"destination" : [ "obj-72", 0 ],
													"hidden" : 0,
													"midpoints" : [ 480.25, 317.5, 347.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-18", 0 ],
													"destination" : [ "obj-25", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-73", 0 ],
													"destination" : [ "obj-18", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 5 ],
													"destination" : [ "obj-73", 0 ],
													"hidden" : 0,
													"midpoints" : [ 413.125, 317.5, 311.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-19", 0 ],
													"destination" : [ "obj-26", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-74", 0 ],
													"destination" : [ "obj-19", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 4 ],
													"destination" : [ "obj-74", 0 ],
													"hidden" : 0,
													"midpoints" : [ 346.0, 317.5, 275.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-20", 0 ],
													"destination" : [ "obj-27", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-75", 0 ],
													"destination" : [ "obj-20", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 3 ],
													"destination" : [ "obj-75", 0 ],
													"hidden" : 0,
													"midpoints" : [ 278.875, 317.5, 239.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-110", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 0,
													"midpoints" : [ 367.5, 218.5, 614.5, 218.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-111", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 0,
													"midpoints" : [ 341.5, 218.5, 614.5, 218.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-114", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 0,
													"midpoints" : [ 301.5, 218.5, 614.5, 218.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-106", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-102", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-98", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-94", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-90", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-86", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-82", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-103", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-99", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-95", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-91", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-87", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-83", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-79", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-105", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-101", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-97", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-93", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-89", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-85", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-81", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-104", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-100", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-96", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-92", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-88", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-84", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-80", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-67", 1 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 0,
													"midpoints" : [ 488.0, 240.5, 614.5, 240.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-34", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 0,
													"midpoints" : [ 576.5, 218.5, 614.5, 218.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-21", 0 ],
													"destination" : [ "obj-28", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-76", 0 ],
													"destination" : [ "obj-21", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 2 ],
													"destination" : [ "obj-76", 0 ],
													"hidden" : 0,
													"midpoints" : [ 211.75, 317.5, 203.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-22", 0 ],
													"destination" : [ "obj-29", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-77", 0 ],
													"destination" : [ "obj-22", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 1 ],
													"destination" : [ "obj-77", 0 ],
													"hidden" : 0,
													"midpoints" : [ 144.625, 317.5, 167.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-31", 0 ],
													"destination" : [ "obj-30", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-78", 0 ],
													"destination" : [ "obj-31", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 0 ],
													"destination" : [ "obj-78", 0 ],
													"hidden" : 0,
													"midpoints" : [ 77.5, 317.5, 131.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-3", 0 ],
													"destination" : [ "obj-139", 0 ],
													"hidden" : 0,
													"midpoints" : [ 61.5, 213.5, 77.5, 213.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-112", 0 ],
													"destination" : [ "obj-139", 0 ],
													"hidden" : 0,
													"midpoints" : [ 152.5, 220.5, 77.5, 220.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-115", 0 ],
													"destination" : [ "obj-139", 0 ],
													"hidden" : 0,
													"midpoints" : [ 129.5, 220.5, 77.5, 220.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-70", 0 ],
													"destination" : [ "obj-139", 0 ],
													"hidden" : 0,
													"midpoints" : [ 175.5, 220.5, 77.5, 220.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-66", 0 ],
													"destination" : [ "obj-139", 0 ],
													"hidden" : 0,
													"midpoints" : [ 201.5, 220.5, 77.5, 220.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 8 ],
													"destination" : [ "obj-33", 0 ],
													"hidden" : 0,
													"midpoints" : [ 614.5, 453.0, 634.5, 453.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-33", 1 ],
													"destination" : [ "obj-11", 1 ],
													"hidden" : 0,
													"midpoints" : [ 720.5, 501.5, 704.5, 501.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-33", 0 ],
													"destination" : [ "obj-11", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
 ]
									}
,
									"saved_object_attributes" : 									{
										"default_fontface" : 0,
										"fontface" : 0,
										"fontsize" : 12.0,
										"default_fontname" : "Arial",
										"default_fontsize" : 12.0,
										"fontname" : "Arial",
										"globalpatchername" : ""
									}

								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "r mode",
									"fontsize" : 12.0,
									"patching_rect" : [ 450.0, 201.0, 48.0, 20.0 ],
									"numinlets" : 0,
									"id" : "obj-82",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "r tonic",
									"fontsize" : 12.0,
									"patching_rect" : [ 412.0, 181.0, 43.0, 20.0 ],
									"numinlets" : 0,
									"id" : "obj-83",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "p modalChange",
									"fontsize" : 12.0,
									"patching_rect" : [ 374.0, 223.0, 95.0, 20.0 ],
									"numinlets" : 3,
									"id" : "obj-84",
									"fontname" : "Arial",
									"numoutlets" : 2,
									"outlettype" : [ "int", "int" ],
									"patcher" : 									{
										"fileversion" : 1,
										"rect" : [ 347.0, 228.0, 1093.0, 691.0 ],
										"bglocked" : 0,
										"defrect" : [ 347.0, 228.0, 1093.0, 691.0 ],
										"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
										"openinpresentation" : 0,
										"default_fontsize" : 12.0,
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"gridonopen" : 0,
										"gridsize" : [ 15.0, 15.0 ],
										"gridsnaponopen" : 0,
										"toolbarvisible" : 1,
										"boxanimatetime" : 200,
										"imprint" : 0,
										"enablehscroll" : 1,
										"enablevscroll" : 1,
										"devicewidth" : 0.0,
										"boxes" : [ 											{
												"box" : 												{
													"maxclass" : "inlet",
													"hint" : "Mode Name",
													"patching_rect" : [ 926.0, 38.0, 25.0, 25.0 ],
													"numinlets" : 0,
													"id" : "obj-2",
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"comment" : ""
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "inlet",
													"hint" : "Tonic (Note or Number)",
													"annotation" : "",
													"patching_rect" : [ 865.0, 38.0, 25.0, 25.0 ],
													"numinlets" : 0,
													"id" : "obj-1",
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"comment" : ""
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "outlet",
													"patching_rect" : [ 828.0, 440.0, 25.0, 25.0 ],
													"numinlets" : 1,
													"id" : "obj-161",
													"numoutlets" : 0,
													"comment" : ""
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "outlet",
													"patching_rect" : [ 776.0, 440.0, 25.0, 25.0 ],
													"numinlets" : 1,
													"id" : "obj-160",
													"numoutlets" : 0,
													"comment" : ""
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "inlet",
													"patching_rect" : [ 776.0, 290.0, 25.0, 25.0 ],
													"numinlets" : 0,
													"id" : "obj-159",
													"numoutlets" : 1,
													"outlettype" : [ "float" ],
													"comment" : ""
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "bpatcher",
													"patching_rect" : [ 619.0, 579.0, 195.0, 148.0 ],
													"name" : "modal_change_related_objects.maxpat",
													"numinlets" : 0,
													"args" : [  ],
													"id" : "obj-13",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "< - Get scale data in a table",
													"linecount" : 2,
													"fontsize" : 12.0,
													"patching_rect" : [ 732.0, 477.0, 141.0, 34.0 ],
													"numinlets" : 1,
													"id" : "obj-119",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "<-- send data to any table",
													"fontsize" : 10.0,
													"patching_rect" : [ 712.0, 508.0, 122.0, 18.0 ],
													"numinlets" : 1,
													"id" : "obj-123",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Look at these table uses:",
													"fontsize" : 12.0,
													"patching_rect" : [ 631.0, 534.0, 153.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-113",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "modal_table_filter",
													"fontsize" : 12.0,
													"patching_rect" : [ 625.0, 477.0, 105.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-33",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"outlettype" : [ "int", "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "table my_table",
													"fontsize" : 12.0,
													"patching_rect" : [ 625.0, 506.0, 89.0, 20.0 ],
													"numinlets" : 2,
													"color" : [ 0.019608, 0.137255, 0.823529, 1.0 ],
													"id" : "obj-11",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"outlettype" : [ "int", "bang" ],
													"showeditor" : 0,
													"editor_rect" : [ 473.0, 481.0, 588.0, 619.0 ],
													"saved_object_attributes" : 													{
														"embed" : 0,
														"signed" : 0,
														"notename" : 0,
														"name" : "my_table",
														"size" : 128,
														"showeditor" : 0,
														"range" : 128
													}

												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "< - Get filtered scale data in a coll list. ",
													"linecount" : 2,
													"fontsize" : 12.0,
													"patching_rect" : [ 722.0, 347.0, 155.0, 34.0 ],
													"numinlets" : 1,
													"id" : "obj-150",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "<-- send data to any coll",
													"fontsize" : 10.0,
													"patching_rect" : [ 697.0, 383.0, 122.0, 18.0 ],
													"numinlets" : 1,
													"id" : "obj-148",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "modal_coll_filter",
													"fontsize" : 12.0,
													"patching_rect" : [ 627.0, 350.0, 97.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-145",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "loadmess set",
													"hidden" : 1,
													"fontsize" : 8.0,
													"patching_rect" : [ 559.0, 314.0, 58.0, 16.0 ],
													"numinlets" : 1,
													"id" : "obj-144",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "4 6 8 9 11 13 15 16",
													"fontsize" : 12.0,
													"gradient" : 1,
													"patching_rect" : [ 449.0, 346.0, 150.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-141",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.8, 0.729412, 0.87451, 1.0 ],
													"outlettype" : [ "" ],
													"bgcolor2" : [ 1.0, 1.0, 1.0, 1.0 ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "list out",
													"textcolor" : [ 0.4, 0.4, 0.8, 1.0 ],
													"frgb" : [ 0.4, 0.4, 0.8, 1.0 ],
													"fontsize" : 12.0,
													"patching_rect" : [ 479.0, 329.0, 53.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-140",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "umenu",
													"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
													"fontsize" : 12.0,
													"items" : [ "C", ",", "C#", ",", "D", ",", "D#", ",", "E", ",", "F", ",", "F#", ",", "G", ",", "G#", ",", "A", ",", "A#", ",", "B" ],
													"patching_rect" : [ 52.0, 175.0, 56.0, 20.0 ],
													"numinlets" : 1,
													"labelclick" : 1,
													"id" : "obj-3",
													"fontname" : "Arial",
													"numoutlets" : 3,
													"types" : [  ],
													"bgcolor" : [ 0.94902, 0.894118, 0.984314, 1.0 ],
													"outlettype" : [ "int", "", "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "control modality in Max",
													"fontsize" : 12.0,
													"patching_rect" : [ 53.0, 83.0, 164.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-6",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Look at these coll list uses:",
													"fontsize" : 12.0,
													"patching_rect" : [ 629.0, 409.0, 153.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-12",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "takes mode names",
													"fontsize" : 12.0,
													"patching_rect" : [ 298.0, 216.0, 160.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-14",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "even takes scale degree distances (in half steps)",
													"linecount" : 2,
													"fontsize" : 12.0,
													"patching_rect" : [ 567.0, 159.0, 161.0, 34.0 ],
													"numinlets" : 1,
													"id" : "obj-15",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 374.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-16",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 338.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-17",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 302.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-18",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 266.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-19",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 230.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-20",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 194.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-21",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 158.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-22",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 374.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-23",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 338.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-24",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 302.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-25",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 266.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-26",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 230.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-27",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 194.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-28",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 158.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-29",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 122.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-30",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 122.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-31",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "2 1 2 2 2 2 1",
													"fontsize" : 12.0,
													"patching_rect" : [ 567.0, 193.0, 82.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-34",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 7",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 669.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-35",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 7",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 669.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-36",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 7",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 669.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-37",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 7",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 669.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-38",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 6",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 634.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-39",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 6",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 634.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-40",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 6",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 634.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-41",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 6",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 634.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-42",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 5",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 602.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-43",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 5",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 602.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-44",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 5",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 602.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-45",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 5",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 602.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-46",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 4",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 569.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-47",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 4",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 569.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-48",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 4",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 569.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-49",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 4",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 569.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-50",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 3",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 536.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-51",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 3",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 536.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-52",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 3",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 536.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-53",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 3",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 536.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-54",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 2",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 496.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-55",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 2",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 496.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-56",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 2",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 496.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-57",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 2",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 496.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-58",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 1",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 462.0, 130.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-59",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 1",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 462.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-60",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 1",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 462.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-61",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 1",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 462.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-62",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Melodic Minor Modes",
													"fontface" : 1,
													"fontsize" : 11.0,
													"patching_rect" : [ 454.0, 416.0, 131.0, 19.0 ],
													"numinlets" : 1,
													"id" : "obj-63",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Harmonic Minor Modes",
													"fontface" : 1,
													"fontsize" : 11.0,
													"patching_rect" : [ 313.0, 416.0, 145.0, 19.0 ],
													"numinlets" : 1,
													"id" : "obj-64",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Harmonic Major Modes",
													"fontface" : 1,
													"fontsize" : 11.0,
													"patching_rect" : [ 173.0, 416.0, 145.0, 19.0 ],
													"numinlets" : 1,
													"id" : "obj-65",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"minimum" : 0,
													"fontsize" : 12.0,
													"maximum" : 11,
													"patching_rect" : [ 192.0, 176.0, 29.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-66",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "umenu",
													"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
													"fontsize" : 12.0,
													"items" : [ "ionian", ",", "dorian", ",", "phrygian", ",", "lydian", ",", "mixolydian", ",", "aeolian", ",", "locrian", ",", "harmonic_major", ",", "dorian_b5", ",", "phrygian_b4", ",", "lydian_b3", ",", "mixolydian_b2", ",", "aeolian_b1", ",", "locrian_b7", ",", "harmonic_minor", ",", "locrian_#6", ",", "ionian_#5", ",", "dorian_#4", ",", "phrygian_#3", ",", "lydian_#2", ",", "mixolydian_#1", ",", "melodic_minor", ",", "dorian_b2", ",", "lydian_#5", ",", "lydian_b7", ",", "mixolydian_b6", ",", "locrian_#2", ",", "locrian_b4" ],
													"patching_rect" : [ 438.0, 173.0, 100.0, 20.0 ],
													"numinlets" : 1,
													"labelclick" : 1,
													"id" : "obj-67",
													"fontname" : "Arial",
													"numoutlets" : 3,
													"types" : [  ],
													"bgcolor" : [ 0.94902, 0.894118, 0.984314, 1.0 ],
													"outlettype" : [ "int", "", "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "p table_uses",
													"fontsize" : 12.0,
													"patching_rect" : [ 772.0, 534.0, 79.0, 20.0 ],
													"numinlets" : 0,
													"id" : "obj-68",
													"fontname" : "Arial",
													"numoutlets" : 0,
													"patcher" : 													{
														"fileversion" : 1,
														"rect" : [ 79.0, 111.0, 387.0, 438.0 ],
														"bglocked" : 0,
														"defrect" : [ 79.0, 111.0, 387.0, 438.0 ],
														"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
														"openinpresentation" : 0,
														"default_fontsize" : 12.0,
														"default_fontface" : 0,
														"default_fontname" : "Arial",
														"gridonopen" : 0,
														"gridsize" : [ 15.0, 15.0 ],
														"gridsnaponopen" : 0,
														"toolbarvisible" : 1,
														"boxanimatetime" : 200,
														"imprint" : 0,
														"enablehscroll" : 1,
														"enablevscroll" : 1,
														"devicewidth" : 0.0,
														"boxes" : [ 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "loadmess 4",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 108.0, 180.0, 56.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-1",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "32nd note",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 159.0, 44.0, 58.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-2",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "16th note",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 157.0, 65.0, 58.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-3",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "8th",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 156.0, 84.0, 58.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-4",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "quarter note",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 144.0, 104.0, 58.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-5",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "half note",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 145.0, 129.0, 58.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-6",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "whole note",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 143.0, 147.0, 58.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-7",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "message",
																	"text" : "1",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 128.0, 145.0, 16.0, 15.0 ],
																	"numinlets" : 2,
																	"id" : "obj-8",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "message",
																	"text" : "2",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 128.0, 124.0, 16.0, 15.0 ],
																	"numinlets" : 2,
																	"id" : "obj-9",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "message",
																	"text" : "4",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 128.0, 103.0, 16.0, 15.0 ],
																	"numinlets" : 2,
																	"id" : "obj-10",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "message",
																	"text" : "tempo $1",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 39.0, 94.0, 56.0, 15.0 ],
																	"numinlets" : 2,
																	"id" : "obj-11",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "flonum",
																	"minimum" : 5.0,
																	"fontsize" : 9.0,
																	"maximum" : 300.0,
																	"patching_rect" : [ 39.0, 74.0, 45.0, 17.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-12",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "float", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "button",
																	"patching_rect" : [ 27.0, 150.0, 15.0, 15.0 ],
																	"numinlets" : 1,
																	"id" : "obj-13",
																	"numoutlets" : 1,
																	"outlettype" : [ "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "toggle",
																	"patching_rect" : [ 27.0, 37.0, 15.0, 15.0 ],
																	"numinlets" : 1,
																	"id" : "obj-14",
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "message",
																	"text" : "8",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 128.0, 82.0, 27.0, 15.0 ],
																	"numinlets" : 2,
																	"id" : "obj-15",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "message",
																	"text" : "16",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 128.0, 61.0, 27.0, 15.0 ],
																	"numinlets" : 2,
																	"id" : "obj-16",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "message",
																	"text" : "32",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 128.0, 41.0, 27.0, 15.0 ],
																	"numinlets" : 2,
																	"id" : "obj-17",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "tempo 120 1 4",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 27.0, 119.0, 68.0, 17.0 ],
																	"numinlets" : 4,
																	"id" : "obj-18",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "number",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 28.0, 263.0, 35.0, 17.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-19",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "int", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "slider",
																	"patching_rect" : [ 89.0, 206.0, 15.0, 18.0 ],
																	"relative" : 1,
																	"numinlets" : 1,
																	"orientation" : 2,
																	"size" : 11.0,
																	"id" : "obj-20",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"mult" : 12.0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "+ 0",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 37.0, 236.0, 27.0, 17.0 ],
																	"numinlets" : 2,
																	"id" : "obj-21",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "number",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 27.0, 206.0, 35.0, 17.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-22",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "int", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "table my_table",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 27.0, 180.0, 69.0, 17.0 ],
																	"numinlets" : 2,
																	"color" : [ 1.0, 0.890196, 0.090196, 1.0 ],
																	"id" : "obj-23",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"outlettype" : [ "int", "bang" ],
																	"showeditor" : 0,
																	"editor_rect" : [ 100.0, 100.0, 300.0, 300.0 ],
																	"saved_object_attributes" : 																	{
																		"embed" : 0,
																		"signed" : 0,
																		"notename" : 0,
																		"name" : "my_table",
																		"size" : 128,
																		"showeditor" : 0,
																		"range" : 128
																	}

																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "noteout",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 28.0, 324.0, 40.0, 17.0 ],
																	"numinlets" : 3,
																	"id" : "obj-24",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "makenote 100 100",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 28.0, 289.0, 85.0, 17.0 ],
																	"numinlets" : 3,
																	"id" : "obj-25",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"outlettype" : [ "float", "float" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "octave",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 106.0, 206.0, 39.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-26",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "tempo",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 41.0, 58.0, 35.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-27",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "START",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 18.0, 21.0, 43.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-28",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
 ],
														"lines" : [ 															{
																"patchline" : 																{
																	"source" : [ "obj-11", 0 ],
																	"destination" : [ "obj-18", 0 ],
																	"hidden" : 0,
																	"midpoints" : [ 48.5, 114.0, 36.5, 114.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-14", 0 ],
																	"destination" : [ "obj-18", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-18", 0 ],
																	"destination" : [ "obj-13", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-21", 0 ],
																	"destination" : [ "obj-19", 0 ],
																	"hidden" : 0,
																	"midpoints" : [ 46.5, 258.0, 37.5, 258.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-19", 0 ],
																	"destination" : [ "obj-25", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-25", 0 ],
																	"destination" : [ "obj-24", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-22", 0 ],
																	"destination" : [ "obj-21", 0 ],
																	"hidden" : 0,
																	"midpoints" : [ 36.5, 229.0, 46.5, 229.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-12", 0 ],
																	"destination" : [ "obj-11", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-25", 1 ],
																	"destination" : [ "obj-24", 1 ],
																	"hidden" : 0,
																	"midpoints" : [ 103.5, 315.0, 48.0, 315.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-20", 0 ],
																	"destination" : [ "obj-21", 1 ],
																	"hidden" : 0,
																	"midpoints" : [ 98.0, 230.0, 54.5, 230.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-9", 0 ],
																	"destination" : [ "obj-18", 3 ],
																	"hidden" : 1,
																	"midpoints" : [ 137.5, 111.0, 85.5, 111.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-10", 0 ],
																	"destination" : [ "obj-18", 3 ],
																	"hidden" : 1,
																	"midpoints" : [ 137.5, 90.0, 85.5, 90.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-15", 0 ],
																	"destination" : [ "obj-18", 3 ],
																	"hidden" : 1,
																	"midpoints" : [ 137.5, 69.0, 85.5, 69.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-17", 0 ],
																	"destination" : [ "obj-18", 3 ],
																	"hidden" : 1,
																	"midpoints" : [ 137.5, 27.0, 85.5, 27.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-16", 0 ],
																	"destination" : [ "obj-18", 3 ],
																	"hidden" : 1,
																	"midpoints" : [ 137.5, 49.0, 85.5, 49.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-8", 0 ],
																	"destination" : [ "obj-18", 3 ],
																	"hidden" : 1,
																	"midpoints" : [ 137.5, 133.0, 120.0, 133.0, 120.0, 111.0, 85.5, 111.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-1", 0 ],
																	"destination" : [ "obj-20", 0 ],
																	"hidden" : 0,
																	"midpoints" : [ 117.5, 201.0, 98.0, 201.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-23", 0 ],
																	"destination" : [ "obj-22", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-13", 0 ],
																	"destination" : [ "obj-23", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
 ]
													}
,
													"saved_object_attributes" : 													{
														"default_fontface" : 0,
														"fontface" : 0,
														"fontsize" : 12.0,
														"default_fontname" : "Arial",
														"default_fontsize" : 12.0,
														"fontname" : "Arial",
														"globalpatchername" : ""
													}

												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "p coll_uses",
													"fontsize" : 12.0,
													"patching_rect" : [ 776.0, 409.0, 71.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-69",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"outlettype" : [ "int", "int" ],
													"patcher" : 													{
														"fileversion" : 1,
														"rect" : [ 160.0, 156.0, 344.0, 479.0 ],
														"bglocked" : 0,
														"defrect" : [ 160.0, 156.0, 344.0, 479.0 ],
														"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
														"openinpresentation" : 0,
														"default_fontsize" : 12.0,
														"default_fontface" : 0,
														"default_fontname" : "Arial",
														"gridonopen" : 0,
														"gridsize" : [ 15.0, 15.0 ],
														"gridsnaponopen" : 0,
														"toolbarvisible" : 1,
														"boxanimatetime" : 200,
														"imprint" : 0,
														"enablehscroll" : 1,
														"enablevscroll" : 1,
														"devicewidth" : 0.0,
														"boxes" : [ 															{
																"box" : 																{
																	"maxclass" : "outlet",
																	"patching_rect" : [ 237.0, 427.0, 25.0, 25.0 ],
																	"numinlets" : 1,
																	"id" : "obj-22",
																	"numoutlets" : 0,
																	"comment" : ""
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "outlet",
																	"patching_rect" : [ 144.0, 429.0, 25.0, 25.0 ],
																	"numinlets" : 1,
																	"id" : "obj-21",
																	"numoutlets" : 0,
																	"comment" : ""
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "inlet",
																	"patching_rect" : [ 25.0, 31.0, 25.0, 25.0 ],
																	"numinlets" : 0,
																	"id" : "obj-20",
																	"numoutlets" : 1,
																	"outlettype" : [ "float" ],
																	"comment" : ""
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "data stored in list",
																	"linecount" : 2,
																	"fontsize" : 12.0,
																	"patching_rect" : [ 253.0, 244.0, 72.0, 34.0 ],
																	"numinlets" : 1,
																	"id" : "obj-1",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "this patch filters all unrelated notes to ones from the selected mode",
																	"linecount" : 2,
																	"fontsize" : 12.0,
																	"patching_rect" : [ 62.0, 21.0, 199.0, 34.0 ],
																	"numinlets" : 1,
																	"id" : "obj-2",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "number",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 182.0, 277.0, 41.0, 20.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-3",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "int", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "number",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 182.0, 213.0, 38.0, 20.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-4",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "int", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "number",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 25.0, 213.0, 34.0, 20.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-5",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "int", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "* 12",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 25.0, 241.0, 51.0, 20.0 ],
																	"numinlets" : 2,
																	"id" : "obj-6",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "kslider",
																	"patching_rect" : [ 25.0, 359.0, 196.0, 34.0 ],
																	"numinlets" : 2,
																	"id" : "obj-7",
																	"numoutlets" : 2,
																	"outlettype" : [ "int", "int" ],
																	"presentation_rect" : [ 0.0, 0.0, 196.0, 35.0 ],
																	"hkeycolor" : [ 0.666667, 0.666667, 0.666667, 1.0 ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "noteout",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 25.0, 419.0, 58.0, 20.0 ],
																	"numinlets" : 3,
																	"id" : "obj-8",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "pitch class",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 222.0, 213.0, 72.0, 20.0 ],
																	"numinlets" : 1,
																	"id" : "obj-9",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "number",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 25.0, 331.0, 45.0, 20.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-10",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "int", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "+",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 25.0, 305.0, 31.0, 20.0 ],
																	"numinlets" : 2,
																	"id" : "obj-11",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "coll my_coll",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 182.0, 246.0, 73.0, 20.0 ],
																	"numinlets" : 1,
																	"color" : [ 0.0, 0.133333, 0.882353, 1.0 ],
																	"id" : "obj-12",
																	"fontname" : "Arial",
																	"numoutlets" : 4,
																	"outlettype" : [ "", "", "", "" ],
																	"saved_object_attributes" : 																	{
																		"embed" : 0
																	}

																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "number",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 25.0, 135.0, 40.0, 20.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-13",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "int", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "% 12",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 182.0, 184.0, 46.0, 20.0 ],
																	"numinlets" : 2,
																	"id" : "obj-14",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "/ 12",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 25.0, 185.0, 41.0, 20.0 ],
																	"numinlets" : 2,
																	"id" : "obj-15",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "kslider",
																	"patching_rect" : [ 25.0, 94.0, 196.0, 34.0 ],
																	"numinlets" : 2,
																	"id" : "obj-16",
																	"numoutlets" : 2,
																	"outlettype" : [ "int", "int" ],
																	"presentation_rect" : [ 0.0, 0.0, 196.0, 35.0 ],
																	"hkeycolor" : [ 0.501961, 0.501961, 0.501961, 1.0 ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "MIDI Note",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 64.0, 135.0, 78.0, 20.0 ],
																	"numinlets" : 1,
																	"id" : "obj-18",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "octave register",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 56.0, 213.0, 90.0, 20.0 ],
																	"numinlets" : 1,
																	"id" : "obj-19",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
 ],
														"lines" : [ 															{
																"patchline" : 																{
																	"source" : [ "obj-13", 0 ],
																	"destination" : [ "obj-15", 0 ],
																	"hidden" : 0,
																	"midpoints" : [ 34.5, 175.0, 34.5, 175.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-15", 0 ],
																	"destination" : [ "obj-5", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-5", 0 ],
																	"destination" : [ "obj-6", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-6", 0 ],
																	"destination" : [ "obj-11", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-11", 0 ],
																	"destination" : [ "obj-10", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-10", 0 ],
																	"destination" : [ "obj-7", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-3", 0 ],
																	"destination" : [ "obj-11", 1 ],
																	"hidden" : 0,
																	"midpoints" : [ 191.5, 300.0, 46.5, 300.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-16", 0 ],
																	"destination" : [ "obj-13", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-13", 0 ],
																	"destination" : [ "obj-14", 0 ],
																	"hidden" : 0,
																	"midpoints" : [ 34.5, 175.0, 191.5, 175.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-14", 0 ],
																	"destination" : [ "obj-4", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-16", 1 ],
																	"destination" : [ "obj-7", 1 ],
																	"hidden" : 1,
																	"midpoints" : [ 211.5, 309.0, 211.5, 309.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-7", 1 ],
																	"destination" : [ "obj-8", 1 ],
																	"hidden" : 0,
																	"midpoints" : [ 211.5, 404.0, 54.0, 404.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-7", 0 ],
																	"destination" : [ "obj-8", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-4", 0 ],
																	"destination" : [ "obj-12", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-12", 0 ],
																	"destination" : [ "obj-3", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-7", 0 ],
																	"destination" : [ "obj-21", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-7", 1 ],
																	"destination" : [ "obj-22", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-20", 0 ],
																	"destination" : [ "obj-16", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
 ]
													}
,
													"saved_object_attributes" : 													{
														"default_fontface" : 0,
														"fontface" : 0,
														"fontsize" : 12.0,
														"default_fontname" : "Arial",
														"default_fontsize" : 12.0,
														"fontname" : "Arial",
														"globalpatchername" : ""
													}

												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "F#",
													"fontsize" : 12.0,
													"patching_rect" : [ 166.0, 176.0, 23.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-70",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 374.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-71",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 338.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-72",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 302.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-73",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 266.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-74",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 230.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-75",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 194.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-76",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 158.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-77",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 122.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-78",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "locrian_b7",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 651.0, 75.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-79",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "locrian_b4",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 651.0, 75.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-80",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "mixolydian_#1",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 651.0, 101.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-81",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "locrian",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 651.0, 51.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-82",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "aeolian_b1",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 617.0, 79.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-83",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "locrian_#2",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 617.0, 75.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-84",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "lydian_#2",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 617.0, 71.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-85",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "aeolian",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 617.0, 55.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-86",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "mixolydian_b2",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 583.0, 101.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-87",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "mixolydian_b6",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 583.0, 101.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-88",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "phrygian_#3",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 583.0, 87.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-89",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "mixolydian",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 583.0, 77.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-90",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "lydian_b3",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 551.0, 71.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-91",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "lydian_b7",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 551.0, 71.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-92",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "dorian_#4",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 551.0, 71.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-93",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "lydian",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 551.0, 47.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-94",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "phrygian_b4",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 517.0, 87.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-95",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "lydian_#5",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 517.0, 71.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-96",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "ionian_#5",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 517.0, 72.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-97",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "phrygian",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 517.0, 63.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-98",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "dorian_b5",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 479.0, 71.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-99",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "dorian_b2",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 479.0, 71.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-100",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "locrian_#6",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 479.0, 75.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-101",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "dorian",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 479.0, 47.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-102",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "harmonic_major",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 443.0, 111.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-103",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "melodic_minor",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 443.0, 103.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-104",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "harmonic_minor",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 443.0, 111.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-105",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "ionian",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 443.0, 48.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-106",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "mode names",
													"textcolor" : [ 0.4, 0.4, 0.8, 1.0 ],
													"frgb" : [ 0.4, 0.4, 0.8, 1.0 ],
													"fontsize" : 12.0,
													"patching_rect" : [ 619.0, 225.0, 81.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-107",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "coll my_coll",
													"fontsize" : 12.0,
													"patching_rect" : [ 627.0, 381.0, 73.0, 20.0 ],
													"numinlets" : 1,
													"color" : [ 0.4, 0.4, 0.8, 1.0 ],
													"id" : "obj-108",
													"fontname" : "Arial",
													"numoutlets" : 4,
													"outlettype" : [ "", "", "", "" ],
													"saved_object_attributes" : 													{
														"embed" : 0
													}

												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "lydian_b7",
													"fontsize" : 12.0,
													"patching_rect" : [ 358.0, 191.0, 68.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-110",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "minor",
													"fontsize" : 12.0,
													"patching_rect" : [ 332.0, 171.0, 39.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-111",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "c",
													"fontsize" : 12.0,
													"patching_rect" : [ 143.0, 176.0, 20.5, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-112",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "major",
													"fontsize" : 12.0,
													"patching_rect" : [ 292.0, 191.0, 43.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-114",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "4",
													"fontsize" : 12.0,
													"patching_rect" : [ 120.0, 176.0, 18.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-115",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "send a MIDI pitch class number (C=0, C#=1, etc) 0-11 in the left inlet or simply send a message box with a letter. This will determine the tonic of the 7 note mode. \nNext send a message box with a mode name in the right inlet. ",
													"linecount" : 3,
													"fontsize" : 12.0,
													"patching_rect" : [ 53.0, 103.0, 478.0, 48.0 ],
													"numinlets" : 1,
													"id" : "obj-117",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "tonic",
													"textcolor" : [ 0.4, 0.4, 0.8, 1.0 ],
													"frgb" : [ 0.4, 0.4, 0.8, 1.0 ],
													"fontsize" : 12.0,
													"patching_rect" : [ 78.0, 226.0, 34.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-118",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "modes are named using traditional Greek names and variations of these names that reflect the least amount of chromatic inflections for the 7 modes of the Major Scale, the Harmonic Minor Scale, the Harmonic Major Scale, and the Melodic Minor Scale",
													"linecount" : 3,
													"fontsize" : 12.0,
													"patching_rect" : [ 57.0, 693.0, 529.0, 48.0 ],
													"numinlets" : 1,
													"id" : "obj-121",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "3.1",
													"fontsize" : 12.0,
													"patching_rect" : [ 228.0, 54.0, 31.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-124",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Major Modes",
													"fontface" : 1,
													"fontsize" : 11.0,
													"patching_rect" : [ 67.0, 416.0, 131.0, 19.0 ],
													"numinlets" : 1,
													"id" : "obj-125",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "panel",
													"mode" : 1,
													"patching_rect" : [ 65.0, 410.0, 93.0, 285.0 ],
													"numinlets" : 1,
													"id" : "obj-126",
													"numoutlets" : 0,
													"grad2" : [ 1.0, 1.0, 1.0, 1.0 ],
													"bgcolor" : [ 0.937255, 0.956863, 1.0, 1.0 ],
													"rounded" : 30
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "panel",
													"mode" : 1,
													"patching_rect" : [ 167.0, 410.0, 136.0, 284.0 ],
													"numinlets" : 1,
													"id" : "obj-127",
													"numoutlets" : 0,
													"grad2" : [ 1.0, 1.0, 1.0, 1.0 ],
													"bgcolor" : [ 0.819608, 0.87451, 0.996078, 1.0 ],
													"rounded" : 30
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "panel",
													"mode" : 1,
													"patching_rect" : [ 306.0, 410.0, 137.0, 283.0 ],
													"numinlets" : 1,
													"id" : "obj-128",
													"numoutlets" : 0,
													"grad2" : [ 1.0, 1.0, 1.0, 1.0 ],
													"bgcolor" : [ 0.694118, 0.768627, 0.988235, 1.0 ],
													"rounded" : 30
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "pitch classes only (reduced to one octave)",
													"fontsize" : 12.0,
													"patching_rect" : [ 170.0, 379.0, 272.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-130",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "complete mode list",
													"fontsize" : 12.0,
													"patching_rect" : [ 436.0, 151.0, 112.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-131",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "takes numbers or letters",
													"fontsize" : 12.0,
													"patching_rect" : [ 111.0, 156.0, 140.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-132",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "modal_change",
													"textcolor" : [ 0.047059, 0.0, 0.454902, 1.0 ],
													"frgb" : [ 0.047059, 0.0, 0.454902, 1.0 ],
													"fontsize" : 26.0,
													"patching_rect" : [ 53.0, 53.0, 181.0, 36.0 ],
													"numinlets" : 1,
													"id" : "obj-133",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "pitches at each scale degree",
													"fontsize" : 11.0,
													"patching_rect" : [ 195.0, 344.0, 201.0, 19.0 ],
													"numinlets" : 1,
													"id" : "obj-134",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "panel",
													"mode" : 1,
													"patching_rect" : [ 618.0, 340.0, 262.0, 94.0 ],
													"numinlets" : 1,
													"grad1" : [ 0.894118, 0.917647, 1.0, 1.0 ],
													"id" : "obj-137",
													"numoutlets" : 0,
													"angle" : 1.16,
													"bgcolor" : [ 0.937255, 0.956863, 1.0, 1.0 ],
													"rounded" : 30
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "panel",
													"mode" : 1,
													"patching_rect" : [ 444.0, 410.0, 136.0, 284.0 ],
													"numinlets" : 1,
													"id" : "obj-129",
													"numoutlets" : 0,
													"grad2" : [ 1.0, 1.0, 1.0, 1.0 ],
													"bgcolor" : [ 0.576471, 0.643137, 0.980392, 1.0 ],
													"rounded" : 30
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "panel",
													"mode" : 1,
													"patching_rect" : [ 618.0, 466.0, 262.0, 94.0 ],
													"numinlets" : 1,
													"grad1" : [ 0.894118, 0.917647, 1.0, 1.0 ],
													"id" : "obj-109",
													"numoutlets" : 0,
													"angle" : 1.16,
													"bgcolor" : [ 0.937255, 0.956863, 1.0, 1.0 ],
													"rounded" : 30
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "modal_change",
													"varname" : "modal_change",
													"patching_rect" : [ 68.0, 247.0, 556.0, 65.0 ],
													"numinlets" : 2,
													"background" : 1,
													"id" : "obj-139",
													"numoutlets" : 9,
													"fontcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
													"outlettype" : [ "int", "int", "int", "int", "int", "int", "int", "int", "list" ]
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"source" : [ "obj-33", 0 ],
													"destination" : [ "obj-11", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-33", 1 ],
													"destination" : [ "obj-11", 1 ],
													"hidden" : 0,
													"midpoints" : [ 720.5, 501.5, 704.5, 501.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 8 ],
													"destination" : [ "obj-33", 0 ],
													"hidden" : 0,
													"midpoints" : [ 614.5, 453.0, 634.5, 453.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-66", 0 ],
													"destination" : [ "obj-139", 0 ],
													"hidden" : 0,
													"midpoints" : [ 201.5, 220.5, 77.5, 220.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-70", 0 ],
													"destination" : [ "obj-139", 0 ],
													"hidden" : 0,
													"midpoints" : [ 175.5, 220.5, 77.5, 220.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-115", 0 ],
													"destination" : [ "obj-139", 0 ],
													"hidden" : 0,
													"midpoints" : [ 129.5, 220.5, 77.5, 220.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-112", 0 ],
													"destination" : [ "obj-139", 0 ],
													"hidden" : 0,
													"midpoints" : [ 152.5, 220.5, 77.5, 220.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-3", 0 ],
													"destination" : [ "obj-139", 0 ],
													"hidden" : 0,
													"midpoints" : [ 61.5, 213.5, 77.5, 213.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 0 ],
													"destination" : [ "obj-78", 0 ],
													"hidden" : 0,
													"midpoints" : [ 77.5, 317.5, 131.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-78", 0 ],
													"destination" : [ "obj-31", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-31", 0 ],
													"destination" : [ "obj-30", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 1 ],
													"destination" : [ "obj-77", 0 ],
													"hidden" : 0,
													"midpoints" : [ 144.625, 317.5, 167.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-77", 0 ],
													"destination" : [ "obj-22", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-22", 0 ],
													"destination" : [ "obj-29", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 2 ],
													"destination" : [ "obj-76", 0 ],
													"hidden" : 0,
													"midpoints" : [ 211.75, 317.5, 203.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-76", 0 ],
													"destination" : [ "obj-21", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-21", 0 ],
													"destination" : [ "obj-28", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-34", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 0,
													"midpoints" : [ 576.5, 218.5, 614.5, 218.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-67", 1 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 0,
													"midpoints" : [ 488.0, 240.5, 614.5, 240.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-80", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-84", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-88", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-92", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-96", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-100", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-104", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-81", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-85", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-89", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-93", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-97", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-101", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-105", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-79", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-83", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-87", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-91", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-95", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-99", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-103", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-82", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-86", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-90", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-94", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-98", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-102", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-106", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-114", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 0,
													"midpoints" : [ 301.5, 218.5, 614.5, 218.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-111", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 0,
													"midpoints" : [ 341.5, 218.5, 614.5, 218.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-110", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 0,
													"midpoints" : [ 367.5, 218.5, 614.5, 218.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 3 ],
													"destination" : [ "obj-75", 0 ],
													"hidden" : 0,
													"midpoints" : [ 278.875, 317.5, 239.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-75", 0 ],
													"destination" : [ "obj-20", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-20", 0 ],
													"destination" : [ "obj-27", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 4 ],
													"destination" : [ "obj-74", 0 ],
													"hidden" : 0,
													"midpoints" : [ 346.0, 317.5, 275.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-74", 0 ],
													"destination" : [ "obj-19", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-19", 0 ],
													"destination" : [ "obj-26", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 5 ],
													"destination" : [ "obj-73", 0 ],
													"hidden" : 0,
													"midpoints" : [ 413.125, 317.5, 311.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-73", 0 ],
													"destination" : [ "obj-18", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-18", 0 ],
													"destination" : [ "obj-25", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 6 ],
													"destination" : [ "obj-72", 0 ],
													"hidden" : 0,
													"midpoints" : [ 480.25, 317.5, 347.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-72", 0 ],
													"destination" : [ "obj-17", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-17", 0 ],
													"destination" : [ "obj-24", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 7 ],
													"destination" : [ "obj-71", 0 ],
													"hidden" : 0,
													"midpoints" : [ 547.375, 317.5, 383.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-71", 0 ],
													"destination" : [ "obj-16", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-16", 0 ],
													"destination" : [ "obj-23", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 8 ],
													"destination" : [ "obj-141", 1 ],
													"hidden" : 0,
													"midpoints" : [ 614.5, 328.0, 589.5, 328.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-144", 0 ],
													"destination" : [ "obj-141", 0 ],
													"hidden" : 1,
													"midpoints" : [ 568.5, 328.0, 458.5, 328.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 8 ],
													"destination" : [ "obj-145", 0 ],
													"hidden" : 0,
													"midpoints" : [ 614.5, 335.5, 636.5, 335.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-145", 0 ],
													"destination" : [ "obj-108", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-159", 0 ],
													"destination" : [ "obj-69", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-69", 0 ],
													"destination" : [ "obj-160", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-69", 1 ],
													"destination" : [ "obj-161", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-1", 0 ],
													"destination" : [ "obj-139", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-2", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
 ]
									}
,
									"saved_object_attributes" : 									{
										"default_fontface" : 0,
										"fontface" : 0,
										"fontsize" : 12.0,
										"default_fontname" : "Arial",
										"default_fontsize" : 12.0,
										"fontname" : "Arial",
										"globalpatchername" : ""
									}

								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "r mode",
									"fontsize" : 12.0,
									"patching_rect" : [ 322.0, 201.0, 48.0, 20.0 ],
									"numinlets" : 0,
									"id" : "obj-79",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "r tonic",
									"fontsize" : 12.0,
									"patching_rect" : [ 285.0, 181.0, 43.0, 20.0 ],
									"numinlets" : 0,
									"id" : "obj-80",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "p modalChange",
									"fontsize" : 12.0,
									"patching_rect" : [ 247.0, 223.0, 95.0, 20.0 ],
									"numinlets" : 3,
									"id" : "obj-81",
									"fontname" : "Arial",
									"numoutlets" : 2,
									"outlettype" : [ "int", "int" ],
									"patcher" : 									{
										"fileversion" : 1,
										"rect" : [ 347.0, 228.0, 1093.0, 691.0 ],
										"bglocked" : 0,
										"defrect" : [ 347.0, 228.0, 1093.0, 691.0 ],
										"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
										"openinpresentation" : 0,
										"default_fontsize" : 12.0,
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"gridonopen" : 0,
										"gridsize" : [ 15.0, 15.0 ],
										"gridsnaponopen" : 0,
										"toolbarvisible" : 1,
										"boxanimatetime" : 200,
										"imprint" : 0,
										"enablehscroll" : 1,
										"enablevscroll" : 1,
										"devicewidth" : 0.0,
										"boxes" : [ 											{
												"box" : 												{
													"maxclass" : "inlet",
													"hint" : "Mode Name",
													"patching_rect" : [ 926.0, 38.0, 25.0, 25.0 ],
													"numinlets" : 0,
													"id" : "obj-2",
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"comment" : ""
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "inlet",
													"hint" : "Tonic (Note or Number)",
													"annotation" : "",
													"patching_rect" : [ 865.0, 38.0, 25.0, 25.0 ],
													"numinlets" : 0,
													"id" : "obj-1",
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"comment" : ""
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "outlet",
													"patching_rect" : [ 828.0, 440.0, 25.0, 25.0 ],
													"numinlets" : 1,
													"id" : "obj-161",
													"numoutlets" : 0,
													"comment" : ""
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "outlet",
													"patching_rect" : [ 776.0, 440.0, 25.0, 25.0 ],
													"numinlets" : 1,
													"id" : "obj-160",
													"numoutlets" : 0,
													"comment" : ""
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "inlet",
													"patching_rect" : [ 776.0, 290.0, 25.0, 25.0 ],
													"numinlets" : 0,
													"id" : "obj-159",
													"numoutlets" : 1,
													"outlettype" : [ "float" ],
													"comment" : ""
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "bpatcher",
													"patching_rect" : [ 619.0, 579.0, 195.0, 148.0 ],
													"name" : "modal_change_related_objects.maxpat",
													"numinlets" : 0,
													"args" : [  ],
													"id" : "obj-13",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "< - Get scale data in a table",
													"linecount" : 2,
													"fontsize" : 12.0,
													"patching_rect" : [ 732.0, 477.0, 141.0, 34.0 ],
													"numinlets" : 1,
													"id" : "obj-119",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "<-- send data to any table",
													"fontsize" : 10.0,
													"patching_rect" : [ 712.0, 508.0, 122.0, 18.0 ],
													"numinlets" : 1,
													"id" : "obj-123",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Look at these table uses:",
													"fontsize" : 12.0,
													"patching_rect" : [ 631.0, 534.0, 153.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-113",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "modal_table_filter",
													"fontsize" : 12.0,
													"patching_rect" : [ 625.0, 477.0, 105.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-33",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"outlettype" : [ "int", "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "table my_table",
													"fontsize" : 12.0,
													"patching_rect" : [ 625.0, 506.0, 89.0, 20.0 ],
													"numinlets" : 2,
													"color" : [ 0.019608, 0.137255, 0.823529, 1.0 ],
													"id" : "obj-11",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"outlettype" : [ "int", "bang" ],
													"showeditor" : 0,
													"editor_rect" : [ 473.0, 481.0, 588.0, 619.0 ],
													"saved_object_attributes" : 													{
														"embed" : 0,
														"signed" : 0,
														"notename" : 0,
														"name" : "my_table",
														"size" : 128,
														"showeditor" : 0,
														"range" : 128
													}

												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "< - Get filtered scale data in a coll list. ",
													"linecount" : 2,
													"fontsize" : 12.0,
													"patching_rect" : [ 722.0, 347.0, 155.0, 34.0 ],
													"numinlets" : 1,
													"id" : "obj-150",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "<-- send data to any coll",
													"fontsize" : 10.0,
													"patching_rect" : [ 697.0, 383.0, 122.0, 18.0 ],
													"numinlets" : 1,
													"id" : "obj-148",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "modal_coll_filter",
													"fontsize" : 12.0,
													"patching_rect" : [ 627.0, 350.0, 97.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-145",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "loadmess set",
													"hidden" : 1,
													"fontsize" : 8.0,
													"patching_rect" : [ 559.0, 314.0, 58.0, 16.0 ],
													"numinlets" : 1,
													"id" : "obj-144",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "4 6 8 9 11 13 15 16",
													"fontsize" : 12.0,
													"gradient" : 1,
													"patching_rect" : [ 449.0, 346.0, 150.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-141",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.8, 0.729412, 0.87451, 1.0 ],
													"outlettype" : [ "" ],
													"bgcolor2" : [ 1.0, 1.0, 1.0, 1.0 ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "list out",
													"textcolor" : [ 0.4, 0.4, 0.8, 1.0 ],
													"frgb" : [ 0.4, 0.4, 0.8, 1.0 ],
													"fontsize" : 12.0,
													"patching_rect" : [ 479.0, 329.0, 53.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-140",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "umenu",
													"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
													"fontsize" : 12.0,
													"items" : [ "C", ",", "C#", ",", "D", ",", "D#", ",", "E", ",", "F", ",", "F#", ",", "G", ",", "G#", ",", "A", ",", "A#", ",", "B" ],
													"patching_rect" : [ 52.0, 175.0, 56.0, 20.0 ],
													"numinlets" : 1,
													"labelclick" : 1,
													"id" : "obj-3",
													"fontname" : "Arial",
													"numoutlets" : 3,
													"types" : [  ],
													"bgcolor" : [ 0.94902, 0.894118, 0.984314, 1.0 ],
													"outlettype" : [ "int", "", "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "control modality in Max",
													"fontsize" : 12.0,
													"patching_rect" : [ 53.0, 83.0, 164.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-6",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Look at these coll list uses:",
													"fontsize" : 12.0,
													"patching_rect" : [ 629.0, 409.0, 153.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-12",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "takes mode names",
													"fontsize" : 12.0,
													"patching_rect" : [ 298.0, 216.0, 160.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-14",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "even takes scale degree distances (in half steps)",
													"linecount" : 2,
													"fontsize" : 12.0,
													"patching_rect" : [ 567.0, 159.0, 161.0, 34.0 ],
													"numinlets" : 1,
													"id" : "obj-15",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 374.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-16",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 338.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-17",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 302.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-18",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 266.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-19",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 230.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-20",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 194.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-21",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 158.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-22",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 374.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-23",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 338.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-24",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 302.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-25",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 266.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-26",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 230.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-27",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 194.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-28",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 158.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-29",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 122.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-30",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 122.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-31",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "2 1 2 2 2 2 1",
													"fontsize" : 12.0,
													"patching_rect" : [ 567.0, 193.0, 82.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-34",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 7",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 669.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-35",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 7",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 669.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-36",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 7",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 669.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-37",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 7",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 669.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-38",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 6",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 634.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-39",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 6",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 634.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-40",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 6",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 634.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-41",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 6",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 634.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-42",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 5",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 602.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-43",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 5",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 602.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-44",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 5",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 602.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-45",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 5",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 602.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-46",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 4",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 569.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-47",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 4",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 569.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-48",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 4",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 569.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-49",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 4",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 569.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-50",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 3",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 536.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-51",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 3",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 536.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-52",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 3",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 536.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-53",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 3",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 536.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-54",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 2",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 496.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-55",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 2",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 496.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-56",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 2",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 496.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-57",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 2",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 496.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-58",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 1",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 462.0, 130.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-59",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 1",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 462.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-60",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 1",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 462.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-61",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 1",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 462.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-62",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Melodic Minor Modes",
													"fontface" : 1,
													"fontsize" : 11.0,
													"patching_rect" : [ 454.0, 416.0, 131.0, 19.0 ],
													"numinlets" : 1,
													"id" : "obj-63",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Harmonic Minor Modes",
													"fontface" : 1,
													"fontsize" : 11.0,
													"patching_rect" : [ 313.0, 416.0, 145.0, 19.0 ],
													"numinlets" : 1,
													"id" : "obj-64",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Harmonic Major Modes",
													"fontface" : 1,
													"fontsize" : 11.0,
													"patching_rect" : [ 173.0, 416.0, 145.0, 19.0 ],
													"numinlets" : 1,
													"id" : "obj-65",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"minimum" : 0,
													"fontsize" : 12.0,
													"maximum" : 11,
													"patching_rect" : [ 192.0, 176.0, 29.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-66",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "umenu",
													"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
													"fontsize" : 12.0,
													"items" : [ "ionian", ",", "dorian", ",", "phrygian", ",", "lydian", ",", "mixolydian", ",", "aeolian", ",", "locrian", ",", "harmonic_major", ",", "dorian_b5", ",", "phrygian_b4", ",", "lydian_b3", ",", "mixolydian_b2", ",", "aeolian_b1", ",", "locrian_b7", ",", "harmonic_minor", ",", "locrian_#6", ",", "ionian_#5", ",", "dorian_#4", ",", "phrygian_#3", ",", "lydian_#2", ",", "mixolydian_#1", ",", "melodic_minor", ",", "dorian_b2", ",", "lydian_#5", ",", "lydian_b7", ",", "mixolydian_b6", ",", "locrian_#2", ",", "locrian_b4" ],
													"patching_rect" : [ 438.0, 173.0, 100.0, 20.0 ],
													"numinlets" : 1,
													"labelclick" : 1,
													"id" : "obj-67",
													"fontname" : "Arial",
													"numoutlets" : 3,
													"types" : [  ],
													"bgcolor" : [ 0.94902, 0.894118, 0.984314, 1.0 ],
													"outlettype" : [ "int", "", "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "p table_uses",
													"fontsize" : 12.0,
													"patching_rect" : [ 772.0, 534.0, 79.0, 20.0 ],
													"numinlets" : 0,
													"id" : "obj-68",
													"fontname" : "Arial",
													"numoutlets" : 0,
													"patcher" : 													{
														"fileversion" : 1,
														"rect" : [ 79.0, 111.0, 387.0, 438.0 ],
														"bglocked" : 0,
														"defrect" : [ 79.0, 111.0, 387.0, 438.0 ],
														"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
														"openinpresentation" : 0,
														"default_fontsize" : 12.0,
														"default_fontface" : 0,
														"default_fontname" : "Arial",
														"gridonopen" : 0,
														"gridsize" : [ 15.0, 15.0 ],
														"gridsnaponopen" : 0,
														"toolbarvisible" : 1,
														"boxanimatetime" : 200,
														"imprint" : 0,
														"enablehscroll" : 1,
														"enablevscroll" : 1,
														"devicewidth" : 0.0,
														"boxes" : [ 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "loadmess 4",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 108.0, 180.0, 56.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-1",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "32nd note",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 159.0, 44.0, 58.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-2",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "16th note",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 157.0, 65.0, 58.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-3",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "8th",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 156.0, 84.0, 58.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-4",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "quarter note",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 144.0, 104.0, 58.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-5",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "half note",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 145.0, 129.0, 58.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-6",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "whole note",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 143.0, 147.0, 58.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-7",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "message",
																	"text" : "1",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 128.0, 145.0, 16.0, 15.0 ],
																	"numinlets" : 2,
																	"id" : "obj-8",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "message",
																	"text" : "2",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 128.0, 124.0, 16.0, 15.0 ],
																	"numinlets" : 2,
																	"id" : "obj-9",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "message",
																	"text" : "4",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 128.0, 103.0, 16.0, 15.0 ],
																	"numinlets" : 2,
																	"id" : "obj-10",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "message",
																	"text" : "tempo $1",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 39.0, 94.0, 56.0, 15.0 ],
																	"numinlets" : 2,
																	"id" : "obj-11",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "flonum",
																	"minimum" : 5.0,
																	"fontsize" : 9.0,
																	"maximum" : 300.0,
																	"patching_rect" : [ 39.0, 74.0, 45.0, 17.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-12",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "float", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "button",
																	"patching_rect" : [ 27.0, 150.0, 15.0, 15.0 ],
																	"numinlets" : 1,
																	"id" : "obj-13",
																	"numoutlets" : 1,
																	"outlettype" : [ "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "toggle",
																	"patching_rect" : [ 27.0, 37.0, 15.0, 15.0 ],
																	"numinlets" : 1,
																	"id" : "obj-14",
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "message",
																	"text" : "8",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 128.0, 82.0, 27.0, 15.0 ],
																	"numinlets" : 2,
																	"id" : "obj-15",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "message",
																	"text" : "16",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 128.0, 61.0, 27.0, 15.0 ],
																	"numinlets" : 2,
																	"id" : "obj-16",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "message",
																	"text" : "32",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 128.0, 41.0, 27.0, 15.0 ],
																	"numinlets" : 2,
																	"id" : "obj-17",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "tempo 120 1 4",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 27.0, 119.0, 68.0, 17.0 ],
																	"numinlets" : 4,
																	"id" : "obj-18",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "number",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 28.0, 263.0, 35.0, 17.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-19",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "int", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "slider",
																	"patching_rect" : [ 89.0, 206.0, 15.0, 18.0 ],
																	"relative" : 1,
																	"numinlets" : 1,
																	"orientation" : 2,
																	"size" : 11.0,
																	"id" : "obj-20",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"mult" : 12.0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "+ 0",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 37.0, 236.0, 27.0, 17.0 ],
																	"numinlets" : 2,
																	"id" : "obj-21",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "number",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 27.0, 206.0, 35.0, 17.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-22",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "int", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "table my_table",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 27.0, 180.0, 69.0, 17.0 ],
																	"numinlets" : 2,
																	"color" : [ 1.0, 0.890196, 0.090196, 1.0 ],
																	"id" : "obj-23",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"outlettype" : [ "int", "bang" ],
																	"showeditor" : 0,
																	"editor_rect" : [ 100.0, 100.0, 300.0, 300.0 ],
																	"saved_object_attributes" : 																	{
																		"embed" : 0,
																		"signed" : 0,
																		"notename" : 0,
																		"name" : "my_table",
																		"size" : 128,
																		"showeditor" : 0,
																		"range" : 128
																	}

																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "noteout",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 28.0, 324.0, 40.0, 17.0 ],
																	"numinlets" : 3,
																	"id" : "obj-24",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "makenote 100 100",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 28.0, 289.0, 85.0, 17.0 ],
																	"numinlets" : 3,
																	"id" : "obj-25",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"outlettype" : [ "float", "float" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "octave",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 106.0, 206.0, 39.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-26",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "tempo",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 41.0, 58.0, 35.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-27",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "START",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 18.0, 21.0, 43.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-28",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
 ],
														"lines" : [ 															{
																"patchline" : 																{
																	"source" : [ "obj-13", 0 ],
																	"destination" : [ "obj-23", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-23", 0 ],
																	"destination" : [ "obj-22", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-1", 0 ],
																	"destination" : [ "obj-20", 0 ],
																	"hidden" : 0,
																	"midpoints" : [ 117.5, 201.0, 98.0, 201.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-8", 0 ],
																	"destination" : [ "obj-18", 3 ],
																	"hidden" : 1,
																	"midpoints" : [ 137.5, 133.0, 120.0, 133.0, 120.0, 111.0, 85.5, 111.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-16", 0 ],
																	"destination" : [ "obj-18", 3 ],
																	"hidden" : 1,
																	"midpoints" : [ 137.5, 49.0, 85.5, 49.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-17", 0 ],
																	"destination" : [ "obj-18", 3 ],
																	"hidden" : 1,
																	"midpoints" : [ 137.5, 27.0, 85.5, 27.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-15", 0 ],
																	"destination" : [ "obj-18", 3 ],
																	"hidden" : 1,
																	"midpoints" : [ 137.5, 69.0, 85.5, 69.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-10", 0 ],
																	"destination" : [ "obj-18", 3 ],
																	"hidden" : 1,
																	"midpoints" : [ 137.5, 90.0, 85.5, 90.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-9", 0 ],
																	"destination" : [ "obj-18", 3 ],
																	"hidden" : 1,
																	"midpoints" : [ 137.5, 111.0, 85.5, 111.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-20", 0 ],
																	"destination" : [ "obj-21", 1 ],
																	"hidden" : 0,
																	"midpoints" : [ 98.0, 230.0, 54.5, 230.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-25", 1 ],
																	"destination" : [ "obj-24", 1 ],
																	"hidden" : 0,
																	"midpoints" : [ 103.5, 315.0, 48.0, 315.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-12", 0 ],
																	"destination" : [ "obj-11", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-22", 0 ],
																	"destination" : [ "obj-21", 0 ],
																	"hidden" : 0,
																	"midpoints" : [ 36.5, 229.0, 46.5, 229.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-25", 0 ],
																	"destination" : [ "obj-24", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-19", 0 ],
																	"destination" : [ "obj-25", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-21", 0 ],
																	"destination" : [ "obj-19", 0 ],
																	"hidden" : 0,
																	"midpoints" : [ 46.5, 258.0, 37.5, 258.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-18", 0 ],
																	"destination" : [ "obj-13", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-14", 0 ],
																	"destination" : [ "obj-18", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-11", 0 ],
																	"destination" : [ "obj-18", 0 ],
																	"hidden" : 0,
																	"midpoints" : [ 48.5, 114.0, 36.5, 114.0 ]
																}

															}
 ]
													}
,
													"saved_object_attributes" : 													{
														"default_fontface" : 0,
														"fontface" : 0,
														"fontsize" : 12.0,
														"default_fontname" : "Arial",
														"default_fontsize" : 12.0,
														"fontname" : "Arial",
														"globalpatchername" : ""
													}

												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "p coll_uses",
													"fontsize" : 12.0,
													"patching_rect" : [ 776.0, 409.0, 71.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-69",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"outlettype" : [ "int", "int" ],
													"patcher" : 													{
														"fileversion" : 1,
														"rect" : [ 160.0, 156.0, 344.0, 479.0 ],
														"bglocked" : 0,
														"defrect" : [ 160.0, 156.0, 344.0, 479.0 ],
														"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
														"openinpresentation" : 0,
														"default_fontsize" : 12.0,
														"default_fontface" : 0,
														"default_fontname" : "Arial",
														"gridonopen" : 0,
														"gridsize" : [ 15.0, 15.0 ],
														"gridsnaponopen" : 0,
														"toolbarvisible" : 1,
														"boxanimatetime" : 200,
														"imprint" : 0,
														"enablehscroll" : 1,
														"enablevscroll" : 1,
														"devicewidth" : 0.0,
														"boxes" : [ 															{
																"box" : 																{
																	"maxclass" : "outlet",
																	"patching_rect" : [ 237.0, 427.0, 25.0, 25.0 ],
																	"numinlets" : 1,
																	"id" : "obj-22",
																	"numoutlets" : 0,
																	"comment" : ""
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "outlet",
																	"patching_rect" : [ 144.0, 429.0, 25.0, 25.0 ],
																	"numinlets" : 1,
																	"id" : "obj-21",
																	"numoutlets" : 0,
																	"comment" : ""
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "inlet",
																	"patching_rect" : [ 25.0, 31.0, 25.0, 25.0 ],
																	"numinlets" : 0,
																	"id" : "obj-20",
																	"numoutlets" : 1,
																	"outlettype" : [ "float" ],
																	"comment" : ""
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "data stored in list",
																	"linecount" : 2,
																	"fontsize" : 12.0,
																	"patching_rect" : [ 253.0, 244.0, 72.0, 34.0 ],
																	"numinlets" : 1,
																	"id" : "obj-1",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "this patch filters all unrelated notes to ones from the selected mode",
																	"linecount" : 2,
																	"fontsize" : 12.0,
																	"patching_rect" : [ 62.0, 21.0, 199.0, 34.0 ],
																	"numinlets" : 1,
																	"id" : "obj-2",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "number",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 182.0, 277.0, 41.0, 20.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-3",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "int", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "number",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 182.0, 213.0, 38.0, 20.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-4",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "int", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "number",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 25.0, 213.0, 34.0, 20.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-5",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "int", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "* 12",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 25.0, 241.0, 51.0, 20.0 ],
																	"numinlets" : 2,
																	"id" : "obj-6",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "kslider",
																	"patching_rect" : [ 25.0, 359.0, 196.0, 34.0 ],
																	"numinlets" : 2,
																	"id" : "obj-7",
																	"numoutlets" : 2,
																	"outlettype" : [ "int", "int" ],
																	"presentation_rect" : [ 0.0, 0.0, 196.0, 35.0 ],
																	"hkeycolor" : [ 0.666667, 0.666667, 0.666667, 1.0 ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "noteout",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 25.0, 419.0, 58.0, 20.0 ],
																	"numinlets" : 3,
																	"id" : "obj-8",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "pitch class",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 222.0, 213.0, 72.0, 20.0 ],
																	"numinlets" : 1,
																	"id" : "obj-9",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "number",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 25.0, 331.0, 45.0, 20.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-10",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "int", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "+",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 25.0, 305.0, 31.0, 20.0 ],
																	"numinlets" : 2,
																	"id" : "obj-11",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "coll my_coll",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 182.0, 246.0, 73.0, 20.0 ],
																	"numinlets" : 1,
																	"color" : [ 0.0, 0.133333, 0.882353, 1.0 ],
																	"id" : "obj-12",
																	"fontname" : "Arial",
																	"numoutlets" : 4,
																	"outlettype" : [ "", "", "", "" ],
																	"saved_object_attributes" : 																	{
																		"embed" : 0
																	}

																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "number",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 25.0, 135.0, 40.0, 20.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-13",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "int", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "% 12",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 182.0, 184.0, 46.0, 20.0 ],
																	"numinlets" : 2,
																	"id" : "obj-14",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "/ 12",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 25.0, 185.0, 41.0, 20.0 ],
																	"numinlets" : 2,
																	"id" : "obj-15",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "kslider",
																	"patching_rect" : [ 25.0, 94.0, 196.0, 34.0 ],
																	"numinlets" : 2,
																	"id" : "obj-16",
																	"numoutlets" : 2,
																	"outlettype" : [ "int", "int" ],
																	"presentation_rect" : [ 0.0, 0.0, 196.0, 35.0 ],
																	"hkeycolor" : [ 0.501961, 0.501961, 0.501961, 1.0 ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "MIDI Note",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 64.0, 135.0, 78.0, 20.0 ],
																	"numinlets" : 1,
																	"id" : "obj-18",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "octave register",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 56.0, 213.0, 90.0, 20.0 ],
																	"numinlets" : 1,
																	"id" : "obj-19",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
 ],
														"lines" : [ 															{
																"patchline" : 																{
																	"source" : [ "obj-20", 0 ],
																	"destination" : [ "obj-16", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-7", 1 ],
																	"destination" : [ "obj-22", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-7", 0 ],
																	"destination" : [ "obj-21", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-12", 0 ],
																	"destination" : [ "obj-3", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-4", 0 ],
																	"destination" : [ "obj-12", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-7", 0 ],
																	"destination" : [ "obj-8", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-7", 1 ],
																	"destination" : [ "obj-8", 1 ],
																	"hidden" : 0,
																	"midpoints" : [ 211.5, 404.0, 54.0, 404.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-16", 1 ],
																	"destination" : [ "obj-7", 1 ],
																	"hidden" : 1,
																	"midpoints" : [ 211.5, 309.0, 211.5, 309.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-14", 0 ],
																	"destination" : [ "obj-4", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-13", 0 ],
																	"destination" : [ "obj-14", 0 ],
																	"hidden" : 0,
																	"midpoints" : [ 34.5, 175.0, 191.5, 175.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-16", 0 ],
																	"destination" : [ "obj-13", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-3", 0 ],
																	"destination" : [ "obj-11", 1 ],
																	"hidden" : 0,
																	"midpoints" : [ 191.5, 300.0, 46.5, 300.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-10", 0 ],
																	"destination" : [ "obj-7", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-11", 0 ],
																	"destination" : [ "obj-10", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-6", 0 ],
																	"destination" : [ "obj-11", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-5", 0 ],
																	"destination" : [ "obj-6", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-15", 0 ],
																	"destination" : [ "obj-5", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-13", 0 ],
																	"destination" : [ "obj-15", 0 ],
																	"hidden" : 0,
																	"midpoints" : [ 34.5, 175.0, 34.5, 175.0 ]
																}

															}
 ]
													}
,
													"saved_object_attributes" : 													{
														"default_fontface" : 0,
														"fontface" : 0,
														"fontsize" : 12.0,
														"default_fontname" : "Arial",
														"default_fontsize" : 12.0,
														"fontname" : "Arial",
														"globalpatchername" : ""
													}

												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "F#",
													"fontsize" : 12.0,
													"patching_rect" : [ 166.0, 176.0, 23.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-70",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 374.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-71",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 338.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-72",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 302.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-73",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 266.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-74",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 230.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-75",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 194.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-76",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 158.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-77",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 122.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-78",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "locrian_b7",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 651.0, 75.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-79",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "locrian_b4",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 651.0, 75.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-80",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "mixolydian_#1",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 651.0, 101.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-81",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "locrian",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 651.0, 51.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-82",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "aeolian_b1",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 617.0, 79.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-83",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "locrian_#2",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 617.0, 75.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-84",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "lydian_#2",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 617.0, 71.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-85",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "aeolian",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 617.0, 55.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-86",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "mixolydian_b2",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 583.0, 101.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-87",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "mixolydian_b6",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 583.0, 101.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-88",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "phrygian_#3",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 583.0, 87.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-89",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "mixolydian",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 583.0, 77.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-90",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "lydian_b3",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 551.0, 71.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-91",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "lydian_b7",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 551.0, 71.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-92",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "dorian_#4",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 551.0, 71.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-93",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "lydian",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 551.0, 47.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-94",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "phrygian_b4",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 517.0, 87.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-95",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "lydian_#5",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 517.0, 71.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-96",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "ionian_#5",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 517.0, 72.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-97",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "phrygian",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 517.0, 63.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-98",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "dorian_b5",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 479.0, 71.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-99",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "dorian_b2",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 479.0, 71.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-100",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "locrian_#6",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 479.0, 75.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-101",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "dorian",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 479.0, 47.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-102",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "harmonic_major",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 443.0, 111.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-103",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "melodic_minor",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 443.0, 103.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-104",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "harmonic_minor",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 443.0, 111.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-105",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "ionian",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 443.0, 48.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-106",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "mode names",
													"textcolor" : [ 0.4, 0.4, 0.8, 1.0 ],
													"frgb" : [ 0.4, 0.4, 0.8, 1.0 ],
													"fontsize" : 12.0,
													"patching_rect" : [ 619.0, 225.0, 81.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-107",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "coll my_coll",
													"fontsize" : 12.0,
													"patching_rect" : [ 627.0, 381.0, 73.0, 20.0 ],
													"numinlets" : 1,
													"color" : [ 0.4, 0.4, 0.8, 1.0 ],
													"id" : "obj-108",
													"fontname" : "Arial",
													"numoutlets" : 4,
													"outlettype" : [ "", "", "", "" ],
													"saved_object_attributes" : 													{
														"embed" : 0
													}

												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "lydian_b7",
													"fontsize" : 12.0,
													"patching_rect" : [ 358.0, 191.0, 68.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-110",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "minor",
													"fontsize" : 12.0,
													"patching_rect" : [ 332.0, 171.0, 39.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-111",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "c",
													"fontsize" : 12.0,
													"patching_rect" : [ 143.0, 176.0, 20.5, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-112",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "major",
													"fontsize" : 12.0,
													"patching_rect" : [ 292.0, 191.0, 43.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-114",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "4",
													"fontsize" : 12.0,
													"patching_rect" : [ 120.0, 176.0, 18.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-115",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "send a MIDI pitch class number (C=0, C#=1, etc) 0-11 in the left inlet or simply send a message box with a letter. This will determine the tonic of the 7 note mode. \nNext send a message box with a mode name in the right inlet. ",
													"linecount" : 3,
													"fontsize" : 12.0,
													"patching_rect" : [ 53.0, 103.0, 478.0, 48.0 ],
													"numinlets" : 1,
													"id" : "obj-117",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "tonic",
													"textcolor" : [ 0.4, 0.4, 0.8, 1.0 ],
													"frgb" : [ 0.4, 0.4, 0.8, 1.0 ],
													"fontsize" : 12.0,
													"patching_rect" : [ 78.0, 226.0, 34.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-118",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "modes are named using traditional Greek names and variations of these names that reflect the least amount of chromatic inflections for the 7 modes of the Major Scale, the Harmonic Minor Scale, the Harmonic Major Scale, and the Melodic Minor Scale",
													"linecount" : 3,
													"fontsize" : 12.0,
													"patching_rect" : [ 57.0, 693.0, 529.0, 48.0 ],
													"numinlets" : 1,
													"id" : "obj-121",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "3.1",
													"fontsize" : 12.0,
													"patching_rect" : [ 228.0, 54.0, 31.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-124",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Major Modes",
													"fontface" : 1,
													"fontsize" : 11.0,
													"patching_rect" : [ 67.0, 416.0, 131.0, 19.0 ],
													"numinlets" : 1,
													"id" : "obj-125",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "panel",
													"mode" : 1,
													"patching_rect" : [ 65.0, 410.0, 93.0, 285.0 ],
													"numinlets" : 1,
													"id" : "obj-126",
													"numoutlets" : 0,
													"grad2" : [ 1.0, 1.0, 1.0, 1.0 ],
													"bgcolor" : [ 0.937255, 0.956863, 1.0, 1.0 ],
													"rounded" : 30
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "panel",
													"mode" : 1,
													"patching_rect" : [ 167.0, 410.0, 136.0, 284.0 ],
													"numinlets" : 1,
													"id" : "obj-127",
													"numoutlets" : 0,
													"grad2" : [ 1.0, 1.0, 1.0, 1.0 ],
													"bgcolor" : [ 0.819608, 0.87451, 0.996078, 1.0 ],
													"rounded" : 30
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "panel",
													"mode" : 1,
													"patching_rect" : [ 306.0, 410.0, 137.0, 283.0 ],
													"numinlets" : 1,
													"id" : "obj-128",
													"numoutlets" : 0,
													"grad2" : [ 1.0, 1.0, 1.0, 1.0 ],
													"bgcolor" : [ 0.694118, 0.768627, 0.988235, 1.0 ],
													"rounded" : 30
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "pitch classes only (reduced to one octave)",
													"fontsize" : 12.0,
													"patching_rect" : [ 170.0, 379.0, 272.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-130",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "complete mode list",
													"fontsize" : 12.0,
													"patching_rect" : [ 436.0, 151.0, 112.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-131",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "takes numbers or letters",
													"fontsize" : 12.0,
													"patching_rect" : [ 111.0, 156.0, 140.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-132",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "modal_change",
													"textcolor" : [ 0.047059, 0.0, 0.454902, 1.0 ],
													"frgb" : [ 0.047059, 0.0, 0.454902, 1.0 ],
													"fontsize" : 26.0,
													"patching_rect" : [ 53.0, 53.0, 181.0, 36.0 ],
													"numinlets" : 1,
													"id" : "obj-133",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "pitches at each scale degree",
													"fontsize" : 11.0,
													"patching_rect" : [ 195.0, 344.0, 201.0, 19.0 ],
													"numinlets" : 1,
													"id" : "obj-134",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "panel",
													"mode" : 1,
													"patching_rect" : [ 618.0, 340.0, 262.0, 94.0 ],
													"numinlets" : 1,
													"grad1" : [ 0.894118, 0.917647, 1.0, 1.0 ],
													"id" : "obj-137",
													"numoutlets" : 0,
													"angle" : 1.16,
													"bgcolor" : [ 0.937255, 0.956863, 1.0, 1.0 ],
													"rounded" : 30
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "panel",
													"mode" : 1,
													"patching_rect" : [ 444.0, 410.0, 136.0, 284.0 ],
													"numinlets" : 1,
													"id" : "obj-129",
													"numoutlets" : 0,
													"grad2" : [ 1.0, 1.0, 1.0, 1.0 ],
													"bgcolor" : [ 0.576471, 0.643137, 0.980392, 1.0 ],
													"rounded" : 30
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "panel",
													"mode" : 1,
													"patching_rect" : [ 618.0, 466.0, 262.0, 94.0 ],
													"numinlets" : 1,
													"grad1" : [ 0.894118, 0.917647, 1.0, 1.0 ],
													"id" : "obj-109",
													"numoutlets" : 0,
													"angle" : 1.16,
													"bgcolor" : [ 0.937255, 0.956863, 1.0, 1.0 ],
													"rounded" : 30
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "modal_change",
													"varname" : "modal_change",
													"patching_rect" : [ 68.0, 247.0, 556.0, 65.0 ],
													"numinlets" : 2,
													"background" : 1,
													"id" : "obj-139",
													"numoutlets" : 9,
													"fontcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
													"outlettype" : [ "int", "int", "int", "int", "int", "int", "int", "int", "list" ]
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"source" : [ "obj-2", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-1", 0 ],
													"destination" : [ "obj-139", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-69", 1 ],
													"destination" : [ "obj-161", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-69", 0 ],
													"destination" : [ "obj-160", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-159", 0 ],
													"destination" : [ "obj-69", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-145", 0 ],
													"destination" : [ "obj-108", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 8 ],
													"destination" : [ "obj-145", 0 ],
													"hidden" : 0,
													"midpoints" : [ 614.5, 335.5, 636.5, 335.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-144", 0 ],
													"destination" : [ "obj-141", 0 ],
													"hidden" : 1,
													"midpoints" : [ 568.5, 328.0, 458.5, 328.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 8 ],
													"destination" : [ "obj-141", 1 ],
													"hidden" : 0,
													"midpoints" : [ 614.5, 328.0, 589.5, 328.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-16", 0 ],
													"destination" : [ "obj-23", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-71", 0 ],
													"destination" : [ "obj-16", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 7 ],
													"destination" : [ "obj-71", 0 ],
													"hidden" : 0,
													"midpoints" : [ 547.375, 317.5, 383.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-17", 0 ],
													"destination" : [ "obj-24", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-72", 0 ],
													"destination" : [ "obj-17", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 6 ],
													"destination" : [ "obj-72", 0 ],
													"hidden" : 0,
													"midpoints" : [ 480.25, 317.5, 347.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-18", 0 ],
													"destination" : [ "obj-25", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-73", 0 ],
													"destination" : [ "obj-18", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 5 ],
													"destination" : [ "obj-73", 0 ],
													"hidden" : 0,
													"midpoints" : [ 413.125, 317.5, 311.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-19", 0 ],
													"destination" : [ "obj-26", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-74", 0 ],
													"destination" : [ "obj-19", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 4 ],
													"destination" : [ "obj-74", 0 ],
													"hidden" : 0,
													"midpoints" : [ 346.0, 317.5, 275.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-20", 0 ],
													"destination" : [ "obj-27", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-75", 0 ],
													"destination" : [ "obj-20", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 3 ],
													"destination" : [ "obj-75", 0 ],
													"hidden" : 0,
													"midpoints" : [ 278.875, 317.5, 239.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-110", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 0,
													"midpoints" : [ 367.5, 218.5, 614.5, 218.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-111", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 0,
													"midpoints" : [ 341.5, 218.5, 614.5, 218.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-114", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 0,
													"midpoints" : [ 301.5, 218.5, 614.5, 218.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-106", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-102", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-98", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-94", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-90", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-86", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-82", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-103", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-99", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-95", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-91", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-87", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-83", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-79", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-105", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-101", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-97", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-93", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-89", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-85", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-81", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-104", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-100", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-96", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-92", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-88", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-84", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-80", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-67", 1 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 0,
													"midpoints" : [ 488.0, 240.5, 614.5, 240.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-34", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 0,
													"midpoints" : [ 576.5, 218.5, 614.5, 218.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-21", 0 ],
													"destination" : [ "obj-28", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-76", 0 ],
													"destination" : [ "obj-21", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 2 ],
													"destination" : [ "obj-76", 0 ],
													"hidden" : 0,
													"midpoints" : [ 211.75, 317.5, 203.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-22", 0 ],
													"destination" : [ "obj-29", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-77", 0 ],
													"destination" : [ "obj-22", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 1 ],
													"destination" : [ "obj-77", 0 ],
													"hidden" : 0,
													"midpoints" : [ 144.625, 317.5, 167.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-31", 0 ],
													"destination" : [ "obj-30", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-78", 0 ],
													"destination" : [ "obj-31", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 0 ],
													"destination" : [ "obj-78", 0 ],
													"hidden" : 0,
													"midpoints" : [ 77.5, 317.5, 131.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-3", 0 ],
													"destination" : [ "obj-139", 0 ],
													"hidden" : 0,
													"midpoints" : [ 61.5, 213.5, 77.5, 213.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-112", 0 ],
													"destination" : [ "obj-139", 0 ],
													"hidden" : 0,
													"midpoints" : [ 152.5, 220.5, 77.5, 220.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-115", 0 ],
													"destination" : [ "obj-139", 0 ],
													"hidden" : 0,
													"midpoints" : [ 129.5, 220.5, 77.5, 220.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-70", 0 ],
													"destination" : [ "obj-139", 0 ],
													"hidden" : 0,
													"midpoints" : [ 175.5, 220.5, 77.5, 220.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-66", 0 ],
													"destination" : [ "obj-139", 0 ],
													"hidden" : 0,
													"midpoints" : [ 201.5, 220.5, 77.5, 220.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 8 ],
													"destination" : [ "obj-33", 0 ],
													"hidden" : 0,
													"midpoints" : [ 614.5, 453.0, 634.5, 453.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-33", 1 ],
													"destination" : [ "obj-11", 1 ],
													"hidden" : 0,
													"midpoints" : [ 720.5, 501.5, 704.5, 501.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-33", 0 ],
													"destination" : [ "obj-11", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
 ]
									}
,
									"saved_object_attributes" : 									{
										"default_fontface" : 0,
										"fontface" : 0,
										"fontsize" : 12.0,
										"default_fontname" : "Arial",
										"default_fontsize" : 12.0,
										"fontname" : "Arial",
										"globalpatchername" : ""
									}

								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "r mode",
									"fontsize" : 12.0,
									"patching_rect" : [ 194.0, 201.0, 48.0, 20.0 ],
									"numinlets" : 0,
									"id" : "obj-76",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "r tonic",
									"fontsize" : 12.0,
									"patching_rect" : [ 156.0, 181.0, 43.0, 20.0 ],
									"numinlets" : 0,
									"id" : "obj-77",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "p modalChange",
									"fontsize" : 12.0,
									"patching_rect" : [ 118.0, 223.0, 95.0, 20.0 ],
									"numinlets" : 3,
									"id" : "obj-78",
									"fontname" : "Arial",
									"numoutlets" : 2,
									"outlettype" : [ "int", "int" ],
									"patcher" : 									{
										"fileversion" : 1,
										"rect" : [ 308.0, 85.0, 1093.0, 691.0 ],
										"bglocked" : 0,
										"defrect" : [ 308.0, 85.0, 1093.0, 691.0 ],
										"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
										"openinpresentation" : 0,
										"default_fontsize" : 12.0,
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"gridonopen" : 0,
										"gridsize" : [ 15.0, 15.0 ],
										"gridsnaponopen" : 0,
										"toolbarvisible" : 1,
										"boxanimatetime" : 200,
										"imprint" : 0,
										"enablehscroll" : 1,
										"enablevscroll" : 1,
										"devicewidth" : 0.0,
										"boxes" : [ 											{
												"box" : 												{
													"maxclass" : "inlet",
													"hint" : "Mode Name",
													"patching_rect" : [ 926.0, 38.0, 25.0, 25.0 ],
													"numinlets" : 0,
													"id" : "obj-2",
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"comment" : ""
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "inlet",
													"hint" : "Tonic (Note or Number)",
													"annotation" : "",
													"patching_rect" : [ 865.0, 38.0, 25.0, 25.0 ],
													"numinlets" : 0,
													"id" : "obj-1",
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"comment" : ""
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "outlet",
													"patching_rect" : [ 828.0, 440.0, 25.0, 25.0 ],
													"numinlets" : 1,
													"id" : "obj-161",
													"numoutlets" : 0,
													"comment" : ""
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "outlet",
													"patching_rect" : [ 776.0, 440.0, 25.0, 25.0 ],
													"numinlets" : 1,
													"id" : "obj-160",
													"numoutlets" : 0,
													"comment" : ""
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "inlet",
													"patching_rect" : [ 776.0, 290.0, 25.0, 25.0 ],
													"numinlets" : 0,
													"id" : "obj-159",
													"numoutlets" : 1,
													"outlettype" : [ "float" ],
													"comment" : ""
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "bpatcher",
													"patching_rect" : [ 619.0, 579.0, 195.0, 148.0 ],
													"name" : "modal_change_related_objects.maxpat",
													"numinlets" : 0,
													"args" : [  ],
													"id" : "obj-13",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "< - Get scale data in a table",
													"linecount" : 2,
													"fontsize" : 12.0,
													"patching_rect" : [ 732.0, 477.0, 141.0, 34.0 ],
													"numinlets" : 1,
													"id" : "obj-119",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "<-- send data to any table",
													"fontsize" : 10.0,
													"patching_rect" : [ 712.0, 508.0, 122.0, 18.0 ],
													"numinlets" : 1,
													"id" : "obj-123",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Look at these table uses:",
													"fontsize" : 12.0,
													"patching_rect" : [ 631.0, 534.0, 153.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-113",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "modal_table_filter",
													"fontsize" : 12.0,
													"patching_rect" : [ 625.0, 477.0, 105.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-33",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"outlettype" : [ "int", "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "table my_table",
													"fontsize" : 12.0,
													"patching_rect" : [ 625.0, 506.0, 89.0, 20.0 ],
													"numinlets" : 2,
													"color" : [ 0.019608, 0.137255, 0.823529, 1.0 ],
													"id" : "obj-11",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"outlettype" : [ "int", "bang" ],
													"showeditor" : 0,
													"editor_rect" : [ 473.0, 481.0, 588.0, 619.0 ],
													"saved_object_attributes" : 													{
														"embed" : 0,
														"signed" : 0,
														"notename" : 0,
														"name" : "my_table",
														"size" : 128,
														"showeditor" : 0,
														"range" : 128
													}

												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "< - Get filtered scale data in a coll list. ",
													"linecount" : 2,
													"fontsize" : 12.0,
													"patching_rect" : [ 722.0, 347.0, 155.0, 34.0 ],
													"numinlets" : 1,
													"id" : "obj-150",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "<-- send data to any coll",
													"fontsize" : 10.0,
													"patching_rect" : [ 697.0, 383.0, 122.0, 18.0 ],
													"numinlets" : 1,
													"id" : "obj-148",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "modal_coll_filter",
													"fontsize" : 12.0,
													"patching_rect" : [ 627.0, 350.0, 97.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-145",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "loadmess set",
													"hidden" : 1,
													"fontsize" : 8.0,
													"patching_rect" : [ 559.0, 314.0, 58.0, 16.0 ],
													"numinlets" : 1,
													"id" : "obj-144",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "4 6 8 9 11 13 15 16",
													"fontsize" : 12.0,
													"gradient" : 1,
													"patching_rect" : [ 449.0, 346.0, 150.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-141",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.8, 0.729412, 0.87451, 1.0 ],
													"outlettype" : [ "" ],
													"bgcolor2" : [ 1.0, 1.0, 1.0, 1.0 ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "list out",
													"textcolor" : [ 0.4, 0.4, 0.8, 1.0 ],
													"frgb" : [ 0.4, 0.4, 0.8, 1.0 ],
													"fontsize" : 12.0,
													"patching_rect" : [ 479.0, 329.0, 53.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-140",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "umenu",
													"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
													"fontsize" : 12.0,
													"items" : [ "C", ",", "C#", ",", "D", ",", "D#", ",", "E", ",", "F", ",", "F#", ",", "G", ",", "G#", ",", "A", ",", "A#", ",", "B" ],
													"patching_rect" : [ 52.0, 175.0, 56.0, 20.0 ],
													"numinlets" : 1,
													"labelclick" : 1,
													"id" : "obj-3",
													"fontname" : "Arial",
													"numoutlets" : 3,
													"types" : [  ],
													"bgcolor" : [ 0.94902, 0.894118, 0.984314, 1.0 ],
													"outlettype" : [ "int", "", "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "control modality in Max",
													"fontsize" : 12.0,
													"patching_rect" : [ 53.0, 83.0, 164.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-6",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Look at these coll list uses:",
													"fontsize" : 12.0,
													"patching_rect" : [ 629.0, 409.0, 153.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-12",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "takes mode names",
													"fontsize" : 12.0,
													"patching_rect" : [ 298.0, 216.0, 160.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-14",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "even takes scale degree distances (in half steps)",
													"linecount" : 2,
													"fontsize" : 12.0,
													"patching_rect" : [ 567.0, 159.0, 161.0, 34.0 ],
													"numinlets" : 1,
													"id" : "obj-15",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 374.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-16",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 338.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-17",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 302.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-18",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 266.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-19",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 230.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-20",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 194.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-21",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 158.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-22",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 374.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-23",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 338.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-24",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 302.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-25",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 266.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-26",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 230.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-27",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 194.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-28",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 158.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-29",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 122.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-30",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 122.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-31",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "2 1 2 2 2 2 1",
													"fontsize" : 12.0,
													"patching_rect" : [ 567.0, 193.0, 82.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-34",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 7",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 669.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-35",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 7",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 669.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-36",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 7",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 669.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-37",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 7",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 669.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-38",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 6",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 634.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-39",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 6",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 634.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-40",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 6",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 634.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-41",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 6",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 634.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-42",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 5",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 602.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-43",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 5",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 602.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-44",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 5",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 602.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-45",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 5",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 602.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-46",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 4",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 569.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-47",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 4",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 569.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-48",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 4",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 569.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-49",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 4",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 569.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-50",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 3",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 536.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-51",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 3",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 536.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-52",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 3",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 536.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-53",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 3",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 536.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-54",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 2",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 496.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-55",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 2",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 496.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-56",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 2",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 496.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-57",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 2",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 496.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-58",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 1",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 462.0, 130.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-59",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 1",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 462.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-60",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 1",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 462.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-61",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 1",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 462.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-62",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Melodic Minor Modes",
													"fontface" : 1,
													"fontsize" : 11.0,
													"patching_rect" : [ 454.0, 416.0, 131.0, 19.0 ],
													"numinlets" : 1,
													"id" : "obj-63",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Harmonic Minor Modes",
													"fontface" : 1,
													"fontsize" : 11.0,
													"patching_rect" : [ 313.0, 416.0, 145.0, 19.0 ],
													"numinlets" : 1,
													"id" : "obj-64",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Harmonic Major Modes",
													"fontface" : 1,
													"fontsize" : 11.0,
													"patching_rect" : [ 173.0, 416.0, 145.0, 19.0 ],
													"numinlets" : 1,
													"id" : "obj-65",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"minimum" : 0,
													"fontsize" : 12.0,
													"maximum" : 11,
													"patching_rect" : [ 192.0, 176.0, 29.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-66",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "umenu",
													"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
													"fontsize" : 12.0,
													"items" : [ "ionian", ",", "dorian", ",", "phrygian", ",", "lydian", ",", "mixolydian", ",", "aeolian", ",", "locrian", ",", "harmonic_major", ",", "dorian_b5", ",", "phrygian_b4", ",", "lydian_b3", ",", "mixolydian_b2", ",", "aeolian_b1", ",", "locrian_b7", ",", "harmonic_minor", ",", "locrian_#6", ",", "ionian_#5", ",", "dorian_#4", ",", "phrygian_#3", ",", "lydian_#2", ",", "mixolydian_#1", ",", "melodic_minor", ",", "dorian_b2", ",", "lydian_#5", ",", "lydian_b7", ",", "mixolydian_b6", ",", "locrian_#2", ",", "locrian_b4" ],
													"patching_rect" : [ 438.0, 173.0, 100.0, 20.0 ],
													"numinlets" : 1,
													"labelclick" : 1,
													"id" : "obj-67",
													"fontname" : "Arial",
													"numoutlets" : 3,
													"types" : [  ],
													"bgcolor" : [ 0.94902, 0.894118, 0.984314, 1.0 ],
													"outlettype" : [ "int", "", "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "p table_uses",
													"fontsize" : 12.0,
													"patching_rect" : [ 772.0, 534.0, 79.0, 20.0 ],
													"numinlets" : 0,
													"id" : "obj-68",
													"fontname" : "Arial",
													"numoutlets" : 0,
													"patcher" : 													{
														"fileversion" : 1,
														"rect" : [ 79.0, 111.0, 387.0, 438.0 ],
														"bglocked" : 0,
														"defrect" : [ 79.0, 111.0, 387.0, 438.0 ],
														"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
														"openinpresentation" : 0,
														"default_fontsize" : 12.0,
														"default_fontface" : 0,
														"default_fontname" : "Arial",
														"gridonopen" : 0,
														"gridsize" : [ 15.0, 15.0 ],
														"gridsnaponopen" : 0,
														"toolbarvisible" : 1,
														"boxanimatetime" : 200,
														"imprint" : 0,
														"enablehscroll" : 1,
														"enablevscroll" : 1,
														"devicewidth" : 0.0,
														"boxes" : [ 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "loadmess 4",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 108.0, 180.0, 56.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-1",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "32nd note",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 159.0, 44.0, 58.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-2",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "16th note",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 157.0, 65.0, 58.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-3",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "8th",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 156.0, 84.0, 58.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-4",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "quarter note",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 144.0, 104.0, 58.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-5",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "half note",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 145.0, 129.0, 58.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-6",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "whole note",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 143.0, 147.0, 58.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-7",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "message",
																	"text" : "1",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 128.0, 145.0, 16.0, 15.0 ],
																	"numinlets" : 2,
																	"id" : "obj-8",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "message",
																	"text" : "2",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 128.0, 124.0, 16.0, 15.0 ],
																	"numinlets" : 2,
																	"id" : "obj-9",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "message",
																	"text" : "4",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 128.0, 103.0, 16.0, 15.0 ],
																	"numinlets" : 2,
																	"id" : "obj-10",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "message",
																	"text" : "tempo $1",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 39.0, 94.0, 56.0, 15.0 ],
																	"numinlets" : 2,
																	"id" : "obj-11",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "flonum",
																	"minimum" : 5.0,
																	"fontsize" : 9.0,
																	"maximum" : 300.0,
																	"patching_rect" : [ 39.0, 74.0, 45.0, 17.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-12",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "float", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "button",
																	"patching_rect" : [ 27.0, 150.0, 15.0, 15.0 ],
																	"numinlets" : 1,
																	"id" : "obj-13",
																	"numoutlets" : 1,
																	"outlettype" : [ "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "toggle",
																	"patching_rect" : [ 27.0, 37.0, 15.0, 15.0 ],
																	"numinlets" : 1,
																	"id" : "obj-14",
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "message",
																	"text" : "8",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 128.0, 82.0, 27.0, 15.0 ],
																	"numinlets" : 2,
																	"id" : "obj-15",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "message",
																	"text" : "16",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 128.0, 61.0, 27.0, 15.0 ],
																	"numinlets" : 2,
																	"id" : "obj-16",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "message",
																	"text" : "32",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 128.0, 41.0, 27.0, 15.0 ],
																	"numinlets" : 2,
																	"id" : "obj-17",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "tempo 120 1 4",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 27.0, 119.0, 68.0, 17.0 ],
																	"numinlets" : 4,
																	"id" : "obj-18",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "number",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 28.0, 263.0, 35.0, 17.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-19",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "int", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "slider",
																	"patching_rect" : [ 89.0, 206.0, 15.0, 18.0 ],
																	"relative" : 1,
																	"numinlets" : 1,
																	"orientation" : 2,
																	"size" : 11.0,
																	"id" : "obj-20",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"mult" : 12.0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "+ 0",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 37.0, 236.0, 27.0, 17.0 ],
																	"numinlets" : 2,
																	"id" : "obj-21",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "number",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 27.0, 206.0, 35.0, 17.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-22",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "int", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "table my_table",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 27.0, 180.0, 69.0, 17.0 ],
																	"numinlets" : 2,
																	"color" : [ 1.0, 0.890196, 0.090196, 1.0 ],
																	"id" : "obj-23",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"outlettype" : [ "int", "bang" ],
																	"showeditor" : 0,
																	"editor_rect" : [ 100.0, 100.0, 300.0, 300.0 ],
																	"saved_object_attributes" : 																	{
																		"embed" : 0,
																		"signed" : 0,
																		"notename" : 0,
																		"name" : "my_table",
																		"size" : 128,
																		"showeditor" : 0,
																		"range" : 128
																	}

																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "noteout",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 28.0, 324.0, 40.0, 17.0 ],
																	"numinlets" : 3,
																	"id" : "obj-24",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "makenote 100 100",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 28.0, 289.0, 85.0, 17.0 ],
																	"numinlets" : 3,
																	"id" : "obj-25",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"outlettype" : [ "float", "float" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "octave",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 106.0, 206.0, 39.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-26",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "tempo",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 41.0, 58.0, 35.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-27",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "START",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 18.0, 21.0, 43.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-28",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
 ],
														"lines" : [ 															{
																"patchline" : 																{
																	"source" : [ "obj-11", 0 ],
																	"destination" : [ "obj-18", 0 ],
																	"hidden" : 0,
																	"midpoints" : [ 48.5, 114.0, 36.5, 114.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-14", 0 ],
																	"destination" : [ "obj-18", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-18", 0 ],
																	"destination" : [ "obj-13", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-21", 0 ],
																	"destination" : [ "obj-19", 0 ],
																	"hidden" : 0,
																	"midpoints" : [ 46.5, 258.0, 37.5, 258.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-19", 0 ],
																	"destination" : [ "obj-25", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-25", 0 ],
																	"destination" : [ "obj-24", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-22", 0 ],
																	"destination" : [ "obj-21", 0 ],
																	"hidden" : 0,
																	"midpoints" : [ 36.5, 229.0, 46.5, 229.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-12", 0 ],
																	"destination" : [ "obj-11", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-25", 1 ],
																	"destination" : [ "obj-24", 1 ],
																	"hidden" : 0,
																	"midpoints" : [ 103.5, 315.0, 48.0, 315.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-20", 0 ],
																	"destination" : [ "obj-21", 1 ],
																	"hidden" : 0,
																	"midpoints" : [ 98.0, 230.0, 54.5, 230.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-9", 0 ],
																	"destination" : [ "obj-18", 3 ],
																	"hidden" : 1,
																	"midpoints" : [ 137.5, 111.0, 85.5, 111.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-10", 0 ],
																	"destination" : [ "obj-18", 3 ],
																	"hidden" : 1,
																	"midpoints" : [ 137.5, 90.0, 85.5, 90.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-15", 0 ],
																	"destination" : [ "obj-18", 3 ],
																	"hidden" : 1,
																	"midpoints" : [ 137.5, 69.0, 85.5, 69.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-17", 0 ],
																	"destination" : [ "obj-18", 3 ],
																	"hidden" : 1,
																	"midpoints" : [ 137.5, 27.0, 85.5, 27.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-16", 0 ],
																	"destination" : [ "obj-18", 3 ],
																	"hidden" : 1,
																	"midpoints" : [ 137.5, 49.0, 85.5, 49.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-8", 0 ],
																	"destination" : [ "obj-18", 3 ],
																	"hidden" : 1,
																	"midpoints" : [ 137.5, 133.0, 120.0, 133.0, 120.0, 111.0, 85.5, 111.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-1", 0 ],
																	"destination" : [ "obj-20", 0 ],
																	"hidden" : 0,
																	"midpoints" : [ 117.5, 201.0, 98.0, 201.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-23", 0 ],
																	"destination" : [ "obj-22", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-13", 0 ],
																	"destination" : [ "obj-23", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
 ]
													}
,
													"saved_object_attributes" : 													{
														"default_fontface" : 0,
														"fontface" : 0,
														"fontsize" : 12.0,
														"default_fontname" : "Arial",
														"default_fontsize" : 12.0,
														"fontname" : "Arial",
														"globalpatchername" : ""
													}

												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "p coll_uses",
													"fontsize" : 12.0,
													"patching_rect" : [ 776.0, 409.0, 71.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-69",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"outlettype" : [ "int", "int" ],
													"patcher" : 													{
														"fileversion" : 1,
														"rect" : [ 160.0, 156.0, 344.0, 479.0 ],
														"bglocked" : 0,
														"defrect" : [ 160.0, 156.0, 344.0, 479.0 ],
														"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
														"openinpresentation" : 0,
														"default_fontsize" : 12.0,
														"default_fontface" : 0,
														"default_fontname" : "Arial",
														"gridonopen" : 0,
														"gridsize" : [ 15.0, 15.0 ],
														"gridsnaponopen" : 0,
														"toolbarvisible" : 1,
														"boxanimatetime" : 200,
														"imprint" : 0,
														"enablehscroll" : 1,
														"enablevscroll" : 1,
														"devicewidth" : 0.0,
														"boxes" : [ 															{
																"box" : 																{
																	"maxclass" : "outlet",
																	"patching_rect" : [ 237.0, 427.0, 25.0, 25.0 ],
																	"numinlets" : 1,
																	"id" : "obj-22",
																	"numoutlets" : 0,
																	"comment" : ""
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "outlet",
																	"patching_rect" : [ 144.0, 429.0, 25.0, 25.0 ],
																	"numinlets" : 1,
																	"id" : "obj-21",
																	"numoutlets" : 0,
																	"comment" : ""
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "inlet",
																	"patching_rect" : [ 25.0, 31.0, 25.0, 25.0 ],
																	"numinlets" : 0,
																	"id" : "obj-20",
																	"numoutlets" : 1,
																	"outlettype" : [ "float" ],
																	"comment" : ""
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "data stored in list",
																	"linecount" : 2,
																	"fontsize" : 12.0,
																	"patching_rect" : [ 253.0, 244.0, 72.0, 34.0 ],
																	"numinlets" : 1,
																	"id" : "obj-1",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "this patch filters all unrelated notes to ones from the selected mode",
																	"linecount" : 2,
																	"fontsize" : 12.0,
																	"patching_rect" : [ 62.0, 21.0, 199.0, 34.0 ],
																	"numinlets" : 1,
																	"id" : "obj-2",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "number",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 182.0, 277.0, 41.0, 20.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-3",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "int", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "number",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 182.0, 213.0, 38.0, 20.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-4",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "int", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "number",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 25.0, 213.0, 34.0, 20.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-5",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "int", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "* 12",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 25.0, 241.0, 51.0, 20.0 ],
																	"numinlets" : 2,
																	"id" : "obj-6",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "kslider",
																	"patching_rect" : [ 25.0, 359.0, 196.0, 34.0 ],
																	"numinlets" : 2,
																	"id" : "obj-7",
																	"numoutlets" : 2,
																	"outlettype" : [ "int", "int" ],
																	"presentation_rect" : [ 0.0, 0.0, 196.0, 35.0 ],
																	"hkeycolor" : [ 0.666667, 0.666667, 0.666667, 1.0 ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "noteout",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 25.0, 419.0, 58.0, 20.0 ],
																	"numinlets" : 3,
																	"id" : "obj-8",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "pitch class",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 222.0, 213.0, 72.0, 20.0 ],
																	"numinlets" : 1,
																	"id" : "obj-9",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "number",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 25.0, 331.0, 45.0, 20.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-10",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "int", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "+",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 25.0, 305.0, 31.0, 20.0 ],
																	"numinlets" : 2,
																	"id" : "obj-11",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "coll my_coll",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 182.0, 246.0, 73.0, 20.0 ],
																	"numinlets" : 1,
																	"color" : [ 0.0, 0.133333, 0.882353, 1.0 ],
																	"id" : "obj-12",
																	"fontname" : "Arial",
																	"numoutlets" : 4,
																	"outlettype" : [ "", "", "", "" ],
																	"saved_object_attributes" : 																	{
																		"embed" : 0
																	}

																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "number",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 25.0, 135.0, 40.0, 20.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-13",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "int", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "% 12",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 182.0, 184.0, 46.0, 20.0 ],
																	"numinlets" : 2,
																	"id" : "obj-14",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "/ 12",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 25.0, 185.0, 41.0, 20.0 ],
																	"numinlets" : 2,
																	"id" : "obj-15",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "kslider",
																	"patching_rect" : [ 25.0, 94.0, 196.0, 34.0 ],
																	"numinlets" : 2,
																	"id" : "obj-16",
																	"numoutlets" : 2,
																	"outlettype" : [ "int", "int" ],
																	"presentation_rect" : [ 0.0, 0.0, 196.0, 35.0 ],
																	"hkeycolor" : [ 0.501961, 0.501961, 0.501961, 1.0 ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "MIDI Note",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 64.0, 135.0, 78.0, 20.0 ],
																	"numinlets" : 1,
																	"id" : "obj-18",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "octave register",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 56.0, 213.0, 90.0, 20.0 ],
																	"numinlets" : 1,
																	"id" : "obj-19",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
 ],
														"lines" : [ 															{
																"patchline" : 																{
																	"source" : [ "obj-13", 0 ],
																	"destination" : [ "obj-15", 0 ],
																	"hidden" : 0,
																	"midpoints" : [ 34.5, 175.0, 34.5, 175.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-15", 0 ],
																	"destination" : [ "obj-5", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-5", 0 ],
																	"destination" : [ "obj-6", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-6", 0 ],
																	"destination" : [ "obj-11", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-11", 0 ],
																	"destination" : [ "obj-10", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-10", 0 ],
																	"destination" : [ "obj-7", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-3", 0 ],
																	"destination" : [ "obj-11", 1 ],
																	"hidden" : 0,
																	"midpoints" : [ 191.5, 300.0, 46.5, 300.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-16", 0 ],
																	"destination" : [ "obj-13", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-13", 0 ],
																	"destination" : [ "obj-14", 0 ],
																	"hidden" : 0,
																	"midpoints" : [ 34.5, 175.0, 191.5, 175.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-14", 0 ],
																	"destination" : [ "obj-4", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-16", 1 ],
																	"destination" : [ "obj-7", 1 ],
																	"hidden" : 1,
																	"midpoints" : [ 211.5, 309.0, 211.5, 309.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-7", 1 ],
																	"destination" : [ "obj-8", 1 ],
																	"hidden" : 0,
																	"midpoints" : [ 211.5, 404.0, 54.0, 404.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-7", 0 ],
																	"destination" : [ "obj-8", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-4", 0 ],
																	"destination" : [ "obj-12", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-12", 0 ],
																	"destination" : [ "obj-3", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-7", 0 ],
																	"destination" : [ "obj-21", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-7", 1 ],
																	"destination" : [ "obj-22", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-20", 0 ],
																	"destination" : [ "obj-16", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
 ]
													}
,
													"saved_object_attributes" : 													{
														"default_fontface" : 0,
														"fontface" : 0,
														"fontsize" : 12.0,
														"default_fontname" : "Arial",
														"default_fontsize" : 12.0,
														"fontname" : "Arial",
														"globalpatchername" : ""
													}

												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "F#",
													"fontsize" : 12.0,
													"patching_rect" : [ 166.0, 176.0, 23.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-70",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 374.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-71",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 338.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-72",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 302.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-73",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 266.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-74",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 230.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-75",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 194.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-76",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 158.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-77",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 122.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-78",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "locrian_b7",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 651.0, 75.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-79",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "locrian_b4",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 651.0, 75.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-80",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "mixolydian_#1",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 651.0, 101.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-81",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "locrian",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 651.0, 51.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-82",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "aeolian_b1",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 617.0, 79.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-83",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "locrian_#2",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 617.0, 75.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-84",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "lydian_#2",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 617.0, 71.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-85",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "aeolian",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 617.0, 55.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-86",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "mixolydian_b2",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 583.0, 101.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-87",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "mixolydian_b6",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 583.0, 101.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-88",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "phrygian_#3",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 583.0, 87.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-89",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "mixolydian",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 583.0, 77.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-90",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "lydian_b3",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 551.0, 71.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-91",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "lydian_b7",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 551.0, 71.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-92",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "dorian_#4",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 551.0, 71.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-93",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "lydian",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 551.0, 47.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-94",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "phrygian_b4",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 517.0, 87.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-95",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "lydian_#5",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 517.0, 71.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-96",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "ionian_#5",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 517.0, 72.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-97",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "phrygian",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 517.0, 63.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-98",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "dorian_b5",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 479.0, 71.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-99",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "dorian_b2",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 479.0, 71.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-100",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "locrian_#6",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 479.0, 75.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-101",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "dorian",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 479.0, 47.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-102",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "harmonic_major",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 443.0, 111.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-103",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "melodic_minor",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 443.0, 103.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-104",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "harmonic_minor",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 443.0, 111.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-105",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "ionian",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 443.0, 48.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-106",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "mode names",
													"textcolor" : [ 0.4, 0.4, 0.8, 1.0 ],
													"frgb" : [ 0.4, 0.4, 0.8, 1.0 ],
													"fontsize" : 12.0,
													"patching_rect" : [ 619.0, 225.0, 81.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-107",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "coll my_coll",
													"fontsize" : 12.0,
													"patching_rect" : [ 627.0, 381.0, 73.0, 20.0 ],
													"numinlets" : 1,
													"color" : [ 0.4, 0.4, 0.8, 1.0 ],
													"id" : "obj-108",
													"fontname" : "Arial",
													"numoutlets" : 4,
													"outlettype" : [ "", "", "", "" ],
													"saved_object_attributes" : 													{
														"embed" : 0
													}

												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "lydian_b7",
													"fontsize" : 12.0,
													"patching_rect" : [ 358.0, 191.0, 68.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-110",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "minor",
													"fontsize" : 12.0,
													"patching_rect" : [ 332.0, 171.0, 39.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-111",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "c",
													"fontsize" : 12.0,
													"patching_rect" : [ 143.0, 176.0, 20.5, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-112",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "major",
													"fontsize" : 12.0,
													"patching_rect" : [ 292.0, 191.0, 43.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-114",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "4",
													"fontsize" : 12.0,
													"patching_rect" : [ 120.0, 176.0, 18.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-115",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "send a MIDI pitch class number (C=0, C#=1, etc) 0-11 in the left inlet or simply send a message box with a letter. This will determine the tonic of the 7 note mode. \nNext send a message box with a mode name in the right inlet. ",
													"linecount" : 3,
													"fontsize" : 12.0,
													"patching_rect" : [ 53.0, 103.0, 478.0, 48.0 ],
													"numinlets" : 1,
													"id" : "obj-117",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "tonic",
													"textcolor" : [ 0.4, 0.4, 0.8, 1.0 ],
													"frgb" : [ 0.4, 0.4, 0.8, 1.0 ],
													"fontsize" : 12.0,
													"patching_rect" : [ 78.0, 226.0, 34.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-118",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "modes are named using traditional Greek names and variations of these names that reflect the least amount of chromatic inflections for the 7 modes of the Major Scale, the Harmonic Minor Scale, the Harmonic Major Scale, and the Melodic Minor Scale",
													"linecount" : 3,
													"fontsize" : 12.0,
													"patching_rect" : [ 57.0, 693.0, 529.0, 48.0 ],
													"numinlets" : 1,
													"id" : "obj-121",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "3.1",
													"fontsize" : 12.0,
													"patching_rect" : [ 228.0, 54.0, 31.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-124",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Major Modes",
													"fontface" : 1,
													"fontsize" : 11.0,
													"patching_rect" : [ 67.0, 416.0, 131.0, 19.0 ],
													"numinlets" : 1,
													"id" : "obj-125",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "panel",
													"mode" : 1,
													"patching_rect" : [ 65.0, 410.0, 93.0, 285.0 ],
													"numinlets" : 1,
													"id" : "obj-126",
													"numoutlets" : 0,
													"grad2" : [ 1.0, 1.0, 1.0, 1.0 ],
													"bgcolor" : [ 0.937255, 0.956863, 1.0, 1.0 ],
													"rounded" : 30
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "panel",
													"mode" : 1,
													"patching_rect" : [ 167.0, 410.0, 136.0, 284.0 ],
													"numinlets" : 1,
													"id" : "obj-127",
													"numoutlets" : 0,
													"grad2" : [ 1.0, 1.0, 1.0, 1.0 ],
													"bgcolor" : [ 0.819608, 0.87451, 0.996078, 1.0 ],
													"rounded" : 30
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "panel",
													"mode" : 1,
													"patching_rect" : [ 306.0, 410.0, 137.0, 283.0 ],
													"numinlets" : 1,
													"id" : "obj-128",
													"numoutlets" : 0,
													"grad2" : [ 1.0, 1.0, 1.0, 1.0 ],
													"bgcolor" : [ 0.694118, 0.768627, 0.988235, 1.0 ],
													"rounded" : 30
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "pitch classes only (reduced to one octave)",
													"fontsize" : 12.0,
													"patching_rect" : [ 170.0, 379.0, 272.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-130",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "complete mode list",
													"fontsize" : 12.0,
													"patching_rect" : [ 436.0, 151.0, 112.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-131",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "takes numbers or letters",
													"fontsize" : 12.0,
													"patching_rect" : [ 111.0, 156.0, 140.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-132",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "modal_change",
													"textcolor" : [ 0.047059, 0.0, 0.454902, 1.0 ],
													"frgb" : [ 0.047059, 0.0, 0.454902, 1.0 ],
													"fontsize" : 26.0,
													"patching_rect" : [ 53.0, 53.0, 181.0, 36.0 ],
													"numinlets" : 1,
													"id" : "obj-133",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "pitches at each scale degree",
													"fontsize" : 11.0,
													"patching_rect" : [ 195.0, 344.0, 201.0, 19.0 ],
													"numinlets" : 1,
													"id" : "obj-134",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "panel",
													"mode" : 1,
													"patching_rect" : [ 618.0, 340.0, 262.0, 94.0 ],
													"numinlets" : 1,
													"grad1" : [ 0.894118, 0.917647, 1.0, 1.0 ],
													"id" : "obj-137",
													"numoutlets" : 0,
													"angle" : 1.16,
													"bgcolor" : [ 0.937255, 0.956863, 1.0, 1.0 ],
													"rounded" : 30
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "panel",
													"mode" : 1,
													"patching_rect" : [ 444.0, 410.0, 136.0, 284.0 ],
													"numinlets" : 1,
													"id" : "obj-129",
													"numoutlets" : 0,
													"grad2" : [ 1.0, 1.0, 1.0, 1.0 ],
													"bgcolor" : [ 0.576471, 0.643137, 0.980392, 1.0 ],
													"rounded" : 30
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "panel",
													"mode" : 1,
													"patching_rect" : [ 618.0, 466.0, 262.0, 94.0 ],
													"numinlets" : 1,
													"grad1" : [ 0.894118, 0.917647, 1.0, 1.0 ],
													"id" : "obj-109",
													"numoutlets" : 0,
													"angle" : 1.16,
													"bgcolor" : [ 0.937255, 0.956863, 1.0, 1.0 ],
													"rounded" : 30
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "modal_change",
													"varname" : "modal_change",
													"patching_rect" : [ 68.0, 247.0, 556.0, 65.0 ],
													"numinlets" : 2,
													"background" : 1,
													"id" : "obj-139",
													"numoutlets" : 9,
													"fontcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
													"outlettype" : [ "int", "int", "int", "int", "int", "int", "int", "int", "list" ]
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"source" : [ "obj-33", 0 ],
													"destination" : [ "obj-11", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-33", 1 ],
													"destination" : [ "obj-11", 1 ],
													"hidden" : 0,
													"midpoints" : [ 720.5, 501.5, 704.5, 501.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 8 ],
													"destination" : [ "obj-33", 0 ],
													"hidden" : 0,
													"midpoints" : [ 614.5, 453.0, 634.5, 453.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-66", 0 ],
													"destination" : [ "obj-139", 0 ],
													"hidden" : 0,
													"midpoints" : [ 201.5, 220.5, 77.5, 220.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-70", 0 ],
													"destination" : [ "obj-139", 0 ],
													"hidden" : 0,
													"midpoints" : [ 175.5, 220.5, 77.5, 220.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-115", 0 ],
													"destination" : [ "obj-139", 0 ],
													"hidden" : 0,
													"midpoints" : [ 129.5, 220.5, 77.5, 220.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-112", 0 ],
													"destination" : [ "obj-139", 0 ],
													"hidden" : 0,
													"midpoints" : [ 152.5, 220.5, 77.5, 220.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-3", 0 ],
													"destination" : [ "obj-139", 0 ],
													"hidden" : 0,
													"midpoints" : [ 61.5, 213.5, 77.5, 213.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 0 ],
													"destination" : [ "obj-78", 0 ],
													"hidden" : 0,
													"midpoints" : [ 77.5, 317.5, 131.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-78", 0 ],
													"destination" : [ "obj-31", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-31", 0 ],
													"destination" : [ "obj-30", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 1 ],
													"destination" : [ "obj-77", 0 ],
													"hidden" : 0,
													"midpoints" : [ 144.625, 317.5, 167.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-77", 0 ],
													"destination" : [ "obj-22", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-22", 0 ],
													"destination" : [ "obj-29", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 2 ],
													"destination" : [ "obj-76", 0 ],
													"hidden" : 0,
													"midpoints" : [ 211.75, 317.5, 203.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-76", 0 ],
													"destination" : [ "obj-21", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-21", 0 ],
													"destination" : [ "obj-28", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-34", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 0,
													"midpoints" : [ 576.5, 218.5, 614.5, 218.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-67", 1 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 0,
													"midpoints" : [ 488.0, 240.5, 614.5, 240.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-80", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-84", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-88", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-92", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-96", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-100", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-104", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-81", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-85", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-89", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-93", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-97", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-101", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-105", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-79", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-83", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-87", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-91", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-95", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-99", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-103", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-82", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-86", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-90", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-94", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-98", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-102", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-106", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-114", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 0,
													"midpoints" : [ 301.5, 218.5, 614.5, 218.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-111", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 0,
													"midpoints" : [ 341.5, 218.5, 614.5, 218.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-110", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 0,
													"midpoints" : [ 367.5, 218.5, 614.5, 218.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 3 ],
													"destination" : [ "obj-75", 0 ],
													"hidden" : 0,
													"midpoints" : [ 278.875, 317.5, 239.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-75", 0 ],
													"destination" : [ "obj-20", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-20", 0 ],
													"destination" : [ "obj-27", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 4 ],
													"destination" : [ "obj-74", 0 ],
													"hidden" : 0,
													"midpoints" : [ 346.0, 317.5, 275.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-74", 0 ],
													"destination" : [ "obj-19", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-19", 0 ],
													"destination" : [ "obj-26", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 5 ],
													"destination" : [ "obj-73", 0 ],
													"hidden" : 0,
													"midpoints" : [ 413.125, 317.5, 311.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-73", 0 ],
													"destination" : [ "obj-18", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-18", 0 ],
													"destination" : [ "obj-25", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 6 ],
													"destination" : [ "obj-72", 0 ],
													"hidden" : 0,
													"midpoints" : [ 480.25, 317.5, 347.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-72", 0 ],
													"destination" : [ "obj-17", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-17", 0 ],
													"destination" : [ "obj-24", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 7 ],
													"destination" : [ "obj-71", 0 ],
													"hidden" : 0,
													"midpoints" : [ 547.375, 317.5, 383.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-71", 0 ],
													"destination" : [ "obj-16", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-16", 0 ],
													"destination" : [ "obj-23", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 8 ],
													"destination" : [ "obj-141", 1 ],
													"hidden" : 0,
													"midpoints" : [ 614.5, 328.0, 589.5, 328.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-144", 0 ],
													"destination" : [ "obj-141", 0 ],
													"hidden" : 1,
													"midpoints" : [ 568.5, 328.0, 458.5, 328.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 8 ],
													"destination" : [ "obj-145", 0 ],
													"hidden" : 0,
													"midpoints" : [ 614.5, 335.5, 636.5, 335.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-145", 0 ],
													"destination" : [ "obj-108", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-159", 0 ],
													"destination" : [ "obj-69", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-69", 0 ],
													"destination" : [ "obj-160", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-69", 1 ],
													"destination" : [ "obj-161", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-1", 0 ],
													"destination" : [ "obj-139", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-2", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
 ]
									}
,
									"saved_object_attributes" : 									{
										"default_fontface" : 0,
										"fontface" : 0,
										"fontsize" : 12.0,
										"default_fontname" : "Arial",
										"default_fontsize" : 12.0,
										"fontname" : "Arial",
										"globalpatchername" : ""
									}

								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "r mode",
									"fontsize" : 12.0,
									"patching_rect" : [ 837.0, 201.0, 48.0, 20.0 ],
									"numinlets" : 0,
									"id" : "obj-75",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "r tonic",
									"fontsize" : 12.0,
									"patching_rect" : [ 809.0, 181.0, 43.0, 20.0 ],
									"numinlets" : 0,
									"id" : "obj-74",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "umenu",
									"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"fontsize" : 12.0,
									"items" : [ "C", ",", "C#", ",", "D", ",", "D#", ",", "E", ",", "F", ",", "F#", ",", "G", ",", "G#", ",", "A", ",", "A#", ",", "B" ],
									"patching_rect" : [ 352.0, 32.0, 56.0, 20.0 ],
									"numinlets" : 1,
									"labelclick" : 1,
									"id" : "obj-73",
									"fontname" : "Arial",
									"numoutlets" : 3,
									"types" : [  ],
									"bgcolor" : [ 0.560784, 0.823529, 1.0, 1.0 ],
									"outlettype" : [ "int", "", "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "lydian_b7",
									"fontsize" : 12.0,
									"patching_rect" : [ 525.0, 32.0, 68.0, 18.0 ],
									"numinlets" : 2,
									"id" : "obj-110",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"bgcolor" : [ 0.560784, 0.823529, 1.0, 1.0 ],
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "minor",
									"fontsize" : 12.0,
									"patching_rect" : [ 477.0, 32.0, 39.0, 18.0 ],
									"numinlets" : 2,
									"id" : "obj-111",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"bgcolor" : [ 0.560784, 0.823529, 1.0, 1.0 ],
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "major",
									"fontsize" : 12.0,
									"patching_rect" : [ 428.0, 32.0, 43.0, 18.0 ],
									"numinlets" : 2,
									"id" : "obj-114",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"bgcolor" : [ 0.560784, 0.823529, 1.0, 1.0 ],
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "60",
									"fontsize" : 12.0,
									"patching_rect" : [ 48.0, 252.0, 32.5, 18.0 ],
									"numinlets" : 2,
									"id" : "obj-71",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "tri~",
									"fontsize" : 12.0,
									"patching_rect" : [ 771.0, 332.0, 46.0, 20.0 ],
									"numinlets" : 3,
									"id" : "obj-68",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "signal" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "mtof",
									"fontsize" : 12.0,
									"patching_rect" : [ 771.0, 307.0, 34.0, 20.0 ],
									"numinlets" : 1,
									"id" : "obj-69",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "tri~",
									"fontsize" : 12.0,
									"patching_rect" : [ 648.0, 332.0, 46.0, 20.0 ],
									"numinlets" : 3,
									"id" : "obj-66",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "signal" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "mtof",
									"fontsize" : 12.0,
									"patching_rect" : [ 648.0, 307.0, 34.0, 20.0 ],
									"numinlets" : 1,
									"id" : "obj-67",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "tri~",
									"fontsize" : 12.0,
									"patching_rect" : [ 505.0, 332.0, 46.0, 20.0 ],
									"numinlets" : 3,
									"id" : "obj-64",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "signal" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "mtof",
									"fontsize" : 12.0,
									"patching_rect" : [ 505.0, 307.0, 34.0, 20.0 ],
									"numinlets" : 1,
									"id" : "obj-65",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "tri~",
									"fontsize" : 12.0,
									"patching_rect" : [ 374.0, 332.0, 46.0, 20.0 ],
									"numinlets" : 3,
									"id" : "obj-62",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "signal" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "mtof",
									"fontsize" : 12.0,
									"patching_rect" : [ 374.0, 307.0, 34.0, 20.0 ],
									"numinlets" : 1,
									"id" : "obj-63",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "saw~",
									"fontsize" : 12.0,
									"patching_rect" : [ 247.0, 332.0, 39.0, 20.0 ],
									"numinlets" : 2,
									"id" : "obj-60",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "signal" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "mtof",
									"fontsize" : 12.0,
									"patching_rect" : [ 247.0, 307.0, 34.0, 20.0 ],
									"numinlets" : 1,
									"id" : "obj-61",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "+",
									"fontsize" : 12.0,
									"patching_rect" : [ 771.0, 277.0, 32.5, 20.0 ],
									"numinlets" : 2,
									"id" : "obj-59",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "+",
									"fontsize" : 12.0,
									"patching_rect" : [ 648.0, 277.0, 32.5, 20.0 ],
									"numinlets" : 2,
									"id" : "obj-58",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "+",
									"fontsize" : 12.0,
									"patching_rect" : [ 505.0, 277.0, 32.5, 20.0 ],
									"numinlets" : 2,
									"id" : "obj-57",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "+",
									"fontsize" : 12.0,
									"patching_rect" : [ 374.0, 277.0, 32.5, 20.0 ],
									"numinlets" : 2,
									"id" : "obj-56",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "+",
									"fontsize" : 12.0,
									"patching_rect" : [ 247.0, 277.0, 32.5, 20.0 ],
									"numinlets" : 2,
									"id" : "obj-55",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "loadbang",
									"fontsize" : 12.0,
									"patching_rect" : [ 48.0, 225.0, 60.0, 20.0 ],
									"numinlets" : 1,
									"id" : "obj-52",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "saw~",
									"fontsize" : 12.0,
									"patching_rect" : [ 118.0, 332.0, 39.0, 20.0 ],
									"numinlets" : 2,
									"id" : "obj-48",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "signal" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "mtof",
									"fontsize" : 12.0,
									"patching_rect" : [ 118.0, 307.0, 34.0, 20.0 ],
									"numinlets" : 1,
									"id" : "obj-47",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "+",
									"fontsize" : 12.0,
									"patching_rect" : [ 118.0, 277.0, 32.5, 20.0 ],
									"numinlets" : 2,
									"id" : "obj-46",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "loadmess 135",
									"fontsize" : 12.0,
									"patching_rect" : [ 13.0, 353.0, 85.0, 20.0 ],
									"numinlets" : 1,
									"id" : "obj-45",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "gain~",
									"patching_rect" : [ 771.0, 407.0, 24.0, 98.0 ],
									"numinlets" : 2,
									"id" : "obj-40",
									"numoutlets" : 2,
									"outlettype" : [ "signal", "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "flonum",
									"fontsize" : 12.0,
									"patching_rect" : [ 771.0, 157.0, 50.0, 20.0 ],
									"numinlets" : 1,
									"id" : "obj-41",
									"fontname" : "Arial",
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "flonum",
									"fontsize" : 12.0,
									"patching_rect" : [ 771.0, 248.0, 50.0, 20.0 ],
									"numinlets" : 1,
									"id" : "obj-42",
									"fontname" : "Arial",
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "p modalChange",
									"fontsize" : 12.0,
									"patching_rect" : [ 771.0, 223.0, 95.0, 20.0 ],
									"numinlets" : 3,
									"id" : "obj-44",
									"fontname" : "Arial",
									"numoutlets" : 2,
									"outlettype" : [ "int", "int" ],
									"patcher" : 									{
										"fileversion" : 1,
										"rect" : [ 290.0, 186.0, 1093.0, 691.0 ],
										"bglocked" : 0,
										"defrect" : [ 290.0, 186.0, 1093.0, 691.0 ],
										"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
										"openinpresentation" : 0,
										"default_fontsize" : 12.0,
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"gridonopen" : 0,
										"gridsize" : [ 15.0, 15.0 ],
										"gridsnaponopen" : 0,
										"toolbarvisible" : 1,
										"boxanimatetime" : 200,
										"imprint" : 0,
										"enablehscroll" : 1,
										"enablevscroll" : 1,
										"devicewidth" : 0.0,
										"boxes" : [ 											{
												"box" : 												{
													"maxclass" : "inlet",
													"hint" : "Mode Name",
													"patching_rect" : [ 926.0, 38.0, 25.0, 25.0 ],
													"numinlets" : 0,
													"id" : "obj-2",
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"comment" : ""
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "inlet",
													"hint" : "Tonic (Note or Number)",
													"annotation" : "",
													"patching_rect" : [ 865.0, 38.0, 25.0, 25.0 ],
													"numinlets" : 0,
													"id" : "obj-1",
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"comment" : ""
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "outlet",
													"patching_rect" : [ 828.0, 440.0, 25.0, 25.0 ],
													"numinlets" : 1,
													"id" : "obj-161",
													"numoutlets" : 0,
													"comment" : ""
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "outlet",
													"patching_rect" : [ 776.0, 440.0, 25.0, 25.0 ],
													"numinlets" : 1,
													"id" : "obj-160",
													"numoutlets" : 0,
													"comment" : ""
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "inlet",
													"patching_rect" : [ 776.0, 290.0, 25.0, 25.0 ],
													"numinlets" : 0,
													"id" : "obj-159",
													"numoutlets" : 1,
													"outlettype" : [ "float" ],
													"comment" : ""
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "bpatcher",
													"patching_rect" : [ 619.0, 579.0, 195.0, 148.0 ],
													"name" : "modal_change_related_objects.maxpat",
													"numinlets" : 0,
													"args" : [  ],
													"id" : "obj-13",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "< - Get scale data in a table",
													"linecount" : 2,
													"fontsize" : 12.0,
													"patching_rect" : [ 732.0, 477.0, 141.0, 34.0 ],
													"numinlets" : 1,
													"id" : "obj-119",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "<-- send data to any table",
													"fontsize" : 10.0,
													"patching_rect" : [ 712.0, 508.0, 122.0, 18.0 ],
													"numinlets" : 1,
													"id" : "obj-123",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Look at these table uses:",
													"fontsize" : 12.0,
													"patching_rect" : [ 631.0, 534.0, 153.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-113",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "modal_table_filter",
													"fontsize" : 12.0,
													"patching_rect" : [ 625.0, 477.0, 105.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-33",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"outlettype" : [ "int", "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "table my_table",
													"fontsize" : 12.0,
													"patching_rect" : [ 625.0, 506.0, 89.0, 20.0 ],
													"numinlets" : 2,
													"color" : [ 0.019608, 0.137255, 0.823529, 1.0 ],
													"id" : "obj-11",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"outlettype" : [ "int", "bang" ],
													"showeditor" : 0,
													"editor_rect" : [ 473.0, 481.0, 588.0, 619.0 ],
													"saved_object_attributes" : 													{
														"embed" : 0,
														"signed" : 0,
														"notename" : 0,
														"name" : "my_table",
														"size" : 128,
														"showeditor" : 0,
														"range" : 128
													}

												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "< - Get filtered scale data in a coll list. ",
													"linecount" : 2,
													"fontsize" : 12.0,
													"patching_rect" : [ 722.0, 347.0, 155.0, 34.0 ],
													"numinlets" : 1,
													"id" : "obj-150",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "<-- send data to any coll",
													"fontsize" : 10.0,
													"patching_rect" : [ 697.0, 383.0, 122.0, 18.0 ],
													"numinlets" : 1,
													"id" : "obj-148",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "modal_coll_filter",
													"fontsize" : 12.0,
													"patching_rect" : [ 627.0, 350.0, 97.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-145",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "loadmess set",
													"hidden" : 1,
													"fontsize" : 8.0,
													"patching_rect" : [ 559.0, 314.0, 58.0, 16.0 ],
													"numinlets" : 1,
													"id" : "obj-144",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "4 6 8 9 11 13 15 16",
													"fontsize" : 12.0,
													"gradient" : 1,
													"patching_rect" : [ 449.0, 346.0, 150.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-141",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.8, 0.729412, 0.87451, 1.0 ],
													"outlettype" : [ "" ],
													"bgcolor2" : [ 1.0, 1.0, 1.0, 1.0 ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "list out",
													"textcolor" : [ 0.4, 0.4, 0.8, 1.0 ],
													"frgb" : [ 0.4, 0.4, 0.8, 1.0 ],
													"fontsize" : 12.0,
													"patching_rect" : [ 479.0, 329.0, 53.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-140",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "umenu",
													"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
													"fontsize" : 12.0,
													"items" : [ "C", ",", "C#", ",", "D", ",", "D#", ",", "E", ",", "F", ",", "F#", ",", "G", ",", "G#", ",", "A", ",", "A#", ",", "B" ],
													"patching_rect" : [ 52.0, 175.0, 56.0, 20.0 ],
													"numinlets" : 1,
													"labelclick" : 1,
													"id" : "obj-3",
													"fontname" : "Arial",
													"numoutlets" : 3,
													"types" : [  ],
													"bgcolor" : [ 0.94902, 0.894118, 0.984314, 1.0 ],
													"outlettype" : [ "int", "", "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "control modality in Max",
													"fontsize" : 12.0,
													"patching_rect" : [ 53.0, 83.0, 164.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-6",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Look at these coll list uses:",
													"fontsize" : 12.0,
													"patching_rect" : [ 629.0, 409.0, 153.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-12",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "takes mode names",
													"fontsize" : 12.0,
													"patching_rect" : [ 298.0, 216.0, 160.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-14",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "even takes scale degree distances (in half steps)",
													"linecount" : 2,
													"fontsize" : 12.0,
													"patching_rect" : [ 567.0, 159.0, 161.0, 34.0 ],
													"numinlets" : 1,
													"id" : "obj-15",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 374.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-16",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 338.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-17",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 302.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-18",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 266.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-19",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 230.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-20",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 194.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-21",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 158.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-22",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 374.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-23",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 338.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-24",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 302.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-25",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 266.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-26",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 230.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-27",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 194.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-28",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 158.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-29",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 122.0, 363.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-30",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "% 12",
													"hidden" : 1,
													"fontsize" : 9.0,
													"patching_rect" : [ 122.0, 345.0, 29.0, 17.0 ],
													"numinlets" : 2,
													"id" : "obj-31",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"outlettype" : [ "int" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "2 1 2 2 2 2 1",
													"fontsize" : 12.0,
													"patching_rect" : [ 567.0, 193.0, 82.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-34",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 7",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 669.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-35",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 7",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 669.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-36",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 7",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 669.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-37",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 7",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 669.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-38",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 6",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 634.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-39",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 6",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 634.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-40",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 6",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 634.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-41",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 6",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 634.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-42",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 5",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 602.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-43",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 5",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 602.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-44",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 5",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 602.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-45",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 5",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 602.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-46",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 4",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 569.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-47",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 4",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 569.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-48",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 4",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 569.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-49",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 4",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 569.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-50",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 3",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 536.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-51",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 3",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 536.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-52",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 3",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 536.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-53",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 3",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 536.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-54",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 2",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 496.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-55",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 2",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 496.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-56",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 2",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 496.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-57",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 2",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 496.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-58",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 1",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 462.0, 130.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-59",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 1",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 462.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-60",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 1",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 462.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-61",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Mode 1",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 462.0, 126.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-62",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Melodic Minor Modes",
													"fontface" : 1,
													"fontsize" : 11.0,
													"patching_rect" : [ 454.0, 416.0, 131.0, 19.0 ],
													"numinlets" : 1,
													"id" : "obj-63",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Harmonic Minor Modes",
													"fontface" : 1,
													"fontsize" : 11.0,
													"patching_rect" : [ 313.0, 416.0, 145.0, 19.0 ],
													"numinlets" : 1,
													"id" : "obj-64",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Harmonic Major Modes",
													"fontface" : 1,
													"fontsize" : 11.0,
													"patching_rect" : [ 173.0, 416.0, 145.0, 19.0 ],
													"numinlets" : 1,
													"id" : "obj-65",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"minimum" : 0,
													"fontsize" : 12.0,
													"maximum" : 11,
													"patching_rect" : [ 192.0, 176.0, 29.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-66",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "umenu",
													"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
													"fontsize" : 12.0,
													"items" : [ "ionian", ",", "dorian", ",", "phrygian", ",", "lydian", ",", "mixolydian", ",", "aeolian", ",", "locrian", ",", "harmonic_major", ",", "dorian_b5", ",", "phrygian_b4", ",", "lydian_b3", ",", "mixolydian_b2", ",", "aeolian_b1", ",", "locrian_b7", ",", "harmonic_minor", ",", "locrian_#6", ",", "ionian_#5", ",", "dorian_#4", ",", "phrygian_#3", ",", "lydian_#2", ",", "mixolydian_#1", ",", "melodic_minor", ",", "dorian_b2", ",", "lydian_#5", ",", "lydian_b7", ",", "mixolydian_b6", ",", "locrian_#2", ",", "locrian_b4" ],
													"patching_rect" : [ 438.0, 173.0, 100.0, 20.0 ],
													"numinlets" : 1,
													"labelclick" : 1,
													"id" : "obj-67",
													"fontname" : "Arial",
													"numoutlets" : 3,
													"types" : [  ],
													"bgcolor" : [ 0.94902, 0.894118, 0.984314, 1.0 ],
													"outlettype" : [ "int", "", "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "p table_uses",
													"fontsize" : 12.0,
													"patching_rect" : [ 772.0, 534.0, 79.0, 20.0 ],
													"numinlets" : 0,
													"id" : "obj-68",
													"fontname" : "Arial",
													"numoutlets" : 0,
													"patcher" : 													{
														"fileversion" : 1,
														"rect" : [ 79.0, 111.0, 387.0, 438.0 ],
														"bglocked" : 0,
														"defrect" : [ 79.0, 111.0, 387.0, 438.0 ],
														"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
														"openinpresentation" : 0,
														"default_fontsize" : 12.0,
														"default_fontface" : 0,
														"default_fontname" : "Arial",
														"gridonopen" : 0,
														"gridsize" : [ 15.0, 15.0 ],
														"gridsnaponopen" : 0,
														"toolbarvisible" : 1,
														"boxanimatetime" : 200,
														"imprint" : 0,
														"enablehscroll" : 1,
														"enablevscroll" : 1,
														"devicewidth" : 0.0,
														"boxes" : [ 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "loadmess 4",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 108.0, 180.0, 56.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-1",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "32nd note",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 159.0, 44.0, 58.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-2",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "16th note",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 157.0, 65.0, 58.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-3",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "8th",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 156.0, 84.0, 58.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-4",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "quarter note",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 144.0, 104.0, 58.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-5",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "half note",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 145.0, 129.0, 58.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-6",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "whole note",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 143.0, 147.0, 58.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-7",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "message",
																	"text" : "1",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 128.0, 145.0, 16.0, 15.0 ],
																	"numinlets" : 2,
																	"id" : "obj-8",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "message",
																	"text" : "2",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 128.0, 124.0, 16.0, 15.0 ],
																	"numinlets" : 2,
																	"id" : "obj-9",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "message",
																	"text" : "4",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 128.0, 103.0, 16.0, 15.0 ],
																	"numinlets" : 2,
																	"id" : "obj-10",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "message",
																	"text" : "tempo $1",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 39.0, 94.0, 56.0, 15.0 ],
																	"numinlets" : 2,
																	"id" : "obj-11",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "flonum",
																	"minimum" : 5.0,
																	"fontsize" : 9.0,
																	"maximum" : 300.0,
																	"patching_rect" : [ 39.0, 74.0, 45.0, 17.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-12",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "float", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "button",
																	"patching_rect" : [ 27.0, 150.0, 15.0, 15.0 ],
																	"numinlets" : 1,
																	"id" : "obj-13",
																	"numoutlets" : 1,
																	"outlettype" : [ "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "toggle",
																	"patching_rect" : [ 27.0, 37.0, 15.0, 15.0 ],
																	"numinlets" : 1,
																	"id" : "obj-14",
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "message",
																	"text" : "8",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 128.0, 82.0, 27.0, 15.0 ],
																	"numinlets" : 2,
																	"id" : "obj-15",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "message",
																	"text" : "16",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 128.0, 61.0, 27.0, 15.0 ],
																	"numinlets" : 2,
																	"id" : "obj-16",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "message",
																	"text" : "32",
																	"hidden" : 1,
																	"fontsize" : 9.0,
																	"patching_rect" : [ 128.0, 41.0, 27.0, 15.0 ],
																	"numinlets" : 2,
																	"id" : "obj-17",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "tempo 120 1 4",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 27.0, 119.0, 68.0, 17.0 ],
																	"numinlets" : 4,
																	"id" : "obj-18",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "number",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 28.0, 263.0, 35.0, 17.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-19",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "int", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "slider",
																	"patching_rect" : [ 89.0, 206.0, 15.0, 18.0 ],
																	"relative" : 1,
																	"numinlets" : 1,
																	"orientation" : 2,
																	"size" : 11.0,
																	"id" : "obj-20",
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"mult" : 12.0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "+ 0",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 37.0, 236.0, 27.0, 17.0 ],
																	"numinlets" : 2,
																	"id" : "obj-21",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "number",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 27.0, 206.0, 35.0, 17.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-22",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "int", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "table my_table",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 27.0, 180.0, 69.0, 17.0 ],
																	"numinlets" : 2,
																	"color" : [ 1.0, 0.890196, 0.090196, 1.0 ],
																	"id" : "obj-23",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"outlettype" : [ "int", "bang" ],
																	"showeditor" : 0,
																	"editor_rect" : [ 100.0, 100.0, 300.0, 300.0 ],
																	"saved_object_attributes" : 																	{
																		"embed" : 0,
																		"signed" : 0,
																		"notename" : 0,
																		"name" : "my_table",
																		"size" : 128,
																		"showeditor" : 0,
																		"range" : 128
																	}

																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "noteout",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 28.0, 324.0, 40.0, 17.0 ],
																	"numinlets" : 3,
																	"id" : "obj-24",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "makenote 100 100",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 28.0, 289.0, 85.0, 17.0 ],
																	"numinlets" : 3,
																	"id" : "obj-25",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"outlettype" : [ "float", "float" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "octave",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 106.0, 206.0, 39.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-26",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "tempo",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 41.0, 58.0, 35.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-27",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "START",
																	"fontsize" : 9.0,
																	"patching_rect" : [ 18.0, 21.0, 43.0, 17.0 ],
																	"numinlets" : 1,
																	"id" : "obj-28",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
 ],
														"lines" : [ 															{
																"patchline" : 																{
																	"source" : [ "obj-13", 0 ],
																	"destination" : [ "obj-23", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-23", 0 ],
																	"destination" : [ "obj-22", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-1", 0 ],
																	"destination" : [ "obj-20", 0 ],
																	"hidden" : 0,
																	"midpoints" : [ 117.5, 201.0, 98.0, 201.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-8", 0 ],
																	"destination" : [ "obj-18", 3 ],
																	"hidden" : 1,
																	"midpoints" : [ 137.5, 133.0, 120.0, 133.0, 120.0, 111.0, 85.5, 111.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-16", 0 ],
																	"destination" : [ "obj-18", 3 ],
																	"hidden" : 1,
																	"midpoints" : [ 137.5, 49.0, 85.5, 49.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-17", 0 ],
																	"destination" : [ "obj-18", 3 ],
																	"hidden" : 1,
																	"midpoints" : [ 137.5, 27.0, 85.5, 27.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-15", 0 ],
																	"destination" : [ "obj-18", 3 ],
																	"hidden" : 1,
																	"midpoints" : [ 137.5, 69.0, 85.5, 69.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-10", 0 ],
																	"destination" : [ "obj-18", 3 ],
																	"hidden" : 1,
																	"midpoints" : [ 137.5, 90.0, 85.5, 90.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-9", 0 ],
																	"destination" : [ "obj-18", 3 ],
																	"hidden" : 1,
																	"midpoints" : [ 137.5, 111.0, 85.5, 111.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-20", 0 ],
																	"destination" : [ "obj-21", 1 ],
																	"hidden" : 0,
																	"midpoints" : [ 98.0, 230.0, 54.5, 230.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-25", 1 ],
																	"destination" : [ "obj-24", 1 ],
																	"hidden" : 0,
																	"midpoints" : [ 103.5, 315.0, 48.0, 315.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-12", 0 ],
																	"destination" : [ "obj-11", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-22", 0 ],
																	"destination" : [ "obj-21", 0 ],
																	"hidden" : 0,
																	"midpoints" : [ 36.5, 229.0, 46.5, 229.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-25", 0 ],
																	"destination" : [ "obj-24", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-19", 0 ],
																	"destination" : [ "obj-25", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-21", 0 ],
																	"destination" : [ "obj-19", 0 ],
																	"hidden" : 0,
																	"midpoints" : [ 46.5, 258.0, 37.5, 258.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-18", 0 ],
																	"destination" : [ "obj-13", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-14", 0 ],
																	"destination" : [ "obj-18", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-11", 0 ],
																	"destination" : [ "obj-18", 0 ],
																	"hidden" : 0,
																	"midpoints" : [ 48.5, 114.0, 36.5, 114.0 ]
																}

															}
 ]
													}
,
													"saved_object_attributes" : 													{
														"default_fontface" : 0,
														"fontface" : 0,
														"fontsize" : 12.0,
														"default_fontname" : "Arial",
														"default_fontsize" : 12.0,
														"fontname" : "Arial",
														"globalpatchername" : ""
													}

												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "p coll_uses",
													"fontsize" : 12.0,
													"patching_rect" : [ 776.0, 409.0, 71.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-69",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"outlettype" : [ "int", "int" ],
													"patcher" : 													{
														"fileversion" : 1,
														"rect" : [ 160.0, 156.0, 344.0, 479.0 ],
														"bglocked" : 0,
														"defrect" : [ 160.0, 156.0, 344.0, 479.0 ],
														"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
														"openinpresentation" : 0,
														"default_fontsize" : 12.0,
														"default_fontface" : 0,
														"default_fontname" : "Arial",
														"gridonopen" : 0,
														"gridsize" : [ 15.0, 15.0 ],
														"gridsnaponopen" : 0,
														"toolbarvisible" : 1,
														"boxanimatetime" : 200,
														"imprint" : 0,
														"enablehscroll" : 1,
														"enablevscroll" : 1,
														"devicewidth" : 0.0,
														"boxes" : [ 															{
																"box" : 																{
																	"maxclass" : "outlet",
																	"patching_rect" : [ 237.0, 427.0, 25.0, 25.0 ],
																	"numinlets" : 1,
																	"id" : "obj-22",
																	"numoutlets" : 0,
																	"comment" : ""
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "outlet",
																	"patching_rect" : [ 144.0, 429.0, 25.0, 25.0 ],
																	"numinlets" : 1,
																	"id" : "obj-21",
																	"numoutlets" : 0,
																	"comment" : ""
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "inlet",
																	"patching_rect" : [ 25.0, 31.0, 25.0, 25.0 ],
																	"numinlets" : 0,
																	"id" : "obj-20",
																	"numoutlets" : 1,
																	"outlettype" : [ "float" ],
																	"comment" : ""
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "data stored in list",
																	"linecount" : 2,
																	"fontsize" : 12.0,
																	"patching_rect" : [ 253.0, 244.0, 72.0, 34.0 ],
																	"numinlets" : 1,
																	"id" : "obj-1",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "this patch filters all unrelated notes to ones from the selected mode",
																	"linecount" : 2,
																	"fontsize" : 12.0,
																	"patching_rect" : [ 62.0, 21.0, 199.0, 34.0 ],
																	"numinlets" : 1,
																	"id" : "obj-2",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "number",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 182.0, 277.0, 41.0, 20.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-3",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "int", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "number",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 182.0, 213.0, 38.0, 20.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-4",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "int", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "number",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 25.0, 213.0, 34.0, 20.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-5",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "int", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "* 12",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 25.0, 241.0, 51.0, 20.0 ],
																	"numinlets" : 2,
																	"id" : "obj-6",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "kslider",
																	"patching_rect" : [ 25.0, 359.0, 196.0, 34.0 ],
																	"numinlets" : 2,
																	"id" : "obj-7",
																	"numoutlets" : 2,
																	"outlettype" : [ "int", "int" ],
																	"presentation_rect" : [ 0.0, 0.0, 196.0, 35.0 ],
																	"hkeycolor" : [ 0.666667, 0.666667, 0.666667, 1.0 ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "noteout",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 25.0, 419.0, 58.0, 20.0 ],
																	"numinlets" : 3,
																	"id" : "obj-8",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "pitch class",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 222.0, 213.0, 72.0, 20.0 ],
																	"numinlets" : 1,
																	"id" : "obj-9",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "number",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 25.0, 331.0, 45.0, 20.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-10",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "int", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "+",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 25.0, 305.0, 31.0, 20.0 ],
																	"numinlets" : 2,
																	"id" : "obj-11",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "coll my_coll",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 182.0, 246.0, 73.0, 20.0 ],
																	"numinlets" : 1,
																	"color" : [ 0.0, 0.133333, 0.882353, 1.0 ],
																	"id" : "obj-12",
																	"fontname" : "Arial",
																	"numoutlets" : 4,
																	"outlettype" : [ "", "", "", "" ],
																	"saved_object_attributes" : 																	{
																		"embed" : 0
																	}

																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "number",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 25.0, 135.0, 40.0, 20.0 ],
																	"triscale" : 0.9,
																	"numinlets" : 1,
																	"id" : "obj-13",
																	"fontname" : "Arial",
																	"numoutlets" : 2,
																	"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
																	"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
																	"outlettype" : [ "int", "bang" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "% 12",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 182.0, 184.0, 46.0, 20.0 ],
																	"numinlets" : 2,
																	"id" : "obj-14",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "newobj",
																	"text" : "/ 12",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 25.0, 185.0, 41.0, 20.0 ],
																	"numinlets" : 2,
																	"id" : "obj-15",
																	"fontname" : "Arial",
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "kslider",
																	"patching_rect" : [ 25.0, 94.0, 196.0, 34.0 ],
																	"numinlets" : 2,
																	"id" : "obj-16",
																	"numoutlets" : 2,
																	"outlettype" : [ "int", "int" ],
																	"presentation_rect" : [ 0.0, 0.0, 196.0, 35.0 ],
																	"hkeycolor" : [ 0.501961, 0.501961, 0.501961, 1.0 ]
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "MIDI Note",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 64.0, 135.0, 78.0, 20.0 ],
																	"numinlets" : 1,
																	"id" : "obj-18",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
, 															{
																"box" : 																{
																	"maxclass" : "comment",
																	"text" : "octave register",
																	"fontsize" : 12.0,
																	"patching_rect" : [ 56.0, 213.0, 90.0, 20.0 ],
																	"numinlets" : 1,
																	"id" : "obj-19",
																	"fontname" : "Arial",
																	"numoutlets" : 0
																}

															}
 ],
														"lines" : [ 															{
																"patchline" : 																{
																	"source" : [ "obj-20", 0 ],
																	"destination" : [ "obj-16", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-7", 1 ],
																	"destination" : [ "obj-22", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-7", 0 ],
																	"destination" : [ "obj-21", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-12", 0 ],
																	"destination" : [ "obj-3", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-4", 0 ],
																	"destination" : [ "obj-12", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-7", 0 ],
																	"destination" : [ "obj-8", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-7", 1 ],
																	"destination" : [ "obj-8", 1 ],
																	"hidden" : 0,
																	"midpoints" : [ 211.5, 404.0, 54.0, 404.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-16", 1 ],
																	"destination" : [ "obj-7", 1 ],
																	"hidden" : 1,
																	"midpoints" : [ 211.5, 309.0, 211.5, 309.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-14", 0 ],
																	"destination" : [ "obj-4", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-13", 0 ],
																	"destination" : [ "obj-14", 0 ],
																	"hidden" : 0,
																	"midpoints" : [ 34.5, 175.0, 191.5, 175.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-16", 0 ],
																	"destination" : [ "obj-13", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-3", 0 ],
																	"destination" : [ "obj-11", 1 ],
																	"hidden" : 0,
																	"midpoints" : [ 191.5, 300.0, 46.5, 300.0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-10", 0 ],
																	"destination" : [ "obj-7", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-11", 0 ],
																	"destination" : [ "obj-10", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-6", 0 ],
																	"destination" : [ "obj-11", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-5", 0 ],
																	"destination" : [ "obj-6", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-15", 0 ],
																	"destination" : [ "obj-5", 0 ],
																	"hidden" : 0,
																	"midpoints" : [  ]
																}

															}
, 															{
																"patchline" : 																{
																	"source" : [ "obj-13", 0 ],
																	"destination" : [ "obj-15", 0 ],
																	"hidden" : 0,
																	"midpoints" : [ 34.5, 175.0, 34.5, 175.0 ]
																}

															}
 ]
													}
,
													"saved_object_attributes" : 													{
														"default_fontface" : 0,
														"fontface" : 0,
														"fontsize" : 12.0,
														"default_fontname" : "Arial",
														"default_fontsize" : 12.0,
														"fontname" : "Arial",
														"globalpatchername" : ""
													}

												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "F#",
													"fontsize" : 12.0,
													"patching_rect" : [ 166.0, 176.0, 23.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-70",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 374.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-71",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 338.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-72",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 302.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-73",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 266.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-74",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 230.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-75",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 194.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-76",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 158.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-77",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "number",
													"fontsize" : 12.0,
													"patching_rect" : [ 122.0, 324.0, 37.0, 20.0 ],
													"triscale" : 0.9,
													"numinlets" : 1,
													"id" : "obj-78",
													"fontname" : "Arial",
													"numoutlets" : 2,
													"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "int", "bang" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "locrian_b7",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 651.0, 75.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-79",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "locrian_b4",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 651.0, 75.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-80",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "mixolydian_#1",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 651.0, 101.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-81",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "locrian",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 651.0, 51.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-82",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "aeolian_b1",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 617.0, 79.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-83",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "locrian_#2",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 617.0, 75.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-84",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "lydian_#2",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 617.0, 71.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-85",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "aeolian",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 617.0, 55.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-86",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "mixolydian_b2",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 583.0, 101.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-87",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "mixolydian_b6",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 583.0, 101.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-88",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "phrygian_#3",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 583.0, 87.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-89",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "mixolydian",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 583.0, 77.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-90",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "lydian_b3",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 551.0, 71.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-91",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "lydian_b7",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 551.0, 71.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-92",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "dorian_#4",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 551.0, 71.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-93",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "lydian",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 551.0, 47.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-94",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "phrygian_b4",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 517.0, 87.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-95",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "lydian_#5",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 517.0, 71.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-96",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "ionian_#5",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 517.0, 72.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-97",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "phrygian",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 517.0, 63.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-98",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "dorian_b5",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 479.0, 71.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-99",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "dorian_b2",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 479.0, 71.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-100",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "locrian_#6",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 479.0, 75.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-101",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "dorian",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 479.0, 47.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-102",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "harmonic_major",
													"fontsize" : 12.0,
													"patching_rect" : [ 183.0, 443.0, 111.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-103",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "melodic_minor",
													"fontsize" : 12.0,
													"patching_rect" : [ 457.0, 443.0, 103.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-104",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "harmonic_minor",
													"fontsize" : 12.0,
													"patching_rect" : [ 323.0, 443.0, 111.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-105",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "ionian",
													"fontsize" : 12.0,
													"patching_rect" : [ 69.0, 443.0, 48.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-106",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "mode names",
													"textcolor" : [ 0.4, 0.4, 0.8, 1.0 ],
													"frgb" : [ 0.4, 0.4, 0.8, 1.0 ],
													"fontsize" : 12.0,
													"patching_rect" : [ 619.0, 225.0, 81.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-107",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "coll my_coll",
													"fontsize" : 12.0,
													"patching_rect" : [ 627.0, 381.0, 73.0, 20.0 ],
													"numinlets" : 1,
													"color" : [ 0.4, 0.4, 0.8, 1.0 ],
													"id" : "obj-108",
													"fontname" : "Arial",
													"numoutlets" : 4,
													"outlettype" : [ "", "", "", "" ],
													"saved_object_attributes" : 													{
														"embed" : 0
													}

												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "lydian_b7",
													"fontsize" : 12.0,
													"patching_rect" : [ 358.0, 191.0, 68.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-110",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "minor",
													"fontsize" : 12.0,
													"patching_rect" : [ 332.0, 171.0, 39.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-111",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "c",
													"fontsize" : 12.0,
													"patching_rect" : [ 143.0, 176.0, 20.5, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-112",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "major",
													"fontsize" : 12.0,
													"patching_rect" : [ 292.0, 191.0, 43.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-114",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "4",
													"fontsize" : 12.0,
													"patching_rect" : [ 120.0, 176.0, 18.0, 18.0 ],
													"numinlets" : 2,
													"id" : "obj-115",
													"fontname" : "Arial",
													"numoutlets" : 1,
													"bgcolor" : [ 0.760784, 0.709804, 0.811765, 1.0 ],
													"outlettype" : [ "" ]
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "send a MIDI pitch class number (C=0, C#=1, etc) 0-11 in the left inlet or simply send a message box with a letter. This will determine the tonic of the 7 note mode. \nNext send a message box with a mode name in the right inlet. ",
													"linecount" : 3,
													"fontsize" : 12.0,
													"patching_rect" : [ 53.0, 103.0, 478.0, 48.0 ],
													"numinlets" : 1,
													"id" : "obj-117",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "tonic",
													"textcolor" : [ 0.4, 0.4, 0.8, 1.0 ],
													"frgb" : [ 0.4, 0.4, 0.8, 1.0 ],
													"fontsize" : 12.0,
													"patching_rect" : [ 78.0, 226.0, 34.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-118",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "modes are named using traditional Greek names and variations of these names that reflect the least amount of chromatic inflections for the 7 modes of the Major Scale, the Harmonic Minor Scale, the Harmonic Major Scale, and the Melodic Minor Scale",
													"linecount" : 3,
													"fontsize" : 12.0,
													"patching_rect" : [ 57.0, 693.0, 529.0, 48.0 ],
													"numinlets" : 1,
													"id" : "obj-121",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "3.1",
													"fontsize" : 12.0,
													"patching_rect" : [ 228.0, 54.0, 31.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-124",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "Major Modes",
													"fontface" : 1,
													"fontsize" : 11.0,
													"patching_rect" : [ 67.0, 416.0, 131.0, 19.0 ],
													"numinlets" : 1,
													"id" : "obj-125",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "panel",
													"mode" : 1,
													"patching_rect" : [ 65.0, 410.0, 93.0, 285.0 ],
													"numinlets" : 1,
													"id" : "obj-126",
													"numoutlets" : 0,
													"grad2" : [ 1.0, 1.0, 1.0, 1.0 ],
													"bgcolor" : [ 0.937255, 0.956863, 1.0, 1.0 ],
													"rounded" : 30
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "panel",
													"mode" : 1,
													"patching_rect" : [ 167.0, 410.0, 136.0, 284.0 ],
													"numinlets" : 1,
													"id" : "obj-127",
													"numoutlets" : 0,
													"grad2" : [ 1.0, 1.0, 1.0, 1.0 ],
													"bgcolor" : [ 0.819608, 0.87451, 0.996078, 1.0 ],
													"rounded" : 30
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "panel",
													"mode" : 1,
													"patching_rect" : [ 306.0, 410.0, 137.0, 283.0 ],
													"numinlets" : 1,
													"id" : "obj-128",
													"numoutlets" : 0,
													"grad2" : [ 1.0, 1.0, 1.0, 1.0 ],
													"bgcolor" : [ 0.694118, 0.768627, 0.988235, 1.0 ],
													"rounded" : 30
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "pitch classes only (reduced to one octave)",
													"fontsize" : 12.0,
													"patching_rect" : [ 170.0, 379.0, 272.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-130",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "complete mode list",
													"fontsize" : 12.0,
													"patching_rect" : [ 436.0, 151.0, 112.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-131",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "takes numbers or letters",
													"fontsize" : 12.0,
													"patching_rect" : [ 111.0, 156.0, 140.0, 20.0 ],
													"numinlets" : 1,
													"id" : "obj-132",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "modal_change",
													"textcolor" : [ 0.047059, 0.0, 0.454902, 1.0 ],
													"frgb" : [ 0.047059, 0.0, 0.454902, 1.0 ],
													"fontsize" : 26.0,
													"patching_rect" : [ 53.0, 53.0, 181.0, 36.0 ],
													"numinlets" : 1,
													"id" : "obj-133",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "comment",
													"text" : "pitches at each scale degree",
													"fontsize" : 11.0,
													"patching_rect" : [ 195.0, 344.0, 201.0, 19.0 ],
													"numinlets" : 1,
													"id" : "obj-134",
													"fontname" : "Arial",
													"numoutlets" : 0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "panel",
													"mode" : 1,
													"patching_rect" : [ 618.0, 340.0, 262.0, 94.0 ],
													"numinlets" : 1,
													"grad1" : [ 0.894118, 0.917647, 1.0, 1.0 ],
													"id" : "obj-137",
													"numoutlets" : 0,
													"angle" : 1.16,
													"bgcolor" : [ 0.937255, 0.956863, 1.0, 1.0 ],
													"rounded" : 30
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "panel",
													"mode" : 1,
													"patching_rect" : [ 444.0, 410.0, 136.0, 284.0 ],
													"numinlets" : 1,
													"id" : "obj-129",
													"numoutlets" : 0,
													"grad2" : [ 1.0, 1.0, 1.0, 1.0 ],
													"bgcolor" : [ 0.576471, 0.643137, 0.980392, 1.0 ],
													"rounded" : 30
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "panel",
													"mode" : 1,
													"patching_rect" : [ 618.0, 466.0, 262.0, 94.0 ],
													"numinlets" : 1,
													"grad1" : [ 0.894118, 0.917647, 1.0, 1.0 ],
													"id" : "obj-109",
													"numoutlets" : 0,
													"angle" : 1.16,
													"bgcolor" : [ 0.937255, 0.956863, 1.0, 1.0 ],
													"rounded" : 30
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "modal_change",
													"varname" : "modal_change",
													"patching_rect" : [ 68.0, 247.0, 556.0, 65.0 ],
													"numinlets" : 2,
													"background" : 1,
													"id" : "obj-139",
													"numoutlets" : 9,
													"fontcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
													"outlettype" : [ "int", "int", "int", "int", "int", "int", "int", "int", "list" ]
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"source" : [ "obj-2", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-1", 0 ],
													"destination" : [ "obj-139", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-69", 1 ],
													"destination" : [ "obj-161", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-69", 0 ],
													"destination" : [ "obj-160", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-159", 0 ],
													"destination" : [ "obj-69", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-145", 0 ],
													"destination" : [ "obj-108", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 8 ],
													"destination" : [ "obj-145", 0 ],
													"hidden" : 0,
													"midpoints" : [ 614.5, 335.5, 636.5, 335.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-144", 0 ],
													"destination" : [ "obj-141", 0 ],
													"hidden" : 1,
													"midpoints" : [ 568.5, 328.0, 458.5, 328.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 8 ],
													"destination" : [ "obj-141", 1 ],
													"hidden" : 0,
													"midpoints" : [ 614.5, 328.0, 589.5, 328.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-16", 0 ],
													"destination" : [ "obj-23", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-71", 0 ],
													"destination" : [ "obj-16", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 7 ],
													"destination" : [ "obj-71", 0 ],
													"hidden" : 0,
													"midpoints" : [ 547.375, 317.5, 383.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-17", 0 ],
													"destination" : [ "obj-24", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-72", 0 ],
													"destination" : [ "obj-17", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 6 ],
													"destination" : [ "obj-72", 0 ],
													"hidden" : 0,
													"midpoints" : [ 480.25, 317.5, 347.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-18", 0 ],
													"destination" : [ "obj-25", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-73", 0 ],
													"destination" : [ "obj-18", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 5 ],
													"destination" : [ "obj-73", 0 ],
													"hidden" : 0,
													"midpoints" : [ 413.125, 317.5, 311.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-19", 0 ],
													"destination" : [ "obj-26", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-74", 0 ],
													"destination" : [ "obj-19", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 4 ],
													"destination" : [ "obj-74", 0 ],
													"hidden" : 0,
													"midpoints" : [ 346.0, 317.5, 275.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-20", 0 ],
													"destination" : [ "obj-27", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-75", 0 ],
													"destination" : [ "obj-20", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 3 ],
													"destination" : [ "obj-75", 0 ],
													"hidden" : 0,
													"midpoints" : [ 278.875, 317.5, 239.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-110", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 0,
													"midpoints" : [ 367.5, 218.5, 614.5, 218.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-111", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 0,
													"midpoints" : [ 341.5, 218.5, 614.5, 218.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-114", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 0,
													"midpoints" : [ 301.5, 218.5, 614.5, 218.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-106", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-102", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-98", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-94", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-90", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-86", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-82", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-103", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-99", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-95", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-91", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-87", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-83", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-79", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-105", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-101", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-97", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-93", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-89", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-85", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-81", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-104", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-100", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-96", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-92", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-88", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-84", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-80", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-67", 1 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 0,
													"midpoints" : [ 488.0, 240.5, 614.5, 240.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-34", 0 ],
													"destination" : [ "obj-139", 1 ],
													"hidden" : 0,
													"midpoints" : [ 576.5, 218.5, 614.5, 218.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-21", 0 ],
													"destination" : [ "obj-28", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-76", 0 ],
													"destination" : [ "obj-21", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 2 ],
													"destination" : [ "obj-76", 0 ],
													"hidden" : 0,
													"midpoints" : [ 211.75, 317.5, 203.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-22", 0 ],
													"destination" : [ "obj-29", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-77", 0 ],
													"destination" : [ "obj-22", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 1 ],
													"destination" : [ "obj-77", 0 ],
													"hidden" : 0,
													"midpoints" : [ 144.625, 317.5, 167.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-31", 0 ],
													"destination" : [ "obj-30", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-78", 0 ],
													"destination" : [ "obj-31", 0 ],
													"hidden" : 1,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 0 ],
													"destination" : [ "obj-78", 0 ],
													"hidden" : 0,
													"midpoints" : [ 77.5, 317.5, 131.5, 317.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-3", 0 ],
													"destination" : [ "obj-139", 0 ],
													"hidden" : 0,
													"midpoints" : [ 61.5, 213.5, 77.5, 213.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-112", 0 ],
													"destination" : [ "obj-139", 0 ],
													"hidden" : 0,
													"midpoints" : [ 152.5, 220.5, 77.5, 220.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-115", 0 ],
													"destination" : [ "obj-139", 0 ],
													"hidden" : 0,
													"midpoints" : [ 129.5, 220.5, 77.5, 220.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-70", 0 ],
													"destination" : [ "obj-139", 0 ],
													"hidden" : 0,
													"midpoints" : [ 175.5, 220.5, 77.5, 220.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-66", 0 ],
													"destination" : [ "obj-139", 0 ],
													"hidden" : 0,
													"midpoints" : [ 201.5, 220.5, 77.5, 220.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-139", 8 ],
													"destination" : [ "obj-33", 0 ],
													"hidden" : 0,
													"midpoints" : [ 614.5, 453.0, 634.5, 453.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-33", 1 ],
													"destination" : [ "obj-11", 1 ],
													"hidden" : 0,
													"midpoints" : [ 720.5, 501.5, 704.5, 501.5 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-33", 0 ],
													"destination" : [ "obj-11", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
 ]
									}
,
									"saved_object_attributes" : 									{
										"default_fontface" : 0,
										"fontface" : 0,
										"fontsize" : 12.0,
										"default_fontname" : "Arial",
										"default_fontsize" : 12.0,
										"fontname" : "Arial",
										"globalpatchername" : ""
									}

								}

							}
, 							{
								"box" : 								{
									"maxclass" : "gain~",
									"patching_rect" : [ 648.0, 407.0, 24.0, 98.0 ],
									"numinlets" : 2,
									"id" : "obj-36",
									"numoutlets" : 2,
									"outlettype" : [ "signal", "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "flonum",
									"fontsize" : 12.0,
									"patching_rect" : [ 648.0, 157.0, 50.0, 20.0 ],
									"numinlets" : 1,
									"id" : "obj-37",
									"fontname" : "Arial",
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "flonum",
									"fontsize" : 12.0,
									"patching_rect" : [ 648.0, 248.0, 50.0, 20.0 ],
									"numinlets" : 1,
									"id" : "obj-38",
									"fontname" : "Arial",
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "gain~",
									"patching_rect" : [ 505.0, 407.0, 24.0, 98.0 ],
									"numinlets" : 2,
									"id" : "obj-32",
									"numoutlets" : 2,
									"outlettype" : [ "signal", "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "flonum",
									"fontsize" : 12.0,
									"patching_rect" : [ 505.0, 157.0, 50.0, 20.0 ],
									"numinlets" : 1,
									"id" : "obj-33",
									"fontname" : "Arial",
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "flonum",
									"fontsize" : 12.0,
									"patching_rect" : [ 505.0, 248.0, 50.0, 20.0 ],
									"numinlets" : 1,
									"id" : "obj-34",
									"fontname" : "Arial",
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "gain~",
									"patching_rect" : [ 374.0, 407.0, 24.0, 98.0 ],
									"interp" : 120.0,
									"numinlets" : 2,
									"id" : "obj-28",
									"numoutlets" : 2,
									"outlettype" : [ "signal", "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "flonum",
									"fontsize" : 12.0,
									"patching_rect" : [ 374.0, 157.0, 50.0, 20.0 ],
									"numinlets" : 1,
									"id" : "obj-29",
									"fontname" : "Arial",
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "flonum",
									"fontsize" : 12.0,
									"patching_rect" : [ 374.0, 248.0, 50.0, 20.0 ],
									"numinlets" : 1,
									"id" : "obj-30",
									"fontname" : "Arial",
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "gain~",
									"patching_rect" : [ 247.0, 407.0, 24.0, 98.0 ],
									"numinlets" : 2,
									"id" : "obj-24",
									"numoutlets" : 2,
									"outlettype" : [ "signal", "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "flonum",
									"fontsize" : 12.0,
									"patching_rect" : [ 247.0, 157.0, 50.0, 20.0 ],
									"numinlets" : 1,
									"id" : "obj-25",
									"fontname" : "Arial",
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "flonum",
									"fontsize" : 12.0,
									"patching_rect" : [ 247.0, 248.0, 50.0, 20.0 ],
									"numinlets" : 1,
									"id" : "obj-26",
									"fontname" : "Arial",
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "unpack 1. 2. 3. 4. 5. 6.",
									"fontsize" : 12.0,
									"patching_rect" : [ 118.0, 72.0, 129.0, 20.0 ],
									"numinlets" : 1,
									"id" : "obj-143",
									"fontname" : "Arial",
									"numoutlets" : 6,
									"outlettype" : [ "float", "float", "float", "float", "float", "float" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"patching_rect" : [ 118.0, 32.0, 25.0, 25.0 ],
									"numinlets" : 0,
									"id" : "obj-4",
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"patching_rect" : [ 390.0, 610.0, 25.0, 25.0 ],
									"numinlets" : 1,
									"id" : "obj-3",
									"numoutlets" : 0,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "flonum",
									"fontsize" : 12.0,
									"patching_rect" : [ 118.0, 157.0, 50.0, 20.0 ],
									"numinlets" : 1,
									"id" : "obj-150",
									"fontname" : "Arial",
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "flonum",
									"fontsize" : 12.0,
									"patching_rect" : [ 118.0, 248.0, 50.0, 20.0 ],
									"numinlets" : 1,
									"id" : "obj-141",
									"fontname" : "Arial",
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-48", 0 ],
									"destination" : [ "obj-94", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-47", 0 ],
									"destination" : [ "obj-48", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-143", 5 ],
									"destination" : [ "obj-11", 0 ],
									"hidden" : 0,
									"midpoints" : [ 237.5, 111.0, 780.5, 111.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-143", 4 ],
									"destination" : [ "obj-10", 0 ],
									"hidden" : 0,
									"midpoints" : [ 215.5, 111.0, 657.5, 111.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-11", 0 ],
									"destination" : [ "obj-41", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-10", 0 ],
									"destination" : [ "obj-37", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-9", 0 ],
									"destination" : [ "obj-33", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-143", 3 ],
									"destination" : [ "obj-9", 0 ],
									"hidden" : 0,
									"midpoints" : [ 193.5, 114.0, 514.5, 114.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-7", 0 ],
									"destination" : [ "obj-29", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-6", 0 ],
									"destination" : [ "obj-25", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-143", 2 ],
									"destination" : [ "obj-7", 0 ],
									"hidden" : 0,
									"midpoints" : [ 171.5, 114.0, 383.5, 114.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-143", 1 ],
									"destination" : [ "obj-6", 0 ],
									"hidden" : 0,
									"midpoints" : [ 149.5, 114.0, 256.5, 114.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-143", 0 ],
									"destination" : [ "obj-5", 0 ],
									"hidden" : 0,
									"midpoints" : [ 127.5, 72.0, 127.5, 72.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-5", 0 ],
									"destination" : [ "obj-150", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-4", 0 ],
									"destination" : [ "obj-143", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-150", 0 ],
									"destination" : [ "obj-78", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-37", 0 ],
									"destination" : [ "obj-90", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-60", 0 ],
									"destination" : [ "obj-24", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-61", 0 ],
									"destination" : [ "obj-60", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 0 ],
									"destination" : [ "obj-73", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 0 ],
									"destination" : [ "obj-114", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-45", 0 ],
									"destination" : [ "obj-24", 0 ],
									"hidden" : 0,
									"midpoints" : [ 22.5, 393.0, 256.5, 393.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-45", 0 ],
									"destination" : [ "obj-32", 0 ],
									"hidden" : 0,
									"midpoints" : [ 22.5, 393.0, 514.5, 393.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-45", 0 ],
									"destination" : [ "obj-36", 0 ],
									"hidden" : 0,
									"midpoints" : [ 22.5, 393.0, 657.5, 393.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-45", 0 ],
									"destination" : [ "obj-40", 0 ],
									"hidden" : 0,
									"midpoints" : [ 22.5, 393.0, 780.5, 393.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-45", 0 ],
									"destination" : [ "obj-28", 0 ],
									"hidden" : 0,
									"midpoints" : [ 22.5, 393.0, 383.5, 393.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-62", 0 ],
									"destination" : [ "obj-28", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-63", 0 ],
									"destination" : [ "obj-62", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-69", 0 ],
									"destination" : [ "obj-68", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-68", 0 ],
									"destination" : [ "obj-40", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-67", 0 ],
									"destination" : [ "obj-66", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-66", 0 ],
									"destination" : [ "obj-36", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-64", 0 ],
									"destination" : [ "obj-32", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-65", 0 ],
									"destination" : [ "obj-64", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-110", 0 ],
									"destination" : [ "obj-91", 0 ],
									"hidden" : 0,
									"midpoints" : [ 534.5, 61.0, 437.5, 61.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-111", 0 ],
									"destination" : [ "obj-91", 0 ],
									"hidden" : 0,
									"midpoints" : [ 486.5, 52.0, 437.5, 52.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-114", 0 ],
									"destination" : [ "obj-91", 0 ],
									"hidden" : 0,
									"midpoints" : [ 437.5, 52.0, 437.5, 52.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-73", 0 ],
									"destination" : [ "obj-92", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-90", 0 ],
									"destination" : [ "obj-38", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-87", 0 ],
									"destination" : [ "obj-34", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-81", 0 ],
									"destination" : [ "obj-26", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-84", 0 ],
									"destination" : [ "obj-30", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-33", 0 ],
									"destination" : [ "obj-87", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-29", 0 ],
									"destination" : [ "obj-84", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-25", 0 ],
									"destination" : [ "obj-81", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-78", 0 ],
									"destination" : [ "obj-141", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-88", 0 ],
									"destination" : [ "obj-90", 2 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-89", 0 ],
									"destination" : [ "obj-90", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-86", 0 ],
									"destination" : [ "obj-87", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-85", 0 ],
									"destination" : [ "obj-87", 2 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-77", 0 ],
									"destination" : [ "obj-78", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-82", 0 ],
									"destination" : [ "obj-84", 2 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-83", 0 ],
									"destination" : [ "obj-84", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-80", 0 ],
									"destination" : [ "obj-81", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-79", 0 ],
									"destination" : [ "obj-81", 2 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-76", 0 ],
									"destination" : [ "obj-78", 2 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-74", 0 ],
									"destination" : [ "obj-44", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-75", 0 ],
									"destination" : [ "obj-44", 2 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-71", 0 ],
									"destination" : [ "obj-59", 1 ],
									"hidden" : 0,
									"midpoints" : [ 57.5, 273.0, 794.0, 273.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-71", 0 ],
									"destination" : [ "obj-58", 1 ],
									"hidden" : 0,
									"midpoints" : [ 57.5, 273.0, 671.0, 273.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-71", 0 ],
									"destination" : [ "obj-57", 1 ],
									"hidden" : 0,
									"midpoints" : [ 57.5, 273.0, 528.0, 273.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-71", 0 ],
									"destination" : [ "obj-56", 1 ],
									"hidden" : 0,
									"midpoints" : [ 57.5, 273.0, 397.0, 273.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-71", 0 ],
									"destination" : [ "obj-55", 1 ],
									"hidden" : 0,
									"midpoints" : [ 57.5, 273.0, 270.0, 273.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-71", 0 ],
									"destination" : [ "obj-46", 1 ],
									"hidden" : 0,
									"midpoints" : [ 57.5, 273.0, 141.0, 273.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-52", 0 ],
									"destination" : [ "obj-71", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-59", 0 ],
									"destination" : [ "obj-69", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-42", 0 ],
									"destination" : [ "obj-59", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-58", 0 ],
									"destination" : [ "obj-67", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-38", 0 ],
									"destination" : [ "obj-58", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-57", 0 ],
									"destination" : [ "obj-65", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-34", 0 ],
									"destination" : [ "obj-57", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-56", 0 ],
									"destination" : [ "obj-63", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-30", 0 ],
									"destination" : [ "obj-56", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-55", 0 ],
									"destination" : [ "obj-61", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-46", 0 ],
									"destination" : [ "obj-47", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-141", 0 ],
									"destination" : [ "obj-46", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-40", 0 ],
									"destination" : [ "obj-3", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-36", 0 ],
									"destination" : [ "obj-3", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-32", 0 ],
									"destination" : [ "obj-3", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-28", 0 ],
									"destination" : [ "obj-3", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-24", 0 ],
									"destination" : [ "obj-3", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-41", 0 ],
									"destination" : [ "obj-44", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-44", 0 ],
									"destination" : [ "obj-42", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-26", 0 ],
									"destination" : [ "obj-55", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-8", 0 ],
									"destination" : [ "obj-2", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-15", 0 ],
									"destination" : [ "obj-13", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-14", 0 ],
									"destination" : [ "obj-15", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-17", 0 ],
									"destination" : [ "obj-18", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-18", 0 ],
									"destination" : [ "obj-16", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-21", 0 ],
									"destination" : [ "obj-19", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-20", 0 ],
									"destination" : [ "obj-21", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-23", 0 ],
									"destination" : [ "obj-27", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-27", 0 ],
									"destination" : [ "obj-22", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-39", 0 ],
									"destination" : [ "obj-31", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-35", 0 ],
									"destination" : [ "obj-39", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-13", 0 ],
									"destination" : [ "obj-24", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-16", 0 ],
									"destination" : [ "obj-28", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-19", 0 ],
									"destination" : [ "obj-32", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-22", 0 ],
									"destination" : [ "obj-36", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-31", 0 ],
									"destination" : [ "obj-40", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-150", 0 ],
									"destination" : [ "obj-8", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-25", 0 ],
									"destination" : [ "obj-14", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-29", 0 ],
									"destination" : [ "obj-17", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-33", 0 ],
									"destination" : [ "obj-20", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-37", 0 ],
									"destination" : [ "obj-23", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-41", 0 ],
									"destination" : [ "obj-35", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-2", 0 ],
									"destination" : [ "obj-50", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-50", 0 ],
									"destination" : [ "obj-51", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-50", 0 ],
									"destination" : [ "obj-70", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-51", 0 ],
									"destination" : [ "obj-3", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-50", 0 ],
									"destination" : [ "obj-93", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-94", 0 ],
									"destination" : [ "obj-50", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"fontface" : 0,
						"fontsize" : 12.0,
						"default_fontname" : "Arial",
						"default_fontsize" : 12.0,
						"fontname" : "Arial",
						"globalpatchername" : ""
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "ezdac~",
					"patching_rect" : [ 942.0, 462.0, 45.0, 45.0 ],
					"numinlets" : 2,
					"id" : "obj-132",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"patching_rect" : [ 742.0, 74.0, 20.0, 20.0 ],
					"numinlets" : 1,
					"id" : "obj-47",
					"numoutlets" : 1,
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route /BulletCurtain/OtherDestroyed",
					"fontsize" : 12.0,
					"patching_rect" : [ 742.0, 51.0, 201.0, 20.0 ],
					"numinlets" : 1,
					"id" : "obj-45",
					"fontname" : "Arial",
					"numoutlets" : 2,
					"outlettype" : [ "", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r OSC_IN",
					"fontsize" : 12.0,
					"patching_rect" : [ 742.0, 28.0, 63.0, 20.0 ],
					"numinlets" : 0,
					"id" : "obj-44",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s OSC_IN",
					"fontsize" : 12.0,
					"patching_rect" : [ 71.0, 40.0, 65.0, 20.0 ],
					"numinlets" : 1,
					"id" : "obj-43",
					"fontname" : "Arial",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s OSC_OUT",
					"fontsize" : 12.0,
					"patching_rect" : [ 527.0, 289.0, 78.0, 20.0 ],
					"numinlets" : 1,
					"id" : "obj-23",
					"fontname" : "Arial",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"fontsize" : 12.0,
					"patching_rect" : [ 573.0, 168.0, 50.0, 20.0 ],
					"numinlets" : 1,
					"id" : "obj-25",
					"fontname" : "Arial",
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"patching_rect" : [ 527.0, 167.0, 20.0, 20.0 ],
					"numinlets" : 1,
					"id" : "obj-31",
					"numoutlets" : 1,
					"outlettype" : [ "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "metro 100",
					"fontsize" : 12.0,
					"patching_rect" : [ 527.0, 196.0, 65.0, 20.0 ],
					"numinlets" : 2,
					"id" : "obj-36",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "1.",
					"fontsize" : 12.0,
					"patching_rect" : [ 527.0, 230.0, 32.5, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-37",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend /BulletCurtain/HaveSubjectShoot",
					"fontsize" : 12.0,
					"patching_rect" : [ 527.0, 262.0, 233.0, 20.0 ],
					"numinlets" : 1,
					"id" : "obj-40",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s OSC_OUT",
					"fontsize" : 12.0,
					"patching_rect" : [ 797.0, 638.0, 78.0, 20.0 ],
					"numinlets" : 1,
					"id" : "obj-21",
					"fontname" : "Arial",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s OSC_OUT",
					"fontsize" : 12.0,
					"patching_rect" : [ 529.0, 639.0, 78.0, 20.0 ],
					"numinlets" : 1,
					"id" : "obj-20",
					"fontname" : "Arial",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s OSC_OUT",
					"fontsize" : 12.0,
					"patching_rect" : [ 24.0, 651.0, 78.0, 20.0 ],
					"numinlets" : 1,
					"id" : "obj-18",
					"fontname" : "Arial",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s OSC_OUT",
					"fontsize" : 12.0,
					"patching_rect" : [ 267.0, 654.0, 78.0, 20.0 ],
					"numinlets" : 1,
					"id" : "obj-17",
					"fontname" : "Arial",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s OSC_OUT",
					"fontsize" : 12.0,
					"patching_rect" : [ 286.0, 286.0, 78.0, 20.0 ],
					"numinlets" : 1,
					"id" : "obj-14",
					"fontname" : "Arial",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s OSC_OUT",
					"fontsize" : 12.0,
					"patching_rect" : [ 20.0, 282.0, 78.0, 20.0 ],
					"numinlets" : 1,
					"id" : "obj-13",
					"fontname" : "Arial",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r OSC_OUT",
					"fontsize" : 12.0,
					"patching_rect" : [ 71.0, 64.0, 76.0, 20.0 ],
					"numinlets" : 0,
					"id" : "obj-12",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"minimum" : 10.0,
					"fontsize" : 12.0,
					"maximum" : 3000.0,
					"patching_rect" : [ 849.0, 521.0, 50.0, 20.0 ],
					"numinlets" : 1,
					"id" : "obj-9",
					"fontname" : "Arial",
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "ezdac~",
					"patching_rect" : [ 20.0, 62.0, 45.0, 45.0 ],
					"numinlets" : 2,
					"id" : "obj-8",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"patching_rect" : [ 797.0, 521.0, 20.0, 20.0 ],
					"numinlets" : 1,
					"id" : "obj-41",
					"numoutlets" : 1,
					"outlettype" : [ "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "metro 1000",
					"fontsize" : 12.0,
					"patching_rect" : [ 797.0, 553.0, 71.0, 20.0 ],
					"numinlets" : 2,
					"id" : "obj-42",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "1.",
					"fontsize" : 12.0,
					"patching_rect" : [ 797.0, 586.0, 32.5, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-38",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend /BulletCurtain/NewAnimationForSpawnedOthers",
					"fontsize" : 12.0,
					"patching_rect" : [ 797.0, 612.0, 315.0, 20.0 ],
					"numinlets" : 1,
					"id" : "obj-39",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"fontsize" : 12.0,
					"patching_rect" : [ 267.0, 524.0, 66.0, 20.0 ],
					"numinlets" : 1,
					"id" : "obj-32",
					"fontname" : "Arial",
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p oscillator",
					"fontsize" : 12.0,
					"patching_rect" : [ 267.0, 551.0, 68.0, 20.0 ],
					"numinlets" : 1,
					"id" : "obj-33",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 291.0, 124.0, 640.0, 480.0 ],
						"bglocked" : 0,
						"defrect" : [ 291.0, 124.0, 640.0, 480.0 ],
						"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 0,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 0,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"boxes" : [ 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "snapshot~ 1",
									"fontsize" : 12.0,
									"patching_rect" : [ 36.0, 174.0, 76.0, 20.0 ],
									"numinlets" : 2,
									"id" : "obj-3",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "float" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"hint" : "Value",
									"patching_rect" : [ 36.0, 205.0, 25.0, 25.0 ],
									"numinlets" : 1,
									"id" : "obj-2",
									"numoutlets" : 0,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"hint" : "Frequency",
									"annotation" : "",
									"patching_rect" : [ 36.0, 41.0, 25.0, 25.0 ],
									"numinlets" : 0,
									"id" : "obj-1",
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "+~ 0.5",
									"fontsize" : 12.0,
									"patching_rect" : [ 36.0, 139.0, 45.0, 20.0 ],
									"numinlets" : 2,
									"id" : "obj-137",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "signal" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "*~ 0.5",
									"fontsize" : 12.0,
									"patching_rect" : [ 36.0, 103.0, 42.0, 20.0 ],
									"numinlets" : 2,
									"id" : "obj-138",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "signal" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "cycle~",
									"fontsize" : 12.0,
									"patching_rect" : [ 36.0, 70.0, 45.0, 20.0 ],
									"numinlets" : 2,
									"id" : "obj-139",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "signal" ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-3", 0 ],
									"destination" : [ "obj-2", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-137", 0 ],
									"destination" : [ "obj-3", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 0 ],
									"destination" : [ "obj-139", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-139", 0 ],
									"destination" : [ "obj-138", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-138", 0 ],
									"destination" : [ "obj-137", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"fontface" : 0,
						"fontsize" : 12.0,
						"default_fontname" : "Arial",
						"default_fontsize" : 12.0,
						"fontname" : "Arial",
						"globalpatchername" : ""
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "slider",
					"patching_rect" : [ 267.0, 590.0, 126.0, 33.0 ],
					"numinlets" : 1,
					"size" : 1.0,
					"floatoutput" : 1,
					"id" : "obj-34",
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend /BulletCurtain/SetOtherSpawnY",
					"fontsize" : 12.0,
					"patching_rect" : [ 267.0, 627.0, 226.0, 20.0 ],
					"numinlets" : 1,
					"id" : "obj-35",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"fontsize" : 12.0,
					"patching_rect" : [ 24.0, 530.0, 66.0, 20.0 ],
					"numinlets" : 1,
					"id" : "obj-27",
					"fontname" : "Arial",
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p oscillator",
					"fontsize" : 12.0,
					"patching_rect" : [ 24.0, 555.0, 68.0, 20.0 ],
					"numinlets" : 1,
					"id" : "obj-28",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 291.0, 124.0, 640.0, 480.0 ],
						"bglocked" : 0,
						"defrect" : [ 291.0, 124.0, 640.0, 480.0 ],
						"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 0,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 0,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"boxes" : [ 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "snapshot~ 1",
									"fontsize" : 12.0,
									"patching_rect" : [ 36.0, 174.0, 76.0, 20.0 ],
									"numinlets" : 2,
									"id" : "obj-3",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "float" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"hint" : "Value",
									"patching_rect" : [ 36.0, 205.0, 25.0, 25.0 ],
									"numinlets" : 1,
									"id" : "obj-2",
									"numoutlets" : 0,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"hint" : "Frequency",
									"annotation" : "",
									"patching_rect" : [ 36.0, 41.0, 25.0, 25.0 ],
									"numinlets" : 0,
									"id" : "obj-1",
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "+~ 0.5",
									"fontsize" : 12.0,
									"patching_rect" : [ 36.0, 139.0, 45.0, 20.0 ],
									"numinlets" : 2,
									"id" : "obj-137",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "signal" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "*~ 0.5",
									"fontsize" : 12.0,
									"patching_rect" : [ 36.0, 103.0, 42.0, 20.0 ],
									"numinlets" : 2,
									"id" : "obj-138",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "signal" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "cycle~",
									"fontsize" : 12.0,
									"patching_rect" : [ 36.0, 70.0, 45.0, 20.0 ],
									"numinlets" : 2,
									"id" : "obj-139",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "signal" ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-138", 0 ],
									"destination" : [ "obj-137", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-139", 0 ],
									"destination" : [ "obj-138", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 0 ],
									"destination" : [ "obj-139", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-137", 0 ],
									"destination" : [ "obj-3", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-3", 0 ],
									"destination" : [ "obj-2", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"fontface" : 0,
						"fontsize" : 12.0,
						"default_fontname" : "Arial",
						"default_fontsize" : 12.0,
						"fontname" : "Arial",
						"globalpatchername" : ""
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "slider",
					"patching_rect" : [ 24.0, 588.0, 126.0, 33.0 ],
					"numinlets" : 1,
					"size" : 1.0,
					"floatoutput" : 1,
					"id" : "obj-29",
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend /BulletCurtain/SetOtherSpawnX",
					"fontsize" : 12.0,
					"patching_rect" : [ 24.0, 625.0, 226.0, 20.0 ],
					"numinlets" : 1,
					"id" : "obj-30",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"minimum" : 10.0,
					"fontsize" : 12.0,
					"maximum" : 2000.0,
					"patching_rect" : [ 575.0, 525.0, 50.0, 20.0 ],
					"numinlets" : 1,
					"id" : "obj-26",
					"fontname" : "Arial",
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"patching_rect" : [ 529.0, 525.0, 20.0, 20.0 ],
					"numinlets" : 1,
					"id" : "obj-24",
					"numoutlets" : 1,
					"outlettype" : [ "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "metro 100",
					"fontsize" : 12.0,
					"patching_rect" : [ 529.0, 554.0, 65.0, 20.0 ],
					"numinlets" : 2,
					"id" : "obj-22",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "1.",
					"fontsize" : 12.0,
					"patching_rect" : [ 529.0, 588.0, 32.5, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-19",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend /BulletCurtain/GenerateAnOther",
					"fontsize" : 12.0,
					"patching_rect" : [ 529.0, 612.0, 228.0, 20.0 ],
					"numinlets" : 1,
					"id" : "obj-15",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"fontsize" : 12.0,
					"patching_rect" : [ 20.0, 170.0, 66.0, 20.0 ],
					"numinlets" : 1,
					"id" : "obj-10",
					"fontname" : "Arial",
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p oscillator",
					"fontsize" : 12.0,
					"patching_rect" : [ 20.0, 197.0, 68.0, 20.0 ],
					"numinlets" : 1,
					"id" : "obj-11",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 291.0, 124.0, 640.0, 480.0 ],
						"bglocked" : 0,
						"defrect" : [ 291.0, 124.0, 640.0, 480.0 ],
						"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 0,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 0,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"boxes" : [ 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "snapshot~ 1",
									"fontsize" : 12.0,
									"patching_rect" : [ 36.0, 174.0, 76.0, 20.0 ],
									"numinlets" : 2,
									"id" : "obj-3",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "float" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"hint" : "Value",
									"patching_rect" : [ 36.0, 205.0, 25.0, 25.0 ],
									"numinlets" : 1,
									"id" : "obj-2",
									"numoutlets" : 0,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"hint" : "Frequency",
									"annotation" : "",
									"patching_rect" : [ 36.0, 41.0, 25.0, 25.0 ],
									"numinlets" : 0,
									"id" : "obj-1",
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "+~ 0.5",
									"fontsize" : 12.0,
									"patching_rect" : [ 36.0, 139.0, 45.0, 20.0 ],
									"numinlets" : 2,
									"id" : "obj-137",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "signal" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "*~ 0.5",
									"fontsize" : 12.0,
									"patching_rect" : [ 36.0, 103.0, 42.0, 20.0 ],
									"numinlets" : 2,
									"id" : "obj-138",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "signal" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "cycle~",
									"fontsize" : 12.0,
									"patching_rect" : [ 36.0, 70.0, 45.0, 20.0 ],
									"numinlets" : 2,
									"id" : "obj-139",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "signal" ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-138", 0 ],
									"destination" : [ "obj-137", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-139", 0 ],
									"destination" : [ "obj-138", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 0 ],
									"destination" : [ "obj-139", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-137", 0 ],
									"destination" : [ "obj-3", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-3", 0 ],
									"destination" : [ "obj-2", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"fontface" : 0,
						"fontsize" : 12.0,
						"default_fontname" : "Arial",
						"default_fontsize" : 12.0,
						"fontname" : "Arial",
						"globalpatchername" : ""
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"fontsize" : 12.0,
					"patching_rect" : [ 286.0, 173.0, 66.0, 20.0 ],
					"numinlets" : 1,
					"id" : "obj-56",
					"fontname" : "Arial",
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p oscillator",
					"fontsize" : 12.0,
					"patching_rect" : [ 286.0, 200.0, 68.0, 20.0 ],
					"numinlets" : 1,
					"id" : "obj-57",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 291.0, 124.0, 640.0, 480.0 ],
						"bglocked" : 0,
						"defrect" : [ 291.0, 124.0, 640.0, 480.0 ],
						"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 0,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 0,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"boxes" : [ 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "snapshot~ 1",
									"fontsize" : 12.0,
									"patching_rect" : [ 36.0, 174.0, 76.0, 20.0 ],
									"numinlets" : 2,
									"id" : "obj-3",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "float" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"hint" : "Value",
									"patching_rect" : [ 36.0, 205.0, 25.0, 25.0 ],
									"numinlets" : 1,
									"id" : "obj-2",
									"numoutlets" : 0,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"hint" : "Frequency",
									"annotation" : "",
									"patching_rect" : [ 36.0, 41.0, 25.0, 25.0 ],
									"numinlets" : 0,
									"id" : "obj-1",
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "+~ 0.5",
									"fontsize" : 12.0,
									"patching_rect" : [ 36.0, 139.0, 45.0, 20.0 ],
									"numinlets" : 2,
									"id" : "obj-137",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "signal" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "*~ 0.5",
									"fontsize" : 12.0,
									"patching_rect" : [ 36.0, 103.0, 42.0, 20.0 ],
									"numinlets" : 2,
									"id" : "obj-138",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "signal" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "cycle~",
									"fontsize" : 12.0,
									"patching_rect" : [ 36.0, 70.0, 45.0, 20.0 ],
									"numinlets" : 2,
									"id" : "obj-139",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "signal" ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-3", 0 ],
									"destination" : [ "obj-2", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-137", 0 ],
									"destination" : [ "obj-3", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 0 ],
									"destination" : [ "obj-139", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-139", 0 ],
									"destination" : [ "obj-138", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-138", 0 ],
									"destination" : [ "obj-137", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"fontface" : 0,
						"fontsize" : 12.0,
						"default_fontname" : "Arial",
						"default_fontsize" : 12.0,
						"fontname" : "Arial",
						"globalpatchername" : ""
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "slider",
					"patching_rect" : [ 286.0, 224.0, 126.0, 33.0 ],
					"numinlets" : 1,
					"size" : 1.0,
					"floatoutput" : 1,
					"id" : "obj-4",
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend /BulletCurtain/SetSubjectY",
					"fontsize" : 12.0,
					"patching_rect" : [ 286.0, 261.0, 199.0, 20.0 ],
					"numinlets" : 1,
					"id" : "obj-5",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "slider",
					"patching_rect" : [ 20.0, 222.0, 126.0, 33.0 ],
					"numinlets" : 1,
					"size" : 1.0,
					"floatoutput" : 1,
					"id" : "obj-82",
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend /BulletCurtain/SetSubjectX",
					"fontsize" : 12.0,
					"patching_rect" : [ 20.0, 259.0, 199.0, 20.0 ],
					"numinlets" : 1,
					"id" : "obj-3",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "udpreceive 8809",
					"fontsize" : 12.0,
					"patching_rect" : [ 71.0, 17.0, 99.0, 20.0 ],
					"numinlets" : 1,
					"id" : "obj-2",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "udpsend localhost 8808",
					"fontsize" : 12.0,
					"patching_rect" : [ 71.0, 88.0, 137.0, 20.0 ],
					"numinlets" : 1,
					"id" : "obj-1",
					"fontname" : "Arial",
					"numoutlets" : 0
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-41", 0 ],
					"destination" : [ "obj-42", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-42", 0 ],
					"destination" : [ "obj-38", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-38", 0 ],
					"destination" : [ "obj-39", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-33", 0 ],
					"destination" : [ "obj-34", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-34", 0 ],
					"destination" : [ "obj-35", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-32", 0 ],
					"destination" : [ "obj-33", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-29", 0 ],
					"destination" : [ "obj-30", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-27", 0 ],
					"destination" : [ "obj-28", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-26", 0 ],
					"destination" : [ "obj-22", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-24", 0 ],
					"destination" : [ "obj-22", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-22", 0 ],
					"destination" : [ "obj-19", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-19", 0 ],
					"destination" : [ "obj-15", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-11", 0 ],
					"destination" : [ "obj-82", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-10", 0 ],
					"destination" : [ "obj-11", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-57", 0 ],
					"destination" : [ "obj-4", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-56", 0 ],
					"destination" : [ "obj-57", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-4", 0 ],
					"destination" : [ "obj-5", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-9", 0 ],
					"destination" : [ "obj-42", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-82", 0 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 0 ],
					"destination" : [ "obj-1", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 0 ],
					"destination" : [ "obj-13", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-5", 0 ],
					"destination" : [ "obj-14", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-35", 0 ],
					"destination" : [ "obj-17", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-30", 0 ],
					"destination" : [ "obj-18", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-15", 0 ],
					"destination" : [ "obj-20", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-39", 0 ],
					"destination" : [ "obj-21", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-36", 0 ],
					"destination" : [ "obj-37", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-31", 0 ],
					"destination" : [ "obj-36", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-25", 0 ],
					"destination" : [ "obj-36", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-37", 0 ],
					"destination" : [ "obj-40", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-40", 0 ],
					"destination" : [ "obj-23", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-2", 0 ],
					"destination" : [ "obj-43", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-45", 0 ],
					"destination" : [ "obj-47", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-44", 0 ],
					"destination" : [ "obj-45", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-175", 0 ],
					"destination" : [ "obj-172", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-171", 0 ],
					"destination" : [ "obj-172", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-172", 0 ],
					"destination" : [ "obj-132", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-172", 0 ],
					"destination" : [ "obj-132", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-51", 0 ],
					"destination" : [ "obj-50", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-53", 0 ],
					"destination" : [ "obj-52", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-52", 0 ],
					"destination" : [ "obj-55", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-50", 0 ],
					"destination" : [ "obj-58", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
 ]
	}

}
