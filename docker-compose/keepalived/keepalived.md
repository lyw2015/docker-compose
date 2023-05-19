# 安装keepalived

## 基础依赖
```shell
yum install -y gcc openssl-devel libnl libnl-devel libnfnetlink-devel net-tools
```

## 下载、解压、改名、删除源文件、进入目录
```shell
wget https://www.keepalived.org/software/keepalived-2.2.7.tar.gz --no-check-certificate -P /data &&
tar zxf /data/keepalived-2.2.7.tar.gz &&
rm -rf /data/keepalived-2.2.7.tar.gz &&
mv /data/keepalived-2.2.7 /data/keepalived &&
cd /data/keepalived
```

## 编译安装
```shell
./configure && make && make install
```

## 复制文件到系统
```shell
mkdir /etc/keepalived &&
cp /data/keepalived/keepalived/etc/init.d/keepalived /etc/init.d/ &&
cp /data/keepalived/keepalived/etc/keepalived/keepalived.conf.sample /etc/keepalived/keepalived.conf &&
cp /etc/keepalived/keepalived.conf /etc/keepalived/keepalived.conf.backup
```

## 配置
```shell
vim /etc/keepalived/keepalived.conf
```

## 启动
```shell
systemctl start keepalived && systemctl enable keepalived
```