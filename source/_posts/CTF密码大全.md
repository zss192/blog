---
tags: []
categories:
  - CTF-杂项
date: 2020-02-10 16:45:00
cover: /img/post/6.jpg
---

---
<div class="htmledit_views" id="content_views">
                                            <h3><a name="t0"></a><a name="t0"></a><strong>通信领域的编码</strong></h3>

<p><strong>1.摩斯编码</strong></p>

<p><strong>特征特点</strong>：用点（.）和划（-）来编码范围<strong>0-9、A-Z</strong>的字符，字母不区分大小写，两个字母之间的空格用斜杠（/）或者三个点（.）或者一个划（-）表示，两个单词之间的间隔是七个点（.）。 根据摩斯编码的原理，CTF中也有出现过变种的摩斯编码，比如点（.）和划（-）用数字0和1来表示等此类变种的思路。</p>

<p><strong>在线解密&amp;工具</strong>： http://www.jb51.net/tools/morse.htm （编码的时候不转换空格） http://ctf.ssleye.com/morse.html （编码的时候不转换空格） http://rumkin.com/tools/cipher/morse.php （空格用斜杠表示）</p>

<p><strong>2.敲击码</strong></p>

<p><strong>特征特点</strong>：敲击码是基于5×5方格波利比奥斯方阵来实现的，不同点是是用K字母被整合到C中，因此密文的特征为1-5的两位一组的数字，编码的范围是A-Z字母字符集，字母不区分大小写。</p>

<p><img alt="" class="has" src="https://ask.qcloudimg.com/http-save/yehe-1539004/vta8io4tvs.png?imageView2/2/w/1620"></p>

<p><strong>在线解密&amp;工具</strong>： http://ctf.ssleye.com/tapcode.html</p>

<p><strong>3.格雷编码</strong></p>

<p><strong>特征特点</strong>：由相邻两位数之间只有一个位元改变的二进制数码构成数列集合。传统的二进位系统例如数字3的表示法为011，要切换为邻近的数字4，也就是100时，装置中的三个位元都得要转换，因此于未完全转换的过程时装置会经历短暂的，010,001,101,110,111等其中数种状态，也就是代表着2、1、5、6、7，因此此种数字编码方法于邻近数字转换时有比较大的误差可能范围。格雷码的发明即是用来将误差之可能性缩减至最小。</p>

<p><img alt="" class="has" src="https://ask.qcloudimg.com/http-save/yehe-1539004/xenqmnq21o.png?imageView2/2/w/1620"></p>

<p><strong>在线解密&amp;工具</strong>： http://www.ab126.com/system/2780.html</p>

<p><strong>4.中文电码</strong></p>

<p><strong>特征特点</strong>：密文以4位[0-9]为一组的数字表示，如2435 0766两组数字分别表示汉字中文：”斗哥“。 中文电码，又称中文电报码或中文电报明码，是于电报之中传送中文信息的方法。它是第一个把汉字化作电子讯号的编码表。其中简体中文电码收录了7085个汉字，繁体中文电码收录了9041个汉字。</p>

<p><strong>在线解密&amp;工具</strong>： http://www.atool.org/dianma.php</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<h3><a name="t1"></a><a name="t1"></a><strong>计算机相关的编码</strong></h3>

<p>计算机相关的编码主要是与计算机系统中会用到的编码，比如常见的ascii编码、unicode、URL编码等，还有就是我们的就是代码混淆中会遇到的一些编码，以及我们古典加密中常见的换位加密和替换加密等。</p>

<p><strong>01-常见的编码</strong></p>

<p><strong>● 字母表编码</strong></p>

<p><strong>特征特点</strong>：用数字<strong>1-26</strong>或者<strong>0-25</strong>来编码范围为<strong>A-Z/a-z</strong>字母字符，字母不区分大小写。</p>

<p><img alt="" class="has" src="https://ask.qcloudimg.com/http-save/yehe-1539004/nz9vqo9hg8.png?imageView2/2/w/1620"></p>

<p><strong>在线解密&amp;工具</strong>：</p>

<p>http://ctf.ssleye.com/a1z26.html</p>

<p><strong>● 进制编码</strong></p>

<p><strong>特征特点</strong>：主要是各进制之间的转换 二进制数，只有01两个字符 八进制数，0开头，用[0-7] 8个字符表示 十六进制数，0x开头，[0-9，a-f ]等十六个个字符表示 <strong>在线解密&amp;工具</strong>： https://tool.oschina.net/hexconvert</p>

