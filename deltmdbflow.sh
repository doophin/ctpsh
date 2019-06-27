#!/bin/bash
filename=`ls -F /home/trade/tmdb/flow/|grep '/$'`
deltime=`date -d "30 day ago" +"%Y%m%d"`
cur=`du -sh /home/trade/tmdb/flow|cut -d '/' -f1`
echo "---------" > deltmdbflow.log
echo "删除前总容量大小为$cur" >> deltmdbflow.log
echo "---------" >> deltmdbflow.log
echo "在$deltime之前（30天前）的文件将不会保留,请输入y确认"
read inword
if [ "$inword" == "y" ];then
for m in $filename
do
n=`echo ${m:0:8}`
if [ $n -lt $deltime ];then
rm -rf /home/trade/tmdb/flow/$n
echo "$n已删除" >> deltmdbflow.log
#else echo "$n will save"
fi
done
echo "---------" >> deltmdbflow.log
echo "目前总容量大小为`du -sh /home/trade/tmdb/flow|cut -d '/' -f1`" >> deltmdbflow.log
echo "---------" >> deltmdbflow.log
cat deltmdbflow.log
else echo "操作终止"
fi
