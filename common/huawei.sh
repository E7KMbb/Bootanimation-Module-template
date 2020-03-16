if [ -e $MODPATH/bootanim.mp4 ]; then
mv $MODPATH/bootanim.mp4 $MODPATH/product/etc/media
set_perm $MODPATH/product/etc/media/bootanimation.mp4 0 0 0644 u:object_r:system_file:s0
else
cp /product/etc/media/vbootanim.conf $MODPATH/system/product/etc/media
sed -i "s/VIDEO_PLAY_SUPPORT=1/VIDEO_PLAY_SUPPORT=0/g" $MODPATH/system/product/etc/media/vbootanim.conf
mv $MODPATH/bootanimation.zip $MODPATH/product/etc/media
set_perm $MODPATH/product/etc/media/bootanimation.zip 0 0 0644 u:object_r:system_file:s0
fi
rm -rf \
$MODPATH/product/etc/media/Placeholder $MODPATH/system \