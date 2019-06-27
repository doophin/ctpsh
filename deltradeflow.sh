#!/bin/bash
filename=`ls /home/trade/data/backup/`
deltime=`date -d "30 day ago" +"%Y%m%d"`
cur=`du -sh /home/trade/data/backup/|cut -d '/' -f1`
echo "---------" > deltradeflow.log
echo "删除前总容量大小为$cur" >> deltradeflow.log
echo "---------" >>deltradeflow.log
echo "在$deltime之前（30天前）的文件将不会保留,请输入y确认"
read inword
if [ "$inword" == "y" ];then
for n in $filename
do
filedate=`echo $n|cut -c -8`
if [ $filedate -lt $deltime ];then
rm -rf /home/trade/data/backup/$n
echo "$n已删除" >> deltradeflow.log
#else echo "$n will save"
fi
done
echo "---------" >> deltradeflow.log
echo "目前总容量大小为`du -sh /home/trade/data/backup/|cut -d '/' -f1`" >> deltradeflow.log
echo "---------" >> deltradeflow.log
cat deltradeflow.log
else echo "操作终止"
fi
