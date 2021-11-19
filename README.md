# The meta-drone layer for the Yocto build system

## Description
This repository contains a layer of the Yocto build system, which generates a complete, bootable Linux OS ready to be run on the IRIDIA drone. This system comes preinstalled with:
- ARGoS3 and a plugin for the drone
- Python

## Quick start
We have listed two ways to build the system below. The reccomended method is to use Docker which will ensure a clean and predictable build environment. The only drawback of the Docker method is that you will need to use sudo or to switch user to root to use Docker. However, this is also a requirement for writing the built image to a USB stick.

To get started, you need to decide where you want to build the system for the drone. Keep in mind that while the resulting image will be approximately 1 GB in size, the build itself will require around **50 GB** of free disk space. In the following steps, we assume that the build location is ``/home/`id -un`/yocto-drone`` where `` `id -un` `` will be replaced with the current username.
```bash
# Create a directory for the build system
mkdir /home/`id -un`/yocto-drone
```

We now need to clone the layers for the build system as follows:
```bash
# Switch to the build location
cd /home/`id -un`/yocto-drone
# Clone the Yocto repository
git clone git://git.yoctoproject.org/poky --branch zeus --single-branch
# Clone additional layers inside the Yocto repository
cd poky
git clone git://git.openembedded.org/meta-openembedded --branch zeus --single-branch
git clone git://git.yoctoproject.org/meta-intel.git --branch zeus --single-branch
git clone https://github.com/allsey87/meta-drone.git
```

From this point, you can continue setting up the build environment on either your host system or inside a Docker container. However, unless you are running a cleanly installed and up-to-date version of Ubuntu, we strongly reccomend using the Docker-based method.

### The Docker way
The easiest way to build the system for the drone is to use Docker. Given you have Docker installed, the following command will execute the Dockerfile in this repository and create a Docker image based on Ubuntu 18.04 LTS. The image will contain a user and a group, which match the current user and group. Setting the user and group enables trivial access to the build system from the host.
```bash
sudo docker build -t yocto-drone:latest https://github.com/allsey87/meta-drone.git#:docker \
 --build-arg host_usrid=`id -u` \
 --build-arg host_usrname=`id -un` \
 --build-arg host_grpid=`id -g` \
 --build-arg host_grpname=`id -gn`
```
Once the above command has completed sucessfully, you can run the following command to create a container from the image. Note the two paths given after the `-v` option. The format of this argument is `path/on/host:path/in/container` where `path/on/host` is a directory on your host system and `path/in/container` is a directory inside the Docker container. This command will map the home directory inside the container to a directory called `yocto-drone` under the current users home directory on the host.
```bash
sudo docker create --tty --interactive --volume /home/`id -un`/yocto-drone:/home/`id -un` \
 --name yocto-drone --hostname yocto-drone yocto-drone:latest
```
After executing this command, you should have a new container with the build environment. The following commands will start and attach to that container.

```
sudo docker start yocto-drone
sudo docker attach yocto-drone
```

### The manual way
These instructions assume you are running a clean, up-to-date installation of Ubuntu. If this is not the case, it is advisable to use the Docker solution above. 

The first step is to install the dependencies for the build system:
```bash
sudo apt install gawk wget git-core diffstat unzip texinfo gcc-multilib build-essential chrpath socat cpio python python3 python3-pip python3-pexpect
 xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev pylint3 tmux
```
Change the current directory to the build location
```bash
cd /home/`id -un`/yocto-drone
```
Initialize the build environment
```bash
TEMPLATECONF=meta-drone/conf source oe-init-build-env
```

## Building the image
Regardless of whether you used the Docker method or to manual method, you should now be in a directory called `build`. To build the entire image for the drone, just run the following command:
```bash
bitbake upboard-image-base
```

Occasionally, the build can fail due to internet connectivity issues or due to an oversight in the dependency tree. These issues are normally resolved by just re-executing the command above.

## Copying the image
The most straightforward way to copy a bootable image to the USB stick is to use the `dd` utility available on most Linux systems. If you are using the Docker method, detach from the container before continuing. Before using `dd` to transfer the image, check the kernel messages (via, e.g., `sudo dmesg`) after attaching the USB stick and carefully note the device name of the USB stick. It usually takes the form of `/dev/sdX`. To write the image to the device, execute the following commands replacing `sdX` with the device you noted while inspecting the kernel messages:
```bash
# unmount the device and/or its partitions
umount /dev/sdX*
# write the image to the device
dd if=PATH/TO/poky/build/tmp/deploy/images/up-core/upboard-image-base-up-core.hddimg of=/dev/sdX
# use sync to ensure that all data has been copied
sync
# unmount the device and/or its partitions again (in case they were mounted)
umount /dev/sdX*
```
After completing these steps, you should be able to remove the USB stick from the development PC and to boot it using the Up Core board.

## Booting the image and accessing the console
The easiest and most reliable way to get access to the drone console is by using a USB keyboard and HDMI monitor. These peripherals can be directly connected to the Up Core board.

*WARNING: Do not use the DC power jack while the Up Core is connected to the drone PCB.*

## BIOS configuration
This layer has been tested with the following BIOS version: `UP_CHR1 R1.8 (UCR1BM18) (04/12/2019)`. If this is not the case, it is reccomended that you upgrade your BIOS following the instructions on the [Up Community Wiki](https://github.com/up-board/up-community/wiki/Firmware#uefi-bios-updates).

## Wifi configuration
The wireless connection is controlled using the `iwctl` command. This interactive command makes the process of connecting to a wireless network relatively painless. Once you are connected, the wireless network is saved on the drone under `/var/lib/iwd/SSID.KEY_TYPE`. The network should automatically connect on boot and fetch an IP address using DHCP.


