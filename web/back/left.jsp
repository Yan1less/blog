<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 严瑞华
  Date: 2018/6/5
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>后台管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/css/jquery.wysiwyg.old-school.css">

    <!-- jQuery AND jQueryUI -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/main.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/css/style2.css">
    <!--<script type="text/javascript" src="${pageContext.request.contextPath}/js/index.js"></script>-->
</head>

<body>
<!--      左侧菜单     -->
<div id="sidebar">
    <ul>
        <li><a><img src="${pageContext.request.contextPath}/back/images/huser.png" alt=""> 我的信息</a>
            <ul>
                <!--原来href是customer-->
                <li><a href="${pageContext.request.contextPath}/back/myinformation/myinformation.html" target="right">我的信息</a></li>
                <li><a href="${pageContext.request.contextPath}/back/myinformation/myexperience.html" target="right">我的经历</a></li>
                <li><a href="${pageContext.request.contextPath}/back/myinformation/myfelling.html" target="right">我的感受</a></li>
            </ul>
        </li>

        <li><a><img src="${pageContext.request.contextPath}/back/images/brush.png" alt="">编辑博客</a>
            <ul>
                <!--原来是informaion-->
                <li><a  href="${pageContext.request.contextPath}/back/editblog/eidt.jsp" target="right">编辑博客</a></li>
                <li><a  href="${pageContext.request.contextPath}/back/editblog/addclass.jsp" target="right">添加分类</a></li>
            </ul>
        </li>

        <li><a><img src="${pageContext.request.contextPath}/back/images/layout.png" alt="">博客列表</a>
            <ul>
                <!--这里面放博客的tag-->
                <!-- <li><a href="${pageContext.request.contextPath}/back/pinpai/pinpai.html">品牌管理</a></li> -->
                <%--<li><a href="${pageContext.request.contextPath}/back/product/series.html" target="right">车系管理</a></li>--%>
                <%--<li><a href="${pageContext.request.contextPath}/back/product/car.html" target="right">车型管理</a></li>--%>
                <%--<li><a href="${pageContext.request.contextPath}/back/product/accessory.html" target="right">配件管理</a></li>--%>
                <c:forEach items="${Sertvlettags}" var="tag">
                    <li><a href="${pageContext.request.contextPath}/bloglist?tagid=${tag.tagid}" target="right">${tag.tag}</a></li>
                </c:forEach>

            </ul>
        </li>
        <li><a><img src="${pageContext.request.contextPath}/back/images/comment.png" alt="">个人博客</a>
            <ul>
                <li><a href="${pageContext.request.contextPath}/back/guide/lamp.html" target="right">查看</a></li>
                <li><a href="${pageContext.request.contextPath}/back/guide/lectureHall.html" target="right">编辑</a></li>
                <li><a href="${pageContext.request.contextPath}/back/guide/guide.html" target="right">xx</a></li>
            </ul>
        </li>


        <li><a href="${pageContext.request.contextPath}/main" target="_blank"><img src="${pageContext.request.contextPath}/back/images/lab.png" alt="">返回主页面</a>

        </li>

    </ul>
</div>
</body>
</html>
