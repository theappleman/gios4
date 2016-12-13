# Gentoo Self-Hosting Installation Scripts

[Source](https://github.com/theappleman/gshis)

This is not an overlay in the normal portage sense.
Nor is it a complete stage4.

[This](https://github.com/theappleman/gshis/archive/master.tar.gz)
is a tarball that is unpacked over
a stage3, and with the included scripts can setup gentoo in under 5 hours.

## Documentation
* [Quick start](https://applehq.eu/projects/gshis)

## Downloads
Clean tarballs that try to match the latest branches. To create your own,
see _git-archive(1)_:

* [master](https://github.com/theappleman/gshis/archive/master.tar.gz)
* [next](https://github.com/theappleman/gshis/archive/next.tar.gz)

## Initial setup
0. Boot into your installation environment; be that live media (e.g. CD, USB)
or an existing Linux distribution.
  * Recommended: [System Rescue CD](http:sysresccd.org)
1. (GPT/BIOS) Partition and format your drives
> \# sgdisk -o -a 2 -n 1:34:2047 -t 1:ef02 -c 1:bios-boot -a 2048 \  
> 	-n 2:2048:64M -t 2:8300 -c 2:boot \  
> 	-n 3:64M:512M -t 3:8200 -c 3:swap \  
> 	-N 4 -t 4:8300 -c 4:root \  
> 	-G /dev/sda  
> \# mke2fs -Tsmall /dev/sda2  
> \# mkswap /dev/sda3; swapon /dev/sda3  
> \# mkfs.btrfs /dev/sda4  
> \# mount /dev/sda4 /mnt/gentoo  
> \# mount /dev/sda2 /mnt/gentoo/boot

2. (GPT/UEFI) Partition and format your drives
> \# sgdisk -o -n 1:2048:512M -t 1:ef00 -c 1:system \  
> 	-n 2:512M:1024M -t 2:8200 -c 2:swap \  
> 	-N 3 -t 3:8300 -c 3:root \  
> 	-G /dev/sda  
> \# mkfs.vfat -F32 /dev/sda1  
> \# mkswap /dev/sda2; swapon /dev/sda2  
> \# mkfs.btrfs /dev/sda3  
> \# mount /dev/sda3 /mnt/gentoo  
> \# mkdir -p /mnt/gentoo/boot/EFI  
> \# mount /dev/sda1 /mnt/gentoo/boot/EFI

3. Unpack the installation script tarball
4. Download a stage3 tarball  
> \# /mnt/gentoo/recovery unpack

5. Run the recovery script (you must do this every time you boot into your
  installation environment)  
> \# /mnt/gentoo/recovery prepare

6. Setup a portage tree  
> \# /mnt/gentoo/recovery web-sync

  * if the stage has rsync, you can `sync`. If you don't have `emerge-webrsync`, the scripts
    download a portage snapshot
7. Run the setup script under chroot  
> \# /mnt/gentoo/recovery setup

  * If you need to install kernel sources, use the '-g gentoo-sources' flag after adding 'freedist' to your licences:
  * ```# tee -a /mnt/gentoo/etc/portage/make.conf<<<'ACCEPT_LICENSE="$ACCEPT_LICENSE freedist"'```
  * ```# /mnt/gentoo/recovery setup -g gentoo-sources```
8. Wait; and verify the installation
  * Build a kernel and prepare a bootloader
9. Reboot!

