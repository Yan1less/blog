<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
  Created by IntelliJ IDEA.
  User: 严瑞华
  Date: 2018/6/3
  Time: 16:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<meta name="description" content="谈同个人博客，本站会给大家不定时更新关于web前端的一些小技巧。如大家有不懂得问题，也可以与我们联系，我们会尽力帮助您。">
<head>
  <link rel="shortcut icon" href="images/logo.png">
  <meta charset="utf-8">
  <meta charset="gb2312">
  <meta name="keywords" content="个人博客" />
  <meta name="keywords" content="博客搭建" />
  <meta name="keywords" content="博客网站" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="baidu-site-verification" content="CtYt4injW1" />
  <meta name="360-site-verification" content="a75dcb147688915b4cc7cfaa71e996a2" />
  <title>一条咸鱼的页面</title>
  <meta name="keywords" content="谈同个人博客♠★♠一个前端设计的热血青年" />
  <meta name="description" content="谈同个人博客♠★♠一个前端设计的热血青年" />
  <link href="${pageContext.request.contextPath}/front/css/base.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/front/css/index.css" rel="stylesheet">
  <!--[if lt IE 9]>
  <script src="${pageContext.request.contextPath}/front/js/modernizr.js"></script>
  <![endif]-->
  <script type="text/javascript" src="${pageContext.request.contextPath}/front/js/jquery-1.9.1.min.js"></script>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/front/css/simple-calendar.css">

  <script type="text/javascript" src="${pageContext.request.contextPath}/front/js/simple-calendar.js"></script>
  <script>

    function searchTextById(Tag) {
        $("div").remove(".text");
        $("div").remove(".pagging");
        $.post(
            "${pageContext.request.contextPath}/ajaxServlet",
            {"TagId":Tag},
            function (data) {

                for(var i =0;i<data.textList.length;i++)
                {

                    $("#textstart").append("                <div class=\"text\">\n" +
                        "                    <h3><a href='${pageContext.request.contextPath}/text?Textid="+data.textList[i].textid+"'>"+ data.textList[i].title+"</a></h3>\n" +
                        "                    <figure><img src='"+data.textList[i].img+"' alt='"+data.textList[i].title+"'></figure>\n" +
                        "                    <ul>\n" +
                        "                    <p>"+data.textList[i].content+"</p>\n" +
                        "                    <a title='"+data.textList[i].title+"' href='${pageContext.request.contextPath}/text?Textid="+data.textList[i].textid+"' target=\"_blank\" class=\"readmore\">阅读全文&gt;&gt;</a>\n" +
                        "                    </ul>\n" +
                        "                    <p class=\"dateview\"><span>"+data.textList[i].editdate+"</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>作者：yan1less</span></p>" +
                        "                </div>");
                }
                //再添加分頁
            },
            "json"
        );
    }

    function gottenlink() {
        var keyboard = $("#keyboard").val();
        var content = "";
        $.ajax({
            url:"${pageContext.request.contextPath}/asyncsearch",
            type:"post",
            data:{"keyboard":keyboard},
            dataType:"json",
            success:function (data) {

                for(var i = 0 ; i<data.length;i++){
                    content+=  "               <div style=\"width: 165px ;height: 30px;background-color:#999 ;opacity:0.6;\" onmouseover=\"mouseup("+data[i].textid+")\"\n" +
                        "                     onmouseout=\"mouseout("+data[i].textid+")\" id="+data[i].textid+" onclick=\"RunToText('/text?Textid="+data[i].textid+"')\">\n" +
                        "                    <label style=\"font-size: 24px;font-weight: bold;color: black\">"+data[i].title+"</label>\n" +
                        "                </div>"
                }

                $("#gottenlink").html(content);
            }



        });
    }
    function mouseup(textid) {
       // $(textid).css("background-color","#2D64B3");
        document.getElementById(textid).setAttribute("background-color","#A7A3A3");
    }
    function mouseout(textid) {
       // $(textid).css("background-color","#3a87ad");
        document.getElementById(textid).setAttribute("background-color","#999");
    }
    function RunToText(link) {
        window.location.href=link;
    }
  </script>
</head>
<body>
<div class="topnav">
  <a href="http://www.tthcclove.cn" target="_blank">yan1less</a>――本站文章部分来自网络<a href="http://www.tthcclove.cn" target="_blank">如有涉嫌侵权，请与本站邮箱联系</a>
