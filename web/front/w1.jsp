<%--
  Created by IntelliJ IDEA.
  User: 严瑞华
  Date: 2018/6/4
  Time: 23:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="baidu-site-verification" content="CtYt4injW1" />
    <meta name="360-site-verification" content="a75dcb147688915b4cc7cfaa71e996a2" />
    <meta name="keywords" content="个人博客" />
    <meta name="keywords" content="博客搭建" />
    <meta name="keywords" content="博客网站" />
    <link rel="shortcut icon" href="images/logo.png">
    <meta charset="utf-8">
    <meta charset="gb2312">
    <title>${currentText.title}</title>
    <meta name="keywords" content="谈同个人博客♠★♠一个前端设计的热血青年" />
    <meta name="description" content="谈同个人博客♠★♠一个前端设计的热血青年" />
    <link href="${pageContext.request.contextPath}/front/css/base.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/front/css/main.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath}/front/js/modernizr.js"></script>
    <![endif]-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/front/js/jquery.js"></script>
</head>
<body>
<div id="wrapper">
    <header>
        <div class="headtop"></div>
        <div class="contenttop">
            <div class="logo f_l">This From Yan1less</div>
            <div class="search f_r">
                <form action="/e/search/index.php" method="post" name="searchform" id="searchform">
                    <input name="keyboard" id="keyboard" class="input_text" value="请输入关键字" style="color: rgb(153, 153, 153);" onfocus="if(value=='请输入关键字'){this.style.color='#000';value=''}" onblur="if(value==''){this.style.color='#999';value='请输入关键字'}" type="text">
                    <input name="show" value="title" type="hidden">
                    <input name="tempid" value="1" type="hidden">
                    <input name="tbname" value="news" type="hidden">
                    <input name="Submit" class="input_submit" value="搜索" type="submit">
                </form>
            </div>
            <div class="blank"></div>
            <nav>
                <div  class="navigation">
                    <ul class="menu">
                        <li><a href="/main">网站首页</a></li>
                        <li><a href="#">关于我</a>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/front/about.html">个人简介</a></li>
                                <li><a href="${pageContext.request.contextPath}/front/listpic.html">个人相册</a></li>
                            </ul>
                        </li>
                        <li><a href="#">我的日记</a>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/front/newslistpic.html">个人日记</a></li>
                                <li><a href="${pageContext.request.contextPath}/front/newslistpic.html">学习笔记</a></li>
                            </ul>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/front/newslistpic.html">技术文章</a> </li>
                        <li><a href="#">给我留言</a> </li>
                    </ul>
                </div>
            </nav>
            <SCRIPT type=text/javascript>
                // Navigation Menu
                $(function() {
                    $(".menu ul").css({display: "none"}); // Opera Fix
                    $(".menu li").hover(function(){
                        $(this).find('ul:first').css({visibility: "visible",display: "none"}).slideDown("normal");
                    },function(){
                        $(this).find('ul:first').css({visibility: "hidden"});
                    });
                });
            </SCRIPT>
        </div>
    </header>
    <div class="container">
        <div class="con_content">
            <div class="about_box">
                <h2 class="nh1"><span>您现在的位置是：<a href="/main" target="_blank">网站首页</a>><a href="#" target="_blank">${currentText.title}</a></span><b>${currentText.title}</b></h2>
                <div class="f_box">
                    <p class="a_title">${currentText.title}</p>
                    <p class="p_title"></p>
                    <p class="box_p"><span>发布时间：${currentText.editdate}</span><span>编辑：yan1less</span><span>点击：15060</span></p>
                    <!-- 可用于内容模板 -->
                </div>
                <ul class="about_content">
                    ${currentText.content}
                </ul>
                <!-- <div class="nextinfos">
          <p>上一篇：<a href="/">区中医医院开展志愿服务活动</a></p>
          <p>下一篇：<a href="/">广安区批准“单独两孩”500例</a></p>
        </div> -->
                <!-- 可用于内容模板 -->

                <!-- container代码 结束 -->
                <div class="shang_a">
                    <div class="one"></div>
                    <div class="two"><img src="${pageContext.request.contextPath}/front/images/weixin.png" alt="" width="200" height="200"></div>

                </div>
                <script src="${pageContext.request.contextPath}/front/js/shang.js"></script>
            </div>
        </div>
        <div class="blank"></div>
    </div>
    <!-- container代码 结束 -->
    <div class="comment">
        <div id="SOHUCS"></div>
        <script type="text/javascript">
            (function(){
                var appid = 'cytk2a7nr';
                var conf = '3437d86f4a4e9bf3aad1ef65fc2740b5';
                var width = window.innerWidth || document.documentElement.clientWidth;
                if (width < 960) {
                    window.document.write('<script id="changyan_mobile_js" charset="utf-8" type="text/javascript" src="http://changyan.sohu.com/upload/mobile/wap-js/changyan_mobile.js?client_id=' + appid + '&conf=' + conf + '"><\/script>'); } else { var loadJs=function(d,a){var c=document.getElementsByTagName("head")[0]||document.head||document.documentElement;var b=document.createElement("script");b.setAttribute("type","text/javascript");b.setAttribute("charset","UTF-8");b.setAttribute("src",d);if(typeof a==="function"){if(window.attachEvent){b.onreadystatechange=function(){var e=b.readyState;if(e==="loaded"||e==="complete"){b.onreadystatechange=null;a()}}}else{b.onload=a}}c.appendChild(b)};loadJs("http://changyan.sohu.com/upload/changyan.js",function(){window.changyan.api.config({appid:appid,conf:conf})}); } })(); </script>

        <!--PC版-->
        <div id="SOHUCS" sid="" ></div>
        <script charset="utf-8" type="text/javascript" src="https://changyan.sohu.com/upload/changyan.js" ></script>
        <script type="text/javascript">
            window.changyan.api.config({
                appid: 'cytk2a7nr',
                conf: '3437d86f4a4e9bf3aad1ef65fc2740b5'
            });
        </script>

        <!--PC和WAP自适应版-->
        <div id="SOHUCS" sid="请将此处替换为配置SourceID的语句" ></div>
        <script type="text/javascript">
            (function(){
                var appid = 'cytk2a7nr';
                var conf = 'prod_53c868f5f3ac56a10e72d038ac860764';
                var width = window.innerWidth || document.documentElement.clientWidth;
                if (width < 960) {
                    window.document.write('<script id="changyan_mobile_js" charset="utf-8" type="text/javascript" src="https://changyan.sohu.com/upload/mobile/wap-js/changyan_mobile.js?client_id=' + appid + '&conf=' + conf + '"><\/script>'); } else { var loadJs=function(d,a){var c=document.getElementsByTagName("head")[0]||document.head||document.documentElement;var b=document.createElement("script");b.setAttribute("type","text/javascript");b.setAttribute("charset","UTF-8");b.setAttribute("src",d);if(typeof a==="function"){if(window.attachEvent){b.onreadystatechange=function(){var e=b.readyState;if(e==="loaded"||e==="complete"){b.onreadystatechange=null;a()}}}else{b.onload=a}}c.appendChild(b)};loadJs("https://changyan.sohu.com/upload/changyan.js",function(){window.changyan.api.config({appid:appid,conf:conf})}); } })(); </script>
    </div>
    <%--<footer>--%>
        <%--<div class="footer">--%>
            <%--<div class="f_l">--%>
                <%--<p>All Rights Reserved 版权所有：<a href="http://www.tthcclove.cn">谈同个人博客</a> 备案号：陕ICP备17018883号</p>--%>
            <%--</div>--%>
            <%--<div class="f_r textr">--%>
                <%--<p>QQ：895072956</p>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</footer>--%>
</div>
<!--百度推送代码-->
<script>
    (function(){
        var bp = document.createElement('script');
        var curProtocol = window.location.protocol.split(':')[0];
        if (curProtocol === 'https') {
            bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
        }
        else {
            bp.src = 'http://push.zhanzhang.baidu.com/push.js';
        }
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(bp, s);
    })();
</script>
</body>
</html>
