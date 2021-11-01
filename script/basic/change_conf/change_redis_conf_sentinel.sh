#!/bin/bash

# [Sentinel_Conf] Set the container path.
DOCKER_CONTAINER_DATA="/redis/data"
DOCKER_CONTAINER_LOG="/redis/log"
DOCKER_CONTAINER_CONF="/redis/conf"

# [Sentinel_Conf] Change the Bind(IP)
echo -e "# What do you want to change bind?"
read cbind

sed "s/^# bind 127.0.0.1 192.168.1.1/bind $cbind 127.0.0.1/g" /root/test_git/default/sentinel.conf > /root/test_git/result/sentinel1.conf

# [Sentinel_Conf] Change the Port
echo -e "# What do you want to change the port?"
read cport

sed "s/port 26379/port $cport/g" /root/test_git/result/sentinel1.conf >> /root/test_git/result/sentinel2.conf

rm -rf /root/test_git/result/sentinel1.conf

# [Sentinel_Conf] Change the monitor setting
echo -e "# Setting the sentinel monitoring(master_IP master_port quorum)"
read cip cport cquo

sed "s/sentinel monitor mymaster 127.0.0.1 6379 2/sentinel monitor mymaster $cip $cport $cquo/g" /root/test_git/result/sentinel2.conf >> /root/test_git/result/sentinel3.conf

rm -rf /root/test_git/result/sentinel2.conf

# [Sentinel_Conf] Change setting the sentinel sdown time
echo -e "# Setting the sentinel sdown time"
read ctime
sed "s/sentinel down-after-milliseconds mymaster 30000/sentinel down-after-milliseconds mymaster $ctime/g" /root/test_git/result/sentinel3.conf >> /root/test_git/result/sentinel4.conf

rm -rf /root/test_git/result/sentinel3.conf

# [Sentinel_Conf] Change the default
sed "s/logfile change/logfile \/redis\/log\/sentinel_$cport.log/g" /root/test_git/result/sentinel4.conf >> /root/test_git/result/sentinel5.conf
rm -rf /root/test_git/result/sentinel4.conf

sed "s/dir \/tmp/dir \/redis\/data/g" /root/test_git/result/sentinel5.conf >> /root/test_git/result/sentinel6.conf
rm -rf /root/test_git/result/sentinel5.conf

sed "s/pidfile \/var\/run\/redis-sentinel.pid/pidfile \/redis\/data\/sentinel_$cport.pid/g" /root/test_git/result/sentinel6.conf >> /root/test_git/result/sentinel7.conf
rm -rf /root/test_git/result/sentinel6.conf

sed "s/^# protected-mode no/protected-mode yes/g" /root/test_git/result/sentinel7.conf >> /root/test_git/result/sentinel8.conf
rm -rf /root/test_git/result/sentinel7.conf

sed "s/daemonize no/daemonize yes/g" /root/test_git/result/sentinel8.conf >> /root/test_git/result/sentinel.conf
rm -rf /root/test_git/result/sentinel8.conf



