SUMMARY = "BuilderBot plug-in for ARGoS3"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://git/src/LICENSE;md5=b176b8e2358647d4c584c9a52b6715fd"

DEPENDS = "argos3 apriltag v4l-utils libjpeg-turbo tbb libiio"
RDEPENDS_${PN} = "argos3 apriltag v4l-utils libjpeg-turbo tbb libiio"

inherit cmake

SRC_URI = "git://github.com/allsey87/argos3-srocs.git;protocol=http"

SRCREV = "${AUTOREV}"

S = "${WORKDIR}/git"

OECMAKE_SOURCEPATH = "${WORKDIR}/git/src"

S = "${WORKDIR}"

FILES_${PN} += "${libdir}/argos3/*"
FILES_${PN} += "${datadir}/argos3"

