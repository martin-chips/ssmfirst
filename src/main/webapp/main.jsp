<%--
 Created by Dimple on 2018/6/28/15:17
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <!-- 引入样式文件和动态控制 -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="jquery/jquery-3.3.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <!--主要样式控制-->
    <link href="css/main.css" rel="stylesheet"/>
    <title>员工管理系统</title>
</head>
<body>
<!--顶部导航栏部分-->
<nav class="navbar navbar-inverse" style="background-color: #2A343C;border: none">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" title="logoTitle" href="main.jsp" style="color: whitesmoke"> 员工管理系统</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li class="navbar-head">
                    <a href="#" style="color: whitesmoke;">当前用户：<span class="badge">边小丰</span></a>
                </li>
                <li class="navbar-head">
                    <a href="#" style="color: whitesmoke;">
                        <span class="glyphicon glyphicon-lock"></span>退出登录</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- 中间主体内容部分 -->
<div class="pageContainer ">
    <!-- 左侧导航栏 -->
    <div class="pageSidebar">
        <ul class="nav nav-stacked nav-pills">
            <li role="presentation">
                <a href="home.jsp" target="mainFrame" class="white-text">首页</a>
            </li>
            <li role="presentation">
                <a href="employee.jsp" target="mainFrame">员工管理</a>
            </li>
            <li role="presentation">
                <a href="salary.jsp" target="mainFrame">工资管理</a>
            </li>
            <li role="presentation">
                <a href="department.jsp" target="mainFrame">部门管理</a>
            </li>
            <!-- 开始 -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="nav4.html" target="mainFrame">
                    个人设置<span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="#" target="mainFrame">修改密码</a>
                    </li>
                    <li>
                        <a href="#" target="mainFrame">查看个人信息</a>
                    </li>
                    <li>
                        <a href="#" target="mainFrame">退出系统</a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>

    <!-- 左侧导航和正文内容的分隔线 -->
    <div class="splitter"></div>
    <!-- 正文内容部分 -->
    <div class="pageContent">
        <iframe src="home.jsp" id="mainFrame" name="mainFrame"
                frameborder="0" width="100%" height="100%" frameBorder="0">
        </iframe>
    </div>

</div>
<!-- 底部页脚部分 -->
<div class="footer">
    <p class="text-center">
        2018 &copy; 边小丰 .
    </p>
</div>

<script type="text/javascript">
    //设置左侧导航栏的点击
    $(".nav li").click(function () {
        $(".active").removeClass('active');
        $(this).addClass("active");
    });
    $("a").click(function () {

    });

</script>
</body>
</html>

