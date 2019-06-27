#!/bin/bash
filename=`ls /home/trade/tools/settlement_tools/backup_sett_data/backup/`
deltime=`date -d "30 day ago" +"%Y%m%d"`
cur=`du -sh /home/trade/tools/settlement_tools/backup_sett_data/backup/|cut -d '/' -f1`
echo "---------" > delzb.log
echo "删除前总容量大小为$cur" >> delzb.log
echo "---------" >>delzb.log
echo "在$deltime之前（30天前）的文件将不会保留,请输入y确认"
read inword
if [ "$inword" == "y" ];then
for n in $filename
do
filedate=`echo $n|cut -c -8`
if [ $filedate -lt $deltime ];then
rm -rf /home/trade/tools/settlement_tools/backup_sett_data/backup/$n
echo "$n已删除" >> delzb.log
#else echo "$n will save"
fi
done
echo "---------" >> delzb.log
echo "目前总容量大小为`du -sh /home/trade/tools/settlement_tools/backup_sett_data/backup/|cut -d '/' -f1`" >> delzb.log
echo "---------" >> delzb.log
cat delzb.log
else echo "操作终止"
fi
