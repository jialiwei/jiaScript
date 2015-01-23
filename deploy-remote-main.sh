#host="zm_tianqi02v.add.zwt.qihoo.net zm_tianqi03v.add.zwt.qihoo.net zm_tianqi04v.add.zwt.qihoo.net zm_tianqi05v.add.zwt.qihoo.net zm_tianqi06v.add.zwt.qihoo.net zm_tianqi01v.add.bjsc.qihoo.net zm_tianqi02v.add.bjsc.qihoo.net zm_tianqi03v.add.bjsc.qihoo.net zm_tianqi04v.add.bjsc.qihoo.net"
zwthost="zm_tianqi02v.add.zwt.qihoo.net zm_tianqi03v.add.zwt.qihoo.net zm_tianqi04v.add.zwt.qihoo.net zm_tianqi05v.add.zwt.qihoo.net"
bjschost="zm_tianqi01v.add.bjsc.qihoo.net zm_tianqi02v.add.bjsc.qihoo.net zm_tianqi03v.add.bjsc.qihoo.net zm_tianqi04v.add.bjsc.qihoo.net"
#host="zm_tianqi04v.add.bjsc.qihoo.net"
for h in ${bjschost}
do
	echo work@$h
	rsync -avvp /home/jialiwei/tq360-prodbjsc.war work@$h:~/tq360.war
	ssh work@$h 'bash -s' < deploy-remote.sh
done

for h in ${zwthost}
do
        echo work@$h
        rsync -avvp /home/jialiwei/tq360-prodzwt.war work@$h:~/tq360.war
        ssh work@$h 'bash -s' < deploy-remote.sh
done
