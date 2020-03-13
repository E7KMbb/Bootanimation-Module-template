var_sdk="`grep_prop ro.build.version.sdk`"
if [ "`echo $var_sdk`" -ge "29" ]; then
  mv $MODPATH/bootanimation.zip $MODPATH/system/product/media
  set_perm $MODPATH/system/product/media/bootanimation.zip 0 0 0644 u:object_r:system_file:s0
  else
  mv $MODPATH/bootanimation.zip $MODPATH/system/media
  set_perm $MODPATH/system/media/bootanimation.zip 0 0 0644 u:object_r:system_file:s0
fi