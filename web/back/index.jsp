<%--
  Created by IntelliJ IDEA.
  User: 89507
  Date: 2018/12/3
  Time: 23:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>后台管理系统</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/jquery.wysiwyg.old-school.css">

    <!-- jQuery AND jQueryUI -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/main.js"></script>
    <link rel="stylesheet" href="css/style2.css">
    <!--<script type="text/javascript" src="${pageContext.request.contextPath}/back/js/index.js"></script>-->
</head>


<!--<frameset border="0"n cols="10%,*">
<frame src="${pageContext.request.contextPath}/back/file:///H|/IAN_SOFT/WeiXin4S/需求分析/静态原型/top.html">
<frameset border="0"n rows="20%,*">
	  <frame   name="left"   src="${pageContext.request.contextPath}/back/file:///H|/IAN_SOFT/WeiXin4S/需求分析/静态原型/left.htm"/>
      <frame   name="content"   src="${pageContext.request.contextPath}/back/file:///H|/IAN_SOFT/WeiXin4S/需求分析/静态原型/index1.htm"/>
	</frameset>
</frameset>
<noframes></noframes>
-->

<style type="text/css">
    body{
        padding:0;
        margin:0;
        overflow-y:hidden;
    }
    .main{
        height:100%;
        width:100%;
        position:absolute;
    }
    .top{
        width:100%;
        height:42px;
        position:absolute;
        top:0;
        z-index:102;
    }
    .bottom{
        width:100%;
        height:100%;
        position:absolute;
        top:0;
        z-index:101;
    }
    .left{
        width:14.4%;
        height:100%;
        clear:both;
        float:left;
        position:absolute;
        top:0;
    }
    .right{
        width:100%;
        height:100%;
    }
</style>

<body>
<!--<div>
<div style="width:100%; height:50px; background-color:#FF0000;"></div>
<div style="width:20%; height:80px; background-color:#333;"></div>
<div style="height:500px;"></div>
</div>-->
<div class="main">
    <div class="top">
        <iframe name="top" width="100%" height="100%" src="${pageContext.request.contextPath}/back/top.html"></iframe>
    </div>
    <div class="bottom">
        <div class="left">
            <iframe name="left" width="100%" height="100%" src="${pageContext.request.contextPath}/back/left.jsp" scrolling="no" ></iframe>
        </div>
        <div class="right">
            <iframe name="right" width="100%" height="100%" src="${pageContext.request.contextPath}/back/myinformation/myinformation.html"></iframe>
        </div>
    </div>
</div>

</body>
</html>