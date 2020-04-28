#!/bin/bash

QVER=v4.1.1
KVER=v5.4
RVER=2020.02

./qemu/$QVER/bin/qemu-system-arm -M mcimx6ul-evk -m 512M -smp 1 -no-reboot -nographic \
	-kernel kernel/$KVER/zImage \
	-dtb kernel/$KVER/imx6ul-liteboard.dtb \
	-drive if=sd,file=root/$RVER/rootfs.ext4,format=raw,id=mmc0 \
	-append 'route=172.17.0.3 iface=eth0 rw fsck.repair=yes rootwait root=/dev/mmcblk0 console=ttymxc0'
	#-net nic,model=smc91c111 -net tap
