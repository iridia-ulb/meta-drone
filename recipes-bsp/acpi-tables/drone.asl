/*
 * Description of the hardware provided by the drone PCB
 */
#define I2C_SPEED 100000

DefinitionBlock ("", "SSDT", 5, "IRIDIA", "Drone", 1)
{
	External (_SB_.PCI0.I2C1, DeviceObj)
	External (_SB_.PCI0.I2C2, DeviceObj)

	Scope (\_SB_.PCI0.I2C1) {
		Device (MUX0) {
			Name (_HID, "PRP0001")
			Name (_DDN, "NXP PCA9544A I2C bus multiplexer")
			Name (_CRS, ResourceTemplate () {
				I2cSerialBus (
					0x70,
					ControllerInitiated,
					I2C_SPEED,
					AddressingMode7Bit,	
					"\\_SB.PCI0.I2C1",
					0x00,
					ResourceConsumer,,)
			})
			Name (_DSD, Package () {
				ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
				Package () {
					Package () {"compatible", "nxp,pca9544"},
					Package () { "i2c-mux-idle-disconnect", 1 },
				}
			})

			Device (CH00) {
				Name (_ADR, 0)
				Device (TOF0) {
					Name (_HID, "PRP0001")
					Name (_DDN, "STMicroelectronics VL53L0X laser rangefinder")
					Name (_CRS, ResourceTemplate () {
						I2cSerialBus (
							0x29,
							ControllerInitiated,
							I2C_SPEED,
							AddressingMode7Bit,
							"\\_SB.PCI0.I2C1.MUX0.CH00",
							0x00,
							ResourceConsumer,,)
					})
					Name (_DSD, Package () {
						ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
						Package () {
							Package () {"compatible", "st,vl53l0x"},
							Package () {"label", "1"},
						}
					})
				}
			}

			Device (CH01) {
				Name (_ADR, 1)
				Device (TOF1) {
					Name (_HID, "PRP0001")
					Name (_DDN, "STMicroelectronics VL53L0X laser rangefinder")
					Name (_CRS, ResourceTemplate () {
						I2cSerialBus (
							0x29,
							ControllerInitiated,
							I2C_SPEED,
							AddressingMode7Bit,
							"\\_SB.PCI0.I2C1.MUX0.CH01",
							0x00,
							ResourceConsumer,,)
					})
					Name (_DSD, Package () {
						ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
						Package () {
							Package () {"compatible", "st,vl53l0x"},
							Package () {"label", "2"},
						}
					})
				}
			}

			Device (CH02) {
				Name (_ADR, 2)
				Device (TOF2) {
					Name (_HID, "PRP0001")
					Name (_DDN, "STMicroelectronics VL53L0X laser rangefinder")
					Name (_CRS, ResourceTemplate () {
						I2cSerialBus (
							0x29,
							ControllerInitiated,
							I2C_SPEED,
							AddressingMode7Bit,
							"\\_SB.PCI0.I2C1.MUX0.CH02",
							0x00,
							ResourceConsumer,,)
					})
					Name (_DSD, Package () {
						ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
						Package () {
							Package () {"compatible", "st,vl53l0x"},
							Package () {"label", "3"},
						}
					})
				}
			}

			Device (CH03) {
				Name (_ADR, 3)
				Device (TOF3) {
					Name (_HID, "PRP0001")
					Name (_DDN, "STMicroelectronics VL53L0X laser rangefinder")
					Name (_CRS, ResourceTemplate () {
						I2cSerialBus (
							0x29,
							ControllerInitiated,
							I2C_SPEED,
							AddressingMode7Bit,
							"\\_SB.PCI0.I2C1.MUX0.CH03",
							0x00,
							ResourceConsumer,,)
					})
					Name (_DSD, Package () {
						ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
						Package () {
							Package () {"compatible", "st,vl53l0x"},
							Package () {"label", "4"},
						}
					})
				}
			}
		}

		Device (MUX1) {
			Name (_HID, "PRP0001")
			Name (_DDN, "NXP PCA9544A I2C bus multiplexer")
			Name (_CRS, ResourceTemplate () {
				I2cSerialBus (
					0x71,
					ControllerInitiated,
					I2C_SPEED,
					AddressingMode7Bit,	
					"\\_SB.PCI0.I2C1",
					0x00,
					ResourceConsumer,,)
			})
			Name (_DSD, Package () {
				ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
				Package () {
					Package () {"compatible", "nxp,pca9544"},
					Package () { "i2c-mux-idle-disconnect", 1 },
				}
			})

			Device (CH00) {
				Name (_ADR, 0)
				Device (TOF0) {
					Name (_HID, "PRP0001")
					Name (_DDN, "STMicroelectronics VL53L0X laser rangefinder")
					Name (_CRS, ResourceTemplate () {
						I2cSerialBus (
							0x29,
							ControllerInitiated,
							I2C_SPEED,
							AddressingMode7Bit,
							"\\_SB.PCI0.I2C1.MUX1.CH00",
							0x00,
							ResourceConsumer,,)
					})
					Name (_DSD, Package () {
						ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
						Package () {
							Package () {"compatible", "st,vl53l0x"},
							Package () {"label", "5"},
						}
					})
				}
			}

			Device (CH01) {
				Name (_ADR, 1)
				Device (TOF1) {
					Name (_HID, "PRP0001")
					Name (_DDN, "STMicroelectronics VL53L0X laser rangefinder")
					Name (_CRS, ResourceTemplate () {
						I2cSerialBus (
							0x29,
							ControllerInitiated,
							I2C_SPEED,
							AddressingMode7Bit,
							"\\_SB.PCI0.I2C1.MUX1.CH01",
							0x00,
							ResourceConsumer,,)
					})
					Name (_DSD, Package () {
						ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
						Package () {
							Package () {"compatible", "st,vl53l0x"},
							Package () {"label", "6"},
						}
					})
				}
			}

			Device (CH02) {
				Name (_ADR, 2)
				Device (TOF2) {
					Name (_HID, "PRP0001")
					Name (_DDN, "STMicroelectronics VL53L0X laser rangefinder")
					Name (_CRS, ResourceTemplate () {
						I2cSerialBus (
							0x29,
							ControllerInitiated,
							I2C_SPEED,
							AddressingMode7Bit,
							"\\_SB.PCI0.I2C1.MUX1.CH02",
							0x00,
							ResourceConsumer,,)
					})
					Name (_DSD, Package () {
						ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
						Package () {
							Package () {"compatible", "st,vl53l0x"},
							Package () {"label", "7"},
						}
					})
				}
			}

			Device (CH03) {
				Name (_ADR, 3)
				Device (TOF3) {
					Name (_HID, "PRP0001")
					Name (_DDN, "STMicroelectronics VL53L0X laser rangefinder")
					Name (_CRS, ResourceTemplate () {
						I2cSerialBus (
							0x29,
							ControllerInitiated,
							I2C_SPEED,
							AddressingMode7Bit,
							"\\_SB.PCI0.I2C1.MUX1.CH03",
							0x00,
							ResourceConsumer,,)
					})
					Name (_DSD, Package () {
						ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
						Package () {
							Package () {"compatible", "st,vl53l0x"},
							Package () {"label", "8"},
						}
					})
				}
			}
		}
		
		Device (MUX2) {
			Name (_HID, "PRP0001")
			Name (_DDN, "NXP PCA9544A I2C bus multiplexer")
			Name (_CRS, ResourceTemplate () {
				I2cSerialBus (
					0x72,
					ControllerInitiated,
					I2C_SPEED,
					AddressingMode7Bit,	
					"\\_SB.PCI0.I2C1",
					0x00,
					ResourceConsumer,,)
			})
			Name (_DSD, Package () {
				ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
				Package () {
					Package () {"compatible", "nxp,pca9544"},
					Package () { "i2c-mux-idle-disconnect", 1 },
				}
			})

			Device (CH00) {
				Name (_ADR, 0)
				Device (TOF0) {
					Name (_HID, "PRP0001")
					Name (_DDN, "STMicroelectronics VL53L0X laser rangefinder")
					Name (_CRS, ResourceTemplate () {
						I2cSerialBus (
							0x29,
							ControllerInitiated,
							I2C_SPEED,
							AddressingMode7Bit,
							"\\_SB.PCI0.I2C1.MUX2.CH00",
							0x00,
							ResourceConsumer,,)
					})
					Name (_DSD, Package () {
						ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
						Package () {
							Package () {"compatible", "st,vl53l0x"},
							Package () {"label", "9"},
						}
					})
				}
			}

			Device (CH01) {
				Name (_ADR, 1)
				Device (TOF1) {
					Name (_HID, "PRP0001")
					Name (_DDN, "STMicroelectronics VL53L0X laser rangefinder")
					Name (_CRS, ResourceTemplate () {
						I2cSerialBus (
							0x29,
							ControllerInitiated,
							I2C_SPEED,
							AddressingMode7Bit,
							"\\_SB.PCI0.I2C1.MUX2.CH01",
							0x00,
							ResourceConsumer,,)
					})
					Name (_DSD, Package () {
						ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
						Package () {
							Package () {"compatible", "st,vl53l0x"},
							Package () {"label", "10"},
						}
					})
				}
			}

			Device (CH02) {
				Name (_ADR, 2)
				Device (TOF2) {
					Name (_HID, "PRP0001")
					Name (_DDN, "STMicroelectronics VL53L0X laser rangefinder")
					Name (_CRS, ResourceTemplate () {
						I2cSerialBus (
							0x29,
							ControllerInitiated,
							I2C_SPEED,
							AddressingMode7Bit,
							"\\_SB.PCI0.I2C1.MUX2.CH02",
							0x00,
							ResourceConsumer,,)
					})
					Name (_DSD, Package () {
						ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
						Package () {
							Package () {"compatible", "st,vl53l0x"},
							Package () {"label", "11"},
						}
					})
				}
			}

			Device (CH03) {
				Name (_ADR, 3)
				Device (TOF3) {
					Name (_HID, "PRP0001")
					Name (_DDN, "STMicroelectronics VL53L0X laser rangefinder")
					Name (_CRS, ResourceTemplate () {
						I2cSerialBus (
							0x29,
							ControllerInitiated,
							I2C_SPEED,
							AddressingMode7Bit,
							"\\_SB.PCI0.I2C1.MUX2.CH03",
							0x00,
							ResourceConsumer,,)
					})
					Name (_DSD, Package () {
						ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
						Package () {
							Package () {"compatible", "st,vl53l0x"},
							Package () {"label", "12"},
						}
					})
				}
			}
		}
	}

	Scope (\_SB_.PCI0.I2C2) {

		Device (GPIO) {
			Name (_HID, "PRP0001")
			Name (_DDN, "NXP PCA9554 IO Expander")
			Name (_CRS, ResourceTemplate () {
				I2cSerialBus (
					0x21,
					ControllerInitiated,
					I2C_SPEED,
					AddressingMode7Bit,
					"\\_SB.PCI0.I2C2",
					0x00,
					ResourceConsumer,,)
			})
			Name (_DSD, Package () {
				ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
				Package () {
					Package () {"compatible", "nxp,pca9554"},
				}
			})
		}

		Device (LEDC) {
			Name (_HID, "PRP0001")
			Name (_DDN, "NXP PCA9635 I2C LED Driver")
			Name (_CRS, ResourceTemplate () {
				I2cSerialBus (
					0x60,
					ControllerInitiated,
					I2C_SPEED,
					AddressingMode7Bit,
					"\\_SB.PCI0.I2C2",
					0x00,
					ResourceConsumer,,)
			})
			Name (_DSD, Package () {
				ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
				Package () {
					Package () {"compatible", "nxp,pca9635"},
					Package () {"nxp,inverted-out", 1},
				},
				ToUUID("dbb8e3e6-5886-4ba6-8795-1319f52a966b"),
				Package () {
					Package () { "led@0", LED0 },
					Package () { "led@1", LED1 },
					Package () { "led@2", LED2 },
					Package () { "led@4", LED4 },
					Package () { "led@5", LED5 },
					Package () { "led@6", LED6 },
					Package () { "led@8", LED8 },
					Package () { "led@9", LED9 },
					Package () { "led@10", LEDA },
					Package () { "led@12", LEDC },
					Package () { "led@13", LEDD },
					Package () { "led@14", LEDE },
				}
			})
			Name (LED0, Package () {
				ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
				Package () {
					Package () { "reg", 0x0 },
					Package () { "label", "arm0:blue" },
				}
			})
			Name (LED1, Package () {
				ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
				Package () {
					Package () { "reg", 0x1 },
					Package () { "label", "arm0:green" },
				}
			})
			Name (LED2, Package () {
				ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
				Package () {
					Package () { "reg", 0x2 },
					Package () { "label", "arm0:red" },
				}
			})
			Name (LED4, Package () {
				ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
				Package () {
					Package () { "reg", 0x4 },
					Package () { "label", "arm1:blue" },
				}
			})
			Name (LED5, Package () {
				ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
				Package () {
					Package () { "reg", 0x5 },
					Package () { "label", "arm1:green" },
				}
			})
			Name (LED6, Package () {
				ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
				Package () {
					Package () { "reg", 0x6 },
					Package () { "label", "arm1:red" },
				}
			})
			Name (LED8, Package () {
				ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
				Package () {
					Package () { "reg", 0x8 },
					Package () { "label", "arm2:blue" },
				}
			})
			Name (LED9, Package () {
				ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
				Package () {
					Package () { "reg", 0x9 },
					Package () { "label", "arm2:green" },
				}
			})
			Name (LEDA, Package () {
				ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
				Package () {
					Package () { "reg", 0xA },
					Package () { "label", "arm2:red" },
				}
			})
			Name (LEDC, Package () {
				ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
				Package () {
					Package () { "reg", 0xC },
					Package () { "label", "arm3:blue" },
				}
			})
			Name (LEDD, Package () {
				ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
				Package () {
					Package () { "reg", 0xD },
					Package () { "label", "arm3:green" },
				}
			})
			Name (LEDE, Package () {
				ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
				Package () {
					Package () { "reg", 0xE },
					Package () { "label", "arm3:red" },
				}
			})
		}
	}
}
