host="zm_tianqi02v.add.zwt.qihoo.net zm_tianqi03v.add.zwt.qihoo.net zm_tianqi04v.add.zwt.qihoo.net zm_tianqi05v.add.zwt.qihoo.net zm_tianqi06v.add.zwt.qihoo.net zm_tianqi01v.add.bjsc.qihoo.net zm_tianqi02v.add.bjsc.qihoo.net zm_tianqi03v.add.bjsc.qihoo.net zm_tianqi04v.add.bjsc.qihoo.net"
#host="zm_tianqi05v.add.zwt.qihoo.net"
for h in ${host}
do
	echo work@$h
	ssh work@$h WHICH=$1 'bash -s' < deploy-rollback.sh
done