<p><strong>● ASCII编码</strong></p>

<p><strong>特征特点</strong>：用1个字节的8位数来编码英文字符集，即所有字母数字等英文符号可以用二进制数、十进制、十六进制来表示。比如大写字母A可分别用二进制数（01000001）、十进制（65）、十六进制（0x41）来表示。</p>

<p><img alt="" class="has" src="https://ask.qcloudimg.com/http-save/yehe-1539004/xk1lcnkhlx.jpeg?imageView2/2/w/1620"></p>

<p><strong>在线解密&amp;工具</strong>： http://ctf.ssleye.com/jinzhi.html http://ctf.ssleye.com/cencode.html http://www.ab126.com/goju/1711.html</p>

<p><strong>● GBK/GBK2312编码</strong></p>

<p><strong>特征特点</strong>：用2个字节16比特的16进制数表示来编码中文字符集，其中GBK是GBK2312的扩展字符集编码，包含简体、繁体中文、日语、韩语等。比如斗哥斗对应的GBK和GBK2312为B6B7。</p>

<p><strong>在线解密&amp;工具</strong>： http://www.mytju.com/classcode/tools/encode_gb2312.asp https://www.qqxiuzi.cn/bianma/zifuji.php</p>

<p><strong>● unicode编码</strong></p>

<p><strong>特征特点</strong>：国际标准字符，将全球的各种语言的每个字符定义一个唯一的编码，以满足跨语言、跨平台文本信息的转换，当编码和解码的字符集出现不一致的时候就会出现乱码。 unicode一般有四种表示形式 &amp;#x [Hex]: &amp;#x0054;&amp;#x0068;&amp;#x0065; &amp;# [Decimal]: &amp;#00084;&amp;#00104;&amp;#00101; \U [Hex]: \U0054\U0068\U0065 \U+ [Hex]: \U+0054\U+0068\U+0065</p>

<p><strong>在线解密&amp;工具</strong>： http://tool.chinaz.com/tools/unicode.aspx</p>

<p><strong>● UTF-8</strong></p>

<p><strong>特征特点</strong>：utf-8是一种可变长的字符编码，主要是为了节省存储空间，编码长度根据编码的字符集从1个字节到6个字节不等。 <strong>在线解密&amp;工具</strong>： http://tool.chinaz.com/Tools/UTF-8.aspx</p>

<p><strong>● URL编码</strong></p>

<p><strong>特征特点</strong>：一个字符ascii码的十六进制，然后在前面加上% <strong>在线解密&amp;工具</strong>： http://ctf.ssleye.com/url.html http://tool.chinaz.com/Tools/urlencode.aspx</p>

<p><strong>● base系列编码</strong></p>

<p><strong>1.base64</strong></p>

<p><strong>特征特点</strong>：密文由64个字符(A-Z,a-z,0-9,+,/)组成，末尾可能会出现1或2个’=’ 最多有2个 加密原理过程如下：</p>

<p><img alt="" class="has" src="https://ask.qcloudimg.com/http-save/yehe-1539004/ynt95h0sqy.png?imageView2/2/w/1620"></p>

<p>base64索引表如下：</p>

<p><img alt="" class="has" src="https://ask.qcloudimg.com/http-save/yehe-1539004/8s9sll4apo.png?imageView2/2/w/1620"></p>

<p><strong>在线解密&amp;工具</strong>： http://ctf.ssleye.com/base64.html</p>

<p><strong>2. base32</strong></p>

<p><strong>特征特点</strong>：密文由32个字符（A-Z,2-7)组成，末尾可能会有‘=’，但最多有6个 <strong>在线解密&amp;工具</strong>： http://ctf.ssleye.com/base64.html</p>

<p><strong>3. base16</strong></p>

<p><strong>特征特点</strong>：密文由16个字符（0-9,A-F）组成 <strong>在线解密&amp;工具</strong>： http://ctf.ssleye.com/base64.html</p>

<p><strong>4. base36</strong></p>

<p><strong>特征特点</strong>：密文由36个字符（0-9,a-z）组成，加密仅支持整数数字，解密仅支持字符串，不支持中文 密文由36个字符（0-9,A-Z） <strong>在线解密&amp;工具</strong>： http://ctf.ssleye.com/base36w.html</p>

