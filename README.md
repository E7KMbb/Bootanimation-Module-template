# Bootanimation Module template
### 依然的爱
基础模板使用了xda大佬Zackptg5的模板
https://github.com/Zackptg5/MMT-Extended

### 介绍
本模板在原版的基础上修改，用于刷入开机动画
本模板兼容所有开机动画文件在Magisk工作目录(/system)的系统

### 使用方法
仅需要把开机动画重命名为bootanimation.zip放置在模板的根目录打包刷入即可
黑暗模式下的开机动画需要重命名为bootanimation-dark.zip

如果你是三星设备，需要支持三星的开机动画文件才能使用需将文件重命名为bootanimation.qmg放置根目录

### 注意
本模板不是转换器，你的设备支持哪个种格式它就支持哪种格式
本模板可能不支持MIUI
Magisk模块工作原理不支持一些特殊机型的目录
暂不支持LG(因为我还没搞懂LG开机动画的工作原理)
> 索尼 /ome/media/bootanimation.zip

> coloros /oppo_product/media/bootanimation/bootanimation.zip

### 警告
你可以star这个项目，但请不要fork它，因为这是一个模板仓库您可以use this template，这将在你的账户下生成一个库

### 实现原理
install.sh
```
find /system -name bootanimation.* > $MODPATH/directory.txt
sed -i 's/\/bootanimation.*//' $MODPATH/directory.txt
directory=$(cat $MODPATH/directory.txt)
if [ -s $MODPATH/directory.txt ]; then
mkdir -p $MODPATH$directory
mv $MODPATH/bootanimation.* $MODPATH$directory
else
abort "您的开机动画文件不存在于Magisk的工作目录"
fi
rm -rf $MODPATH/directory.txt

```