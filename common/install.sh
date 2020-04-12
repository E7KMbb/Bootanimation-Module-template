if [ -e /system/product/media/bootanimation.zip ]; then
#一般设备Android10开机目录
  mv $MODPATH/bootanimation.zip $MODPATH/system/product/media
  set_perm $MODPATH/system/product/media/bootanimation.zip 0 0 0644 u:object_r:system_file:s0
  else
  if [ -e /system/media/bootanimation.zip ]; then
  #一般设备Android10以下开机动画目录
    mv $MODPATH/bootanimation.zip $MODPATH/system/media
    set_perm $MODPATH/system/media/bootanimation.zip 0 0 0644 u:object_r:system_file:s0
    else
    if [ -e /system/media/theme/bootup/bootanimation.zip ]; then
    #努比亚开机动画目录
      mv $MODPATH/bootanimation.zip $MODPATH/system/media/theme/bootup
      set_perm $MODPATH/system/media/theme/bootup/bootanimation.zip 0 0 0644 u:object_r:system_file:s0
        else
          if [ -e /system/media/bootanimation.qmg ]; then
          #三星开机动画目录
            mv $MODPATH/bootanimation.qmg $MODPATH/system/media
            set_perm $MODPATH/system/media/bootanimation.qmg 0 0 0644 u:object_r:system_file:s0
            else
             if [ -e /system/media/bootanimation/bootanimation.zip ]; then
             #OPPO开机动画目录
             mv $MODPATH/bootanimation.zip $MODPATH/system/media/bootanimation
             set_perm $MODPATH/system/media/bootanimation/bootanimation.zip 0 0 0644 u:object_r:system_file:s0
             else
             ui_print "不支持你的设备！"
             exit 1
           fi
        fi
      fi
   fi
fi
rm -rf \
$MODPATH/system/product/media/Placeholder $MODPATH/system/media/Placeholder $MODPATH/system/media/theme/bootup/Placeholder $MODPATH/system/media/bootanimation/Placeholder $MODPATH/product \