<%--
  Created by IntelliJ IDEA.
  User: 严瑞华
  Date: 2018/6/7
  Time: 15:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>后台管理系统</title>
    <link rel="stylesheet" href="/back/css/style.css">
    <link rel="stylesheet" href="/back/css/jquery.wysiwyg.old-school.css">

    <!-- jQuery AND jQueryUI -->
    <script type="text/javascript" src="/back/js/jquery.min.js"></script>
    <script type="text/javascript" src="/back/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/back/js/min.js"></script>
</head>
<body>
<body class="modal white">
<script type="text/javascript" src="/back/js/main.js"></script>
<link rel="stylesheet" href="/back/css/style2.css">
<div id="content" class="white">
    <div class="bloc">
        <div class="title">验证身份信息<a class="toggle"></a></div>
        <div class="content"style="text-align: center">

            <label >为防止恶意删除，我们需要您输入一些信息</label>
            <form method="post" action="/yanzheng">
                <%
                    String tagid = request.getParameter("tagid");
                    request.setAttribute("tagid",tagid);
                %>
                <input type="hidden"  name="tagid" value="${tagid}">
                <input type="text" name="info">&nbsp;&nbsp;&nbsp;<i>たんじうび</i><br><br><br>
                <input type="submit" value="提交">
            </form>
            <img src="/front/images/homura.jpg" style="width:150px;height: 200px;">



        </div>
    </div>
</div>
<div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"></div>
</body>
</html>
