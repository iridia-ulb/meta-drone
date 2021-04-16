FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

PR := "${PR}.1"

COMPATIBLE_MACHINE_up-core = "up-core"

SRC_URI += " \
	file://cryptography.cfg \
	file://iio.cfg \
	file://i2c.cfg \
	file://usb.cfg \
	file://of.cfg \
	file://usb-no-autosuspend.cfg \
	file://0001-pca954x-Use-driver-from-upstream-kernel.patch \
	file://0002-uvc-Hack-the-bandwidth-calculation-for-compressed-fo.patch \
	file://0003-vl53l0x-Add-iio-trigger-functionality.patch \
	file://0004-usb3503-Use-driver-from-upstream-kernel.patch \
	file://0005-usb3503-Disable-regmap-configuration-during-connect.patch \
"

# replace these SRCREVs with the real commit ids once you've had
# the appropriate changes committed to the upstream linux-yocto repo
SRCREV_machine_pn-linux-yocto_up-board ?= "${AUTOREV}"
SRCREV_meta_pn-linux-yocto_up-board ?= "${AUTOREV}"

#Remove the following line once AUTOREV is locked to a certain SRCREV
KERNEL_VERSION_SANITY_SKIP = "1"
