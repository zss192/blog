---
title: 某旅游网站sql注入导致泄露2万多个人信息
tags:
  - 渗透测试
categories:
  - 渗透测试
date: 2020-05-22 22:34:00
---
# 说明

测试目标是一个旅游网站，发现了sql注入漏洞，泄露2万多用户信息，可任意下载服务器上文件。

所有可利用信息均打码处理。



# 渗透过程

正常搜索没啥问题

但是当我们输入1'就会报错

![image-20200513141920454](https://cdn.jsdelivr.net/gh/zss192/Typora-notes@latest/images/image-20200513141839168.png)

尝试注释闭合，发现失败

![image-20200513141839168](https://cdn.jsdelivr.net/gh/zss192/Typora-notes@latest/images/image-20200513141920454.png)

尝试不注释闭合后面的

![image-20200513142028584](https://cdn.jsdelivr.net/gh/zss192/Typora-notes@latest/images/image-20200513142028584.png)

后来多次尝试找到了问题所在

当我们把空格替换为/**/发现搜到了内容

![image-20200513142322134](https://cdn.jsdelivr.net/gh/zss192/Typora-notes@latest/images/image-20200513142322134.png)



直接上sqlmap

```
sqlmap -u "http://xxxxxx/search/cloudsearch?keyword=1&typeid=0" --level 3 -p keyword --tamper space2comment.py
```

发现了好几个注入漏洞

![image-20200513144740433](https://cdn.jsdelivr.net/gh/zss192/Typora-notes@latest/images/image-20200513142514633.png)

尝试列数据库，发现60多数据库

![2](https://cdn.jsdelivr.net/gh/zss192/Typora-notes@master/images/2.png)

查看当前数据库根据名字看到是一个cms

![image-20200513142852619](https://cdn.jsdelivr.net/gh/zss192/Typora-notes@latest/images/image-20200513142852619.png)

谷歌搜下这个cms发现没啥爆出来的漏洞，看下cms数据库的结构

找到了会员表

![image-20200513142514633](https://cdn.jsdelivr.net/gh/zss192/Typora-notes@latest/images/image-20200513143035131.png)

看下发现有2万多数据

![image-20200513144553013](https://cdn.jsdelivr.net/gh/zss192/Typora-notes@latest/images/image-20200512171651702.png)

查看了下部分数据，可看到密码是MD5加密

![image-20200512171651702](https://cdn.jsdelivr.net/gh/zss192/Typora-notes@latest/images/image-20200513143239226.png)

MD5破解后，成功登录

![image-20200513143035131](https://cdn.jsdelivr.net/gh/zss192/Typora-notes@latest/images/image-20200513143327053.png)

# 进一步利用漏洞

我们已经得到了了其用户账号和密码，我们想进一步利用

## 登录子站后台

查看cms表结构找到其admin表

![image-20200513143537261](https://cdn.jsdelivr.net/gh/zss192/Typora-notes@latest/images/image-20200513143537261.png)

密码一看就是MD5尝试破解

![image-20200513143239226](https://cdn.jsdelivr.net/gh/zss192/Typora-notes@latest/images/image-20200513143623963.png)

拿到了管理员密码，按理说我们应该尝试登录其后台，但是经扫描各种方法尝试也没找到它后台在哪，无奈放弃。

用subdomainsbrute 扫描子站，发现有个WordPress的博客

![image-20200513144008090](https://cdn.jsdelivr.net/gh/zss192/Typora-notes@latest/images/image-20200513144008090.png)

![image-20200513122737322](https://cdn.jsdelivr.net/gh/zss192/Typora-notes@latest/images/image-20200513144048053.png)



首页后缀输入/login直接跳转到后台登录页面，用我们刚才得到的管理员数据直接登录成功

![image-20200513144008090](https://cdn.jsdelivr.net/gh/zss192/Typora-notes@latest/images/image-20200513122737322.png)

## 服务器任意文件下载

以前打CTF不知道sqlmap还能下载文件，之前都是得到数据库看数据找flag

这也是但是网上搜如何进一步利用漏洞发现的

```
sqlmap -u "http://xxxxx/search/cloudsearch?keyword=1&typeid=0" --level 3 -p keyword --tamper space2comment.py --file-read=/etc/passwd
```

去看下文件，成功下载

![image-20200513143623963](https://cdn.jsdelivr.net/gh/zss192/Typora-notes@latest/images/image-20200513144553013.png)

另外我发现它首页如果访问一个不存在的控制器会报错，根据报错信息可以找到其根目录的绝对路径

![image-20200513144048053](https://cdn.jsdelivr.net/gh/zss192/Typora-notes@latest/images/image-20200513144740433.png)

根据网站根目录可下载网站文件，这里就没再尝试了

# 拿shell??

网上说sqlmap可用--os-shell且知道网站根目录可拿shell,上面我们已经得到了网站根目录路径，尝试了下拿shell，失败，卒。。。

后来在它一个客服系统子站找到了一个上传漏洞，拿到了shell,详情见下一篇博客。

# 写在最后

这次渗透收获颇丰，也是这个站防护太差才让我这个小菜鸡都能渗透进去的，hahaha。

