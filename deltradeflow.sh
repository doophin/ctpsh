#!/bin/bash
filename=`ls /home/trade/data/backup/`
deltime=`date -d "30 day ago" +"%Y%m%d"`
cur=`du -sh /home/trade/data/backup/|cut -d '/' -f1`
echo "---------" > deltradeflow.log
echo "ɾ��ǰ��������СΪ$cur" >> deltradeflow.log
echo "---------" >>deltradeflow.log
echo "��$deltime֮ǰ��30��ǰ�����ļ������ᱣ��,������yȷ��"
read inword
if [ "$inword" == "y" ];then
for n in $filename
do
filedate=`echo $n|cut -c -8`
if [ $filedate -lt $deltime ];then
rm -rf /home/trade/data/backup/$n
echo "$n��ɾ��" >> deltradeflow.log
#else echo "$n will save"
fi
done
echo "---------" >> deltradeflow.log
echo "Ŀǰ��������СΪ`du -sh /home/trade/data/backup/|cut -d '/' -f1`" >> deltradeflow.log
echo "---------" >> deltradeflow.log
cat deltradeflow.log
else echo "������ֹ"
fi
