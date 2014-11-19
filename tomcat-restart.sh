jia_res=`curl -IGs   http://localhost:8181`
statuscode=`echo "$jia_res"|grep HTTP|awk '{print $2}'`
echo  $statuscode
now=`date "+%Y-%m-%d  %H:%M:%S"`
if  [ -n "$statuscode" ] &&  [ $statuscode -eq 200 ]; then
        echo $now" good"
else
        echo $now" bad"
        processCode=`ps -ef|grep tomcat|grep -v grep|awk '{print $2}'`
        if [ -n "$processCode" ]; then
                for p in  $processCode
                do
                        echo "kill tomcat $p"   
                        kill -9 $p
                done
        fi
        sh /home/work/tools/tomcat/bin/startup.sh
fi