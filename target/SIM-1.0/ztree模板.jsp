<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ztree树最简单模板</title>
    <link  rel="stylesheet" href="css/plugins/zTreeStyle/zTreeStyle.css"/>
    <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/plugins/ztree/jquery.ztree.core.min.js"></script>
    <script src="js/plugins/ztree/jquery.ztree.exedit.js"></script>
    <script src="js/plugins/ztree/jquery.ztree.excheck.js"></script>
</head>
<body>
    <div class="col-sm-8">
        <ul id="treeDemo" class="ztree"></ul>
    </div>

    <%--ztree树js--%>
    <script type="text/javascript">
        window.onload = function () {
            var setting = {
                async: {
                    enable: true,
                    url: "${pageContext.request.contextPath}/role/selectSourcesByRoleId?roleid=24",
                    autoParam: ["id", "name"]
                },
                check: {
                    enable: true
                }

            }
            $.fn.zTree.init($("#treeDemo"), setting);
        };
    </script>

</body>
</html>
