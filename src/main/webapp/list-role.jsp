<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>


<!-- Mirrored from www.gzsxt.cn/theme/hplus/table_basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:20:01 GMT -->
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>办公系统 - 基础表格</title>
    <meta name="keywords" content="办公系统">
    <meta name="description" content="办公系统">

    <link rel="shortcut icon" href="favicon.ico">
    <link href="css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="css/plugins/select/bootstrap-select.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/plugins/zTreeStyle/zTreeStyle.css"/>
</head>

<body class="gray-bg">
<div class="wrapper2 wrapper-content2 animated fadeInRight">
    <div class="row">
        <div class="col-sm-5">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>添加角色</h5>
                </div>
                <div class="ibox-content">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">角色名称：</label>

                            <div class="col-sm-8">
                                <input type="text" id="roleName" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">角色描述：</label>

                            <div class="col-sm-8">
                                <input type="text" id="roleDis" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">角色权限：</label>
                            <div class="col-sm-8">
                                <ul id="treeDemo" class="ztree"></ul>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">是否启用：</label>
                            <div class="col-sm-8">
                                <div class="switch">
                                    <div>
                                        <input type="radio" value="1" name="status" class="st">启用
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="radio" value="0" name="status" class="st">禁用
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-3 col-sm-8">
                                <button class="btn btn-sm btn-white" id="keepRole" type="button"><i
                                        class="fa fa-save"></i> 保存
                                </button>
                                <button class="btn btn-sm btn-white" id="resetRole"><i class="fa fa-undo"></i> 重置
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-sm-7">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>角色列表 <small>点击修改信息将显示在左边表单</small></h5>
                </div>
                <div class="ibox-content">
                    <div class="hr-line-dashed2"></div>
                    <div class="row">
                        <div class="table-responsive">
                            <table class="table table-striped list-table">
                                <thead>
                                <tr>
                                    <th>选择</th>
                                    <th>角色名称</th>
                                    <th>角色描述：</th>
                                    <th>是否启用</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${sessionScope.pageInfo.list}" var="role">
                                    <tr>
                                        <td><input type="checkbox" id="roleid" value="${role.roleid}"></td>
                                        <td>${role.rolename}</td>
                                        <td>${role.roledis}</td>
                                        <td>${role.status}</td>
                                        <td>
                                            <a href="update-role.jsp?roleid=${role.roleid}&rolename=${role.rolename}&roledis=${role.roledis}&status=${role.status}"><i
                                                    class="glyphicon glyphicon-edit  text-navy"></i></a>
                                            <a href="javascript:deleteRole(${role.roleid})" value="${role.roleid}"
                                               id="btndel" class="btndel"><i
                                                    class="glyphicon glyphicon-remove text-navy"></i></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="row">
                            <div class="col-sm-5">
                                <button class="btn btn-sm btn-primary" type="button"><i
                                        class="fa fa-check-square-o"></i> 全选
                                </button>
                                <button class="btn btn-sm btn-primary" type="button"><i class="fa fa-square-o"></i> 反选
                                </button>
                                <button class="btn btn-sm btn-primary" type="button"><i
                                        class="fa fa-times-circle-o"></i> 删除
                                </button>
                            </div>
                            <div class="col-sm-7 text-right">
                                <div class="btn-group">
                                    <span>共有${sessionScope.pageInfo.pages}页,当前是第${sessionScope.pageInfo.pageNum}页</span>
                                    <a href='${pageContext.request.contextPath}/role/showRoleInfo?pageNum=1'>首页</a>
                                    <a href='${pageContext.request.contextPath}/role/showRoleInfo?pageNum=${sessionScope.pageInfo.prePage}'>上一页</a>
                                    <a href='${pageContext.request.contextPath}/role/showRoleInfo?pageNum=${sessionScope.pageInfo.nextPage}'>下一页</a>
                                    <a href='${pageContext.request.contextPath}/role/showRoleInfo?pageNum=${sessionScope.pageInfo.pages}'>尾页</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

</div>
<script src="js/jquery.min.js?v=2.1.4"></script>
<script src="js/bootstrap.min.js?v=3.3.6"></script>
<script src="js/plugins/select/bootstrap-select.min.js"></script>
<script src="js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="js/plugins/ztree/jquery.ztree.core.min.js"></script>
<script src="js/plugins/ztree/jquery.ztree.exedit.js"></script>
<script src="js/plugins/ztree/jquery.ztree.excheck.js"></script>
<script type="text/javascript">
    $(function () {
        var setting = {
            async: {
                enable: true,
                url: "${pageContext.request.contextPath}/sources/showSources",
                autoParam: ["id", "name"]
            },
            check: {
                enable: true
            }

        }

        $.fn.zTree.init($("#treeDemo"), setting);

    });
</script>

<script>
    $(document).ready(function () {
        // 设置按钮的样式
        $('.selectpicker').selectpicker('setStyle', 'btn-white').selectpicker('setStyle', 'btn-sm');
    });
</script>
<script type="text/javascript">
    //点击删除
    function deleteRole(roleid) {
        swal({
            title: "您确定要改修该角色状态吗？",
            text: "改修后将将，请谨慎操作！",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "删除",
            closeOnConfirm: false
        }, function () {//此函数是点击删除执行的函数
            $.ajax({
                type: 'GET',
                url: '${pageContext.request.contextPath}/role/deleteRole?roleid=' + roleid,
                async: 'false',
                success: function (data) {
                    if (data) {
                        //这里写ajax代码
                        // 以下是成功的提示框，请在ajax回调函数中执行
                        swal("删除成功！", "您已经永久删除了这条信息。", "success");
                        window.location.href = "${pageContext.request.contextPath}/role/showRoleInfo"
                    } else {
                        swal("删除失败！", "您删除这条信息失败。", "false");
                    }
                }
            })
        })
    }
</script>

<script type="text/javascript">
    $("#keepRole").click(function () {
        var ztreeObj = $.fn.zTree.getZTreeObj("treeDemo");
        var nodes = ztreeObj.getCheckedNodes(true);
        if (nodes.length === 0) {
            alert("请给角色赋予权限");
        } else {
            var ids = [];
            for (var i = 0; i < nodes.length; i++) {
                id = nodes[i].id;
                ids.push(id);
            }
            console.log(ids);
        }
        var rolename = $("#roleName").val();
        var roledis = $("#roleDis").val();
        var status = $(".st:checked").val();
        var url = "${pageContext.request.contextPath}/role/addRole?ids=" + ids + "&rolename=" + rolename + "&roledis=" + roledis + "&status=" + status;
        console.log(url);
        window.location.href = url;
    });
</script>

</body>

</html>
    
