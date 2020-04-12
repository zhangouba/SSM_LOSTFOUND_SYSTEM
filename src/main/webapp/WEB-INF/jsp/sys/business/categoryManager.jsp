<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%
	pageContext.setAttribute("ctx",request.getContextPath());
	%>
	<meta charset="utf-8">
	<title>用户管理</title>
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
	<link rel="stylesheet" href="${ctx }/resources/layui_ext/dtree/dtree.css">
	<link rel="stylesheet" href="${ctx }/resources/layui_ext/dtree/font/dtreefont.css">
</head>
<body class="childrenBody">
	<!-- 搜索条件开始 -->
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
	  <legend>目录管理</legend>
	</fieldset>

	<!-- 数据表格开始 -->
	<table class="layui-hide" id="CategoryTable" lay-filter="CategoryTable"></table>

	<div style="display: none;" id="CategoryToolBar">
		<button type="button" class="layui-btn layui-btn-green layui-btn-sm" lay-event="add">添加目录</button>

		<button type="button" class="layui-btn layui-btn-danger layui-btn-sm" lay-event="deleteBatch">批量删除</button>
	</div>
	<div  id="CategoryBar" style="display: none;">
		<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
		<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
	</div>
	<!-- 数据表格结束 -->

	<!-- 添加和修改的弹出层开始 -->
	<div style="display: none;padding: 20px" id="saveOrUpdateDiv" >
		<form class="layui-form"  lay-filter="dataFrm" id="dataFrm">
				<div class="layui-inline">
					<label class="layui-form-label">目录名称:</label>
					<div class="layui-input-inline">
						<input type="hidden" name="id">
						<input type="text" name="categoryName" placeholder="目录名称" autocomplete="off"
							   class="layui-input">
					</div>
				</div>
			<br>
			<br>
			<br>
				<div class="layui-input-block">
					<button type="button" class="layui-btn layui-btn-normal layui-btn-sm layui-icon layui-icon-release" lay-filter="doSubmit" lay-submit="">提交</button>
					<button type="reset" class="layui-btn layui-btn-warm layui-btn-sm layui-icon layui-icon-refresh" >重置</button>
				</div>
		</form>
	</div>
	<!-- 添加和修改的弹出层结束 -->
	<!-- 用户分配菜单的弹出层开始 -->
	<div style="display: none;padding: 10px" id="selectCategoryRole">
		<table  id="roleTable" lay-filter="roleTable"></table>

	</div>
	<!-- 用户分配菜单的弹出层结束 -->
	<script src="${ctx }/resources/layui/layui.js"></script>
	<script type="text/javascript">
	    var tableIns;
	    layui.extend({
			dtree:'${ctx}/resources/layui_ext/dist/dtree'
		}).use([ 'jquery', 'layer', 'form', 'table' ], function() {
			var $ = layui.jquery;
			var layer = layui.layer;
			var form = layui.form;
			var table = layui.table;
			//渲染数据表格
			 tableIns=table.render({
					 elem: '#CategoryTable'   //渲染的目标对象
					,url:'${ctx}/business/loadAllCategory.action' //数据接口
			    ,title: '目录表'//数据导出来的标题
			    ,toolbar:"#CategoryToolBar"   //表格的工具条
			    ,height:'full-60'
			    ,cellMinWidth:100 //设置列的最小默认宽度
			    ,page: true  //是否启用分页
			    ,cols: [[   //列表数据
			         {type: 'checkbox', fixed: 'left'}
                    ,{field:'id', title:'编号',align:'center',width:'140'}
                    ,{field:'categoryName', title:'类别',align:'center',width:'450'}
                    ,{field:'lostDATE', title:'创建时间',align:'center',width:'450'}
			      ,{fixed: 'right', title:'操作', toolbar: '#CategoryBar', width:'200',align:'center'}
			    ]]
			})
			//监听头部工具栏事件
			table.on("toolbar(CategoryTable)",function(obj){
				 switch(obj.event){
				    case 'add':
				        openAddCategory();
				    break;
				    case 'deleteBatch':
				    	deleteBatch();
					break;
				  };
			})
			//监听行工具事件
		   table.on('tool(CategoryTable)', function(obj){
				   var data = obj.data; //获得当前行数据
				   var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
		    	  if(layEvent === 'del'){ //删除
				  layer.confirm('真的删除【'+data.categoryName +'】这个目录吗', function(index){
				       //向服务端发送删除指令
				    $.post("${ctx}/business/deleteCategory.action",{id:data.id},function(res){
				    	   layer.msg(res.msg);
				    	    //刷新数据 表格
							tableIns.reload();
				       })
				     });
			   } else if(layEvent === 'edit'){ //编辑
			         openUpdateCategory(data);
			   }
			 });
			var url;
			var mainIndex;
			//打开修改页面
			function openUpdateCategory(data){
				mainIndex=layer.open({
					type:1,
					title:'修改目录',
					content:$("#saveOrUpdateDiv"),
					area:['400px','200px'],
					success:function(index){
						form.val("dataFrm",data);
						url="${ctx}/business/updateCategory.action";
					}
				});
			}

            //打开添加页面
            function openAddCategory(){
                mainIndex=layer.open({
                    type:1,
                    title:'添加目录',
                    content:$("#saveOrUpdateDiv"),
                    area:['400px','200px'],

                    success:function(index){
                        //清空表单数据
                        $("#dataFrm")[0].reset();
                        url="${ctx}/business/addCategory.action";
                        $("#carnumber").removeAttr("readonly");
                    }
                });
            }

			//保存
			form.on("submit(doSubmit)",function(obj){
				//序列化表单数据
				var params=$("#dataFrm").serialize();
				$.post(url,params,function(obj){
					layer.msg(obj.msg);
					//关闭弹出层
					layer.close(mainIndex)
					//刷新数据 表格
					tableIns.reload();
				})
			});
			//批量删除
			function deleteBatch(){
				//得到选中的数据行
				var checkStatus = table.checkStatus('CategoryTable');
			    var data = checkStatus.data;
			    var params="";
			    $.each(data,function(i,item){
			    	if(i==0){
			    		params+="ids="+item.id;
			    	}else{
			    		params+="&ids="+item.id;
			    	}
			    });
			    layer.confirm('真的删除选中的这些目录吗', function(index){
				       //向服务端发送删除指令
				       $.post("${ctx}/business/deleteBatchCategory.action",
						   params,
						   function(res){
				    	   layer.msg(res.msg);
				    	    //刷新数据 表格
							tableIns.reload();
				       })
				     });
			}

		});
	</script>
</body>
</html>