<p><strong>5. base58编码</strong></p>

<p><strong>特征特点</strong>： Base58是用于Bitcoin中使用的一种独特的编码方式，主要用于产生Bitcoin的钱包地址，Base58不使用数字”0”，字母大写”O”，字母大写”I”，和字母小写”l”，以及”+”和”/”符号 <strong>在线解密&amp;工具</strong>： http://ctf.ssleye.com/base58w.html</p>

<p><strong>6. base62编码</strong></p>

<p><strong>特征特点</strong>：密文由62字符（0-9，a-z，A-Z）组成 <strong>在线解密&amp;工具</strong>： https://base62.io/（支持中文） http://decode-base62.nichabi.com http://ctf.ssleye.com/base62.html（仅支持数字）</p>

<p><strong>7. base91编码</strong></p>

<p><strong>特征特点</strong>：密文由91个字符（0-9，a-z，A-Z,!#$%&amp;()*+,./:;&lt;=&gt;?@[]^_`{|}~”）组成 <strong>在线解密&amp;工具</strong>： http://ctf.ssleye.com/base91.html</p>

<p><strong>02-代码混淆加密</strong></p>

<p><strong>● UUencode</strong></p>

<p><strong>特征特点</strong>：一种二进制到文字的编码，将要编码的文件转化为二进制，重新分组进行编码的过程，与base64编码类似。 <strong>在线解密&amp;工具</strong>： http://web.chacuo.net/charsetuuencode https://www.qqxiuzi.cn/bianma/uuencode.php</p>

<p><strong>● XXencode</strong></p>

<p><strong>特征特点</strong>：与xxencode类似，区别是打印的字符不同 <strong>在线解密&amp;工具</strong>： http://web.chacuo.net/charsetxxencode/</p>

<p><strong>● quoted-printable</strong></p>

<p><strong>特征特点</strong>：在所有邮件处理的各式各样的编码中，很多编码的目的都是通过编码的手段使得七位字符的邮件协议体系可以传送八位的二进制文件、双字节语言等等。Quoted-Printable也是这样一些编码中的一个，它的目的同样是帮助非ASCII编码的信件传输通过SMTP。Quoted-Printable编码是字符对应的编码，每个末编码的二进制字符被编码成三个字符，即一个等号和一个十六进制的数字，如‘=AB’。</p>

<p><strong>在线解密&amp;工具</strong> http://www.mxcz.net/tools/QuotedPrintable.aspx</p>

<p><strong>● jjencode</strong></p>

<p><strong>特征特点</strong>：将JS代码转换成只有符号的字符串 <strong>在线解密&amp;工具</strong>： http://utf-8.jp/public/jjencode.html http://www.atoolbox.net/Tool.php?Id=704</p>

<p><strong>● aaencode</strong></p>

<p><strong>特征特点</strong>：将JS代码转换成常用的网络表情 <strong>在线解密&amp;工具</strong>： http://utf-8.jp/public/aaencode.html https://www.qtool.net/decode</p>

<p><strong>● ppencode</strong></p>

<p><strong>特征特点</strong>：把Perl代码转换成只有英文字母的字符串 <strong>在线解密&amp;工具</strong>： http://namazu.org/~takesako/ppencode/demo.html</p>

<p><strong>● rrencode</strong></p>

<p><strong>特征特点</strong>：把ruby代码全部转换成符号 <strong>在线解密&amp;工具</strong>： http://www.lab2.kuis.kyoto-u.ac.jp/~yyoshida/rrencode.html</p>

<p><strong>● JSfuck</strong></p>

<p><strong>特征特点</strong>：用6 个字符 ( ) [ ] !+ 来对JavaScript进行编码 <strong>在线解密&amp;工具</strong>： http://discogscounter.getfreehosting.co.uk/js-noalnum.php http://www.jsfuck.com/</p>

<p><strong>● jother</strong></p>

<p><strong>特征特点</strong>： 密文为8个字符! + ( ) [ ] { } <strong>在线解密&amp;工具</strong>： jother直接在浏览器(IE可以)的控制台里输入密文即可执行解密</p>

<p><strong>● brainfuck编程语言</strong></p>

<p><strong>特征特点</strong>：密文由+.&lt;&gt;[]’ &amp;&amp; ‘!.?或者’+-.&lt;&gt;[]’等组成 <strong>在线解密&amp;工具</strong>： https://www.splitbrain.org/services/ook https://www.nayuki.io/page/brainfuck-interpreter-javascript http://esoteric.sange.fi/brainfuck/impl/interp/i.html</p>

