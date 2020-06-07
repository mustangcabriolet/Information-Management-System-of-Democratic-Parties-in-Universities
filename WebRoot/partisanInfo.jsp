<%--
  Created by IntelliJ IDEA.
  User: Logan
  Date: 2020/5/26
  Time: 15:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="easyui/jquery.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
    <link id="themeLink" rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
</head>
<body>
<table id="list"></table>
<script type="text/javascript">
    $(function() {
        $("#list").datagrid({
            //url:后台数据查询的地址
            url: "partisanInfo/list.action",
            //columns：填充的列数据
            //field:后台对象的属性
            //tille:列标题
            columns: [[
                {
                    field: "partisan",
                    title: "党派",
                    width: 50
                },
                {
                    field: "number",
                    title: "人数",
                    width: 50
                },
                {
                    field: "establish_time",
                    title: "成立时间",
                    width: 50
                },
                {
                    field: "introduction",
                    title: "简介",
                    width: 1000
                },
                {
                    field: "chairman",
                    title: "主席",
                    width: 50
                },

            ]],
            //显示分页
            pagination: true,
            //工具条
            toolbar: "#tb"
        });
    });
</script>
</body>
</html>
