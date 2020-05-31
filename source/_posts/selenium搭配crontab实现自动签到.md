---
title: selenium搭配crontab实现自动签到
tags:
  - 日常办公
categories:
  - 日常办公
date: 2020-04-17 16:45:00
---
# 起因
前几天接触到linux中的crontab可以定时完成更换壁纸、推送本地文件到github等功能。这几天想着可不可以弄个自动签到的脚本，本来用的爬虫带cookie实现登录然后签到，但是过几天cookie失效就凉凉了。偶然的机会了解到selenium可以模拟浏览器点击，于是找了找关于自动签到的文章学习下，在次记录下。
# selenium简介
Selenium 是一个综合性的项目，为web浏览器的自动化提供了各种工具和依赖包。他有很多功能。此次主要结合Python，功能可以理解为可以模拟一个浏览器并进行各种点击、填写账号密码等操作。
# 放张截图
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200417161530715.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)
# 要点
主要是选取到合适的元素，假装代码是一个人，你要先打开网页，然后输入账号，然后你要点击登录这样的按钮，对于代码来说它要先找到登录的按钮才能进行点击等操作。所以查找的合适精准至关重要。
## 查找元素
通过id

```python
driver.find_element_by_id('loginForm')
```
通过name

```python
driver.find_element_by_name('username')
```
通过Xpath

```python
#绝对定位 (页面结构轻微调整就会被破坏)
driver.find_element_by_xpath("/html/body/form[1]")
#HTML页面中的第一个form元素
driver.find_element_by_xpath("//form[1]")
#包含 id 属性并且其值为 loginForm 的form元素
driver.find_element_by_xpath("//form[@id='loginForm']")
```
>对于查找而言，你可以F12选中一个元素然后右键选择Copy便有copy xpath等选项
## 其他要点
点击操作

```python
driver.find_element_by_xpath('/html/body/div[2]/button').click()
```
填写信息

```python
driver.find_element_by_id('email').send_keys(username)
```
获取元素内容

```python
driver.find_element_by_xpath('//*[@id="swal2-content"]').text
```
# 缺点
对于selenium我个人感觉最大的缺点就是比较慢，相对于爬虫速度慢点多，代码中虽然用到了禁用图片、设置超时等操作但还是比较慢。不过对于自动签到而言，慢一点也没什么太大的影响，只要能稳定就行。
# 代码

```python
"""
功能：自动签到脚本
配置：登录地址 + 账号 + 密码
"""
import time
from selenium import webdriver
from selenium.common.exceptions import NoSuchElementException
from selenium.webdriver.chrome.options import Options

def checkin(login_url,username,password):
    chrome_options = Options()  #解决使用chrome报错
    chrome_options.add_argument('--headless')
    chrome_options.add_argument('--no-sandbox')
    chrome_options.add_argument('--disable-dev-shm-usage')
    chrome_options.add_argument("enable-automation")
    chrome_options.add_argument("--headless")
    chrome_options.add_argument("--window-size=1920,1080")
    chrome_options.add_argument("--no-sandbox")
    chrome_options.add_argument("--disable-extensions")
    chrome_options.add_argument("--dns-prefetch-disable")
    chrome_options.add_argument("--disable-gpu")

    chrome_prefs = {}   #禁止加载图片以提高速度
    chrome_options.experimental_options["prefs"] = chrome_prefs
    chrome_prefs["profile.default_content_settings"] = {"images": 2}
    chrome_prefs["profile.managed_default_content_settings"] = {"images": 2}
    driver = webdriver.Chrome(options=chrome_options, executable_path='/usr/bin/chromedriver')  # 初始化chrome
    driver.set_page_load_timeout(30) #设置超时以提高速度
    driver.maximize_window()  # 最大化窗口

    try:
        driver.get(login_url)  # 进入登录页面
    except:
        driver.execute_script("window.stop()") #加载超时停止加载执行下一步操作

    print("当前页面为："+driver.find_element_by_xpath('//*[@id="app"]/section/div/div[1]/div/h4/span').text)
    print("当前账号为："+username)
    print("--------------------------------")

    try:
        time.sleep(3)  # 延时加载
        driver.find_element_by_id('email').send_keys(username)  # 填充用户名和密码
        driver.find_element_by_id('password').send_keys(password)
        driver.find_element_by_xpath('/html/body/div[1]/section/div/div[1]/div/form/div[4]/button').click()  # 登录
        time.sleep(3)
        driver.find_element_by_xpath('/html/body/div[2]/div/div/div[3]/button').click()   #点击刚进主页弹出的弹窗
        time.sleep(3) #等待两秒，点击read后网页流量是动态增加的
        try:  # 未签到
            driver.find_element_by_xpath("/html/body/div[1]/div/div[3]/section/div[1]/div/div/a").click()  # 点击签到
            print(driver.find_element_by_xpath('//*[@id="swal2-content"]').text)
            driver.find_element_by_xpath("/html/body/div[7]/div/div[3]/button[1]").click()
            print("签到成功，恭喜你，幸运的boy")
        except Exception as e:
            print("已经签到过了")
    except Exception as e:
        print(e)
        print("签到失败")

    time.sleep(3)
    print("当前流量为："+driver.find_element_by_xpath("//*[@id='app']/div/div[3]/section/div[3]/div[2]/div/div[2]/div[2]/span").text+"G")
    print()
    driver.quit()

checkin("url","账号","密码")
checkin("url","账号","密码")
```
# 写在最后
以上仅为个人总结，我也是刚接触，如有错误，请联系我更正。以后发现更多linux和python有趣的事也会分享的。