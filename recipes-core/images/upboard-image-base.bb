DESCRIPTION = "Linux image for UP family boards based on core-image-base"

LICENSE = "GPLv2"

require recipes-core/images/core-image-base.bb
require upboard-image-base.inc

set_local_timezone() {
    ln -sf /usr/share/zoneinfo/Europe/Brussels ${IMAGE_ROOTFS}/etc/localtime
}

set_motd() {
    printf "\nDo you want ants!? Because that's how you get ants!\n" > ${IMAGE_ROOTFS}/etc/motd
}

ROOTFS_POSTPROCESS_COMMAND += " \
    set_local_timezone ; \
    set_motd ; \
 "

