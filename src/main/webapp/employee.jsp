<%--
 Created by Dimple on 2018/6/22/14:42
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>

<head>
    <title>员工管理</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css"/>
    <script src="jquery/jquery-3.3.1.js"></script>
    <%--<script src="js/index.js" type="application/javascript" charset="UTF-8"></script>--%>
    <script src="bootstrap/js/bootstrap.js"></script>
</head>
<body>
<!-- 员工添加模态框 -->
<!-- Modal -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">员工添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <%--姓名--%>
                    <div class="form-group">
                        <label for="empName_input" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10 ">
                            <input type="text" name="empName" class="form-control" id="empName_input"
                                   placeholder="请输入姓名">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <%--邮箱--%>
                    <div class="form-group">
                        <label for="email_input" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_input"
                                   placeholder="email@dimple.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <%--性别--%>
                    <div class="form-group">
                        <label for="email_input" class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="M" checked> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <%--部门信息--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-5">
                            <select class="form-control" name="dId">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>

</div>

<!-- 员工修改模态框 -->
<!-- Modal -->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">员工修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <%--姓名--%>
                    <div class="form-group">
                        <label for="empName_input" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10 ">
                            <p class="form-control-static" id="empName_update_input"></p>
                            <%--<input type="text" name="empName" class="form-control" id="empName_update_input"--%>
                            <%--placeholder="empName">--%>
                            <%--<span class="help-block"></span>--%>
                        </div>
                    </div>
                    <%--邮箱--%>
                    <div class="form-group">
                        <label for="email_input" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_update_input"
                                   placeholder="email@dimple.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <%--性别--%>
                    <div class="form-group">
                        <label for="email_input" class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="M" checked> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <%--部门信息--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-5">
                            <select class="form-control" name="dId">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
            </div>
        </div>
    </div>

</div>


<div class="container">
    <%--标题--%>
    <div class="row">
        <div class="col-md-12 text-center">
            <h1 class="text-danger">员工管理</h1>
        </div>
    </div>
    <div style="margin-top: 10px"></div>
    <%--按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="emp_add_btn">新增</button>
            <button class="btn btn-danger" id="emp_delete_all_btn">删除</button>
        </div>
    </div>
    <%--显示表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover " id="emps_table">
                <thead>
                <tr>
                    <td><input type="checkbox" id="check_all"/></td>
                    <th>ID</th>
                    <th>员工姓名</th>
                    <th>性别</th>
                    <th>邮箱</th>
                    <th>部门名称</th>
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

