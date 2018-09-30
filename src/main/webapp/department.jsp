<%--
 Created by Dimple on 2018/6/28/15:53
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>部门管理</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="jquery/jquery-3.3.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<%--部门添加模态框--%>
<div class="modal fade" id="deptAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">部门添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <%--部门名称--%>
                    <div class="form-group">
                        <label for="deptName_input" class="col-sm-2 control-label">名称：</label>
                        <div class="col-sm-10 ">
                            <input type="text" name="deptName" class="form-control" id="deptName_input"
                                   placeholder="请输入部门名称">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <%--基本工资--%>
                    <div class="form-group">
                        <label for="note_input" class="col-sm-2 control-label">工资：</label>
                        <div class="col-sm-10">
                            <input type="text" name="deptSalary" class="form-control"
                                   placeholder="请输入基本工资">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <%--备注--%>
                    <div class="form-group">
                        <label for="note_input" class="col-sm-2 control-label">备注：</label>
                        <div class="col-sm-10">
                            <input type="text" name="deptNote" class="form-control" id="note_input"
                                   placeholder="请输入备注">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="dept_save_btn">保存</button>
            </div>
        </div>
    </div>

</div>

<!-- 部门修改模态框 -->
<!-- Modal -->
<div class="modal fade" id="deptUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">部门修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <%--姓名--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门名称</label>
                        <div class="col-sm-10 ">
                            <input type="text" name="deptName" class="form-control" id="deptName_update_input"
                                   placeholder="empName">
                            <%--<span class="help-block"></span>--%>
                        </div>
                    </div>
                    <%--基本工资--%>
                    <div class="form-group">
                        <label for="note_input" class="col-sm-2 control-label">基本工资：</label>
                        <div class="col-sm-10">
                            <input type="text" name="deptSalary" class="form-control" id=""
                                   placeholder="请输入基本工资">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <%--备注--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">备注信息：</label>
                        <div class="col-sm-10">
                            <input type="text" name="deptNote" class="form-control" id="note_update_input">
                            <span class="help-block"></span>
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

<%--内容主体部分--%>
<div class="container">
    <%--标题--%>
    <div class="row">
        <div class="col-md-12 text-center">
            <h1 class="text-danger">部门管理</h1>
        </div>
    </div>
    <div style="margin-top: 10px"></div>
    <%--按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="dept_add_btn">新增</button>
            <button class="btn btn-danger" id="dept_delete_all_btn">删除</button>
        </div>
    </div>
    <%--显示表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover " id="depts_table">
                <thead>
                <tr>
                    <td><input type="checkbox" id="check_all"/></td>
                    <th>ID</th>
                    <th>部门名称</th>
                    <th>部门工资</th>
                    <th>备注</th>
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
    // 从服务器加载数据
    $(function () {
        dept_to_page(1);
    });

    //执行查询操作
    function dept_to_page(pn) {
        $.ajax({
            url: "deptss",
            data: pn,
            type: "GET",
            success: function (result) {
                build_depts_table(result);
                //    2、解析并显示分页信息
                build_page_info(result);
                //    3、解析并显示分页条
                build_page_nav(result);
            }
        })
    }

    //显示表格数据
    function build_depts_table(result) {
        $("#depts_table tbody").empty();
        var depts = result.extend.pageInfo.list;
        $.each(depts, function (index, item) {
            var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
            var deptIdTd = $("<td></td>").append(item.deptId);
            var deptNameTd = $("<td></td>").append(item.deptName);
            var noteTd = $("<td></td>").append(item.deptNote);
            var deptSalaryTd = $("<td></td>").append(item.deptSalary + " 元");

            var editBtn = $("<button></button>").addClass("btn btn-sm btn-primary edit_btn").append($("<span></span>")
                .addClass("glyphicon glyphicon-pencil ")).append("编辑");
            editBtn.attr("edit_id", item.empId);
            var delBtn = $("<button></button>").addClass("btn btn-sm btn-danger delete_btn").append($("<span></span>")
                .addClass("glyphicon glyphicon-pencil")).append("删除");
            delBtn.attr("delete_id", item.empId);
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            $("<tr></tr>").append(checkBoxTd)
                .append(deptIdTd)
                .append(deptNameTd)
                .append(deptSalaryTd)
                .append(noteTd)
                .append(btnTd)
                .appendTo("#depts_table tbody");
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

    //点击新增按钮打开模态框
    $("#dept_add_btn").click(function () {
            //打开模态框之前，清除所有的表单数据
            $("#deptAddModal form")[0].reset();
            //还需要清除表单的样式，否则会出现表单的下面还有错误提示信息的情况
            // reset_form("#empAddModal form");
            //在打开模态框之前，发送ajax请求获取部门信息
            $("#deptAddModal").modal(
                {
                    backdrop: "static"
                }
            );
        }
    );
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
    $("#dept_delete_all_btn").click(function () {

        //    遍历获取到所有的已经勾选的tr的内容
        var names = "";
        var del_ids = "";
        $.each($(".check_item:checked"), function () {
            names += $(this).parents("tr").find("td:eq(2)").text() + ",";
            del_ids += $(this).parents("tr").find("td:eq(1)").text() + "-";
        });
        if (names == "") {
            alert("请选择要删除的部门信息");
            return;
        }
        names = names.substring(0, empNames.length - 1);
        del_ids = del_ids.substring(0, del_ids.length - 1);
        if (confirm("确认删除" + names + "的信息吗")) {
            $.ajax({
                url: "dept/" + del_ids,
                type: "DELETE",
                success: function (result) {
                    alert("删除成功");
                    to_page(currentPage);
                    $("#check_all").prop("checked", false);
                }
            })
        }
    });
    //使用on动态的绑定事件
    $(document).on("click", ".delete_btn", function () {
        //    1、弹出确认删除对话框，拿到信息
        var name = $(this).parents("tr").find("td:eq(2)").text();
        if (confirm("确认删除" + name + "的信息吗？")) {
            $.ajax({
                url: "dept/" + $(this).attr("delete_id"),
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
    //点击编辑按钮
    $(document).on("click", ".edit_btn", function () {
        //查询员工信息显示在模态框中
        // getEmp($(this).attr("edit_id"));
        //保存当前的id到更新按钮上,方便更新的时候提交
        $("#dept_update_btn").attr("update_id", $(this).attr("edit_id"));
        //打开模态框
        $("#deptUpdateModal").modal(
            {
                backdrop: "static"
            }
        );
    });
    //新增模态框里面的保存按钮的点击事件
    $("#dept_save_btn").click(function () {
        //    此处省略数据校验

        //    发送ajax请求获取数据
        console.log($("#deptAddModal form").serialize());
        $.ajax({
            url: "dept/",
            data: $("#deptUpdateModal form").serialize(),
            type: "POST",
            success: function (result) {
                if (result.code == 100) {
                    alert("添加成功！");
                    $("#deptAddModal").modal('hide');
                    dept_to_page(totleConnt);
                }
            }
        });
    });
</script>
</body>
</html>
