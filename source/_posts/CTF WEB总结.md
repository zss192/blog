---
tags: []
categories:
  - CTF-WEB
date: 2020-02-06 18:45:00
cover: /img/post/1.jpg
---

---

### 1.http协议报头
##### 使用referer字段来伪造来源
**问：某些页面要求你必须要通过http://www.xxxx.com进行访问?**
答：增加一个referer字段
Referrer:http://www.xxxx.com  (题目要求的url) 
使用X-Forwarded-For来伪造ip

**问：题目要求必须是某个ip地址如1.1.1.1，才允许访问。**
答：增加一个X-Forwarded-For字段
X-Forwarded-For：1.1.1.1
使用User-Agent:伪造代理

**问：某些题目要求必须使用某个浏览器如HAHA浏览器，才允许访问。**
答：增加User-Agent字段
User-Agent:HAHA

**问：页面要求必须要安装了.net 9.0版本了才能访问。**
答：修改User-Agent字段
User-Agent:.NET CLR 9
使用Accept-Language修改语言

**问：题目要求只能外国人才能访问这个页面。**
答：修改Accept-Language字段
Accept-Language: en-US,en;q=0.8
直接查看http协议报头

**问：题目什么都没有提示，但是答案就直接是藏在http请求报头里面。**
答：在使用burp suit的时候注意看清楚头部有哪些内容。

### 2.sql注入
**判断是否过滤常见关键字**
答：在输入框中输入字符串：selectFromWhereUnionAndOrOderBy ，查看页面反馈回来的报错信息，如果报错信息中没有这一串字符串或者只有部分字符串，这说面消失的那一部分内过滤，这时候需要使用双写关键字或者大小写的方式绕过。比如说：select->selselectect->SelEct。

**判断是否过滤特殊字符**
答：同样的在输入框中输入字符串：'"( ) <>=空格，如果发现有字符消失，则说明该字符被过滤，需要采取编码的方式进行在输入框中输入字符串：selectFromWhereUnionAndOrOderBy ，查看页面反馈回来的报错信息，如果报错信息中没有这一串字符串或者只有部分字符串，这说面消失的那一部分内过滤，这时候需要使用双写关键字或者大小写的方式绕过。比如说：select->selselectect->SelEct绕过。如果是空格被过滤，可以考虑将空格替换成/**/。

**判断列数和回显位置**
答：在输入框中输入字符串：99‘ union select 1,2,3 。从select 1 开始，不断增加数字，直到页面显示正常。页面上出现的数字几，表示回显位置（注入点）在哪，之后将查询语句写在这个位置上。

**获取数据库名（设回显位置是2）**
答：99‘ union select 1, database(),3 from information_schema.SCHEMATA %23。

**获取数据库中的表名**
答：99’ union select 1,concat(TABLE_NAME),3 from information_schema.TABLES where TABLE_SCHEMA=查询到的数据库名 %23。

**获取数据库中表的列名**
答：99‘ union select 1,concat(column_NAME),3 from information_schema.columns where TABLE_SCHEMA=要查询的数据库名 and table_name=要查询表名的十六进制 %23。

**获取数据库表中列字段的值**
答：99‘ union select 1,concat(要查询的列名),3 from 要查询的表名 %23。

### 3.xss注入
**问：xss注入这类型的题目一般是要求能够通过js代码注入的方式实现页面弹窗。**
答：下面是几个最基本的弹窗语句：

```js
<script>alert(/1/)</script>
<img src=1 onerror="alert(/1/)">
<img src="javascript:alert('1');">
<a href="javascript:alert(1)">
```

过滤测试字符串：
'';!--"<XSS>=&{()}
绕过的方式可以参考：闭合标签，大小写，编码，双写，空格替换等等。

### 4.绕过上传

上传类的题目一般是要求上传一个包含一句话木马的脚本文件如php，上传成功后过关。针对这类题目的套路一般有以下几种：
##### 前端页面限制文件类型
检测:在上传前开启burp suit的拦截功能，然后选择一个php文件上传，如果上传过程中burp没有检测到有http数据，但是页面提示上传错误，这就是前端限制的一个表现。
解答：先将php文件的后缀改成jpg等普通文件格式，然后在文件上传过程中使用burp suit修改文件的后缀回php，实现前端限制绕过。

##### 黑名单限制绕过

