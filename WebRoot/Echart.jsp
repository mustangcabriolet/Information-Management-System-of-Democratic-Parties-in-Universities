<%--
  Created by IntelliJ IDEA.
  User: Logan
  Date: 2020/8/20
  Time: 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Echarts</title>
   <%-- <script type="text/javascript" src="easyui/echarts.js"></script>--%>
    <script src="https://cdn.staticfile.org/echarts/4.3.0/echarts.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.min.js"></script>
</head>

<body>
<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
<%--<div id="main" style="width: 600px;height:400px;"></div>--%>

<script>
    //数据图表展示
    $(function () {
       // $("#main").show();
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));
        console.log("======");
        //加载数据图表
        $.getJSON("partisanInfo/list.action",function (data,status) {
            console.log(data);
            var ObjectArray = [];
            for(var i=0;i<data.length;i++)
            {
                var obj = new Object();
                obj.name=data[i].partisan;
                obj.value =data[i].number;
                ObjectArray[i] = obj;
            }
            var option ={
                series: [
                    {
                        name: '各党派人数饼状图',
                        type: 'pie',
                       // radius: '55%',
                        roseType: 'angle',
                        data: ObjectArray
                    }

                ],
                itemStyle: {
                    // 阴影的大小
                    shadowBlur: 200,
                    // 阴影水平方向上的偏移
                    shadowOffsetX: 0,
                    // 阴影垂直方向上的偏移
                    shadowOffsetY: 0,
                    // 阴影颜色
                    shadowColor: 'rgba(0, 0, 0, 0.5)',
                    emphasis: {
                        shadowBlur: 200,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
            if(status=="success") {
                myChart.showLoading();
                myChart.hideLoading();
                myChart.setOption(option);
            }
            else{
                console.log(status.statusText);
            }
        })

    })
</script>
</body>
</html>
