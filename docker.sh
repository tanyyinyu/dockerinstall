#! /bin/bash
DOCKER_NAME=docker-ce-19.03.8-3.el7.x86_64.rpm
yum localinstall $DOCKER_NAME -y
mkdir /etc/docker
cat > /etc/docker/daemon.json <<EOF
{
  "registry-mirrors": ["https://dhq9bx4f.mirror.aliyuncs.com"]
}
EOF
systemctl start docker
if [ $? -eq 0 ]
  then
    echo "successfully installed docker"
  else
    echo "install failed"
    exit 1
fi

