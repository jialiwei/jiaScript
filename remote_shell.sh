host="hostA hostB"
for h in ${host}
do
        echo work@$h 
        ssh work@$h 'bash -s' < mk.sh

done