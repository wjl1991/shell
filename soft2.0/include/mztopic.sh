function mztopic_docker()
{
    node_name="mztopic"
    node_port=7006
    docker run -dti --name=$node_name -p $node_port:8000 -v /etc/localtime:/etc/localtime -v /www/servers/$node_name:/manage -v /data/logs/$node_name:/manage/logs --privileged=true jdk /bin/bash
    docker exec $node_name /bin/sh -c "echo "/root/mz-topic.sh" >> /root/.bashrc"
    docker cp $cur_dir/config/mz-topic.sh $node_name:/root/
    docker exec $node_name chmod +x /root/mz-topic.sh
    docker restart $node_name
    
    if [ $(docker ps |grep $node_name |wc -l)  == 1 ];then
        echo -e  "\033[47;30m ------Docker $node_name install successed!! ----- \033[0m \n"
    else
        echo -e "\033[41;5m ------$node_name install failed !Please check !! ----- \033[0m \n"
        exit 1
    fi
}
