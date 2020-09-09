$(function(){
    $("#searchButton").click(function(){
        var str = $('#str').val();
        $("#findForm").form("clear");
        $("#search").window("close");
        $("#list").datagrid("reload", {str: str});
    });
    $("#main").hide();
    $("#list").datagrid({
        url:"partisan/listByPageFind.action",
        columns:[[
            {
                field:"id",
                title:"编号",
                width:100,
                checkbox:true
            },
            {
                field:"name",
                title:"姓名",
                width:150
            },
            {
                field:"gender",
                title:"性别",
                width:150
            },
            {
                field:"partisan",
                title:"党派",
                width:150
            },
            {
                field:"join_time",
                title:"加入时间",
                width:150
            },
            {
                field:"school",
                title:"学校",
                width:150
            },
            {
                field:"telephone",
                title:"手机",
                width:150
            },
            {
                field:"address",
                title:"住址",
                width:150
            }

        ]],
        //显示分页
        pagination:true,
        //工具条
        toolbar:"#Toolbar"
    });

    //打开编辑窗口
    $("#addBtn").click(function(){
        //清空表单数据
        $("#bianji").form("clear");
        $("#win").window("open");
    });

    //打开查找窗口
    $("#searchBtn").click(function(){
        //清空表单数据
        $("#findForm").form("clear");
        $("#search").window("open");
    });

    //保存数据
    $("#SaveButton").click(function(){
        $("#bianji").form("submit",{
            url:"partisan/save.action",
            onSubmit:function(){
                //验证表单内容是否符合要求
                return $("#bianji").form("validate");
            },
            success:function(data_of_Con){
                //把data_of_Con字符串类型转换对象类型
                data_of_Con = eval("("+data_of_Con+")");

                if(data_of_Con.result){
                    //关闭窗口
                    $("#win").window("close");
                    //保存成功刷新table
                    $("#list").datagrid("reload");

                    $.messager.alert("alert","Saved successfully","info");
                }else{
                    $.messager.alert("alert","Save failed："+data_of_Con.msg,"error");
                }
            }
        });

    });

    //修改数据
    $("#editBtn").click(function(){
        //判断是否只选了一行
        var rows = $("#list").datagrid("getSelections");
        if(rows.length!=1){
            $.messager.alert("alert","You can only select one line to modify","warning");
            return;
        }
        //表单回显,将选中的那行数据从数据库读取出来并显示在编辑窗口
        $("#bianji").form("load","partisan/findById.action?id="+rows[0].id);

        $("#win").window("open");
    });


    //删除
    $("#deleteBtn").click(function(){
        var hangshu =$("#list").datagrid("getSelections");//选择删除哪行
        if(hangshu.length==0){
            $.messager.alert("alert","最少选择一行删除","warning");
            return;
        }

        //格式： id=1&id=2&id=3
        $.messager.confirm("alert","确认删除数据吗?",function(value){
            if(value){
                var IdOfhangshu = "";
                //遍历选了哪几行
                $(hangshu).each(function(i){
                    IdOfhangshu+=("id="+hangshu[i].id+"&");
                });
                IdOfhangshu = IdOfhangshu.substring(0,IdOfhangshu.length-1);

                //传递到后台
                $.post("partisan/delete.action",IdOfhangshu,function(data){
                    console.log(data);
                    if(data.result){
                        //刷新删除后的table
                        $("#list").datagrid("reload");

                        $.messager.alert("alert","删除成功","info");
                    }else{
                        $.messager.alert("alert","删除失败："+data.msg,"error");
                    }
                },"json");
            }
        });
    });
    //导出为excel表格
    $("#export").click(function () {
        location ="partisan/exportAllUser.action";
    });

    //柱状图
    $('#echarts').click(function () {
        showBarEcharts();
    })

    //饼状图
    $('#echart2').click(function () {
        showPieEcharts();
    })

    //柱状图导出
    $("#exportbarchart").click(function () {
        var myChart = echarts.init(document.getElementById('main'));
        //var img = new Image();
        var url  = myChart.getDataURL({
            pixelRatio: 2,
            backgroundColor: '#fff'
        });
        $.post("partisanInfo/export.action",url,function (data,status) {
            if(status=="status")
            {
                alert("导出成功")
            }
            else{
                alert("导出失败")
            }
        })
    })
    $('#openpage').click(function () {
        window.open("partisan/opennewpage.action");
    })

    $('#openModwin').click(function () {
        layui.use('layer',function () {
            var layer = layui.layer;
            layer.open({
                title: '模态框',
                anim: 0,
                maxmin: true,
                type: 1,
                area:['80%','80%'],
                content:$('#modwinEcharts'),
                success: function () {
                    showBarEcharts();
                    showPieEcharts();
                }
            })
        })
    })

});
function showBarEcharts() {
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main3'));
        myChart.setOption({
            title:{
                text:"党派人员图表"
            },
            tooltip:{},
            //保存Echart图
            toolbox: {
                show: true,
                feature: {
                    dataZoom: {
                        yAxisIndex: 'none'
                    },
                    dataView: {readOnly: false},
                    magicType: {type: ['line', 'bar']},
                    restore: {},
                    saveAsImage: {}
                }
            },
            legend:{
                data:['人数']
            },
            xAxis: {
                data: []
            },
            yAxis:{},
            series: [{
                // 根据名字对应到相应的系列
                name: '人数',
                type:'bar',
                data: []
            }]
        });
        myChart.showLoading();
        $.getJSON("partisanInfo/list.action",function (data,status) {
            var partisan = [];
            var number =[];
            for(var i=0;i<data.length;i++)
            {
                partisan.push(data[i].partisan);
            }
            for(var i=0;i<data.length;i++)
            {
                number.push(data[i].number);
            }
            console.log(partisan);
            if(status=="success") {
                myChart.hideLoading();
                myChart.setOption({
                    xAxis: {
                        data: partisan
                    },
                    series: {
                        name: '人数',
                        data: number
                    }
                })
            }
            else{
                console.log(status.statusText);
            }
        })
}
function showPieEcharts() {
        // $("#main").show();
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main2'));
        //加载数据图表
        $.getJSON("partisanInfo/list.action",function (data,status) {
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

                ]
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
}