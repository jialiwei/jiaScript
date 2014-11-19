WORK_PATH=$1
logfiles=`ls -l $WORK_PATH|awk '{print $9}'|egrep '\.log\.[0-9]{4}\-[0-9]{2}\-[0-9]{2}$'`
endtime=`date --date="3 days ago" +%Y-%m-%d`
echo "delete log from "$endtime
for f in $logfiles
do
        length=${#f}
        start=length-10
        dateStr=${f:$start:10}
        if [[ "$dateStr" < "$endtime" ]] || [[ "$dateStr" = "$endtime" ]]; then
                rm -f $WORK_PATH"/"$f
                echo $f
        fi
done