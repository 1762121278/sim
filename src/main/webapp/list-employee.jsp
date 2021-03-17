<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>


<!-- Mirrored from www.gzsxt.cn/theme/hplus/table_basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:20:01 GMT -->
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>绿地中央广场综合物业办公系统 - 基础表格</title>
    <meta name="keywords" content="综合办公系统">
    <meta name="description" content="综合办公系统">

    <link rel="shortcut icon" href="favicon.ico">
    <link href="css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="css/plugins/select/bootstrap-select.min.css" rel="stylesheet">

</head>

<body class="gray-bg">
<div class="wrapper2 wrapper-content2 animated fadeInRight">
    <div class="ibox float-e-margins">
        <div class="ibox-content">
            <div class="row">
                <div class="col-sm-3 col-sm-offset-2 text-right">
                    <h3><small>搜索条件:</small></h3>
                </div>
                <div class="col-sm-2">
                    <select class="selectpicker form-control">
                        <option value="0">选择类型</option>
                        <option value="1">项目名称</option>
                        <option value="2">项目经理</option>
                    </select>
                </div>

                <div class="col-sm-3">
                    <div class="input-group">
                        <input type="text" placeholder="请输入关键词" class="input-sm form-control">
                        <span class="input-group-btn">
                                        <button type="button" class="btn btn-sm btn-primary"><i
                                                class="fa fa-search"></i>搜索</button>
                                    </span>
                    </div>
                </div>
                <div class="col-sm-2 text-right">
                    <a href="save-employee.jsp" class="btn btn-sm btn-primary" type="button"><i
                            class="fa fa-plus-circle"></i> 添加员工</a>
                </div>
            </div>
            <div class="hr-line-dashed2"></div>
            <div class="table-responsive">
                <table class="table table-striped list-table">
                    <thead>
                    <tr>
                        <th>选择</th>
                        <th>员工编号</th>
                        <th>姓名</th>
                        <th>部门</th>
                        <th>角色</th>
                        <th>性别</th>
                        <th>联系电话</th>
                        <th>入职时间</th>
                        <th>备注</th>
                        <th>状态</th>
                        <th class="text-center">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${sessionScope.employeePageInfo.list}" var="employee">
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>${employee.eid}</td>
                            <td>${employee.ename}</td>
                            <td>${employee.dept.dname}</td>
                            <td><c:forEach items="${employee.empRoleList}" var="empRole">
                                <span>${empRole.role.rolename}</span><br>
                            </c:forEach>
                            </td>
                            <td>${employee.esex}</td>
                            <td>${employee.telephone}</td>
                            <td>${employee.hiredate}</td>
                            <td>${employee.remark}</td>
                            <td>无</td>
                            <td class="text-right">
                                <a href="show-employee.jsp" class="btn btn-primary btn-xs"><i class="fa fa-edit"></i>编辑</a>
                                <button class="btn btn-danger btn-xs btndel"><i class="fa fa-close"></i>删除</button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="row">
                <div class="col-sm-5">
                    <button class="btn btn-sm btn-primary" type="button"><i class="fa fa-check-square-o"></i> 全选
                    </button>
                    <button class="btn btn-sm btn-primary" type="button"><i class="fa fa-square-o"></i> 反选</button>
                    <button class="btn btn-sm btn-primary" type="button"><i class="fa fa-times-circle-o"></i> 删除
                    </button>
                    <button id="demo1" class="btn btn-sm btn-primary" type="button"><i class="fa fa-table"></i> 导出Excel
                    </button>
                </div>
                <div class="col-sm-7 text-right">
                    <span>共有${sessionScope.employeePageInfo.pages}页,当前是第${sessionScope.employeePageInfo.pageNum}页</span>
                    <a href='${pageContext.request.contextPath}/employee/showEmployeeInfo?pageNum=1'>首页</a>
                    <a href='${pageContext.request.contextPath}/employee/showEmployeeInfo?pageNum=${sessionScope.employeePageInfo.prePage}'>上一页</a>
                    <a href='${pageContext.request.contextPath}/employee/showEmployeeInfo?pageNum=${sessionScope.employeePageInfo.nextPage}'>下一页</a>
                    <a href='${pageContext.request.contextPath}/employee/showEmployeeInfo?pageNum=${sessionScope.employeePageInfo.pages}'>尾页</a>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="js/jquery.min.js?v=2.1.4"></script>
<script src="js/bootstrap.min.js?v=3.3.6"></script>
<script src="js/plugins/select/bootstrap-select.min.js"></script>
<script src="js/plugins/sweetalert/sweetalert.min.js"></script>

<script>
    $(document).ready(function () {
        $('.selectpicker').selectpicker('setStyle', 'btn-white').selectpicker('setStyle', 'btn-sm');
    });
</script>
<%--<script>
    window.onload = function () {
        window.location.href = "${pageContext.request.contextPath}/employee/showEmployeeInfo";
    }
</script>--%>

<script type="text/javascript">
    $("#demo1").click(function () {
        window.location.href = "${pageContext.request.contextPath}/employee/exportExcelUtil";
    });
    //点击删除
    $('.btndel').click(function () {
        swal({
            title: "您确定要删除这条信息吗",
            text: "删除后将无法恢复，请谨慎操作！",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "删除",
            closeOnConfirm: false
        }, function () {//此函数是点击删除执行的函数
            //这里写ajax代码
            // 以下是成功的提示框，请在ajax回调函数中执行
            swal("删除成功！", "您已经永久删除了这条信息。", "success");
        });
    });
</script>

</body>


</html>
    