<p><strong>03-古典密码</strong></p>

<p><strong>03古典密码-换位加密</strong></p>

<p><strong>● 栅栏密码(Rail-fence Cipher)</strong></p>

<p><strong>特征特点</strong>：栅栏密码是一种简单的移动字符位置的加密方法，加密前后的字符数不变。</p>

<p>栅栏密码的加密方式：把文本按照一定的字数分成多个组，取每组第一个字连起来得到密文1，再取每组第二个字连起来得到密文2……最后把密文1、密文2……连成整段密文。</p>

<p><strong>在线解密&amp;工具</strong>： https://www.qqxiuzi.cn/bianma/zhalanmima.php</p>

<p><strong>● 曲路密码(Curve Cipher)</strong></p>

<p><strong>特征特点</strong>：曲路密码(Curve Cipher)是一种换位密码，需要事先约定填充的行列数(也就是曲路路径)</p>

<p><img alt="" class="has" src="https://ask.qcloudimg.com/http-save/yehe-1539004/lo80fll85d.jpeg?imageView2/2/w/1620"></p>

<p><strong>在线解密&amp;工具</strong>：暂无</p>

<p><strong>● 列移位密码(Columnar Transposition Cipher)</strong></p>

<p><strong>特征特点</strong>：列移位密码(Columnar Transposition Cipher)是一种比较简单，易于实现的换位密码，通过一个简单的规则将明文打乱混合成密文。 以明文 The quick brown fox jumps over the lazy dog，密钥 how are u为例： 填入5行7列表(事先约定填充的行列数，如果明文不能填充完表格可以约定使用某个字母进行填充)</p>

<p><img alt="" class="has" src="https://ask.qcloudimg.com/http-save/yehe-1539004/mwqj8mz9jo.png?imageView2/2/w/1620"></p>

<p>密钥：how are u 按how are u在字母表中的出现的先后顺序进行编号，我们就有a为1,e为2，h为3，o为4，r为5，u为6，w为7，所以先写出a列，其次e列，以此类推写出的结果便是密文： 密文：qoury inpho Tkool hbxva uwmtd cfseg erjez</p>

<p><img alt="" class="has" src="https://ask.qcloudimg.com/http-save/yehe-1539004/5n92r8it7c.png?imageView2/2/w/1620"></p>

<p><strong>在线解密&amp;工具</strong>： http://www.practicalcryptography.com/ciphers/classical-era/columnar-transposition/</p>

<p><strong>03-古典密码-替换加密</strong></p>

<p><strong>● 埃特巴什码(Atbash Cipher)</strong></p>

<p><strong>特征特点</strong>：埃特巴什码(Atbash Cipher)是一种以字母倒序排列作为特殊密钥的替换加密 对应关系如下： ABCDEFGHIJKLMNOPQRSTUVWXYZ ZYXWVUTSRQPONMLKJIHGFEDCBA</p>

<p><strong>在线解密&amp;工具</strong>：</p>

<p>http://www.practicalcryptography.com/ciphers/classical-era/atbash-cipher/</p>

<p><strong>● 凯撒密码(Caesar Cipher)</strong></p>

<p><strong>特征特点</strong>：明文中的所有字母都在字母表上向后（或向前）按照一个固定数目进行偏移后被替换成密文 <strong>在线解密&amp;工具</strong>： http://planetcalc.com/1434/</p>

<p><strong>● ROT5/13/18/47</strong></p>

<p><strong>特征特点</strong>： ROT5：只对数字进行编码，用当前数字往前数的第5个数字替换当前数字，例如当前为0，编码后变成5，当前为1，编码后变成6，以此类推顺序循环。 ROT13：只对字母进行编码，用当前字母往前数的第13个字母替换当前字母，例如当前为A，编码后变成N，当前为B，编码后变成O，以此类推顺序循环。 ROT18：这是一个异类，本来没有，它是将ROT5和ROT13组合在一起，为了好称呼，将其命名为ROT18。 ROT47：对数字、字母、常用符号进行编码，按照它们的ASCII值进行位置替换，用当前字符ASCII值往前数的第47位对应字符替换当前字符，例如当前为小写字母z，编码后变成大写字母K，当前为数字0，编码后变成符号_。用于ROT47编码的字符其ASCII值范围是33－126， <strong>在线解密&amp;工具</strong>： http://www.qqxiuzi.cn/bianma/ROT5-13-18-47.php</p>