检测:将要上传的php文件后缀改成一个谁都不知道的格式，然后上传，如果提示上传成功了，表明这题考的是黑名单限制绕过。
解答:web中间件除了可以解析php、asp、jsp等常规脚本文件外，还可以解析php2、php3、php4、htaccess、php5、pht、phtml、aspx、asa、jspx、js、ph、cer、cdx等格式，尝试修改成这些格式实现黑名单绕过上传。还可以尝试大小写文件后缀绕过。
##### MIME限制
检测:上传一张正常的图片文件，在上传的过程中使用burp suit将上传文件内的MIME类型内容，修改为非正常类型，如果提示上传失败表示该题目采用的是文件类型限制的方式。
解答:将MIME类型内容改为：image/jpeg，绕过MIME限制。
#####  文件内容限制

检测:上传一个由txt文件（内容无意义或无内容）修改后缀形成的jpg文件，如果提示上传失败，则可能题目做了针对jpg文件内容的检测。
解答:使用edjpgcom软件制作一句话图片木马，绕过文件内容限制。
##### 白名单限制

检测:如果以上方式都无法实现上传的话，有可能是服务器上面做了白名单限制，只能上传jpg等普通文件。
解答：尝试使用截断绕过和解析漏洞绕过来实现。
##### 截断绕过

解答：上传x.jpg文件，在上传的过程中使用burp suit修改文件名为x.php\x00.jpg或者x.php%00.jpg、x.php:1.jpg
##### 漏洞绕过
解答：Apache：修改上传文件名为x.php.abc，在低版本apache中，遇到不认识的后缀名会往前解析。
IIs：修改上传文件名为x.php;x.jpg，iis6.0中，截断字符是“;”冒号。
PHP以CGI的方式部署：直接上传图片木马x.jpg，在上传成功后图片的url后面加上1.php，图片可以被当成是php来执行。能够执行php的url如下所示：
http://www.xxxx.com/x.jpg/1.php




### 5.前端代码
##### 查看页面源代码
**问：页面上限制了鼠标右键，无法直接通过右键查看源代码。**
答：在火狐浏览器中，在当前页面的url前面输入view-source:即可查看到页面的源代码。 
##### 输入框无法输入
**问：要求在输入框中输入数据，但输入框无法输入。**
答：将<input>标签中的disable属性或者readonly属性删除。

##### 输入密码过关

**问：要求在输入框中输入正确的密码，才能通过。**
答：寻找源码<script>标签内的判断语句中如if（x==‘mima’）。找到密码输入之后提示密码错误有可能是在<script>标签内对你输入的密码进行了字符的过滤，比如语句x = x.replace("ctf","a")，需要在浏览器的查看器上将这个语句删除。

##### 计算密码
**问：密码在源码中并不是直接给出的，而是通过代码得出。**
答：比如在源码中看到密码由下面代码得出：

```js
var str ="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
password = numletter.substring(11,12);
password = password + numletter.substring(18,19);
password = password + numletter.substring(23,24);
password = password + numletter.substring(16,17);
if(x == password){ alert("恭喜过关!");}
```
新建一个文本文档，文档的内容为：

```js
<script> 
var str ="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
password = str.substring(11,12);
password = password + numletter.substring(18,19);
password = password + numletter.substring(23,24);
password = password + numletter.substring(16,17);
alert(‘password’);
</script>
```
将文件保存为x.html ,使用浏览器打开，弹框的内容就是算出来的密码。

##### 跳转问题

**问：在点击进入下一页的时候，有可能页面有细微变化或者明显进入下一页但又自动跳转回上一页。**
答：使用burp suit删除响应包中的跳转语句如window.location.href="xxx.php";
### 6.文件包含与读取
##### 文件读取
**问：url带有明显的文件包含特征，比如:http://www.xxx.com/index.php?a=1.php
答：可以通过php://filter/read=convert.base64-encode/resource=index.php得到index.php的源码。**
http://www.xxx.com/index.php?a=php://filter/read=convert.base64-encode/resource=index.php
如果题目flag在某个文件中，如flag.php，你就可以构造相应的url读取文件内容：
http://www.xxx.com/index.php?a=php://filter/read=convert.base64-encode/resource=flag.php
接着对页面上出现的字符串进行base64。

##### 执行命令

**问：要求能够执行php命令，且题目url带有明显的文件包含特征，比如:http://www.xxx.com/index.php?a=1.php**
 答：利用伪协议构造url：

```js
http://www.xxx.com/index.php?a=data:text/plain,<?php phpinfo()?>
http://www.xxx.com/index.php?a=data:text/plain;base64,PD9waHAgcGhwaW5mbygpPz4=
http://www.xxx.com/index.php?a=php://input  [POST DATA]:<?php phpinfo()?>
```
>转自公众号国科漏斗社区https://mp.weixin.qq.com/s/dD8vGsc-Nm-AbDzh2ldt3w（在这里也推荐一波这个公众号），如有侵权请联系我删除。


