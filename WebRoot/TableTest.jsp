<%--
  Created by IntelliJ IDEA.
  User: Logan
  Date: 2020/8/5
  Time: 22:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>表格专题</title>
</head>
<body>
<table border="1" cellspacing="0" cellpadding="5px">
    <tr>
        <td>员工姓名</td>
        <td>员工性别</td>
        <td>员工编号</td>
        <td>员工操作</td>
    </tr>
    <tr>
        <td>李铁柱</td>
        <td>男</td>
        <td>007</td>
        <td>
            <a href="#">删除</a>
        </td>
    </tr>
    <tr>
        <td>王二狗</td>
        <td>男</td>
        <td>38</td>
        <td>
            <a href="#">删除</a>
        </td>
    </tr>
    <tr>
        <td>李鸭蛋</td>
        <td>女</td>
        <td>250</td>
        <td>
            <a href="#">删除</a>
        </td>
    </tr>
    <tr>
        <td>王二丫</td>
        <td>女</td>
        <td>251</td>
        <td>
            <a href="#">删除</a>
        </td>
    </tr>

</table>
<form action="">
    姓名：<input type="text" value=" "><br>
    性别：<input type="text" value=""><br>
    编号：<input type="text" value=''><br>

    <input type="button" value="新增">
    <button type="button" >查看姓名和性别</button>
</form>
<script type="text/javascript">

    var btn1 = document.querySelectorAll('input')[3];

    var btn2 = document.querySelector('button');


    //表单的内容 要在用户点击按钮之后获取，这样能获取到每一次用户所输入的值
    btn2.onclick =function(){

        var name = document.querySelectorAll('form input')[0].value;

        var sex = document.querySelectorAll('input')[1].value;

        var num = document.querySelectorAll('input')[2].value;

        alert(name+' ,'+sex+','+num);

    }

    btn1.onclick = function(){

        var name = document.querySelectorAll('form input')[0].value;

        var sex = document.querySelectorAll('input')[1].value;

        var num = document.querySelectorAll('input')[2].value;

        // var allTr = document.querySelectorAll('tr');
        var tr = document.createElement('tr');

        var tbody = document.querySelector('tbody');
        // 增减删除的a链接

        var delA = document.createElement('a');

        // 给a标签增加一个子节点  删除

        delA.appendChild(document.createTextNode('删除'));

        delA.setAttribute("href","#");



        // console.log(delA);

        var array = [name,sex,num,delA];

        for(i=0;i<4;i++){

            // 创建一个td节点
            var td = document.createElement('td');
            if (array[i] != "") {

                if (i<3) {
                    td.appendChild(document.createTextNode(array[i]));
                    // 让创建的td找到他的父元素tr
                    tr.appendChild(td);

                }else if (i=3) {
                    td.appendChild(array[i]);
                    tr.appendChild(td);

                    array[i].onclick = function(){

                        var flag = confirm('您确认要删除'+tr.children[0].innerText+'吗?')
                        if (flag) {

                            tr.parentNode.removeChild(tr);

                        }
                    }
                }

            }else {
                alert("请输入正确的字符");
                break;
            }
        }
        // 让tr找到他真正的父亲tbody
        tbody.appendChild(tr);
    };
    // 删除节点的功能

    var allA = document.querySelectorAll('a');

    for(i = 0; i <allA.length;i++){
        allA[i].num = i;
        allA[i].onclick = function(){

            index = this.num;

            var b = allA[index].parentNode.parentNode;

            var flag = confirm('您确认要删除'+b.children[0].innerText +'吗?');

            if (flag) {
                // b == tr
                b.parentNode.removeChild(b);

            }
        }
    }
</script>
</body>
</html>