<p><strong>● 猪圈密码(Pigpen Cipher)</strong></p>

<p><strong>特征特点</strong>： 图形：</p>

<p><img alt="" class="has" src="https://ask.qcloudimg.com/http-save/yehe-1539004/fn7lqy3nr7.png?imageView2/2/w/1620"></p>

<p><strong>在线解密&amp;工具</strong>： http://www.simonsingh.net/The_Black_Chamber/pigpen.html</p>

<p><strong>圣堂武士密码(Templar Cipher)</strong></p>

<p><strong>特征特点</strong>：</p>

<p><img alt="" class="has" src="https://ask.qcloudimg.com/http-save/yehe-1539004/piiapyjwqx.png?imageView2/2/w/1620"></p>

<p><strong>猪圈密码其他变种</strong></p>

<p><strong>特征特点</strong>：</p>

<p><img alt="" class="has" src="https://ask.qcloudimg.com/http-save/yehe-1539004/ncoga8efct.jpeg?imageView2/2/w/1620"></p>

<p><strong>键盘密码(Keyboard Cipher)</strong></p>

<p><strong>特征/特点</strong>：利用键盘的特性制作的密码，常见有计算机的键盘和手机的键盘，加密的方式有坐标法和顺序法。 <strong>坐标法</strong>： Y轴 1 QWE RTY UIOP 2 ASD FGH JKL 3 ZXC VBN M 12345678910 X轴 eq：密文：2251914161对应明文：story</p>

<p><strong>顺序法</strong>： Q W E R T Y U I O P 1 2 3 4 5 6 7 8 9 10 A S D F G H J K L 11 12 13 14 15 16 17 18 19 Z X C V B N M 20 21 22 23 24 25 26 eq：密文：125947对应明文：story</p>

<p><strong>● 手机九宫格键盘密码</strong></p>

<p><strong>特征特点</strong>：密文用数字0-9表示a-z的字符集，字母不区分大小写 密文：21222331323341424351525361626371727381828391929394 明文：abcdefghijklmnopqrtuvwxyz <strong>在线解密&amp;工具</strong>：米斯特</p>

<p><strong>● 维吉尼亚密码(Vigenère Cipher)</strong></p>

<p><strong>特征特点</strong>：维吉尼亚密码(Vigenère Cipher)是在单一恺撒密码的基础上扩展出多表代换密码，根据密钥(当密钥长度小于明文长度时可以循环使用)来决定用哪一行的密表来进行替换，以此来对抗字频统计 <strong>在线解密&amp;工具</strong>： http://planetcalc.com/2468/（已知密匙） http://rumkin.com/tools/cipher/gronsfeld.php（未知密匙）</p>

<p><strong>● 希尔密码(Hill Cipher)</strong></p>

<p><strong>特征特点</strong>：希尔密码(Hill Cipher)是基于线性代数多重代换密码，由Lester S. Hill在1929年发明。每个字母转换成26进制数字：A=0, B=1, C=2…Z=25一串字母当成n维向量，跟一个n×n的矩阵相乘，再将得出的结果MOD26。 <strong>在线解密&amp;工具</strong>： http://www.practicalcryptography.com/ciphers/hill-cipher/</p>

<p><strong>● 波利比奥斯方阵密码（Polybius Square Cipher)</strong></p>

<p><strong>特征特点</strong>：波利比奥斯方阵密码（Polybius Square Cipher或称波利比奥斯棋盘）是棋盘密码的一种，是利用波利比奥斯方阵进行加密的密码方式，简单的来说就是把字母排列好，用坐标(行列)的形式表现出来。字母是密文，明文便是字母的坐标。</p>

<p><img alt="" class="has" src="https://ask.qcloudimg.com/http-save/yehe-1539004/vhjrfxrin7.png?imageView2/2/w/1620"></p>

<p><strong>在线解密&amp;工具</strong>：暂无</p>

<p><strong>● 夏多密码(曲折加密)</strong></p>

<p><strong>特征特点</strong>：夏多密码是作者麦克斯韦·格兰特在中篇小说《死亡之链》塑造夏多这一英雄人物中所自创的密码 。</p>

<p><img alt="" class="has" src="https://ask.qcloudimg.com/http-save/yehe-1539004/fw0bwqrwjw.jpeg?imageView2/2/w/1620"></p>

