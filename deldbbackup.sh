#!/bin/bash
filename1=`ls /u02/dumpdp/expdp_schema_*`
filename2=`ls /u02/dumpdp/expdp_inc*`
filename3=`ls /u02/dumpdp/expdp_full_asp1*`
deltime=`date -d "30 day ago" +"%Y%m%d"`
cur=`du -sh /u02/dumpdp/|cut -d '/' -f1`
echo "---------" > deldbbackup.log
echo "ɾ��ǰ��������СΪ$cur" >> deldbbackup.log
echo "---------" >> deldbbackup.log
echo "��$deltime֮ǰ��30��ǰ�����ļ������ᱣ��,������yȷ��"
read inword
if [ "$inword" == "y" ];then
for a in $filename1
do
a1tmp=`echo ${a%%.*}` 
a1=`echo ${a1tmp:0-8}`
if [ $a1 -lt $deltime ];then
rm -rf $a
echo "$a��ɾ��" >> deldbbackup.log
#else echo "$a will save"
fi
done
for b in $filename2
do
b1tmp=`echo ${b%%.*}` 
b1=`echo ${b1tmp:0-8}`
if [ $b1 -lt $deltime ];then
rm -rf $b
echo "$b��ɾ��" >> deldbbackup.log
#else echo "$b will save"
fi
done
for c in $filename3
do
c1tmp=`echo ${c%%.*}` 
c1=`echo $c1tmp|cut -d'_' -f4` 
if [ $c1 -lt $deltime ];then
rm -rf $c
echo "$c��ɾ��" >> deldbbackup.log
#else echo "$c will save"
fi
done
echo "---------" >> deldbbackup.log
echo "Ŀǰ��������СΪ`du -sh /u02/dumpdp|cut -d '/' -f1`" >> deldbbackup.log
echo "---------" >> deldbbackup.log
cat deldbbackup.log
else echo "������ֹ"
fi
