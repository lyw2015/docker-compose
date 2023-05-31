# 安装keepalived

## 离线安装
```shell
# 基础依赖
yum install -y gcc openssl-devel libnl libnl-devel libnfnetlink-devel net-tools

# 下载、解压、改名、删除源文件、进入目录
wget https://www.keepalived.org/software/keepalived-2.2.7.tar.gz --no-check-certificate -P /data &&
tar zxf /data/keepalived-2.2.7.tar.gz &&
rm -rf /data/keepalived-2.2.7.tar.gz &&
mv /data/keepalived-2.2.7 /data/keepalived &&
cd /data/keepalived

# 编译安装
./configure && make && make install

# 复制文件到系统
mkdir /etc/keepalived &&
cp /data/keepalived/keepalived/etc/init.d/keepalived /etc/init.d/ &&
cp /data/keepalived/keepalived/etc/keepalived/keepalived.conf.sample /etc/keepalived/keepalived.conf &&
cp /etc/keepalived/keepalived.conf /etc/keepalived/keepalived.conf.backup
```

## 在线yum安装
```shell
yum install -y keepalived
```

## 修改日志文件路径
```shell
#修改/etc/sysconfig/keepalived
KEEPALIVED_OPTIONS="-D -S 0"

#修改/etc/rsyslog.conf，末尾添加如下行
local0.*                                                /var/log/keepalived.log
```

## 配置
```shell
vim /etc/keepalived/keepalived.conf
```

## 启动
```shell
systemctl start keepalived && systemctl enable keepalived
```

### 防火墙开放VRRP协议
```shell
firewall-cmd --permanent --add-protocol=vrrp

firewall-cmd --reload
```