</div>
<div id="wrapper">
  <header>
    <div class="headtop"></div>
    <div class="contenttop">
      <div class="logo f_l">Yan1less的小站</div>
      <div class="search f_r">
        <%--实现站内异步查找--%>
        <form action="${pageContext.request.contextPath}/xxx" method="post" name="searchform" id="searchform">
          <input name="keyboard" id="keyboard" class="input_text" value="请输入关键字" style="color: rgb(153, 153, 153);"
                 onfocus="if(value=='请输入关键字'){this.style.color='#000';value=''}"
                 onblur="if(value==''){this.style.color='#999';value='请输入关键字'}" type="text" onkeyup="gottenlink()">
          <input name="show" value="title" type="hidden">
          <input name="tempid" value="1" type="hidden">
          <input name="tbname" value="news" type="hidden">
          <%--<input name="Submit" class="input_submit" value="搜索" type="submit"><br>--%>
            <span id="gottenlink">

               <%--<div style="width: 165px ;height: 30px;background-color: #A7A3A3 " onmouseover="mouseup()"--%>
                    <%--onmouseout="mouseout()" id="this" onclick="RunToText('/back/xxx.html')">--%>
                    <%--<label style="font-size: 24px;font-weight: bold;color: black">123</label>--%>
                <%--</div>--%>
            </span>
        </form>

      </div>
      <div class="blank"></div>
      <nav>
        <div  class="navigation">
          <ul class="menu">
            <li><a href="${pageContext.request.contextPath}/main">网站首页</a></li>
            <li><a href="${pageContext.request.contextPath}/front/about.jsp">关于我</a>
              <ul>
                <li><a href="${pageContext.request.contextPath}/front/about.jsp">个人简介</a></li>
                <li><a href="${pageContext.request.contextPath}/front/listpic.jsp">个人相册</a></li>
              </ul>
            </li>
            <%--<li><a href="404.html">我的日记</a>--%>
              <%--<ul>--%>
                <%--<li><a href="${pageContext.request.contextPath}/front/newslistpic.html">个人日记</a></li>--%>
                <%--<li><a href="${pageContext.request.contextPath}/front/newslistpic.html">学习笔记</a></li>--%>
              <%--</ul>--%>
            <%--</li>--%>
            <li><a href="${pageContext.request.contextPath}/login/login.jsp">博主登录</a> </li>
            <li><a href="${pageContext.request.contextPath}/front/404.html">给我留言</a> </li>
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
  <div class="jztop"></div>
  <div class="container">
    <div class="bloglist f_l">


      <!--@@@@第一篇文章开始@@@@-->
      <div id="textstart">
      </div>
        <%--循环开始--%>
      <c:forEach items="${pageBean.textList}" var="text">

      <div class="text">
        <h3><a href="${pageContext.request.contextPath}/text?Textid=${text.textid}">
            ${text.title}</a></h3>
        <figure><img src="${text.img}" alt="${text.title}"></figure>
        <ul>
          <p>${text.content}</p>
          <a title="${text.title}" href="${pageContext.request.contextPath}/text?Textid=${text.textid}" target="_blank" class="readmore">阅读全文&gt;&gt;</a>
        </ul>
        <p class="dateview"><span>${text.editdate}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>作者：yan1less</span></p>
      </div>
    </c:forEach>




      <%--分页--%>
      <div id="paggingstart"></div>
        <div style="width: 620px;margin: 0 auto;margin-top: 50px" class="pagging">
          <ul  class="pagination" style="text-align: center;margin-top: 10px">
            <%--上一页--%>
            <c:if test="${pageBean.currentPage==1}">
            <li style="display: inline-block;font-size: 20px"><a href="javascript:void(0);" >&laquo;</a>&nbsp;</li>
            </c:if>
              <c:if test="${pageBean.currentPage!=1}">
                <li style="display: inline-block;font-size: 20px"><a  href="${pageContext.request.contextPath}//main?currentPage=${pageBean.currentPage-1}" >&laquo;</a>&nbsp;</li>
              </c:if>
              <%--分页的页数--%>

              <c:forEach begin="1" end="${pageBean.totalPage}" var="page">
                <c:if test="${page==pageBean.currentPage}">
                <li style="display: inline-block;font-size: 20px;"><a href="javascript:void(0);"><span style="color: red">${page}</span></a>&nbsp;</li>
                </c:if>
                <c:if test="${page!=pageBean.currentPage}">
                  <li style="display: inline-block;font-size: 20px"><a  href="${pageContext.request.contextPath}//main?currentPage=${page}">${page}</a>&nbsp;</li>
                </c:if>
              </c:forEach>


              <%--下一页--%>
              <c:if test="${pageBean.currentPage==pageBean.totalPage}">
                  <li style="display: inline-block;font-size: 20px"><a href="javascript:void(0);">&raquo;</a>&nbsp;</li>
              </c:if>
              <c:if test="${pageBean.currentPage!=pageBean.totalPage}">
                <li style="display: inline-block;font-size: 20px"><a href="${pageContext.request.contextPath}//main?currentPage=${pageBean.currentPage+1}">&raquo;</a>&nbsp;</li>
              </c:if>
          </ul>
        </div>
      </div>

    <!--首页主要文章部分结束-->

    <div class="r_box f_r">
      <div class="tit01">
        <h3 class="tit">关注我</h3>
        <div class="gzwm">
          <ul>
            <li><a class="email" href="tel:18706855385" target="_blank">我的电话</a></li>
            <li><a class="qq" href="mailto:895072956@qq.com" target="_blank">我的邮箱</a></li>
            <li><a class="tel" href="http://wpa.qq.com/msgrd?v=3&uin=895072956&site=qq&menu=yes" target="_blank" title="如果QQ未被唤起请按照提示添加我的QQ">我的QQ</a></li>
            <li><a class="prize" href="#" title="个人奖项">个人奖项</a></li>
          </ul>
        </div>
      </div>
      <!--tit01 end-->
      <div class="ph">
        <h3 class="tit">我的分类</h3>
        <ul class="rank">

          <c:forEach items="${tags}" var="tag">

            <li><a href="#" title="${tag.tag}"  id="${tag.tagid}" onclick="searchTextById(${tag.tagid})">${tag.tag}</a></li>
          </c:forEach>



        </ul>
      </div>
      <div class="tuwen">
        <h3 class="tit">搞个小日历</h3>
        <div id="container">

          <script>
              var myCalendar = new SimpleCalendar('#container');
          </script>
      </div>


    </div>
      <div class="ad"> <img src="${pageContext.request.contextPath}/front/images/homura.jpg" height="300" width="110"> </div>
  </div>

  <!-- container代码 结束 -->
  <div class="jzend"></div>

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



  <footer>
    <div class="footer">
      <div class="f_l">
        <p>All Rights Reserved 版权所有：<a href="http://www.tthcclove.cn">谈同个人博客</a> 备案号：陕ICP备17018883号</p>
      </div>
      <div class="f_r textr">
        <p>157956315</p>
      </div>
    </div>
  </footer>
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

