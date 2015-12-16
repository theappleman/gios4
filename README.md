# Gentoo Self-Hosting Installation Scripts

[Source](https://github.com/theappleman/gios4)

This is not an overlay in the normal portage sense.
Nor is it a complete stage4.

[This](https://github.com/theappleman/gios4/archive/master.tar.gz)
is a tarball that is unpacked over
a stage3, and with the included scripts can setup gentoo in under 5 hours.

## Documentation
* [Quick start](https://applehq.eu/projects/gentoo-ios4)

## Downloads
Clean tarballs that try to match the latest branches. To create your own,
see _git-archive(1)_:

* [master](https://github.com/theappleman/gios4/archive/master.tar.gz)
* [master](https://github.com/theappleman/gios4/archive/next.tar.gz)

## Initial setup
0. Boot into your installation environment; be that live media (e.g. CD, USB)
or an existing Linux distribution.
  * Recommended: [System Rescue CD](http:sysresccd.org)
1. Partition and format your drives
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

2. Unpack the installation script tarball
3. Download a stage3 tarball  
> \# /mnt/gentoo/recovery unpack

4. Run the recovery script (you must do this every time you boot into your
  installation environment)  
> \# /mnt/gentoo/recovery prepare

5. Setup a portage tree
  * sync, or download a snapshot
> \# /mnt/gentoo/recovery sync

6. Run the setup script under chroot  
> \# /mnt/gentoo/recovery setup

  * Answer easy questions
7. Wait; and verify the installation
8. Reboot!

