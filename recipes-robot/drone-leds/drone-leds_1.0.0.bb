inherit systemd

SUMMARY = "Drone LEDs"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
RDEPENDS_${PN} = "python3"

SRC_URI = " \
   file://service.py \
   file://drone-leds.service \
"

SRCREV = "${AUTOREV}"

SYSTEMD_SERVICE_${PN} = "drone-leds.service"

S = "${WORKDIR}"

do_install() {
   install -d ${D}${libdir}/drone-leds/
   install -m 0644 ${S}/service.py ${D}${libdir}/drone-leds/
   install -d ${D}${systemd_unitdir}/system/
   install -m 0644 ${S}/drone-leds.service ${D}${systemd_unitdir}/system/
}

FILES_${PN} = "${libdir}/drone-leds/service.py ${systemd_unitdir}/system/drone-leds.service"

