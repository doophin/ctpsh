#!/bin/bash
filename=`ls /home/trade/tools/settlement_tools/backup_sett_data/backup/`
deltime=`date -d "30 day ago" +"%Y%m%d"`
cur=`du -sh /home/trade/tools/settlement_tools/backup_sett_data/backup/|cut -d '/' -f1`
echo "---------" > delzb.log
echo "ɾ��ǰ��������СΪ$cur" >> delzb.log
echo "---------" >>delzb.log
echo "��$deltime֮ǰ��30��ǰ�����ļ������ᱣ��,������yȷ��"
read inword
if [ "$inword" == "y" ];then
for n in $filename
do
filedate=`echo $n|cut -c -8`
if [ $filedate -lt $deltime ];then
rm -rf /home/trade/tools/settlement_tools/backup_sett_data/backup/$n
echo "$n��ɾ��" >> delzb.log
#else echo "$n will save"
fi
done
echo "---------" >> delzb.log
echo "Ŀǰ��������СΪ`du -sh /home/trade/tools/settlement_tools/backup_sett_data/backup/|cut -d '/' -f1`" >> delzb.log
echo "---------" >> delzb.log
cat delzb.log
else echo "������ֹ"
fi
