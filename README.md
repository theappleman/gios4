# Gentoo installation overlay/stage4

This is not an overlay in the normal portage sense.
Nor is it a complete stage4.

This is a tarball that is unpacked over a stage3, and with the included scripts
can set up a homogenous gentoo setup.

## Initial setup
Boot into your installation environment; be that live media (e.g. CD, USB)
or an existing Linux distribution.

1. Partition and format your drives
> \# sgdisk -o -a 2 -n 1:34:2047 -t 1:ef02 -c 1:bios-boot -a 2048 \  
> 	-n 2:2048:64M -t 2:8300 -c 2:boot \  
> 	-N 3 -t 3:8e00 -c 3:root \  
> 	-G /dev/sda  

  * Don't mount /boot
2. Download a stage3 tarball  
> \# wget ftp://distfiles.gentoo.org/pub/gentoo/releases/amd64/current-iso/stage3-amd64-\*.tar.bz2

  * browse http://distfiles.gentoo.org/releases
3. Download a portage snapshot
  * Or, prepare an existing gentoo installation to NFS portage
4. Unpack the stage3 and portage tree
5. Unpack the stage3.5 tarball
6. Run the recovery script (you must do this every time you boot into your
  installation environment)  
> \# /mnt/gentoo/recovery

7. Run the setup script under chroot  
> \# chroot /mnt/gentoo /setup

  * Answer easy questions
8. Wait; and verify the installation
9. Reboot!

## FAQ
### Why does setup ask those questions?
Hostnames are special and should be unique. Give it one with a domain name.
The script uses this to setup the hostname, hosts file and the outward mail.
For your mail, this assumes that your second level domain can send mail
from this host unauthenticated.

The boot partition has to be handled in a special way because grub2 needs it
mounted inside the chroot and genkernel mounts /boot while it works.

