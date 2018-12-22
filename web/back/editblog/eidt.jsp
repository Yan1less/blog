<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 严瑞华
  Date: 2018/6/6
  Time: 16:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>编辑博客</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/css/jquery.wysiwyg.old-school.css">

    <!-- jQuery AND jQueryUI -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/main.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/css/style2.css">
    <!--<script type="text/javascript" src="js/index.js"></script>-->
</head>
<body>
<div id="content" class="white">
    <h1><img src="../images/posts.png" alt="">编辑博客</h1>
    <div class="bloc">
        <div class="title"> 操作 <a class="toggle"></a></div>
        <div class="content dashboard">
            <div  style="display: block; width: auto;">

                <form action="${pageContext.request.contextPath}/edit" method="post">
                    <span style="font-size: 30px;font-style: italic">博文名称：</span><input type="text" name="title" style="width: 500px;height: 30px;font-size: 28px"><br><br><br><br>
                    <span style="font-size: 30px;font-style: italic">博文分类：
                        <%--需要先访问LeftServlet--%>
                        <%--需要前台校验tag不能不选，不然数据库报错--%>
                        <c:forEach items="${Sertvlettags}" var="tag">
                            <div style="width: 80px;display: inline" id="div${tag.tagid}"><input style="height: 26px;width: 26px" type="checkbox" name="tag" value="${tag.tagid}">${tag.tag}</div>&nbsp;&nbsp;&nbsp;
                        </c:forEach>
                        <br><br><br><br>
                    <span style="font-size: 30px">博文内容：</span><br><br><br>
                    <!-- 加载编辑器的容器 -->
                    <script id="container" name="content" type="text/plain" >

                    </script>
                        <br><br>
                        <input  style="margin-right: 30%; width: 100px;height: 50px;font-size: 26px; float: right" type="submit" value="提交">
                        <br>
                </form>
                <!-- 配置文件 -->
                <script type="text/javascript" src="../utf8-jsp/ueditor.config.js"></script>
                <!-- 编辑器源码文件 -->
                <script type="text/javascript" src="../utf8-jsp/ueditor.all.js"></script>
                <!-- 实例化编辑器 -->
                <script type="text/javascript">
                    var editor = UE.getEditor('container');
                </script>
                <div class="cb"></div>
            </div>
        </div>
    </div>

</div>

<div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"></div>

</body>
</html>
