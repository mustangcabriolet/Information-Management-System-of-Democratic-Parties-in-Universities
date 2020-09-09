<%--
  Created by IntelliJ IDEA.
  User: Logan
  Date: 2020/8/12
  Time: 17:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
<head>
    <title>电话号码匹配</title>
</head>
<body>
<form>
    <div>
        <label for="name">用户名</label>
        <input name="name" id="name" type="text" autofocus="autofocus">
        <label for="tele">电话号码</label>
        <input name="tele" id="tele" type="text">
        <button id="button">登入</button>
    </div>
</form>
<script>
    $('#button').click(function () {
       var str = $('#tele').val();
       var regex = new RegExp("^(?:\\+?86)?1(?:3\\d{3}|5[^4\\D]\\d{2}|8\\d{3}|7[^29\\D]((?<=4)(?:0\\d|1[0-2]|9\\d)|\\d{2})|9[189]\\d{2}|6[567]\\d{2}|4(?:[14]0\\d{3}|[68]\\d{4}|[579]\\d{2}))\\d{6}$");
        if(regex.test(str))
            console.log("匹配成功")
        else{
            console.log("匹配失败")
        }
    })
</script>
</body>
</html>
