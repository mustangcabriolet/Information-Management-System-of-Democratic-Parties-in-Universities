<%@ page language="java" import="java.util.*,GP.domain.Admin" pageEncoding="utf-8" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>高校民主党派信息管理系统</title>
    
<%--	<meta http-equiv="pragma" content="no-cache">--%>
<%--	<meta http-equiv="cache-control" content="no-cache">--%>
<%--	<meta http-equiv="expires" content="0">    --%>
<%--	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">--%>
<%--	<meta http-equiv="description" content="This is my page">--%>
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
	<link id="themeLink" rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">

	<style type="text/css">
		ul{
			line-height: 30px;
		}
	</style>
  </head>
  
  <body class="easyui-layout"> 
  	 <!-- 顶部 --> 
    <div data-options="region:'north',split:true" style="height:80px;">
    	
    	
    	<!-- 登录用户信息 -->
    	<div id="loginDiv" style="position: absolute;right: 20px;top: 20px;">
    		 ${lgn}管理员您好，欢迎登录高校民主信息管理系统
    	</div>
    </div>
    <div data-options="region:'west',title:'系统菜单',split:true" style="width:100px;">
    	<div id="aa" class="easyui-accordion" style="width:150px;" data-options="border:0,multiple:true" >
		    <div title="党派人员管理" data-options="iconCls:'icon-reload',selected:true" style="padding:10px;">   
		       <ul>
		       	 <li><a href="javascript:void(0)" pageUrl="partisan_manage.jsp">人员管理</a></li>
		       	 <li><a href="javascript:void(0)" pageUrl="partisanInfo.jsp">党派查询</a></li>
		       </ul>
		    </div>     
		</div>  
    </div>   
    
    <!-- 中间编辑区域 -->
    <div data-options="region:'center'" style="padding:5px;background:#eee;">
    	<div id="tt" class="easyui-tabs" style="width:500px;height:250px;" data-options="fit:true">   
		    <div title="起始页" style="padding:20px;display:none;">   
		       欢迎登录高校民主党派信息管理系统
		    </div>     
		</div>  
    </div> 

    <script type="text/javascript">
    	$(function(){
    		//给a标签绑定时间
    		$("a[pageUrl]").click(function(){
    			//1.获取pageUrl属性值（需要跳转的页面地址）
    			var pageUrl = $(this).attr("pageUrl");
    			//获取a标签的内容，标题
    			var title = $(this).text();

    			//2.判断是否存在指定标题的选项卡
    			if( $("#tt").tabs("exists",title)  )  {
	    			//3.如果存在，则选项该选项卡
    				$("#tt").tabs("select",title);				
    			}else{
	    			//4.如果不存在，则添加选项卡
    				$("#tt").tabs("add",{
    					title:title,
    					content:"<iframe src='"+pageUrl+"' width='100%' height='100%' frameborder='0'><iframe>",
    					closable:true
    				});				
    			}
    		});  		
    	});
    
    </script>  
  </body>  
</html>
