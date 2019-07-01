#!/bin/sh -x

devicetree="__DTB_XZ_B64"

dtb_uuencoded="$(mktemp switchpwm.XXXXXX)"
dtb_xz="$(mktemp switchpwm.XXXXXX)"


mkdir /tmp/boot
mount -t vfat /dev/mmcblk0p1 /tmp/boot

if [ ! -e /tmp/boot/suniv-f1c500s-miyoo.dtb.orig ]; then
    cp /tmp/boot/suniv-f1c500s-miyoo.dtb /tmp/boot/suniv-f1c500s-miyoo.dtb.orig
fi

printf "$devicetree" >"$dtb_uuencoded"
uudecode -o "$dtb_xz" "$dtb_uuencoded"
xz -dc "$dtb_xz" >/tmp/boot/suniv-f1c500s-miyoo.dtb

rm "$dtb_uuencoded" "$dtb_xz"

umount /tmp/boot

printf 'Device tree copied successfully, reboot for changes to take effect\n'
sleep 5
