---
title: http header题总结
tags:
  - CTF-WEB
categories:
  - CTF-WEB
date: 2020-02-02 14:23:00
cover: /img/post/2.jpg
---
# 1.必须从本机登陆  X-Forwarded-For:127.0.0.1
# 2.用域名登陆	将host:字段的ip地址改成网页上给出的域名
# 3.从百度跳转登陆	Referer: https://www.google.com
# 4.必须通过ie4.0登陆	修改User-agent
# 5.电脑上必须安装了.net8		user-aget中加入.net clr 8.0
# 6.必须是德国用户	Accept-Language:de-De
# 7.必须使用ajax登陆	x-request-with: XMLHttpRequest说明是ajax异步请求方式
# 8.指定某一时间后才可以		If-Unmodified-Since:  01 Jan 2076 00:00:00 GMT
# 9.必须是某一代理  Via: 1.0 fred, 1.1 example.com (Apache/1.1)
# 10.必须为某一邮件   From: user@example.c