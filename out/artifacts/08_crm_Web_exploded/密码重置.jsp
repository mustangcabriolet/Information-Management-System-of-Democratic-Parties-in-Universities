<%--
  Created by IntelliJ IDEA.
  User: Logan
  Date: 2020/8/21
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<<html>
<head>
    <title>密码重置</title>
</head>
<body>

<form>
        <legend>密码重置</legend>
        <p>
            <label for="name">姓名：</label>
            <a id="name"></a>
        </p>
        <p>
            <label for="password">密码：</label>
            <a id="password" ></a>
        </p>


</form>
<script>
    $(function () {
        $.get("resetPassword.action",function (data,status) {
            if(status=="success")
            {
                console.log(data);
                $("#name").text(data.name);
                $("#password").text(data.password);
            }
            else{
                console.log(status.statusText)
            }

        })
    })
</script>
</body>
</html>

