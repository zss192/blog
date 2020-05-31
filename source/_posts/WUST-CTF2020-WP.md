---
tags:
  - CTF-WEB
categories:
  - CTF-WEB
date: 2020-03-29 18:45:00
cover: /img/post/1.jpg
---

---

# WEB
## checkin
打开页面显示Who's the author?，回到题目发现作者是52HeRtz，输入52HeRtz发现有截断，f12选中输入框把maxlength改成一个较大的数即可输入。然后发现提交按钮不能用，选中提交按钮删除disabled="disabled"(意思是禁止点击)即可。提交弹出：一个远古的博客: https://52hertz.tech
打开链接跳到一个博客首页
在最后一篇博客发现名为远古的blog的文章，打开在最下面发现Here is your flag: 5_a_c@nner_can_Can_@_can}。这应该不是完整的flag,回到首页发现会动态显示flag,查看源代码，搜索wctf找到对应的flag的前半段，拼接即可。

![在这里插入图片描述](https://img-blog.csdnimg.cn/20200328143052442.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)
## admin
题目说作为admin登录，尝试万能密码，用户名为admin'#，密码随便输，成功登入。

```bash
提示必须本地IP：X-Forwarded-For:127.0.0.1
用GET方式传一个参数ais, 值为520：?ais=520
用POST方式传一个参数wust, 值为1314 ：burpsuite变更请求方法,注意get还是要在网址那传参，wust=131

```
提示离flag很近了，给了个网址，但应该顺序是乱的
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200329135428234.png)
先拼接https://paste.ubuntu.com打开
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200329135536616.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)
随便输入个字符结果地址是https://paste.ubuntu.com/p/rJcP4y52Yv/
这和题目给的网址类似，按照这个格式拼接尝试即可
## CV Maker
先注册个账号，然后登录。发现页面其他地方不能点击。只有个更换图像，考点应该是文件上传。尝试上传一句话木马均失败，改变content-type均失败，扫描发现有uploads目录，访问发现好多文件，按时间排序上传一个正常的图片发现就在这个目录下，查看别人上传的php文件，发现只能看到GIF89a，谷歌搜了下文件上传发现这是文件头检验。![在这里插入图片描述](https://img-blog.csdnimg.cn/20200328144508301.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)
在burpsuite一句话前面加上GIF89a,然后去uploads目录下查看刚刚上传的php文件，用蚁剑成功连接。
![在这里插入图片描述](https://img-blog.csdnimg.cn/2020032814453471.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)
到根目录发现flag文件打开一片空白，然后又发现还有个readflag文件。因为前不久就做过一题成功上传了木马，却找不到flag，情形和现在一样。当时看了wp就是说在终端运行readflag即可。

![在这里插入图片描述](https://img-blog.csdnimg.cn/2020032814501679.png)
>看来还是得再看看文件上传，这次是碰巧了，hahaha。附上一篇不错的[文件上传漏洞（绕过姿势） ](https://thief.one/2016/09/22/%E4%B8%8A%E4%BC%A0%E6%9C%A8%E9%A9%AC%E5%A7%BF%E5%8A%BF%E6%B1%87%E6%80%BB-%E6%AC%A2%E8%BF%8E%E8%A1%A5%E5%85%85/)
## easyweb
>本来没做出来，结束时群里有人说可以读bash_history,又去做了下，做出来了，不过读bash_history是非预期的答案，haha
>
上传一个文件返回一个下载地址，在最后输错会暴露绝对路径
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200329222735522.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)
我们可以根据这向上层找找到根目录先下载passwd文件查看有哪些用户

```bash
http://47.96.229.52:12121/download?file=../../../../../../../etc/passwd
```
可以看到存在tomajp用户，然后下载它的bash_history文件
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200329223055902.png)

```bash
47.96.229.52:12121/download?file=../../../../../../../home/tomajp/.bash_history
```
打开文件一般看最后发现
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200329223200665.png)
尝试进入根目录下的flaaaag下的what_you_want
下载文件打开即得到flag

```bash
47.96.229.52:12121/download?file=../../../../../../../flaaaag/what_you_want
```
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200329223312897.png)
## train yourself to be godly
>这题wp来自官方wp：[WUST-CTF 2020 官方 Writeup](https://ivenwings.github.io/2020/03/30/wctf2020_official_wp/#train-yourself-to-be-godly-1-solves)

页面是 examples，其实洞不在这里，好像一般人很难想得到，肯定得需要 hint，于是就有了 Orange 大哥在 BlackHat 上的一个议题，就是那个 pdf，主要内容就是URL路径参数不规范引发的问题，能造成的危害如下
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200330220931669.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)

apache中的tomcat/webapps目录如下。

既然题目是用了examples目录作为网站根目录，那么上图中的Web容器控制台和管理界面这一点就显得很有意思了
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200330220953831.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)

