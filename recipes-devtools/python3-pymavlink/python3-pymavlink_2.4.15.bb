SUMMARY = "Python implementation of the MAVLink protocol"
HOMEPAGE = "https://pypi.org/project/pymavlink/"
LICENSE = "LGPLv3"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=bfccfe952269fff2b407dd11f2f3083b"

SRC_URI[md5sum] = "4237fa17f9d19964e7050b6381187227"
SRC_URI[sha256sum] = "7bf45ad4a250e5e9928c33b5ff56afed4dbc6f99c8f58d05051e2a308150db80"
 
PYPI_PACKAGE = "pymavlink"

inherit setuptools3 pypi

DEPENDS += "python3-future-native"

