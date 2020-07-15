FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += " \
	file://Khazad-dum.psk \
	file://main.conf \
"

do_configure_wireless() {
    install -d ${D}${localstatedir}/lib/iwd/
    install -m 0644 ${WORKDIR}/Khazad-dum.psk ${D}${localstatedir}/lib/iwd/
    install -d ${D}${sysconfdir}/iwd/      
    install -m 0644 ${WORKDIR}/main.conf ${D}${sysconfdir}/iwd/
}
addtask configure_wireless after do_install_append

#FILES_${PN}_append += " \
#	${sysconfdir}/iwd/* \
#	${localstatedir}/lib/iwd/* \
#"
