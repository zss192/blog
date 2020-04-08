---
title: 从github迁移hexo博客到服务器
tags:
  - hexo
categories:
  - 日常办公
date: 2020-04-08 15:08:00
---
>需要本地hexo博客已搭建完毕，以下是在服务器以root用户操作

# 登录云服务器安装git和nginx

```bash
sudo apt install git
sudo apt install nginx
```
这样以后输入服务器地址会打开nginx默认页面

# 修改默认打开页面
**也可不修改默认打开页面只需将博客文件放到/var/www/html下即可**

找到nginx配置文件，我这是/etc/nginx/sites-available下的default文件，建议先备份

```bash
vim default
```
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200407225936259.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)
重新载入Nginx，使配置生效

```bash
service nginx reload
```

>如果报错，看看找对配置文件没，实在改不过来恢复原来的备份文件，执行命令后没什么显示即执行成功

# 创建一个Git裸库，只用于保存Repository信

```bash
cd ~
git init --bare blogit.git
```
使用Git-Hooks同步网站根目录，这里使用的是Git中的“post-receive”，当有Git收发的时候会调用该脚本，自动将最新内容同步到网站根目录中

```bash
vim blogit.git/hooks/post-receive
```

将以下语句写入文件

```bash
#!/bin/sh
git --work-tree=/opt/hexo --git-dir=/root/blogit.git checkout -f
```
>注意博客路径和当前用户
>
保存并赋予执行权限

```bash
chmod +x /root/blogit.git/hooks/post-receive
```
# 本地配置
配置”_config.yml”
 
打开位于Hexo博客根目录下的“_config.yml”文件，找到“deploy”并修改

```bash
deploy:
-  type: git
   repository: git@github.com:zss192/zss192.github.io.git
   branch: master
-  type: git
   repository: root@39.107.45.243:/root/blogit.git
   branch: master      # 分支
```
>注意若原来type: git前面没有\-这个符号要手动添加上，不然后面会报错
>

本地执行下列命令即可

```bash
hexo clean
hexo g
hexo d
```
这样以后hexo d的时候就会推到github和个人服务器上了

# hexo d免密码
经过上述操作我们每次使用hexo d的时候就会推到服务器上，但是每次都要输入密码，添加秘钥免密推送

进入～/.ssh找到id_rsa.pub改为 anthorized_keys并上传到服务器你的主目录下的.ssh下即可

```bash
cp id_rsa.pub authorized_keys
scp authorized_keys username@服务器地址:~/.ssh
```
若没秘钥本地输入ssh-keygen -t rsa生成即可

这样后就会github和服务器同步更新了，即使以后更换服务器只需按照上述步骤操作下即可。