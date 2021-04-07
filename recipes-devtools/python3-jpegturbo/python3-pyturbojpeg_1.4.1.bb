SUMMARY = "Python bindings for libjpeg-turbo"
HOMEPAGE = "https://pypi.org/project/v4l2/"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI[md5sum] = "df42ecc72debd4aef20537fd8d8cd512"
SRC_URI[sha256sum] = "09688a93331281e566569b4d313e1d1a058ca32ccae1a2473847a10e4ca2f2a7"

DEPENDS = "libjpeg-turbo"
RDEPENDS_${PN} = "libjpeg-turbo python3-numpy"

PYPI_PACKAGE = "PyTurboJPEG"

inherit pypi setuptools3


