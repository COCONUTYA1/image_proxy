#!/bin/bash
read -p "请输入用户名:" USERNAME
read -p "请输入密码:" PASSWORD
echo $PASSWORD  | docker login --username=$PASSWORD --password-stdin registry.cn-hangzhou.aliyuncs.com
for i in $(cat list.txt); 
do 
  docker pull registry.cn-hangzhou.aliyuncs.com/cachei/${i##*/}  ;
  docker tag registry.cn-hangzhou.aliyuncs.com/cachei/${i##*/} $i  ; 
  docker rmi registry.cn-hangzhou.aliyuncs.com/cachei/${i##*/}
done
docker logout registry.cn-hangzhou.aliyuncs.com
echo $docker logout registry.cn-hangzhou.aliyuncs.com
