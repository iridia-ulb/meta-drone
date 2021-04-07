SUMMARY = "Python bindings for the V4L2 userspace API"
HOMEPAGE = "https://pypi.org/project/v4l2/"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"

SRC_URI[md5sum] = "63ad6c62d907d0a9d8efad9a66357451"
SRC_URI[sha256sum] = "0d8f31f9d554ded4d0b50a31a7be5590b861df9e1ba256ee757e1c09175dd4a2"

PYPI_PACKAGE = "v4l2"

inherit pypi setuptools3

#RDEPENDS_${PN} += " \
#    python3-psutil \
#"
