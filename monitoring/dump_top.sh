#Screening top every 1 minute during 6 hours
for i in {1..360}; do echo -n "This is a  $i minute " >> dump_top.LOG && top -bn1 >> dump_top.LOG ; sleep 1m; done
