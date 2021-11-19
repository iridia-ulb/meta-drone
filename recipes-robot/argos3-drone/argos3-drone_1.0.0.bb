SUMMARY = "Drone plug-in for ARGoS3"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

DEPENDS = "argos3 apriltag v4l-utils libjpeg-turbo tbb libiio"
RDEPENDS_${PN} = "argos3 apriltag v4l-utils libjpeg-turbo tbb libiio"

inherit cmake

SRC_URI = "git://github.com/iridia-ulb/argos3-drone.git;protocol=http"

SRCREV = "${AUTOREV}"

S = "${WORKDIR}/git"

OECMAKE_SOURCEPATH = "${S}/src"

EXTRA_OECMAKE += "-DARGOS_BUILD_FOR=drone"

# Since the base package name (BPN) is argos3-drone and not argos3, Bitbake will
# not automatically collect the files that we install inside ${libdir}/argos3,
# ${datadir}/argos3, and ${includedir}/argos3.
FILES_${PN} += "${libdir}/argos3/*"
FILES_${PN} += "${datadir}/argos3/*"
FILES_${PN} += "${includedir}/argos3/*"

