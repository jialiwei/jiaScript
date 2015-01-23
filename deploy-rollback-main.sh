host="host1 host2 host3"
for h in ${host}
do
	echo work@$h
	#WHICH is args for deploy-roolback.sh ,can use $WHICH in deploy-rollback.sh
	# refer http://stackoverflow.com/questions/305035/how-to-use-ssh-to-run-shell-script-on-a-remote-machine
	ssh work@$h WHICH=$1 'bash -s' < deploy-rollback.sh
done