<script type="application/javascript">
    //页面加载完成后，直接发送ajax请求
    $(function () {
        to_page(1);
    });

    function to_page(pn) {
        $.ajax({
            url: "/empsnew",
            data: "pn=" + pn,
            type: "GET",//使用的是rest风格的URL
            success: function (result) {//这里的成功代表的是服务器响应成功并不是处理结果成功
                // console.log(result);
                //    1、在页面的表格中解析json显示员工数据
                build_emps_table(result);
                //    2、解析并显示分页信息
                build_page_info(result);
                //    3、解析并显示分页条
                build_page_nav(result);
            }
        });
    }

    // table构建
    function build_emps_table(result) {
        console.log(result);
        //清空table表格
        $("#emps_table tbody").empty();
        var emps = result.extend.pageInfo.list;
        $.each(emps, function (index, item) {
            // console.log(item.empId);$(this)代表的是当前的遍历的对象
            var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
            //分别构建各个表单项的td
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var gender = item.gender == "M" ? "男" : "女";
            var empGenderTd = $("<td></td>").append(gender);
            var empEmailTd = $("<td></td>").append(item.email);
            var empdeptNameTd = $("<td></td>").append(item.department.deptName);
            var editBtn = $("<button></button>").addClass("btn btn-sm btn-primary edit_btn").append($("<span></span>")
                .addClass("glyphicon glyphicon-pencil ")).append("编辑");
            editBtn.attr("edit_id", item.empId);
            var delBtn = $("<button></button>").addClass("btn btn-sm btn-danger delete_btn").append($("<span></span>")
                .addClass("glyphicon glyphicon-pencil")).append("删除");
            delBtn.attr("delete_id", item.empId);
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            $("<tr></tr>")
                .append(checkBoxTd)
                .append(empIdTd)
                .append(empNameTd)
                .append(empGenderTd)
                .append(empEmailTd)
                .append(empdeptNameTd)
                .append(btnTd)
                .appendTo("#emps_table tbody");

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
                to_page(1);
            });
            //前一页案例的点击事件
            prePageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum - 1);
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
                to_page(result.extend.pageInfo.pages);
            });
            //下一页按钮的点击事件
            nextPageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum + 1);
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
                to_page(item);
            });
            ul.append(numLi);
        });
        //添加下一页和末页
        ul.append(nextPageLi).append(lastPage);
        ul.appendTo($("#page_nav_area"));
    }

    //清空表单的样式和内容
    function reset_form(ele) {
        //清除表单的数据
        $(ele)[0].reset();
        //    清除表单的样式
        $(ele).find("*").removeClass("has-error has-success");
        //    将span元素的内容置空
        $(ele).find(".help-block").text("");
    }

    //点击新增按钮打开模态框
    $("#emp_add_btn").click(function () {
            //打开模态框之前，清除所有的表单数据
            // $("#empAddModal form")[0].reset();
            //还需要清除表单的样式，否则会出现表单的下面还有错误提示信息的情况
            reset_form("#empAddModal form");
            //在打开模态框之前，发送ajax请求获取部门信息
            getdepts("#empAddModal select");
            $("#empAddModal").modal(
                {
                    backdrop: "static"
                }
            );
        }
    );

    //获取所有的部门信息，并放在select中
    function getdepts(ele) {
        //清空下拉列表框
        $(ele).empty();
        $.ajax({
            url: "depts",
            type: "GET",
            success: function (result) {
                $.each(result.extend.depts, function () {
                    //    empAddModal select
                    var optionELe = $("<option></option>").append(this.deptName).attr("value", this.deptId);
                    $(ele).append(optionELe);
                });
            },
            error: function (result) {
                alert("获取服务器信息失败");
                $("#empAddModal").modal('hide');
            }
        });
    }


    //数据校验方法
    function validata_add_form() {
        //需要清空这个元素的之前的值，不然就会出现，已经校验成功但还是红色的框的现象

        //    1、拿到要校验的数据，使用正则
        var empName = $("#empName_input").val();
        var email = $("#email_input").val();
        //姓名的正则表达式
        var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        //如果校验失败
        if (!regName.test(empName)) {
            // alert("用户名可以是2-5位中文或者6-16位英文字母和数字的组合");
            show_validata_msg("#empName_input", "error", "用户名可以是2-5位中文或者6-16位英文字母和数字的组合");
            // $("#empName_input").parent().addClass("has-error");
            // $("#empName_input").next("span").text("用户名可以是2-5位中文或者6-16位英文字母和数字的组合");
            return false;
        } else {
            show_validata_msg("#empName_input", "success", "");
            // $("#empName_input").parent().addClass("has-success");
            // $("#empName_input").next("span").text("");
        }
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(email)) {
            // alert("邮箱格式不正确");
            show_validata_msg("#email_input", "error", "邮箱格式不正确");
            // $("#email_input").parent().addClass("has-error");
            // $("#email_input").next("span").text("邮箱格式不正确");
            return false;
        } else {
            show_validata_msg("#email_input", "success", "");
            // $("#email_input").parent().addClass("has-success");
            // $("#email_input").next("span").text("");
        }
        return true;
    }

    function show_validata_msg(ele, status, msg) {
        //清除当前元素的校验状态
        $(ele).parent().removeClass("has-success has-error");
        //清除span元素的文本内容
        $(ele).next("span").text("");
        if (status == "success") {
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        }
        if (status == "error") {
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }

    $("#empName_input").change(function () {
        //    发送ajax请求检验用户是否可用
        $.ajax({
            url: "/checkUser",
            data: "empName=" + $("#empName_input").val(),
            success: function (result) {
                console.log(result);
                //100表示成功，200表示失败
                if (result.code == 100) {
                    show_validata_msg("#empName_input", "success", result.extend.va_msg);
                    $("#emp_save_btn").attr("ajax_va", "success");
                } else {
                    show_validata_msg("#empName_input", "error", result.extend.va_msg);
                    $("#emp_save_btn").attr("ajax_va", "error");
                }
            },
            error: function () {
                alert("服务器故障，请稍后再试！");
            }
        });

    });
    //模态框的保存按钮的点击事件
    $("#emp_save_btn").click(function () {
        //注：这里在发ajax的时候，前后端要统一，可以先进行前端校验，校验成功了再进行后端校验
        //要先对数据进行校验
        // if (!validata_add_form()) {
        //     return;
        // }
        //判断之前的ajax校验是否成功，如果成功就提交，不成功就返回。防止出现校验失败但是还是可以提交的情况
        if ($(this).attr("ajax_va") == "error") {
            return;
        }
        //将模态框中填写的数据提交给服务器
        // alert($("#empAddModal form").serialize());
        $.ajax({
            url: "/emp",
            type: "POST",
            data: $("#empAddModal form").serialize(),
            success: function (result) {
                if (result.code == 100) {
                    // alert(result.msg);
                    //关闭模态框，显示刚才保存的数据
                    $("#empAddModal").modal('hide');
                    to_page(totleConnt);
                } else {
                    console.log(result);
                    if (undefined != result.extend.errorFields.email) {
                        //    显示邮箱校验错误信息
                        show_validata_msg("#email_input", "error", result.extend.errorFields.email);
                    }
                    if (undefined != result.extend.errorFields.empName) {
                        //    显示名称校验错误信息
                        show_validata_msg("#empName_input", "error", result.extend.errorFields.empName);
                    }
                }
            }
        });
    });

    //点击编辑按钮
    $(document).on("click", ".edit_btn", function () {
        //在打开模态框之前，需要获得的是部门下拉列表框的信息
        getdepts("#empUpdateModal select");
        //查询员工信息显示在模态框中
        getEmp($(this).attr("edit_id"));
        //保存当前的id到更新按钮上,方便更新的时候提交
        $("#emp_update_btn").attr("update_id", $(this).attr("edit_id"));
        //打开模态框
        $("#empUpdateModal").modal(
            {
                backdrop: "static"
            }
        );
    });

    //根据id进行查询
    function getEmp(id) {
        $.ajax({
            url: "emp/" + id,
            type: "GET",
            success: function (result) {
                console.log(result);
                //    设置值
                var emp = result.extend.emp;
                $("#empName_update_input").text(emp.empName);
                $("#email_update_input").val(emp.email);
                //也可以这样写$("#empUpdateModal input[type=radio]").val([emp.gender]);
                $("#empUpdateModal input[name=gender]").val([emp.gender]);
                $("#empUpdateModal select").val([emp.dId]);
            }
        })
    }

    //修改模态框中的更新按钮的点击事件
    $("#emp_update_btn").click(function () {
        email = $("#email_update_input").val();
        //    需要对email进行验证
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,10})$/;
        console.log("这里的email" + email);
        if (!regEmail.test(email)) {
            show_validata_msg("#email_update_input", "error", "邮箱格式不正确");
            return false;
        } else {
            show_validata_msg("#email_update_input", "success", "");
        }
        //    发送ajax请求
        console.log($("#empUpdateModal form").serialize());
        $.ajax({
            url: "/emp/" + $(this).attr("update_id"),
            type: "PUT",
            data: $("#empUpdateModal form").serialize(),
            success: function () {
                //关闭模态框
                $("#empUpdateModal").modal('hide');

                to_page(currentPage);
            }
        });
        //也可以使用以下方法，使用post进行发送，然后在data后面跟上&method=PUT
        // $.ajax({
        //     url: "/emp/" + $(this).attr("update_id"),
        //     type: "POST",
        //     data:$("#empUpdateModal form").serialize()+"&method=PUT",
        //     success: function () {
        //         to_page(totleConnt);
        //     }
        // });
    });
    //使用on动态的绑定事件
    $(document).on("click", ".delete_btn", function () {
        //    1、弹出确认删除对话框，拿到信息
        var name = $(this).parents("tr").find("td:eq(1)").text();
        if (confirm("确认删除" + name + "的信息吗？")) {
            $.ajax({
                url: "emp/" + $(this).attr("delete_id"),
                type: "DELETE",
                success: function (result) {
                    if (result.code == 100) {
                        alert("删除成功！");
                        //刷新当前行
                        to_page(currentPage);
                    }
                }
            });
        }
    });
    //完成全选/全不选功能
    $("#check_all").click(function () {
        //attr获取checked是undefined;
        //我们这些dom原生的属性；attr获取自定义属性的值；
        //prop修改和读取dom原生属性的值
        $(".check_item").prop("checked", $(this).prop("checked"));
    });
    //check_item
    $(document).on("click", ".check_item", function () {
        //判断当前选择中的元素是否5个
        var flag = $(".check_item:checked").length == $(".check_item").length;
        $("#check_all").prop("checked", flag);
    });
    //点击全部删除，就批量删除
    $("#emp_delete_all_btn").click(function () {

        //    遍历获取到所有的已经勾选的tr的内容
        var empNames = "";
        var del_ids = "";
        $.each($(".check_item:checked"), function () {
            empNames += $(this).parents("tr").find("td:eq(2)").text() + ",";
            del_ids += $(this).parents("tr").find("td:eq(1)").text() + "-";
        });
        if (empNames == "") {
            alert("请选择要删除的员工信息");
            return;
        }
        empNames = empNames.substring(0, empNames.length - 1);
        del_ids = del_ids.substring(0, del_ids.length - 1);
        if (confirm("确认删除" + empNames + "的信息吗")) {
            $.ajax({
                url: "emp/" + del_ids,
                type: "DELETE",
                success: function (result) {
                    alert("删除成功");
                    to_page(currentPage);
                    $("#check_all").prop("checked", false);
                }
            })
        }
    });
</script>
</body>
</html>






