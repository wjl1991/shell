echo 192.168.1.2  redis.imuzhuang.com>>/etc/hosts
echo 192.168.2.1  mq.imuzhuang.com>>/etc/hosts
echo 47.95.254.28 rftp.imuzhuang.com>>/etc/hosts
export LANG=en_US.utf8
export TZ='Asia/Shanghai'
echo  >> /manage/logs/mz.jar.log
nohup java -jar mz.jar.jar --spring.profiles.active=test,yxsmstpl --server.port=8000>>/manage/logs/mz.jar.log&
