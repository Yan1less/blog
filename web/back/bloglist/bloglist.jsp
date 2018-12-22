<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 严瑞华
  Date: 2018/6/6
  Time: 14:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <%--不使用这样的绝对路径就找不到--%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${tag.tag}的操作</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/css/jquery.wysiwyg.old-school.css">

    <!-- jQuery AND jQueryUI -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/min.js"></script>
    <!--<script type="text/javascript" src="js/index.js"></script>-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/main.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/css/style2.css">
</head>
<body>

<!--     内容      -->
<div id="content" class="white">
    <h1><img src="../images/posts.png" alt="">${tag.tag}</h1>

    <!--操作栏-->
    <div class="bloc">
        <div class="title"> 操作 <a class="toggle"></a></div>
        <div class="content dashboard">
            <div class="center" style="display: block; width: auto;">
                <a href="#" class="shortcut zoombox w500 h300"> <img src="${pageContext.request.contextPath}/back/images/glyph-add.png" alt="" width="48" height="48"> 暂无 </a>
                <div class="cb"></div>
            </div>
        </div>
    </div>


    <div class="bloc">
        <div class="title"> 博文列表 <a href="http://www.grafikart.fr/demo/coreadmin/index.php?p=table#" class="toggle"></a></div>
        <div class="content">
            <table>
                <thead>
                <tr>
                    <th>博文ID</th>
                    <th>博文标题</th>
                    <th>博文内容概要</th>
                    <th>博文编辑时间</th>
                    <th>博文图片连接</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${texts}" var="text">
                    <tr>
                        <td>${text.textid}</td>
                        <td>${text.title}</td>
                        <td><a href="${pageContext.request.contextPath}/text?Textid=${text.textid}" target="_blank">${text.content}</a></td>
                        <td>${text.editdate}</td>
                        <td>${text.link}</td>
                        <td><a href="#" title="修改">
                            <img src="${pageContext.request.contextPath}/back/images/edit.png" alt=""></a>
                            <a href="#" title="删除">
                                <img src="${pageContext.request.contextPath}/back/images/delete.png" alt=""></a>
                        </td>
                    </tr>
                </c:forEach>


                </tbody>
            </table>
            <%--<div class="pagination"> <a href="http://www.grafikart.fr/demo/coreadmin/index.php?p=table#" class="prev">«</a> <a href="http://www.grafikart.fr/demo/coreadmin/index.php?p=table#">1</a> <a href="http://www.grafikart.fr/demo/coreadmin/index.php?p=table#" class="current">2</a> ... <a href="http://www.grafikart.fr/demo/coreadmin/index.php?p=table#">21</a> <a href="http://www.grafikart.fr/demo/coreadmin/index.php?p=table#">22</a> <a href="http://www.grafikart.fr/demo/coreadmin/index.php?p=table#" class="next">»</a> </div>--%>
        </div>
    </div>
</div>
<br>
<div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"></div>
</body>
<br>
</html>
