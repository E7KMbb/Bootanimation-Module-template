# Bootanimation Module template
### 依然的爱
基础模板使用了xda大佬Zackptg5的模板
https://github.com/Zackptg5/MMT-Extended

### 介绍
本模板在原版的基础上修改，用于刷入开机动画
本模板兼容所有的设备，所有Android版本

### 使用方法
仅需要把开机动画重命名为bootanimation.zip放置在模板的根目录打包刷入即可

如果你需要输入的设备为华为那么将支持mp4格式仅需将你想作为开机动画的mp4文件重命名为bootanimation.mp4即可
当然，因为华为设备同时也支持bootanimation.zip方案所以同样适用

如果你是三星设备，需要支持三星的开机动画文件才能使用需将文件重命名为bootanimation.qmg放置根目录

### 注意
本模板不是转换器，你的设备支持哪个种格式它就支持哪种格式
本模板可能不支持MIUI
Magisk模块工作原理不支持一些特殊机型的目录
> 索尼 /ome/media/bootanimation.zip
> coloros /oppo_product/media/bootanimation/bootanimation.zip

### 警告
你可以star这个项目，但请不要fork它，因为这是一个模板仓库您可以use this template，这将在你的账户下生成一个库

### 实现原理
install.sh
```
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
```

huawei.sh
```
if [ -e $MODPATH/bootanim.mp4 ]; then
mv $MODPATH/bootanim.mp4 $MODPATH/product/etc/media
set_perm $MODPATH/product/etc/media/bootanimation.mp4 0 0 0644 u:object_r:system_file:s0
else
cp /product/etc/media/vbootanim.conf $MODPATH/system/product/etc/media
sed -i "s/VIDEO_PLAY_SUPPORT=1/VIDEO_PLAY_SUPPORT=0/g" $MODPATH/system/product/etc/media/vbootanim.conf
mv $MODPATH/bootanimation.zip $MODPATH/product/etc/media
set_perm $MODPATH/product/etc/media/bootanimation.zip 0 0 0644 u:object_r:system_file:s0
fi
```
