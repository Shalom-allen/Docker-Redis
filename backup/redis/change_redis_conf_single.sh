#!/bin/bash

# [Redis_Conf] Set the container path.
DOCKER_CONTAINER_DATA="/redis/data"
DOCKER_CONTAINER_LOG="/redis/log"
DOCKER_CONTAINER_CONF="/redis/conf"

# [Redis_Conf] Change the Bind(IP)
echo -e "What do you want to change bind?"
read cbind

<<<<<<< HEAD
sed "s/bind 127.0.0.1 -::1/bind $cbind 127.0.0.1 -::1/g" /root/docker_redis/default/redis.conf > /root/docker_redis/result/redis1.conf
=======
sed "s/bind 127.0.0.1 -::1/bind $cbind 127.0.0.1 -::1/g" /root/test_git/default/redis.conf > /root/test_git/result/redis1.conf
>>>>>>> 8817de1f0566ea4493ad4d0a5de1a7bc6f146ac7

# [Redis_Conf] Change the Port
echo -e "What do you want to change the port?"
read cport

<<<<<<< HEAD
sed "s/port 6379/port $cport/g" /root/docker_redis/result/redis1.conf >> /root/docker_redis/result/redis2.conf

rm -rf /root/docker_redis/result/redis1.conf

# [Redis_Conf] Change the Logfile
sed "s/logfile \/var\/log\/redis_6379.log/logfile \/redis\/log\/redis_$cport.log/g" /root/docker_redis/result/redis2.conf >> /root/docker_redis/result/redis3.conf

rm -rf /root/docker_redis/result/redis2.conf

# [Redis_Conf] Change the Datadir
sed "s/dir \/var\/lib\/redis\/6379/dir \/redis\/data/g" /root/docker_redis/result/redis3.conf >> /root/docker_redis/result/redis_$cport.conf

rm -rf /root/docker_redis/result/redis3.conf
=======
sed "s/port 6379/port $cport/g" /root/test_git/result/redis1.conf >> /root/test_git/result/redis2.conf

rm -rf /root/test_git/result/redis1.conf

# [Redis_Conf] Change the Logfile
sed "s/logfile \/var\/log\/redis_6379.log/logfile \/redis\/log\/redis_$cport.log/g" /root/test_git/result/redis2.conf >> /root/test_git/result/redis3.conf

rm -rf /root/test_git/result/redis2.conf

# [Redis_Conf] Change the Datadir
sed "s/dir \/var\/lib\/redis\/6379/dir \/redis\/data/g" /root/test_git/result/redis3.conf >> /root/test_git/result/redis_$cport.conf

rm -rf /root/test_git/result/redis3.conf
>>>>>>> 8817de1f0566ea4493ad4d0a5de1a7bc6f146ac7
