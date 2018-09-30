<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <!-- 引入样式文件和动态控制 -->
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="../jquery/jquery-3.3.1.min.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>
    <!--主要样式控制-->
    <link href="../css/main.css" rel="stylesheet"/>
    <title>员工管理系统</title>
</head>
<body>
<nav class="navbar navbar-inverse" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">LOGO</a>
        </div>

    </div>
</nav>

<%--中间主体部分--%>
<div class="pageContainer">
    <%--左侧导航栏--%>
    <div class="pageSidebar">
        <ul class="nav nav-stacked nav-pills">
            <li>
                <a href="www.bianxiaofeng.cm" target="mianFrame">首页</a>
            </li>
            <li>
                <a href="www.baidu.com" target="mianFrame">员工管理</a>
            </li>
            <li>
                <a href="www.google.com" target="mianFrame">工资管理</a>
            </li>

        </ul>
    </div>
    <%--分割线--%>
    <div class="splitter"></div>
    <%--正文部分--%>
    <div class="pageContent">
        <iframe src="../employee.jsp" id="mainFrame" name="mainFrame" frameborder="0" width="100%" height="100%"></iframe>
    </div>
</div>
<%--底部页脚部分--%>
<div class="footer">
    <p class="text-center">
        2018 &copy; 边小丰.
    </p>
</div>
<script type="text/javascript">
    $(".nav li").click(function () {
        $(".active").removeClass("active");
        $(this).addClass("active");

    });
</script>
</body>
</html>