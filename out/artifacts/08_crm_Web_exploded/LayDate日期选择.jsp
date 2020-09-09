<%--
  Created by IntelliJ IDEA.
  User: Logan
  Date: 2020/8/31
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="layui/layui.js"></script>
<%--<script type="text/javascript" src="<%=request.getContextPath()%>/layui/lay/modules/transfer.js"></script>--%>

<html>
<head>
    <title>日期选择</title>
</head>
<body>
<div>
    日期选择：<input id="date" type="text" placeholder="请选择日期" size="20">
    <a id="upload"></a>
</div>
<div id="transfer" style="display: inline-block;position: absolute;top:30%;left:20%">

</div>
</body>
<script>
   /* $('#date').focus(function () {

    })*/
   layui.use('laydate',function () {
       var laydate = layui.laydate;
       laydate.render({
           elem: '#date',//绑定元素
           lang: 'cn', //语言
           theme:'grid',   //主题
           calendar:true,  //公历节日
           mark:{
               '0-4-12':'生日',
               '0-0-15':'发薪',
               '0-10-1':'国庆',
           }
       })
   })
    layui.use('upload',function () {
        var upload = layui.upload;
        var uploadinst = upload.render({
            elem:'#upload',
            url: '/upload/',
            accept: 'file',//文件上传类型，默认是图片images
            auto: true ,//选择文件后自动上传
            size: 0,//上传文件大小，0即为不设定
            multiple: true,//是否为多文件上传，默认为false
            number: 0,//上传数量，0即为不限制
            drag:true,// 默认为true,是否接受拖拽的文件上传
            done: function (res) {
                layui.img('上传成功');
            },
            error: function (res) {
                layui.img('上传失败');
            }

        })

    })

    layui.use('transfer',function () {
        var transfer = layui.transfer;
        transfer.render({
            elem:'#transfer',
            data: [
                {"value":"1","title":"李白","disabled":"","checked":"checked"},
                {"value":"2","title":"杜甫","disabled":"","checked":"checked"},
                {"value":"3","title":"贤心","disabled":"","checked":"checked"}
            ],
            id:'demo1',
            showSearch:true
        });
    });

</script>
</html>
