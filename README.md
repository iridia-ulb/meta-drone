# The meta-drone layer for the Yocto build system

## Description
The [meta-drone repository](https://github.com/iridia-ulb/meta-drone) contains a layer for the Yocto build system, which generates a complete, bootable Linux OS ready to be run on the IRIDIA drone. This system comes preinstalled with:
- ARGoS3 and a plugin for the drone
- Python3

## Quick start
To ensure reproducible builds on systems with varying configurations, the following steps will explain how to create an image using [Docker](https://docs.docker.com/get-docker/). Note that you will probably need to use sudo or to switch to a root user to install Docker or to create and run its containers.

To get started, you first need to decide where you want to build the system for the drone. Keep in mind that while the resulting image will be approximately 1 GB in size, the build system itself will require around **50 GB** of free disk space. The following steps will set up the build system. These steps assume that the build location is `/home/$(id -un)/yocto-drone` where `$(id -un)` will be replaced with the current username.
```sh
# Create a directory for the build system
mkdir /home/$(id -un)/yocto-drone
```

We now need to clone the layers for the build system as follows:
```sh
# Switch to the build location
cd /home/$(id -un)/yocto-drone
# Clone the Yocto repository
git clone git://git.yoctoproject.org/poky --branch zeus --single-branch
# Clone additional layers inside the Yocto repository
cd poky
git clone git://git.openembedded.org/meta-openembedded --branch zeus --single-branch
git clone git://git.yoctoproject.org/meta-intel.git --branch zeus --single-branch
git clone https://github.com/iridia-ulb/meta-drone.git
```

### Create the Docker image
The following command will execute the Dockerfile in the meta-drone repository and create a Docker image based on Ubuntu 18.04 LTS. The image will contain a user and a group, which match the identifiers of current user and group. Setting the user and group in this way enables trivial access to the build system from the host.
```sh
sudo docker build -t yocto-drone:latest https://github.com/iridia-ulb/meta-drone.git#:docker \
 --build-arg host_user_id=$(id -u) \
 --build-arg host_group_id=$(id -g)
```

### Create the Docker container
Once the above command has completed successfully, you can run the following command to create a container from the image. Note the two paths given after the `-v` option. The format of this argument is `path/on/host:path/in/container` where `path/on/host` is a directory on your host system and `path/in/container` is a directory inside the Docker container. This command will map the home directory inside the container to a directory called `yocto-drone` under the current user's home directory on the host.
```sh
sudo docker create --tty --interactive --volume /home/$(id -un)/yocto-drone:/home/developer \
 --name yocto-drone --hostname yocto-drone yocto-drone:latest
```
After executing this command, you should have a new container with the build environment. The following commands will start and attach to that container.

```sh
sudo docker start yocto-drone
sudo docker attach yocto-drone
```

### Start the build
After following the steps above, you should have a terminal that is attached to the docker container and be inside a directory called `build`. To build the entire image for the drone, just run the following command:
```sh
bitbake upboard-image-base
```

Occasionally, the build can fail due to internet connectivity issues or due to an oversight in the dependency tree. These issues are normally resolved by just re-executing the command above.

## Copying the image
The most straightforward way to copy a bootable image to the USB stick is to use the `dd` utility available on most Linux systems. Before using `dd` to transfer the image, check the kernel messages (via, e.g., `sudo dmesg`) after attaching the USB stick and carefully note the device name of the USB stick. It usually takes the form of `/dev/sdX`. To write the image to the device, execute the following commands replacing `sdX` with the device you noted while inspecting the kernel messages:
```sh
# unmount the device and/or its partitions
umount /dev/sdX*
# write the image to the device
dd if=PATH/TO/poky/build/tmp/deploy/images/up-core/upboard-image-base-up-core.hddimg of=/dev/sdX
# run sync to ensure that all data has been copied
sync
# unmount the device and/or its partitions again (in case they were mounted)
umount /dev/sdX*
```

## Booting the image and accessing the console
The easiest and most reliable way to get access to the drone console is by using a USB keyboard and HDMI monitor. These peripherals can be directly connected to the Up Core board.

*WARNING: Do not use the DC power jack while the Up Core is connected to the drone PCB.*

## Installation
After testing and debugging is complete, it is recommended to install the operating system onto the internal flash storage. This can be achieved by booting from the USB stick, selecting the install option from the boot menu, and accepting all the default options/prompts. If the drone is not booting from the USB stick and is instead booting an old installation, try to change the boot order in the BIOS. By installing the OS and booting from the internal storage, an additional USB port is made available which, for example, could be used to save footage from the drone camera system.

## BIOS configuration
This layer has been tested with the following BIOS version: `UP_CHR1 R1.8 (UCR1BM18) (04/12/2019)`. If this is not the current BIOS version, it is recommended that you downgrade/upgrade your BIOS following the instructions on the [Up Community Wiki](https://github.com/up-board/up-community/wiki/Firmware#uefi-bios-updates).

## Wifi configuration
The wireless connection is controlled using the `iwctl` command. This interactive command makes the process of connecting to a wireless network relatively painless. Once you are connected, the wireless network is saved on the drone under `/var/lib/iwd/SSID.KEY_TYPE`. By default, the drone will connect to a network with the name `MergeableNervousSystem` using PSK authentication with the password `uprising`. The network should automatically connect on boot and fetch an IP address using DHCP.