manage目录是可以上传WAR文件部署服务，也就是说可以通过manage目录实现文件上传，继而实现木马上传，也就是第二个hint。
![在这里插入图片描述](https://img-blog.csdnimg.cn/2020033022101421.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)

我们可以看到 pdf 有一个这样的东西，告诉我们可以通过 /..;/manager/html 进入到manager页面。

并且随便加一串路径，根据报错信息知道我们当前的tomcat的root路径为examlpes
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200330221038281.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)

目录穿越到 manager 得输入密码验证，这里是弱密码 tomcat/tomcat

![在这里插入图片描述](https://img-blog.csdnimg.cn/20200330221054191.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)

接下来就是上传 war 包拿 webshell，github挑一个就好了，这里用 LandGrey 的。

可以直接用jar cvf yourname.war webshell.jsp命令将webshell.jsp打包成war

选择文件，上传。

![在这里插入图片描述](https://img-blog.csdnimg.cn/2020033022111222.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)

根据报错信息明显路径拼结完是example/manager/html/upload，缺少一个/..;/，加一个再试

返回一个403，这说明/manager/html/upload路径访问到了，但是权限不够，那一般问题就出在cookie或者session没给，www没有目录访问权限身上。按照目前的思路来说，不会出现服务器权限不足的问题，那就只能是cookie没添。利用burpsuit从头开始抓包，在访问/..;/manager/html出现了Set-Cookie(set-Cookie的Path是指此cookie只在Path目录下起作用)，那么我们403的问题就迎刃而解，只需要将/example换成Path参数指定的/manage就行，再把cookie加上就完事了。

![在这里插入图片描述](https://img-blog.csdnimg.cn/20200330221129353.png)

修改post，添加cookie（ps: 由于cookie只能用一次，所以还是403的话，再请求一次/..;/manager/html，更换新的cookie就行了 ），上传完毕后可以看到war已安装好了，访问上传的war，注意这里还有一个/..;/的坑，剩下的就是根据自己的马找flag了。

当然直接找flag是找不到的，这道题我改得比较玄学，加了《圣经》新约：《提摩太后书》里的文章。（逃
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200330221143225.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200330221153882.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)


可以看到在Timothy里面，cat 一下，是一段文章，这里知道flag格式，grep一下 wctf2020，就可以看到flag了。
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200330221206348.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)
![在这里插入图片描述](https://img-blog.csdnimg.cn/2020033022121450.png)

In the end, train yourself to be godly.
## 朴实无华
intval(字符串)为0 但是intval(字符串+1) 会自动转换成数值
MD5需要用一个0e开头纯数字加密后仍为0e开头纯数字的数
空格用${IFS}代替
```powershell
http://101.200.53.102:23333/fl4g.php?num=0x2022&md5=0e215962017&get_flag=cut${IFS}-b${IFS}1-222${IFS}fllllllllllllllllllllllllllllllllllllllllaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaag
```
## 颜值成绩查询
明显是sql注入，经测试过滤了空格可用/**/代替，过滤了关键字可用大小写替换。剩下没啥了union查询查出flag

```bash
http://101.200.53.102:10114/?stunum=-1/**/uNion/**/seleCt/**/1,flag,value/**/frOm/**/flag--+
```

![在这里插入图片描述](https://img-blog.csdnimg.cn/20200329125337505.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)
>吐槽一下sqlmap,明明设置了脚本还是没跑出来，最后还是手工注入的，经检查注入代码发现注释的--后面的空格也被替换成/**/了，导致注释失效。看来还是得学学写py脚本了。
>补充：官方wp说检查了UA,所以sqlmap根本跑不出来
# MISC
## Space Club
打开文件一片空白，但是如果Ctrl+a全选文本就会发现
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200328150353926.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)
那么flag肯定是0和1搭配然后转换，这里说个技巧，比如这次比赛flag都是wctf2020{},那么我们可以先看看w的二进制是什么，然后往这方面靠。w的二进制是01110111，然而在文本编辑器里不大容易看出来，放到sumlime中发现
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200328150644194.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)
这样很明显的发现每行正好对应01110....
把等于第一行的内容全部替换成0，然后第二行正好是00，然后把00替换成1，再把换行替换成空格即可。就会出现01字符串。
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200328151010582.png)
上脚本

