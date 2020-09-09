<%--
  Created by IntelliJ IDEA.
  User: Logan
  Date: 2020/8/5
  Time: 23:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<HTML>
<HEAD>
    <TITLE> New Document </TITLE>
    <META NAME="Generator" CONTENT="EditPlus">
    <META NAME="Author" CONTENT="">
    <META NAME="Keywords" CONTENT="">
    <META NAME="Description" CONTENT="">
</HEAD>

<script Language="javascript">
    function a(x,y,color)
    {document.write("<img border='0' style='position: absolute; left: "+(x+20)+"; top: "+(y+20)+";background-color: "+color+"' src='pxgggggg.gif' width=1 height=1>")}
</script>

<body leftmargin=20 topmargin=20>
<TABLE border=0 bgcolor="000000" cellspacing="1" width=400>
    <TR bgcolor="FFFFFF">
        <TD id="td1">
            <div align="right">姓名</div><div>课程</div>
        </TD>
        <TD>张三</TD>
        <TD>李四</TD>
        <TD>王五</TD>
    </TR>
    <TR bgcolor="FFFFFF">
        <TD>数学</TD>
        <TD>55</TD>
        <TD>66</TD>
        <TD>77</TD>
    </TR>
    <TR bgcolor="FFFFFF">
        <TD>英语</TD>
        <TD>99</TD>
        <TD>68</TD>
        <TD>71</TD>
    </TR>
    <TR bgcolor="FFFFFF">
        <TD>语文</TD>
        <TD>33</TD>
        <TD>44</TD>
        <TD>55</TD>
    </TR>
</TABLE>
<script>
    function line(x1,y1,x2,y2,color)
    {
        var tmp
        if(x1>=x2)
        {
            tmp=x1;
            x1=x2;
            x2=tmp;
            tmp=y1;
            y1=y2;
            y2=tmp;
        }
        for(var i=x1;i<=x2;i++)
        {
            x = i;
            y = (y2 - y1) / (x2 - x1) * (x - x1) + y1;
            a(x,y,color);
        }
    }
    //line(1,1,1000,1000,"000000");
    line(td1.offsetLeft,td1.offsetTop,td1.offsetLeft+td1.offsetWidth,td1.offsetTop+td1.offsetHeight,'000000')
</script>
</BODY>
</HTML>