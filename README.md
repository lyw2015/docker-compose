<h1 style="text-align: center;">各组件安装配置方式</h1>

## 安装Docker
```shell
方式一:
  yum install -y yum-utils device-mapper-persistent-data lvm2

  yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo

  yum install -y docker-ce

方式二:
  curl -fsSL https://get.docker.com/ | sh

systemctl start docker && systemctl enable docker

#镜像加速
vim /etc/docker/daemon.json
{
  "registry-mirrors": ["https://xxx.mirror.aliyuncs.com"]
}
```

## 安装Docker-compose
```shell
wget https://github.com/docker/compose/releases/download/v2.17.2/docker-compose-`uname -s`-`uname -m` -O /usr/local/bin/docker-compose &&

chmod +x /usr/local/bin/docker-compose
```

