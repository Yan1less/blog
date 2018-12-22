<%--
  Created by IntelliJ IDEA.
  User: 严瑞华
  Date: 2018/6/6
  Time: 21:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>后台管理系统</title>
    <link rel="stylesheet" href="/back/css/style.css">
    <link rel="stylesheet" href="/back/css/jquery.wysiwyg.old-school.css">

    <!-- jQuery AND jQueryUI -->
    <script type="text/javascript" src="/back/js/jquery.min.js"></script>
    <script type="text/javascript" src="/back/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/back/js/min.js"></script>
    <!--<script type="text/javascript" src="js/index.js"></script>-->
</head>
<body class="modal white">
<script type="text/javascript" src="/back/js/main.js"></script>
<link rel="stylesheet" href="/back/css/style2.css">

<!--     内容      -->
<div id="content" class="white">
    <div class="bloc">
        <div class="title">编辑明细<a class="toggle"></a></div>
        <div class="content">
            <form method="post" action="/changetagname">
                <div class="input" style="width: 300px;">
                    <label>以前的名字</label>
                    <input type="hidden" name="tagid" value="${tag.tagid}">
                    <input type="text" id="input1" name="newtag" value="${tag.tag}">
                </div>
                <div class="submit">
                    <input type="submit"  value="确定">
                </div>
            </form>



        </div>
    </div>
</div>
<div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"></div>
</body>
</html>