/*
 * Description of the hardware provided by the drone PCB
 */
#define I2C_SPEED 100000

DefinitionBlock ("", "SSDT", 5, "IRIDIA", "Drone", 1)
{
	External (_SB_.PCI0.I2C1, DeviceObj)
	External (_SB_.PCI0.I2C2, DeviceObj)
	
	Scope (\_SB_.PCI0.I2C1) {

		Device (USB0) {
			Name (_HID, "PRP0001")
			Name (_DDN, "Microchip USB3503 HSIC High-Speed Hub")
			Name (_CRS, ResourceTemplate () {
				I2cSerialBus (
					0x08,
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
					Package () {"compatible", "smsc,usb3503"},
				}
			})
		}
		
		Device (MUX0)
		{
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
							"^CH00",
							0x00,
							ResourceConsumer,,)
					})
					Name (_DSD, Package () {
						ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
						Package () {
							Package () {"compatible", "st,vl53l0x"},
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
							"^CH01",
							0x00,
							ResourceConsumer,,)
					})
					Name (_DSD, Package () {
						ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
						Package () {
							Package () {"compatible", "st,vl53l0x"},
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
							"^CH02",
							0x00,
							ResourceConsumer,,)
					})
					Name (_DSD, Package () {
						ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
						Package () {
							Package () {"compatible", "st,vl53l0x"},
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
							"^CH03",
							0x00,
							ResourceConsumer,,)
					})
					Name (_DSD, Package () {
						ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
						Package () {
							Package () {"compatible", "st,vl53l0x"},
						}
					})
				}
			}
		}

		Device (MUX1)
		{
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
							"^CH00",
							0x00,
							ResourceConsumer,,)
					})
					Name (_DSD, Package () {
						ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
						Package () {
							Package () {"compatible", "st,vl53l0x"},
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
							"^CH01",
							0x00,
							ResourceConsumer,,)
					})
					Name (_DSD, Package () {
						ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
						Package () {
							Package () {"compatible", "st,vl53l0x"},
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
							"^CH02",
							0x00,
							ResourceConsumer,,)
					})
					Name (_DSD, Package () {
						ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
						Package () {
							Package () {"compatible", "st,vl53l0x"},
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
							"^CH03",
							0x00,
							ResourceConsumer,,)
					})
					Name (_DSD, Package () {
						ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
						Package () {
							Package () {"compatible", "st,vl53l0x"},
						}
					})
				}
			}
		}
		
		Device (MUX2)
		{
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
							"^CH00",
							0x00,
							ResourceConsumer,,)
					})
					Name (_DSD, Package () {
						ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
						Package () {
							Package () {"compatible", "st,vl53l0x"},
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
							"^CH01",
							0x00,
							ResourceConsumer,,)
					})
					Name (_DSD, Package () {
						ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
						Package () {
							Package () {"compatible", "st,vl53l0x"},
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
							"^CH02",
							0x00,
							ResourceConsumer,,)
					})
					Name (_DSD, Package () {
						ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
						Package () {
							Package () {"compatible", "st,vl53l0x"},
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
							"^CH03",
							0x00,
							ResourceConsumer,,)
					})
					Name (_DSD, Package () {
						ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
						Package () {
							Package () {"compatible", "st,vl53l0x"},
						}
					})
				}
			}
		}
		
	}

	Scope (\_SB_.PCI0.I2C2) {

		Device (IOE0) {
			Name (_HID, "PRP0001")
			Name (_DDN, "NXP PCA9554 IO Expander")
			Name (_CRS, ResourceTemplate () {
				I2cSerialBus (
					0x20,
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

		Device (IOE1) {
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

		Device (USB1) {
			Name (_HID, "PRP0001")
			Name (_DDN, "Microchip USB3503 HSIC High-Speed Hub")
			Name (_CRS, ResourceTemplate () {
				I2cSerialBus (
					0x08,
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
					Package () {"compatible", "smsc,usb3503"},
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
				}
			})
		}
	}
}
