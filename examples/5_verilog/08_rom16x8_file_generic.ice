{
  "version": "1.1",
  "package": {
    "name": "",
    "version": "",
    "description": "",
    "author": "",
    "image": ""
  },
  "design": {
    "board": "icezum",
    "graph": {
      "blocks": [
        {
          "id": "9da24591-8efd-4bcf-b9dd-86470cf5184c",
          "type": "basic.constant",
          "data": {
            "name": "ROMFILE",
            "value": "\"rom0.list\"",
            "local": false
          },
          "position": {
            "x": 544,
            "y": -56
          }
        },
        {
          "id": "522f4259-2128-4d19-958e-cc7c78ea705b",
          "type": "basic.info",
          "data": {
            "info": "Displaying the contents of an 16x8 rom memory in the leds\nThe memory is read from the rom0.list file"
          },
          "position": {
            "x": -72,
            "y": -48
          },
          "size": {
            "width": 464,
            "height": 48
          }
        },
        {
          "id": "b4f187db-b9ee-4b23-adf5-c217c6570d91",
          "type": "basic.output",
          "data": {
            "name": "LED",
            "range": "[7:0]",
            "pins": [
              {
                "index": "7",
                "name": "LED7",
                "value": "104"
              },
              {
                "index": "6",
                "name": "LED6",
                "value": "102"
              },
              {
                "index": "5",
                "name": "LED5",
                "value": "101"
              },
              {
                "index": "4",
                "name": "LED4",
                "value": "99"
              },
              {
                "index": "3",
                "name": "LED3",
                "value": "98"
              },
              {
                "index": "2",
                "name": "LED2",
                "value": "97"
              },
              {
                "index": "1",
                "name": "LED1",
                "value": "96"
              },
              {
                "index": "0",
                "name": "LED0",
                "value": "95"
              }
            ],
            "virtual": false
          },
          "position": {
            "x": 848,
            "y": 24
          }
        },
        {
          "id": "0d35d3f1-1c79-4b4a-a4e9-41c1c082bb7a",
          "type": "basic.code",
          "data": {
            "code": "\n//-- ROM memory\nreg [7:0] rom [0:15];\n\n//-- Address bus (4 bits)\nwire [3:0] A;\n\n//-- Data bus (8 bits)\nreg [7:0] D;\n\nalways @(negedge clk) begin\n  D <= rom[A];\nend\n\n\n//-- Memory contents read\n//-- from the ROMFILE file\ninitial begin\n    $readmemh(ROMFILE, rom);\nend\n",
            "params": [
              {
                "name": "ROMFILE"
              }
            ],
            "ports": {
              "in": [
                {
                  "name": "clk"
                },
                {
                  "name": "A",
                  "range": "[3:0]",
                  "size": 4
                }
              ],
              "out": [
                {
                  "name": "D",
                  "range": "[7:0]",
                  "size": 8
                }
              ]
            }
          },
          "position": {
            "x": 440,
            "y": 56
          },
          "size": {
            "width": 304,
            "height": 224
          }
        },
        {
          "id": "c0815427-2523-4ddf-b95b-74fa5fd6b73a",
          "type": "basic.constant",
          "data": {
            "name": "N",
            "value": "19",
            "local": false
          },
          "position": {
            "x": -72,
            "y": 80
          }
        },
        {
          "id": "4908c9de-130b-466b-aee3-f53bde588562",
          "type": "basic.code",
          "data": {
            "code": "reg value;\n\nalways @(posedge clk)\n  value <= value + 1;\n",
            "params": [],
            "ports": {
              "in": [
                {
                  "name": "clk"
                }
              ],
              "out": [
                {
                  "name": "value",
                  "range": "[3:0]",
                  "size": 4
                }
              ]
            }
          },
          "position": {
            "x": 96,
            "y": 176
          },
          "size": {
            "width": 224,
            "height": 96
          }
        },
        {
          "id": "7e321552-a45f-4dcc-a06d-633cfe0f2c0c",
          "type": "2e70855674b893bd8b7ee5beda5ccded7b398def",
          "position": {
            "x": -72,
            "y": 192
          },
          "size": {
            "width": 96,
            "height": 64
          }
        }
      ],
      "wires": [
        {
          "source": {
            "block": "7e321552-a45f-4dcc-a06d-633cfe0f2c0c",
            "port": "7e07d449-6475-4839-b43e-8aead8be2aac"
          },
          "target": {
            "block": "4908c9de-130b-466b-aee3-f53bde588562",
            "port": "clk"
          }
        },
        {
          "source": {
            "block": "c0815427-2523-4ddf-b95b-74fa5fd6b73a",
            "port": "constant-out"
          },
          "target": {
            "block": "7e321552-a45f-4dcc-a06d-633cfe0f2c0c",
            "port": "de2d8a2d-7908-48a2-9e35-7763a45886e4"
          }
        },
        {
          "source": {
            "block": "9da24591-8efd-4bcf-b9dd-86470cf5184c",
            "port": "constant-out"
          },
          "target": {
            "block": "0d35d3f1-1c79-4b4a-a4e9-41c1c082bb7a",
            "port": "ROMFILE"
          }
        },
        {
          "source": {
            "block": "4908c9de-130b-466b-aee3-f53bde588562",
            "port": "value"
          },
          "target": {
            "block": "0d35d3f1-1c79-4b4a-a4e9-41c1c082bb7a",
            "port": "A"
          },
          "size": 4
        },
        {
          "source": {
            "block": "0d35d3f1-1c79-4b4a-a4e9-41c1c082bb7a",
            "port": "D"
          },
          "target": {
            "block": "b4f187db-b9ee-4b23-adf5-c217c6570d91",
            "port": "in"
          },
          "size": 8
        }
      ]
    },
    "state": {
      "pan": {
        "x": 136.6535,
        "y": 102.2837
      },
      "zoom": 1
    }
  },
  "dependencies": {
    "2e70855674b893bd8b7ee5beda5ccded7b398def": {
      "package": {
        "name": "Prescaler_N",
        "version": "0.1",
        "description": "Parametric N-bits prescaler",
        "author": "Juan Gonzalez (Obijuan)",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "de2d8a2d-7908-48a2-9e35-7763a45886e4",
              "type": "basic.constant",
              "data": {
                "name": "N",
                "value": "22",
                "local": false
              },
              "position": {
                "x": 352,
                "y": 56
              }
            },
            {
              "id": "2330955f-5ce6-4d1c-8ee4-0a09a0349389",
              "type": "basic.code",
              "data": {
                "code": "//-- Number of bits of the prescaler\n//parameter N = 22;\n\n//-- divisor register\nreg [N-1:0] divcounter;\n\n//-- N bit counter\nalways @(posedge clk_in)\n  divcounter <= divcounter + 1;\n\n//-- Use the most significant bit as output\nassign clk_out = divcounter[N-1];",
                "params": [
                  {
                    "name": "N"
                  }
                ],
                "ports": {
                  "in": [
                    {
                      "name": "clk_in"
                    }
                  ],
                  "out": [
                    {
                      "name": "clk_out"
                    }
                  ]
                }
              },
              "position": {
                "x": 176,
                "y": 176
              },
              "size": {
                "width": 448,
                "height": 224
              }
            },
            {
              "id": "e19c6f2f-5747-4ed1-87c8-748575f0cc10",
              "type": "basic.input",
              "data": {
                "name": "clk",
                "clock": true
              },
              "position": {
                "x": 0,
                "y": 256
              }
            },
            {
              "id": "7e07d449-6475-4839-b43e-8aead8be2aac",
              "type": "basic.output",
              "data": {
                "name": ""
              },
              "position": {
                "x": 720,
                "y": 256
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "2330955f-5ce6-4d1c-8ee4-0a09a0349389",
                "port": "clk_out"
              },
              "target": {
                "block": "7e07d449-6475-4839-b43e-8aead8be2aac",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "e19c6f2f-5747-4ed1-87c8-748575f0cc10",
                "port": "out"
              },
              "target": {
                "block": "2330955f-5ce6-4d1c-8ee4-0a09a0349389",
                "port": "clk_in"
              }
            },
            {
              "source": {
                "block": "de2d8a2d-7908-48a2-9e35-7763a45886e4",
                "port": "constant-out"
              },
              "target": {
                "block": "2330955f-5ce6-4d1c-8ee4-0a09a0349389",
                "port": "N"
              }
            }
          ]
        },
        "state": {
          "pan": {
            "x": 20,
            "y": 0
          },
          "zoom": 1
        }
      }
    }
  }
}