#!/bin/bash
filename=`ls -F /home/trade/tmdb/flow/|grep '/$'`
deltime=`date -d "30 day ago" +"%Y%m%d"`
cur=`du -sh /home/trade/tmdb/flow|cut -d '/' -f1`
echo "---------" > deltmdbflow.log
echo "ɾ��ǰ��������СΪ$cur" >> deltmdbflow.log
echo "---------" >> deltmdbflow.log
echo "��$deltime֮ǰ��30��ǰ�����ļ������ᱣ��,������yȷ��"
read inword
if [ "$inword" == "y" ];then
for m in $filename
do
n=`echo ${m:0:8}`
if [ $n -lt $deltime ];then
rm -rf /home/trade/tmdb/flow/$n
echo "$n��ɾ��" >> deltmdbflow.log
#else echo "$n will save"
fi
done
echo "---------" >> deltmdbflow.log
echo "Ŀǰ��������СΪ`du -sh /home/trade/tmdb/flow|cut -d '/' -f1`" >> deltmdbflow.log
echo "---------" >> deltmdbflow.log
cat deltmdbflow.log
else echo "������ֹ"
fi
