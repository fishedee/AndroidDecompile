#!/bin/sh

file=$1
if [[ $file == "" ]];then
	echo "请输入apk文件"
	exit 0
fi
echo $file
rm -rf package
rm -rf jar
rm -rf xml
mkdir xml
mkdir jar

java -jar ./util/apktool/apktool_2.3.3.jar d $file -o package -f -s -r
java -jar ./util/AXMLPrinter2/AXMLPrinter2.jar package/AndroidManifest.xml > xml/AndroidManifest.xml
./util/dex2jar/d2j-dex2jar.sh -f -o jar/classes.jar package/classes.dex 
./util/dex2jar/d2j-dex2jar.sh -f -o jar/classes2.jar package/classes2.dex 

#open jd-gui
#java -jar ./util/jd-gui/jd-gui-1.4.0.jar
