<%--
 Created by Dimple on 2018/6/22/14:42
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>

<head>
    <title>工资管理</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css"/>
    <script src="jquery/jquery-3.3.1.js"></script>
    <%--<script src="js/index.js" type="application/javascript" charset="UTF-8"></script>--%>
    <script src="bootstrap/js/bootstrap.js"></script>
</head>
<body>
<div class="container">
    <%--标题--%>
    <div class="row">
        <div class="col-md-12 text-center">
            <h1 class="text-danger">工资管理</h1>
        </div>
    </div>
    <div style="margin-top: 10px"></div>
    <%--按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <%--此处欠妥--%>
            <button class="btn btn-primary" id="emp_add_btn">新增</button>
            <button class="btn btn-danger" id="emp_delete_all_btn">删除</button>
        </div>
    </div>
    <%--显示表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover " id="salary_table">
                <thead>
                <tr>
                    <td><input type="checkbox" id="check_all"/></td>
                    <th>ID</th>
                    <th>员工ID</th>
                    <th>员工姓名</th>
                    <th>性别</th>
                    <th>所属部门</th>
                    <th>基本工资</th>
                    <th>技能工资</th>
                    <th>全勤工资</th>
                    <th>部门工资</th>
                    <th>总工资</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
    <%--显示分页信息--%>
    <div class="row">
        <%--分页文字信息--%>
        <div class="col-md-6" id="page_info_area">
        </div>
        <%--分页条--%>
        <div class="col-md-6" id="page_nav_area">
        </div>
    </div>
</div>
<script type="text/javascript">
    //页面加载完成后，直接发送ajax请求
    $(function () {
        salary_to_page(1);
    });

    function salary_to_page(pn) {
        $.ajax({
            url: "/salary",
            data: "pn=" + pn,
            type: "GET",//使用的是rest风格的URL
            success: function (result) {//这里的成功代表的是服务器响应成功并不是处理结果成功
                console.log(result);
                build_salary_table(result);
                build_page_info(result);
                build_page_nav(result);
            }
        });
    }

    // table构建
    function build_salary_table(result) {
        console.log(result);
        //清空table表格
        $("#salary_table tbody").empty();
        var salaries = result.extend.pageInfo.list;
        $.each(salaries, function (index, item) {
            // console.log(item.empId);$(this)代表的是当前的遍历的对象
            var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
            //分别构建各个表单项的td
            var sala_id = $("<td></td>").append(item.sala_id);
            var sala_empId = $("<td></td>").append(item.sala_empId);
            var emp_nameTd = $("<td></td>").append(item.emp_name);
            var gender = item.gender == "M" ? "男" : "女";
            var genderTd = $("<td></td>").append(gender);
            var dept_nameTd = $("<td></td>").append(item.dept_name);
            var sala_baseSalaryTd = $("<td></td>").append(item.sala_baseSalary);
            var sala_performanceSalaryTd = $("<td></td>").append(item.sala_performanceSalary);
            var sala_attendanceTd = $("<td></td>").append(item.sala_attendance);
            var sala_stationTd = $("<td></td>").append(item.sala_station);
            var totalSalary = item.sala_baseSalary + item.sala_performanceSalary + item.sala_attendance + item.sala_station;
            var sala_totalTd = $("<td></td>").append(totalSalary);
            var editBtn = $("<button></button>").addClass("btn btn-sm btn-primary edit_btn").append($("<span></span>")
                .addClass("glyphicon glyphicon-pencil ")).append("编辑");
            editBtn.attr("edit_id", item.empId);
            var delBtn = $("<button></button>").addClass("btn btn-sm btn-danger delete_btn").append($("<span></span>")
                .addClass("glyphicon glyphicon-pencil")).append("删除");
            delBtn.attr("delete_id", item.empId);
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            $("<tr></tr>")
                .append(checkBoxTd)
                .append(sala_id)
                .append(sala_empId)
                .append(emp_nameTd)
                .append(genderTd)
                .append(dept_nameTd)
                .append(sala_baseSalaryTd)
                .append(sala_performanceSalaryTd)
                .append(sala_attendanceTd)
                .append(sala_stationTd)
                .append(sala_totalTd)
                .append(btnTd)
                .appendTo("#salary_table tbody");
        });
    }

    var totleConnt;//保存总的记录数
    var currentPage;//保存当前的页面
    //当前第页，总页，总 条记录
    //显示分页信息
    function build_page_info(result) {
        totleConnt = result.extend.pageInfo.total;
        currentPage = result.extend.pageInfo.pageNum;
        $("#page_info_area").empty();
        $("#page_info_area").append("当前第" + result.extend.pageInfo.pageNum + "页，总共" + result.extend.pageInfo.pages + "页，总共" + result.extend.pageInfo.total + "条记录");
    }

    //显示分页条信息,点击分页条要能去下一页
    function build_page_nav(result) {
        $("#page_nav_area").empty();
        var firstPageLi = $("<li></li>").addClass("page-item").append($("<a></a>").addClass("page-link").append("首页").attr("href", "#"));
        var prePageLi = $("<li></li>").addClass("page-item").append($("<a></a>").addClass("page-link").append("&laquo;").attr("href", "#"));
        //设置首页和向前一页的时是否可点击
        if (result.extend.pageInfo.hasPreviousPage == false) {
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        } else {
            //首页按钮的点击事件
            firstPageLi.click(function () {
                salary_to_page(1);
            });
            //前一页案例的点击事件
            prePageLi.click(function () {
                salary_to_page(result.extend.pageInfo.pageNum - 1);
            });
        }
        var nextPageLi = $("<li></li>").addClass("page-item").append($("<a></a>").addClass("page-link").append("&raquo;").attr("href", "#"));
        var lastPage = $("<li></li>").addClass("page-item").append($("<a></a>").addClass("page-link").append("末页").attr("href", "#"));
        //设置末页和向后一页是否可点击
        if (result.extend.pageInfo.hasNextPage == false) {
            nextPageLi.addClass("disabled");
            lastPage.addClass("disabled");
        } else {
            //末页按钮的点击事件
            lastPage.click(function () {
                salary_to_page(result.extend.pageInfo.pages);
            });
            //下一页按钮的点击事件
            nextPageLi.click(function () {
                salary_to_page(result.extend.pageInfo.pageNum + 1);
            });
        }
        var ul = $("<ul></ul>").addClass("pagination");
        //添加首页和前一页
        ul.append(firstPageLi).append(prePageLi);
        //遍历向ul添加页码
        $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").addClass("page-item").append($("<a></a>").addClass("page-link").append(item).attr("href", "#"));
            if (result.extend.pageInfo.pageNum == item) {
                numLi.addClass("active");
            }
            //添加点击事件
            numLi.click(function () {
                salary_to_page(item);
            });
            ul.append(numLi);
        });
        //添加下一页和末页
        ul.append(nextPageLi).append(lastPage);
        ul.appendTo($("#page_nav_area"));
    }

</script>
</body>
</html>






