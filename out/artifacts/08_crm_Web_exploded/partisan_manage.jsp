<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>党派人员管理</title>
	  <link rel="icon" href="easyui/themes/icons/bitbug_favicon.ico">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- 导入easyui的资源文件 -->
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	  <script type="text/javascript" src="layui/layui.js"></script>
	  <script type="text/javascript" src="easyui/echarts.min.js"></script>
	  <%--<script src="https://cdn.staticfile.org/echarts/4.3.0/echarts.min.js"></script>--%>
	  <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
	<link id="themeLink" rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
<style type="text/css">
	#main{
		float: left;
		display: inline-block;
	}
	#main2{
		float: left;
		display: inline-block;
	}
</style>
  </head>
  <body>
  	<table id="list"></table>

  	<!-- 工具条 -->
  	<div id="Toolbar">
		<a id="addBtn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a>
		<a id="editBtn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改</a>
		<a id="deleteBtn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
		<a id="searchBtn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查找</a>
		<a id="export" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cvs',plain:true">导出为excel</a>
		<a id="echarts" href=#" class="easyui-linkbutton" data-options="iconCls:'icon-cvs',plain:true">柱状图展示</a>
		<a id="echart2" href="Echart.jsp" class="easyui-linkbutton" data-options="iconCls:'icon-cvs',plain:true">饼图表展示</a>
		<a id="openpage" class="easyui-linkbutton" data-options="iconCls:'icon-cvs',plain:true">打开新界面(日期选择)</a>
		<a id="openModwin" class="easyui-linkbutton" data-options="iconCls:'icon-cvs',plain:true">打开模态框</a>
		<%--<a id="exportbarchart" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cvs',plain:true">导出柱状图</a>
		<a id="exportpiechar" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cvs',plain:true">导出饼状图</a>
--%>
	<%--<a href="${pageContext.request.contextPath }/courseScore/export.action?code=${dangqiandaima}" class="btn btn-primary">导出到Excel</a>--%>
		<%--<a href=’${pageContext.request.contextPath}partisan/exportAllUser.action’>导出全部</a>--%>
	</div>

	<div id="modwinEcharts">
		<div id="main3" style="width:600px;height:400px;float: left;display: inline-block"></div>
		<div id="main2" style="width:300px;height:150px;float: left;display: inline-block"></div>
	</div>
	<!-- 编辑窗口 -->
	<div id="win" class="easyui-window" title="党派人员编辑" style="width:500px;height:300px"
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
	<script type="text/javascript" src="JS/partisan_manage.js"></script>
  </body>
</html>