```python
import base64
import re
def shiZhuanAscii(ls):	#十进制列表转ascii
	flag=''
	for i in ls:
	    flag=flag+chr(int(i))
	return flag
def erZhuanShi(ls):		#二进制列表转十进制列表
	for i in range(len(ls)):
		ls[i]=int(ls[i],2)
	return ls
def splitS(s,n):	#把字符s每n个分到一个列表元素
	ls=re.findall('.{'+str(n)+'}', s)     
	return ls

#示例：

s="011101110110001101110100011001100011001000110000001100100011000001111011011010000011001101110010011001010101111100110001011100110101111101111001001100000111010101110010010111110110011001101100010000000110011101011111011100110011000101111000010111110111001100110001011110000101111101110011001100010111100001111101"
ls=splitS(s,8)  #['1100110', '1101100', '1100001', '1100111', '1111011', '1010111', '0110000', '1010111', '0101010', '1100110', '1110101', '1101110', '1101110', '1111001', '1111101']
ls=erZhuanShi(ls)  #[102, 108, 97, 103, 123, 87, 48, 87, 42, 102, 117, 110, 110, 121, 125]
ls=shiZhuanAscii(ls) #flag{W0W*funny}
print(ls)
```
直接跑出flag
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200328151138592.png)
## Welcome
打开发现一个exe程序，还有一个xml文件，题目说明中说会打开摄像头。

搜了下那个xml文件名发现相当于人脸识别。由于我用的Linux，用我姐的电脑打开exe文件等一小会摄像头打开了，发现会有个圈圈圈注你的脸，左晃晃右晃晃也没发现咋整，就在这时突然小黑框出现了flag。hahaha。

然后又研究了下咋回事，题目说三人行，exe中又会有圈，于是尝试在画面中让相机捕捉到三个圈(可以用手比个圈)就出现了flag。
## Alison likes jojo
打开文件两个图片，binwalk一波发现其中一个藏有压缩包，分离发现压缩包密码。

这时一般有两种情况
1.根据没用到的那张图片找到解压密码，再继续下一步。这种一般密码都比较复杂。
2.暴力破解得到密码，然后再结合剩下那张图片。

一边暴力破解一边分析下另一张图片。一会暴力破解成功，密码是纯数字。解压发现好像是base64:WVRKc2MySkhWbmxqV0Zac1dsYzBQUT09，几次base64解密得到killerqueen。这应该是个秘钥。这时首先想到了outguess加密(因为前几天bjdctf就有个outguess隐写)。

```powershell
outguess -r jljy.jpg -k killerqueen  out.txt
```
然后打开out.txt发现flag
## Shop
根据题目提示nc连接，发现是个买flag的商店
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200328152759448.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)
1就是查看余额，2买flag有两个选项，买真的flag提示钱不够(一般都是这个套路)，但是可以买Cheaper flag,但也只能买两个然后就没钱了
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200328152957945.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)
一筹莫展时搜了下这样的ctf题目，虽然没搜到但一篇文章提到了让价钱等于-1溢出，然后尝试买Cheaper flag时输一个较大的数。
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200328153258454.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)

我们可以发现花费是负的数，这样余额减去一个负的数就是一个比较大的正数。原理大概是计算机有固定运算能力，如果超过最大运算值会来个循环正太大就从负的开始了。不过现在一般都不会出这种问题，都有防护措施的。
然后去买real flag,成功买到
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200328153541470.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)
## girlfriend
>本来以为是摩丝密码，看wp才知道是九键的声音
>
原理是DTMF
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200330155057182.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)
经搜索找到了软件解密和py脚本，可能会有误差，稍微调整下即可
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200330150013864.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200330150053759.png)
解密得到flag：wctf2020{youaremygirlfriends}
如果出现提交不对，可能是识别的重复了，可结合AU看频谱图看看它的次数
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200330155014556.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)
## 爬
打开提示flag被图片盖住，本来以为是找那种分离pdf的工具，一番搜索无果，然后binwalk foremost分离试试，分离了一个图片但还是没啥用。

然后突然想到试试把pdf里的图片删除试试。打开分离的图片,然后找到文件头和文件尾。在PDF里删除对应的十六进制。这时打开还是啥都没有。想着改下后缀名吧，再打开就出现了一行十六进制。
>这里是个坑，我用的linux，不是根据后缀名打开文件的，打开源文件的是自带的一个软件，改后缀pdf后是默认wps打开。

![在这里插入图片描述](https://img-blog.csdnimg.cn/20200328211859588.png)
用qq识图复制十六进制转文本得到flag

![在这里插入图片描述](https://img-blog.csdnimg.cn/20200328212014382.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)
>看到flag猜测应该是用ps分层把图片那层去掉。
ps解法：打开pdf文件选择图像引入，选择第一个图像即可。
## Find me
打开图片查看备注发现⡇⡓⡄⡖⠂⠀⠂⠀⡋⡉⠔⠀⠔⡅⡯⡖⠔⠁⠔⡞⠔⡔⠔⡯⡽⠔⡕⠔⡕⠔⡕⠔⡕⠔⡕⡍=
明显是盲文(几个点最后有等于号)
在线解密，附上网站：[盲文解密](https://www.qqxiuzi.cn/bianma/wenbenjiami.php?s=mangwen)
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200329122055178.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)
# 小结
总的来说体验还是不错的，这次比赛可能是新生赛比较简单点，题目大多考的不是很难的点而是脑洞吧，不过还是发现了自己的一点不足，还是得继续努力。
