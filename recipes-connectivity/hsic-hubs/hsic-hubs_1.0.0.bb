inherit systemd

SUMMARY = "Continuously enable the HSIC hubs until they connect"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = " \
   file://service.sh \
   file://hsic-hubs.service \
"

SRCREV = "${AUTOREV}"

SYSTEMD_SERVICE_${PN} = "hsic-hubs.service"

S = "${WORKDIR}"

do_install() {
   install -d ${D}${libdir}/hsic-hubs/
   install -m 0644 ${S}/service.sh ${D}${libdir}/hsic-hubs/
   install -d ${D}${systemd_unitdir}/system/
   install -m 0644 ${S}/hsic-hubs.service ${D}${systemd_unitdir}/system/
}

FILES_${PN} = "${libdir}/hsic-hubs/service.sh ${systemd_unitdir}/system/hsic-hubs.service"

