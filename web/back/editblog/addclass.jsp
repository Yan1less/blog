<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 严瑞华
  Date: 2018/6/6
  Time: 18:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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
    <script>
        function checkTagName() {

            var tagtitle = $("#tagtitle").val();

            $.ajax({
                datatype:"json",
                url:"/ajaxcheck",
                data: {"tagtitle":tagtitle},
                success:function(data){
                    $("#inform").html(data);
                    //$("#submit").attr("disabled",true);
                },
                type:"post"

            });
        }
    </script>
</head>
<body>

<div id="content" class="white">
    <h1><img src="${pageContext.request.contextPath}/back/images/posts.png" alt="">编辑分类信息 </h1>
    <div class="bloc left">
        <div class="title"> 添加分类</div>
        <div class="content dashboard">
            <div class="center" style="display: block; width: auto;">
                <form action="/editclass" method="post">
                    <span style="font-size: 20px;font-style: italic">请输入需要添加的分类：</span>
                    <input type="text" name="newtag" style="width: 200px;height: 30px;font-size: 20px" onblur="checkTagName()" id="tagtitle">&nbsp;&nbsp;<span id="inform" style="color: red">这项不能为空</span>
                    <input type="submit" style="margin-right: 10%;float: right;height: 30px;width: 60px" value="提交" id="submit">
                </form>
                <div class="cb"></div>
            </div>
        </div>
    </div>
    <div class="bloc right">
        <div class="title"> 忠告 <a href="http://www.grafikart.fr/demo/coreadmin/index.php?#" class="toggle"></a></div>
        <div class="content">
            <div>
                <table class="noalt">
                    <thead>
                    <tr>
                        <th colspan="2"><em>from：yan1less</em></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td><h6>没事可以添加或者，别删除</h6></td>
                    </tr>
                    <tr>
                        <td><h6 style="color: red">因为有外键！</h6></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="cb"></div>
        </div>
    </div>
    <div class="cb"></div>
    <div class="bloc">
        <div class="title">分类信息<a href="http://www.grafikart.fr/demo/coreadmin/index.php?#" class="toggle"></a></div>
        <div class="content">
            <table>
                <thead>
                <tr>
                    <th>tagid</th>
                    <th>tag</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                    <c:forEach items="${Sertvlettags}" var="tag">
                    <tr>
                        <td>${tag.tagid}</td>
                        <td>${tag.tag}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/change?tagid=${tag.tagid}" class="shortcut zoombox w500 h150" title="修改">
                                <img src="${pageContext.request.contextPath}/back/images/edit.png" alt=""></a>
                            <a href="${pageContext.request.contextPath}/back/editblog/yanzheng.jsp?tagid=${tag.tagid}" class="shortcut zoombox w500 h150" title="删除">
                                <img src="${pageContext.request.contextPath}/back/images/delete.png" alt=""></a>

                        </td>
                    </tr>
                    </c:forEach>

                </tbody>
            </table>
        </div>
    </div>
</div>
<div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"></div>

</body>
</html>
