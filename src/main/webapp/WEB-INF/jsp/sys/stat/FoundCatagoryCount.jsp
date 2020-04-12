<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>拾取物品类别统计</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Access-Control-Allow-Origin" content="*">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="icon" href="favicon.ico">
<link rel="stylesheet" href="${ctx }/resources/layui/css/layui.css" media="all" />
<link rel="stylesheet" href="${ctx }/resources/css/public.css" media="all" />
</head>
<body style="height: 100%; margin: 0">
<!-- 搜索条件开始 -->
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
	  <legend>查询条件</legend>
	</fieldset>
	<%--<form class="layui-form" method="post" id="searchFrm">--%>
		<%--<div class="layui-form-item">--%>
			<%--<div class="layui-inline">--%>
			      <%--<label class="layui-form-label">选择年份:</label>--%>
			      <%--<div class="layui-input-inline">--%>
			       	       <%--<input type="text" class="layui-input" id="year" readonly="readonly">--%>
			      <%--</div>--%>
		     <%--</div>--%>
			<%--<div class="layui-inline">--%>
		            <%--<button type="button" class="layui-btn layui-btn-normal  layui-icon layui-icon-search" id="doSearch">查询</button>--%>
		     <%--</div>--%>
		 <%--</div>--%>
	<%--</form>--%>
	<!-- 搜索条件结束 -->
       <div id="container" style="height: 70%"></div>
       <script type="text/javascript" src="${ctx }/resources/echarts/js/echarts.min.js"></script>
       <script type="text/javascript" src="${ctx }/resources/echarts/js/jquery-3.1.1.min.js"></script>
       <script src="${ctx }/resources/layui/layui.js"></script>
      
       <script type="text/javascript">
           $.post("${ctx}/data/loadUserFoundCategory.action",function (data) {
               var dom = document.getElementById("container");
               var myChart = echarts.init(dom);
               var app = {};
               option = null;
               option = {
                   title: {
                       text: '拾取物品类别统计',
                       subtext: '',
                       left: 'center'
                   },
                   tooltip: {
                       trigger: 'item',
                       formatter: '{a} <br/>{b} : {c} ({d}%)'
                   },
                   legend: {
                       orient: 'vertical',
                       left: 'left',
                       data: data,
                   },
                   series: [
                       {
                           name: '拾取物品类别以及占比',
                           type: 'pie',
                           radius: '75%',
                           center: ['50%', '60%'],
                           data: data,
                           emphasis: {
                               itemStyle: {
                                   shadowBlur: 10,
                                   shadowOffsetX: 0,
                                   shadowColor: 'rgba(0, 0, 0, 0.5)'
                               }
                           }
                       }
                   ]
               };
               ;
               if (option && typeof option === "object") {
                   myChart.setOption(option, true);
               }
           })
       </script>
   </body>
</html>