<h1 style="text-align: center;">各组件安装配置方式</h1>

## 修改服务器IP
```shell
vim /etc/sysconfig/network-scripts/ifcfg-ens33
BOOTPROTO="static"
IPADDR=192.168.116.129
NETMASK=255.255.255.0
GATEWAY=192.168.116.2
DNS1=114.114.114.114
DNS2=8.8.8.8

systemctl restart network
```

---

## 安装Docker
```shell
yum install -y yum-utils device-mapper-persistent-data lvm2

yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo

yum install -y docker-ce

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

