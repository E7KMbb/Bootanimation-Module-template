find /system -name bootanimation.* > $MODPATH/directory.txt
sed -i 's/\/bootanimation.*//' $MODPATH/directory.txt
directory=$(cat $MODPATH/directory.txt)
if [ -s $MODPATH/directory.txt ]; then
mkdir -p $MODPATH$directory
mv $MODPATH/bootanimation.* $MODPATH$directory
mv $MODPATH/bootanimation-dark.* $MODPATH$directory
else
ui_print "Your bootanimation file does not exist in Magisk's working directory"
abort "您的开机动画文件不存在于Magisk的工作目录"
fi
rm -rf $MODPATH/directory.txt
