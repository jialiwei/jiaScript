echo "Backing weather war..."
cd ~/tools/tomcat-tq360
mkdir /home/work/BACKUP
\cp webapps/ROOT.war ~/BACKUP/tq360.`date +%Y-%m-%d:%H`.war

echo "Copying new war..."
\cp ~/tq360.war ~/BACKUP/flycopy.tq360.`date +%Y-%m-%d`.war

echo "Killing tomcat..."
kill -9 `ps aux|grep tomcat|grep tq360|grep -v grep|awk '{print $2}'`
sleep 1

echo "Removing root war..."
rm webapps/ROOT* -fr

echo "Copying new root war..."
cp ~/tq360.war webapps/ROOT.war

sleep 1
echo "Restarting tomcat..."
export JAVA_HOME=/usr/local/jdk1.6
~/tools/tomcat-tq360/bin/startup.sh
echo "Done"
#tail -fn100 logs/catalina.out

