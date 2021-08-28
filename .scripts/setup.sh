#!/bin/bash

su -

# install etc and other configs
for f in ../etc/*; do
	ln "$f" /etc/
done

# install custom systemd services
for f in ./systemd_services/*; do
	ln "$f" /etc/systemd/system
done

ln ./backup/backup.sh /usr/local/solom

# setup groups to allow privilaged dev like wheel, wireshark, docker, libvirt, vboxusers, flutterusers
usermod -a -G lock,wheel,uucp,wireshark,docker,libvirt,vboxusers,flutterusers,plugdev solom

# setup openocd udev rules and plugdev group for platformIO dev board programming
curl -fsSL https://raw.githubusercontent.com/platformio/platformio-core/master/scripts/99-platformio-udev.rules | sudo tee /etc/udev/rules.d/99-platformio-udev.rules
