<%@ page import="com.github.pagehelper.PageInfo" %>
<%@ page import="java.util.List" %>
<%@ page import="com.dimple.bean.Employee" %><%--
 Created by Dimple on 2018/6/22/14:42
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css"/>
    <script src="jquery/jquery-3.3.1.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>
</head>
<body>

<div class="container">
    <%--标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <%--按钮--%>
    <div class="row">
        <div class="col-md-4 offset-8">
            <button class="btn btn-primary">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <%--显示表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <tr>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>departmentName</th>
                    <th>操作</th>
                </tr>

                <c:forEach var="temp" items="${pageInfo.list}">
                    <tr>
                        <th>${temp.empId}</th>
                        <th>${temp.empName}</th>
                        <th>${temp.gender=="M"?"男":"女"}</th>
                        <th>${temp.email}</th>
                        <th>${temp.department.deptName}</th>
                        <th>
                            <button class="btn btn-sm btn-primary">
                                修改 <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                            </button>
                            <button class="btn btn-sm btn-danger">
                                删除<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                            </button>
                        </th>
                    </tr>
                </c:forEach>

            </table>
        </div>

    </div>
    <%--显示分页信息--%>
    <div class="row">
        <%--分页文字信息--%>
        <div class="col-6">
            当前第${pageInfo.pageNum}页，总${pageInfo.pages}页，总${pageInfo.total}条记录
        </div>
        <%--分页条--%>
        <div class="col-6">
            <ul class="pagination">
                <li class="page-item"><a class="page-link" href="/emps?pn=1">首页</a></li>
                <c:if test="${pageInfo.hasPreviousPage}">
                    <li class="page-item">
                        <a  class="page-link" href="/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li> 
                </c:if>

                <c:forEach var="page_Num" items="${pageInfo.navigatepageNums}">
                    <c:if test="${page_Num == pageInfo.pageNum}">
                        <li class="page-item active"><a class="page-link" href="#">${page_Num}</a></li>
                    </c:if>
                    <c:if test="${page_Num!= pageInfo.pageNum}">
                        <li class="page-item "><a class="page-link" href="/emps?pn=${page_Num}">${page_Num}</a></li>
                    </c:if>
                </c:forEach>
                <c:if test="${pageInfo.hasNextPage}">
                    <li class="page-item">
                        <a href="/emps?pn=${pageInfo.pageNum+1}" aria-label="Previous" class="page-link">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
                <li class="page-item"><a class="page-link" href="/emps?pn=${pageInfo.pages}">末页</a></li>
            </ul>
        </div>

    </div>
</div>
</body>
</html>
