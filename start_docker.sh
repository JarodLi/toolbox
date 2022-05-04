
#docker network create --driver=bridge --subnet=172.19.0.0/16 my
# 宿主机的docker.sock挂载到/docker.sock，如果在容器内要使用需要创建软链接(ln -s /docker.sock /var/run/dock.sock)， 直接挂载到/var/run/docker.sock会失败(必须使用bash作为CMD才能成功)
TAG="20220504"
docker run -dit --name my --hostname=lijian --privileged --net my --ip 172.19.1.2 -p 23:22 -p 8888:8888 -p 9999:9999 -p 8080:8080 -p 7443:7443 -p 8090:8090 -p 2181:2181 -p 80:80 -p 123:123 -p 20051:20051 -p 30051:30051 -p 50051:50051 -p 60051:60051 -v /usr/bin/docker:/usr/bin/docker -v /usr1:/usr1 -v /share:/share --restart=always my:"${TAG}"
