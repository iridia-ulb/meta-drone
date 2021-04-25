DESCRIPTION = "Linux image for UP family boards based on core-image-base"

LICENSE = "GPLv2"

require recipes-core/images/core-image-base.bb

IMAGE_FEATURES += "package-management"

IMAGE_INSTALL += "kernel-modules"
IMAGE_INSTALL += "dmidecode"
IMAGE_INSTALL += "python3 python3-pip"
IMAGE_INSTALL += "openssh openssh-keygen openssh-sftp-server"
IMAGE_INSTALL += "i2c-tools"
IMAGE_INSTALL += "file parted dosfstools"
IMAGE_INSTALL += "picocom yavta mjpg-streamer"
IMAGE_INSTALL += "haveged"
IMAGE_INSTALL += "argos3-srocs"
IMAGE_INSTALL_append += " systemd"
IMAGE_INSTALL_append += " fernbedienung"
IMAGE_INSTALL_append += " iw iwd"

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

