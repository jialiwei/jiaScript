cd ~/tools/tomcat-tq360

echo "Killing tomcat..."
echo $WHICH
kill -9 `ps aux|grep tomcat|grep tq360|grep -v grep|awk '{print $2}'`
sleep 1

echo "Removing root war..."
rm webapps/ROOT* -fr

echo "cp backup tq360.$WHICH.war"
cp ~/BACKUP/tq360.$WHICH.war webapps/ROOT.war

sleep 1
echo "Restarting tomcat..."
export JAVA_HOME=/usr/local/jdk1.6
~/tools/tomcat-tq360/bin/startup.sh
echo "Done"
#tail -fn100 logs/catalina.out

