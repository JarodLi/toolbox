
#docker network create --driver=bridge --subnet=172.18.0.0/16 my_net
# 宿主机的docker.sock挂载到/docker.sock，如果在容器内要使用需要创建软链接(ln -s /docker.sock /var/run/dock.sock)， 直接挂载到/var/run/docker.sock会失败(必须使用bash作为CMD才能成功)
TAG="20230727"
#TAG="20240206"
# 使用方法：先执行本脚本启动，然后再执行init.sh初始化

docker run -dit --name my --hostname=lijian --privileged -p 8000:22 -p 8888:8888 -p 9999:9999 -p 8080:8080 -p 7443:7443 -p 8090:8090 -p 2181:2181 -p 80:80 -p 123:123 -p 20051:20051 -v /Users/lijian/docker:/usr1/docker -v /Users/lijian/ASU:/usr1/asu  --restart=always my:"${TAG}"

