IMAGE_FEATURES += "package-management"

IMAGE_INSTALL += "kernel-modules"
IMAGE_INSTALL += "dmidecode"
IMAGE_INSTALL += "python3 python3-pip"
IMAGE_INSTALL += "openssh openssh-keygen openssh-sftp-server"
IMAGE_INSTALL += "i2c-tools"
IMAGE_INSTALL += "file parted dosfstools"
IMAGE_INSTALL += "picocom"

DISTRO_FEATURES_append = " wifi"
IMAGE_INSTALL_append += " systemd"
IMAGE_INSTALL_append += " iw iwd"
