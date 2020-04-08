#!/bin/bash

QVER=v4.2.0
KVER=v5.4.8
RVER=2020.02

#./qemu/$QVER/bin/qemu-system-aarch64 -M virt -m 128M -smp 2 -no-reboot -nographic -cpu cortex-a57 \
#	-kernel kernel/v5.1/Image \
#	-initrd root/2016.05/rootfs.cpio.gz \
#	-append 'route=172.17.0.5 root=/dev/ram0 earlycon console=ttyAMA0' \
#	#-net nic,model=virtio -net tap -device virtio-net-device,netdev=net0,mac=00:27:b2:6a:86:cc -netdev tap,id=net0

./qemu/$QVER/bin/qemu-system-arm \
-M mcimx6ul-evk \
-m 512M \
-dtb kernel/$KVER/imx6ul-14x14-evk.dtb \
-kernel kernel/$KVER/zImage \
-drive  file=root/$RVER/rootfs.ext4,format=raw,id=mysdcard -device sd-card,drive=mysdcard \
-append "console=ttymxc0,115200 rootfstype=ext4 root=/dev/mmcblk1 rw rootwait init=/sbin/init  loglevel=8" \
-nographic -serial mon:stdio \
-nic user

