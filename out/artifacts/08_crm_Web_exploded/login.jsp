<%--
  Created by IntelliJ IDEA.
  User: Logan
  Date: 2020/5/24
  Time: 13:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>高校民主党派信息管理系统</title>
</head>
<body bgcolor="#71CABF">
    <form action="loginController.action" method="post">
        <table>
            <caption>用户登录</caption>
            <tr>
                <td>登录名</td>
                <td><input name="name" type="text" size="20"/></td>
            </tr>
            <tr>
                <td>密码</td>
                <td><input name="password" type="password" size="21"/></td>
            </tr>
        </table>
        <input type="submit" value="登录"/>
        <input type="reset" value="重置"/>
    </form>
   <%--<p>${map.username}</p>
    <p>${map.password}</p>
    <br>
    <br>
    <% Map<String,String> map = new HashMap<>();
    if(map==null)
        map = (Map<String, String>) request.getAttribute("map");
    String a = map.get("username");
    String b= map.get("password");
    %>
    <p><%=a%></p>
    <p><%=b%></p>--%>

</body>
</html>
