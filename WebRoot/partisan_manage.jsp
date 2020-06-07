<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>党派人员管理</title>   
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- 导入easyui的资源文件 -->
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
	<link id="themeLink" rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
  </head>
  
  <body>
  	<table id="list"></table>
  	
  	<!-- 工具条 -->
  	<div id="Toolbar">
		<a id="addBtn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a>
		<a id="editBtn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改</a>
		<a id="deleteBtn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
		<a id="searchBtn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查找</a>
	</div>
	
	<!-- 编辑窗口 -->
	<div id="win" class="easyui-window" title="客户数据编辑" style="width:500px;height:300px"
		 data-options="iconCls:'icon-save',modal:true,closed:true">
		<form id="bianji" method="post">
			<%--提供id隐藏域 --%>
			<input type="hidden" name="id">
			姓名：<input type="text" name="name" class="easyui-validatebox" data-options="required:true"/><br/>
			性别：
			<input type="radio" name="gender" value="男"/>男
			<input type="radio" name="gender" value="女"/>女
			<br/>
			党派：<select name="partisan" class="easyui-validatebox" data-options="required:true">
				<option value ="民盟">民盟</option>
				<option value ="民革">民革</option>
				<option value="民建">民建</option>
				<option value="民进">民进</option>
				<option value ="农工党">农工党</option>
				<option value ="致公党">致公党</option>
				<option value="九三学社">九三学社</option>
				<option value="台盟">台盟</option>
			</select>
				<br>
			学校：<input type="text" name="school" class="easyui-validatebox" data-options="required:true"/><br/>
				加入时间：<input type="text" name="join_time" class="easyui-validatebox" data-options="required:true"/><br/>
				住址：<input type="text" name="address" class="easyui-validatebox" data-options="required:true"/><br/>
				手机：<input type="text" name="telephone" class="easyui-validatebox" data-options="required:true"/><br/>
			<a id="SaveButton" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
		</form>
	</div>

	<!-- 查询窗口 -->
	<div id="search" class="easyui-window" title="查询" style="width:500px;height:300px"
		 data-options="iconCls:'icon-save',modal:true,closed:true">
		<div id="findForm" method="post">
			<%--提供id隐藏域 --%>
			<input type="hidden" name="id">
			输入查找项： <td><input id="str" type="text" size="20"/></td><br/>
			<br/>
			<input id="searchButton" type="button" value="查找"/>
			<input type="reset" value="重置"/>
		</div>
	</div>
	<script type="text/javascript">
  		$(function(){
			$("#searchButton").click(function(){
				var str = $('#str').val();
				$("#findForm").form("clear");
				$("#search").window("close");
				$("#list").datagrid("reload", {str: str});
			});
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
  					success:function(data){
  						//把data字符串类型转换对象类型
  						data_of_Con = eval("("+data+")");
  						
  						if(data_of_Con.success){
  							//关闭窗口
  							$("#win").window("close");
  							//保存成功刷新table
  							$("#list").datagrid("reload");
  							
  							$.messager.alert("alert","Saved successfully","info");
  						}else{
  							$.messager.alert("alert","Save failed："+data.msg,"error");
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
  						var idStr = "";
  						//遍历选了哪几行
  						$(hangshu).each(function(i){
  							IdOfhangshu+=("id="+hangshu[i].id+"&");
  						});
						IdOfhangshu = IdOfhangshu.substring(0,IdOfhangshu.length-1);
						
  						//传递到后台
  						$.post("partisan/delete.action",idStr,function(data){
  							if(data.success){
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

  		});
  	
  	</script>
  </body>
</html>
