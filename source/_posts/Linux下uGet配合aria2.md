---
tags:
  - Linux
categories:
  - Linux
date: 2020-02-22 15:45:00
cover: /img/post/3.jpg
---

---
<div id="content_views" class="markdown_views prism-atom-one-dark">
<path stroke-linecap="round" d="M5,0 0,2.5 5,5z" id="raphael-marker-block" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
                    </svg>
                                            <ol>
<li>
<p>安装uGet：软件中心即可安装。</p>
</li>
<li>
<p>安装aria2： <code>sudo apt-get install aria2</code></p>
</li>
<li>
<p>打开uget并最大化，点击edit-&gt;setting<br>
<img src="https://img-blog.csdnimg.cn/20190112141003979.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2Nsa3NqeA==,size_16,color_FFFFFF,t_70" alt="在这里插入图片描述"></p>
</li>
<li>
<p>点击插件，选aria2，其他默认即可，点击ok。<br>
<img src="https://img-blog.csdnimg.cn/20190112141120796.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2Nsa3NqeA==,size_16,color_FFFFFF,t_70" alt="在这里插入图片描述"></p>
</li>
<li>
<p>如果出现不能下载的问题，如uGet弹出<code>Error occourred when downloading</code>。可能是aria2的问题，在terminal中执行<code>aria2c --daemon --enable-rpc=true</code>即可 。<a href="https://askubuntu.com/questions/342433/uget-with-aria2-plugin" rel="nofollow">参考链接</a></p>
</li>
<li>
<p>如需下载迅雷链接，需要多进行一步链接转换。迅雷下载协议是经过加密的,如：<br>
thunder://QUFodHRwOi8vd3d3LmNub3N3aWtpLmNvbS93cC1jb250ZW50L3RoZW1lcy9tb25vY2hyb21lL2ltZy9sb2dvLmdpZlpa，直接在Linux下面是没有办法下载的。<br>
在ubuntu中，可在终端下使用<code>echo url|base64 -d</code> 来显示解密后的地址。如（URL为迅雷链接去掉开头）：

```bash
echo
QUFodHRwOi8vd3d3LmNub3N3aWtpLmNvbS93cC1jb250ZW50L3RoZW1lcy9tb25vY2hyb21lL2ltZy9sb2dvLmdpZlpa
|base64 -d
```

<p>显示结果是：<br>
<code>AAhttp://www.cnoswiki.com/wp-content/themes/monochrome/img/logo.gifZZ</code><br>
然后去除开头的AA和结尾的ZZ既是解密后的地址：<br>
<code>http://www.cnoswiki.com/wp-content/themes/monochrome/img/logo.gif</code><br>
拿到解密后的地址后，就可以使用uGet下载工具进行下载！<br>
<a href="https://blog.csdn.net/cjmiou/article/details/41152195">参考链接</a></p>
</li>
</ol>


