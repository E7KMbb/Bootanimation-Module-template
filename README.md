# Bootanimation Module template
### 依然的爱
基础模板使用了xda大佬Zackptg5的模板
https://github.com/Zackptg5/MMT-Extended

### 介绍
本模板在原版的基础上修改，用于刷入开机动画
本模板兼容Android10的/system/product/media 
也兼容10以下版本的/system/media

### 使用方法
仅需要把开机动画重命名为bootanimation.zip放置在模板的根目录打包刷入即可

### 注意
本模板可能不支持MIUI

### 实现原理
```
var_sdk="`grep_prop ro.build.version.sdk`"
if [ "`echo $var_sdk`" -ge "29" ]; then
  mv $MODPATH/bootanimation.zip $MODPATH/system/product/media
  set_perm $MODPATH/system/product/media/bootanimation.zip 0 0 0644 u:object_r:system_file:s0
  else
  mv $MODPATH/bootanimation.zip $MODPATH/system/media
  set_perm $MODPATH/system/media/bootanimation.zip 0 0 0644 u:object_r:system_file:s0
fi
```
