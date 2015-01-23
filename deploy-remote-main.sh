host="host1 host2"
for h in ${host}
do
	echo work@$h
	rsync -avvp /home/work/ROOT.war work@$h:~/ROOT.war
	ssh work@$h 'bash -s' < deploy-remote.sh
done