<p><img alt="" class="has" src="https://ask.qcloudimg.com/http-save/yehe-1539004/o1sxf965hd.jpeg?imageView2/2/w/1620"></p>

<p><strong>在线解密&amp;工具</strong>：暂无</p>

<p><strong>● 培根密码(Baconian Cipher)</strong></p>

<p><strong>特征/特点</strong>：培根密码(Baconian Cipher)是一种替换密码，每个明文字母被一个由5字符组成的序列替换，最初的加密方式就是由’A’和’B’组成序列替换明文(所以你当然也可以用别的字母)，比如字母’D’替换成”aaabb”，以下是全部的对应关系(另一种对于关系是每个字母都有唯一对应序列，I和J与U/V各自都有不同对应序列)：</p>

<p><img alt="" class="has" src="https://ask.qcloudimg.com/http-save/yehe-1539004/5chhu05lb7.png?imageView2/2/w/1620"></p>

<p><strong>在线解密&amp;工具</strong>： http://rumkin.com/tools/cipher/baconian.php</p>

<p><strong>● ADFGX和ADFGVX密码(ADFG/VX Cipher)</strong></p>

<p><strong>特征/特点</strong>：ADFGX密码(ADFGX Cipher)是结合了改良过的Polybius方格替代密码与单行换位密码的矩阵加密密码，使用了5个合理的密文字母：A，D，F，G，X，这些字母之所以这样选择是因为当转译成摩尔斯电码(ADFGX密码是德国军队在一战发明使用的密码)不易混淆，目的是尽可能减少转译过程的操作错误。 <strong>在线解密&amp;工具</strong>： http://www.practicalcryptography.com/ciphers/adfgx-cipher/</p>

<p><strong>● 双密码(Bifid Cipher)</strong></p>

<p><strong>特征/特点</strong>：双密码(Bifid Cipher)结合了波利比奥斯方阵换位密码，并采用分级实现扩散，这里的“双”是指用2个密钥进行加密。双密码是由法国Felix Delastelle发明，除此之外Felix Delastelle还发明了三分密码(Trifid Cipher)，四方密码(Four-Square Cipher)。还有一个两方密码(Two-Square)与四方密码类似，共轭矩阵双密码(Conjugated Matrix Bifid Cipher)也是双密码的变种。 <strong>在线解密&amp;工具</strong>： http://www.practicalcryptography.com/ciphers/adfgx-cipher/</p>

<p>&nbsp;</p>

<h3><a name="t2"></a><a name="t2"></a><strong>现实世界中常用的编码</strong></h3>

<p><strong>● 条形码</strong></p>

<p><strong>特征特点</strong>：宽度不等的多个黑条和空白，按照一定的编码规则排列，用以表达一组信息的图形标识符 <strong>在线解密&amp;工具</strong>： https://online-barcode-reader.inliteresearch.com/</p>

<p><strong>● 二维码</strong></p>

<p><strong>特征特点</strong>：用某种特定几何图形按一定规律在平面分步的黑白相间的图形记录数据符号信息 堆叠式 / 行排式二维码：Code 16 k、Code 49、PDF417 矩阵式二维码：QR CODE <strong>在线解密&amp;工具</strong>： https://online-barcode-reader.inliteresearch.com/</p>

<p>&nbsp;</p>

<h3><a name="t3"></a><a name="t3"></a><strong>其他：</strong></h3>

<p><strong>● 当铺密码</strong></p>

<p><strong>特征特点</strong>：密文由[0-9]数字组成（以当前汉字有多少笔画出头，就是转化成对应的数字） 密文：0123456789 原文：口由中人工大王夫井羊 <strong>在线解密&amp;工具</strong>： http://www.zjslove.com/3.decode/dangpu/index.html</p>

<p><strong>● 核心价值观编码</strong></p>

<p><strong>特征特点</strong>：密文特征为社会主义核心价值观的关键字 <strong>在线解密&amp;工具</strong>： http://ctf.ssleye.com/cvencode.html</p>

<p><strong>● 与佛论禅</strong></p>

<p><strong>特征特点</strong>：密文以”佛曰：如是我闻：”开头，密文一般是与关佛经的汉字 <br><strong>在线解密&amp;工具</strong>： http://www.keyfc.net/bbs/tools/tudoucode.aspx</p>
                                    </div>
