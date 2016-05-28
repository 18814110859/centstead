#文档

### 目录
#### [介绍](#introduction)
#### [开始](#start)
#### [基础配置](#base-config)
#### [软件环境](#environment-soft)
#### [文件拷贝](#copy-file)
#### [共享文件夹](#share-folder)
#### [网站配置](#sites-config)
#### [计划任务](#schedule)
#### [数据库创建](#create-database)
### 附录
#### [Vagrant 介绍](#vagrant)
#### [团队配合](#teamwork)
#### [Fuck GFW](#fuck-gfw)
#### [参与改善](#involvement)

<h1 id="introduction">介绍</h1>

基于开发的实际需求,PHP开发者通常需要一个贴近生产环境,又易于维护的测试与开发环境.以往的选择:
1. xampp, wamp, phpstudy…… 集成环境, 启动方便,占用小,但是需要往往不能提供 curl,pgsql,imagick ……插件, 自行编译成本很高.
2. 基于虚拟机手工搭建一个linux环境,然而虚拟机的初始化过程却相当费时费力.

似乎'易用'与'贴近生产环境',很难平衡. 然而 Vagrant 的到来为我们提供了这种可能. Vagrant 提供了一个便捷的方式来管理和设置虚拟机, Vagrant 提出了盒子的概念. 一个盒子即时一个初始化的虚拟系统, 需要的时候可以基于盒子快速生成虚拟机, 出现错误时又可以在几分钟之内快速销毁重建. 

Centstead 就是一个高度定制的 CentOS + php 盒子, 你可以通过 Centstead 提供的脚本 与 vagrant 命令方便的管理你的虚拟环境.

#####Centstead 预置软件： (可基于配置快速切换版本)
+ CentOS 7
+ PHP  5.4 / 5.5 / 5.6 / 7.0
+ Mysql  5.5 / 5.6 / 5.7
+ MariaDB  5.5 / 10 / 10.1
+ PostgreSQL  9.2 / 9.3 / 9.4 / 9.5
+ Composer
+ Nginx
+ Redis
+ Sqllite3
+ Supervisor
+ Xdebug
+ Nodejs (npm webpack gulp bower)
+ memcached
+ Beanstalkd

<h1 id="start">开始</h1>

###、安装 & 设置

##### 首次安装

在使用 Centstead 之前，需要先安装 [Virtual Box][1] 和 [Vagrant][2], 它们都提供 windows, mac ,linux 系统的安装程序。

##### 安装 Centstead Vagrant 盒子
[VirtualBox][1] 和 [Vagrant][2] 安装好了之后, 接着下载 Centstead 盒子, Centstead 默认提供了两个版本的盒子,供自行选择 :

1. 先锋版 virtualbox_avant.box ,预制 php 7.0 mysql 5.7
2. 通用版 virtualbox_usual.box ,预制 php 5.6 mysql 5.6

下载地址: (感谢GFW, 我没能将盒子上传到官方仓库).

1. **[百度网盘][3]**
2. **[360云盘][4]** 提取码：7766

下载完成后, `cd` 到 `.box` 所在目录, 将 box 添加到 Vagrant 环境.
~~~bash
cd downlods/path
vagrant box add ./virtualbox_avant.box --name=jason-chang/centstead
或者
vagrant box add ./virtualbox_usual.box --name=jason-chang/centstead
~~~

#####通过 GitHub 克隆 Centstead

box 安装完成后, 克隆 `Centstead` 代码库到任意目录.

~~~bash
cd some/directory
git clone https://github.com/jason-chang/centstead.git centstead
~~~

克隆完成后,cd 到 `centstead` 目录下

1. 如果你使用 mac 或 linux , 运行 `bash init.sh` 命令来创建 centstead.yaml 配置文件.
2. 如果你使用 windows , 运行 `init.bat` 命令来创建 centstead.yaml 配置文件.

