echo "Backing weather war..."
cd ~/tools/tomcat
mkdir /home/work/BACKUP
\cp webapps/ROOT.war ~/BACKUP/ROOT.`date +%Y-%m-%d:%H`.war

echo "Copying new war..."
\cp ~/ROOT.war ~/BACKUP/flycopy.ROOT.`date +%Y-%m-%d`.war

echo "Killing tomcat..."
kill -9 `ps aux|grep tomcat|grep -v grep|awk '{print $2}'`
sleep 1

echo "Removing root war..."
rm webapps/ROOT* -fr

echo "Copying new root war..."
cp ~/ROOT.war webapps/ROOT.war

sleep 1
echo "Restarting tomcat..."
export JAVA_HOME=/usr/local/jdk1.6
~/tools/tomcat/bin/startup.sh
echo "Done"
#tail -fn100 logs/catalina.out

