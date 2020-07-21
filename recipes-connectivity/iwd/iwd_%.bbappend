FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += " \
	file://Khazad-dum.psk \
	file://main.conf \
"

fakeroot do_configure_wireless() {
    install -d ${D}${localstatedir}/lib/iwd/
    install ${WORKDIR}/Khazad-dum.psk ${D}${localstatedir}/lib/iwd/
    install -d ${D}${sysconfdir}/iwd/      
    install ${WORKDIR}/main.conf ${D}${sysconfdir}/iwd/
}
do_configure_wireless[depends] += "virtual/fakeroot-native:do_populate_sysroot"

addtask configure_wireless after do_install before do_package