centstead.yaml 配置文件文件将创建于 config 目录.

	centstead.yaml 是 centstead 主配置文件，几乎所有常用的变更都是通过修改centstead.yaml实现. 文件格式上它遵循 [yaml][5] 标准.

至此使用 `centstead` 的脚手架工作都完成了, 再 **[配置共享文件夹](#share-folder)** 、 **[设置 nginx 站点](#sites-config)** 后就可以享受 centstead 的福利了.

http://Centstead.app
启动 Vagrant Box

配置好 Centstead.yaml 文件后，在 Centstead 目录下运行 vagrant up 命令，Vagrant 将会启动虚拟机并自动配置共享文件夹以及 Nginx 站点。
销毁该机器，可以使用 vagrant destroy –force

[1]:(https://www.virtualbox.org/wiki/Downloads)
[2]:(https://www.vagrantup.com/downloads.html)
[3]:(http://pan.baidu.com/s/1c15ybAS)
[4]:(https://yunpan.cn/cSerL4tXNhrBV#7766)
[5]:(https://zh.wikipedia.org/wiki/YAML)

<h1 id="base-config">基础配置</h1>

<h1 id="environment-soft">软件环境</h1>

1. [PHP版本切换](php.md)
2. [Mysql/MariaDB版本切换](mysql.md)
3. [PostgreSql版本切换](postgre.md)

<h1 id="copy-file">文件拷贝</h1>

<h1 id="share-folder">共享文件夹</h1>

Centstead.yaml 文件中的 folders 属性列出了所有主机和 Centstead 虚拟机共享的文件夹，一旦这些目录中的文件有了修改，将会在本地和 Centstead 虚拟机之间保持同步，如果有需要的话，你可以配置多个共享文件夹（一般一个就够了）：

folders:
    - map: ~/Code
      to: /home/vagrant/Code
如果要开启 NFS，只需简单添加一个标识到同步文件夹配置：

folders:
    - map: ~/Code
      to: /home/vagrant/Code
      type: "nfs"
配置 Nginx 站点

<h1 id="sites-config">网站配置</h1>

对 Nginx 不熟？没问题，通过 sites 属性你可以方便地将“域名”映射到 Centstead 虚拟机的指定目录，Centstead.yaml 中默认已经配置了一个示例站点。和共享文件夹一样，你可以配置多个站点：

sites:
    - map: Centstead.app
      to: /home/vagrant/Code/Laravel/public
你还可以通过设置 hhvm 为 true 让所有的 Centstead 站点使用 HHVM：

sites:
    - map: Centstead.app
      to: /home/vagrant/Code/Laravel/public
      hhvm: true
默认情况下，每个站点都可以通过 HTTP（端口号：8000）和 HTTPS（端口号：44300）进行访问。

Hosts文件

不要忘记把 Nginx 站点配置中的域名添加到本地机器上的 hosts 文件中，该文件会将对本地域名的请求重定向到 Centstead 虚拟机，在 Mac 或 Linux上，该文件位于 /etc/hosts，在 Windows 上，位于 C:\Windows\System32\drivers\etc\hosts，添加方式如下：

192.168.10.10 Centstead.app
确保 IP 地址和你的 Centstead.yaml 文件中列出的一致，一旦你将域名放置到 hosts 文件，就可以在浏览器中通过该域名访问站点了！

<h1 id="schedule">计划任务</h1>

<h1 id="create-database">数据库创建</h1>

<h1>附录</h1>

<h1 id="vagrant">Vagrant 介绍</h1>

<h1 id="teamwork">团队配合</h1>

<h1 id="fuck-gfw">Fuck GFW</h1>

`vagrant provision` 前请注意由于GFW的原因,初始化过程中可能经常失败,请尽量使用个人ADSL网络,操作前尽量重连ADSL更换IP.

(GFW会根据IP计算HTTPS流量,HTTPS流量高后被断链的几率将增大)

<h1 id="involvement">参与改善</h1>

![改变文件格式](images/unix lf.png)