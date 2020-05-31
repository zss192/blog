---
tags:
  - CTF-WEB
categories:
  - CTF-WEB
date: 2020-02-15 15:45:00
cover: /img/post/5.jpg
---

---

# 函数介绍

```python
mt_scrand() //播种 Mersenne Twister 随机数生成器。
mt_rand()   //生成随机数
```
简单来说mt_scrand()通过分发seed种子，然后种子有了后，靠mt_rand()生成随机数
# 代码测试
```php
<?php  
mt_srand(12345);    
echo mt_rand()."###";
echo mt_rand()."###";
echo mt_rand()."###";
?>  
```
**运行结果如下**
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200215141703433.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)
**现在我们让它生成两个随机数，结果如下**
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200215141841774.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)
出现问题了，我们会发现当种子不变时，实际上生成的随机数是固定的。而这就是伪随机数漏洞，部分ctf题便以此为考点。
# 考点
## 1.根据种子预测随机数
如HackingLab上的小明学习代码审计这道题。链接：[小明学习代码审计](http://lab1.xseclab.com/pentest6_210deacdf09c9fe184d16c8f7288164f/index.php)

```php
<?php 
session_start();
include '_flag.php';
date_default_timezone_set('Asia/Shanghai');
if(isset($_POST['token']) && isset($_SESSION['token']) &&!empty($_POST['token'])&&!empty($_SESSION['token'])){
    if($_POST['token']==$_SESSION['token']){
        echo "PassResetSuccess! Your Flag is:".$flag;
    }else{
    	echo "Token_error!";
    }
}else{
    mt_srand(time());
    $rand= mt_rand();
    $_SESSION['token']=sha1(md5($rand));
    echo "Token Generate Ok! now send email to your EmailBox!.....";
    if(sendmymail($_SESSION['token'])){
    	echo "SendOK! \r\n<br> Your password reset Token has been send to your mailbox! <br>Please Check your mail box and fill your token here to reset your password!<br>";
    };
}
```
代码的关键就是以前时间戳为种子生成随机数，进行相关加密存到session，而当我们post的token数值和session中的token值相同时便可得到flag。
我们只需也按照相同的加密方式设置一定的时间区间生成随机数即可。
>如果你的时间和服务器上面的时间不同步，即time()的值不相同话，需要去偏移一个大概范围去爆破
>
详解见[小明学习代码审计writeup](https://www.cnblogs.com/kevinbruce656/p/11209125.html)
## 2.根据随机数预测种子
以上面生成的随机数为例，假设我们知道了第一个生成的随机数，那我们怎么预测种子呢？
那就要用到[php_mt_seed](https://github.com/lepiaf/php_mt_seed)这个工具了。
>php_mt_rand 工具只能用于爆破mt_rand()函数产生的随机数的种子值， 无论是否显式调用mt_srand()函数播种，但不能用于mt_rand(1,1000)这种指定范围的和rand函数的爆破

下载好后进入相应目录。第一次使用需要先输入make生成php_mt_seed文件,以后就不用输入了。
使用./php_mt_seed + 随机数即可。细心地小伙伴会发现有时会出现好多预测出的种子，这是正常现象，我们只需逐一尝试下即可（一般情况下跑出来的种子不会很多）
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200215143826275.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)
我们可以看到跑出来的种子12345，这正是上面我们设置的种子。

**参考：**[Web中的随机数安全总结](https://www.jianshu.com/p/607af0735aa8)
