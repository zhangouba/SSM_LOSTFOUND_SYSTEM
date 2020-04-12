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
	  <legend>查询条件</legend>
	</fieldset>
	<form class="layui-form" method="post" id="searchFrm">
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">账&nbsp;号:</label>
				<div class="layui-input-inline">
					<input type="text" name="username"  autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">手机号:</label>
				<div class="layui-input-inline">
					<input type="text" name="phone"  autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">邮&nbsp;箱:</label>
				<div class="layui-input-inline">
					<input type="text" name="email"  autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">地&nbsp;址:</label>
				<div class="layui-input-inline">
					<input type="text" name="address"  autocomplete="off" class="layui-input">
				</div>
			</div>



            <div class="layui-form-item">
                <label class="layui-form-label">是否可用</label>
                <div class="layui-input-inline">
                    <select name="available" lay-verify="required">
                        <option value="" selected>ALL</option>
                        <option value="0">不可用</option>
                        <option value="1">可用</option>
                    </select>
                </div>

				<label class="layui-form-label">性别</label>
				<div class="layui-input-inline">
					<select name="sex" lay-verify="required">
						<option value="" selected>ALL</option>
						<option value="0">女</option>
						<option value="1">男</option>
					</select>
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

				<label class="layui-form-label">权限</label>
				<div class="layui-input-inline">
					<select name="type" lay-verify="required">
						<option value="">ALL</option>

						<option value="0">用户</option>
						<option value="1">管理员</option>
						<option value="2">超级管理员</option>
						<option value="3">OA</option>
					</select>
				</div>

				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;
				&nbsp;
				&nbsp;
				&nbsp;
				&nbsp;
				&nbsp;
				&nbsp;
				&nbsp;
				&nbsp;
				<div class="layui-inline">
					<button type="button" class="layui-btn layui-btn-normal  layui-icon layui-icon-search" id="doSearch">查询</button>
					<button type="reset" class="layui-btn layui-btn-warm  layui-icon layui-icon-refresh">重置</button>
				</div>
            </div>


		</div>
	</form>

	<!-- 搜索条件结束 -->

	<!-- 数据表格开始 -->
	<table class="layui-hide" id="UserTable" lay-filter="UserTable"></table>
	<div style="display: none;" id="UserToolBar">
		    <button type="button" class="layui-btn layui-btn-danger layui-btn-sm" lay-event="deleteBatch">批量删除</button>
	</div>
	<div  id="UserBar" style="display: none;">
		<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
		<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
		<a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="selectUserRole">分配角色</a>
	</div>
	<!-- 数据表格结束 -->

	<!-- 添加和修改的弹出层开始 -->
	<div style="display: none;padding: 20px" id="saveOrUpdateDiv" >
		<form class="layui-form"  lay-filter="dataFrm" id="dataFrm">
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">用户姓名:</label>
					<div class="layui-input-inline">
						<input type="hidden" name="id">
						<%--lay-verify="required" 必填的意思  --%>
						<input type="text" name="realname" lay-verify="required" placeholder="请输入用户姓名" autocomplete="off"
							   class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">账 号:</label>
					<div class="layui-input-inline">
						<input type="text" name="username" placeholder="请输入账号" autocomplete="off" readonly="readonly"
							   class="layui-input">
					</div>
				</div>
			</div>

			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">密码:</label>
					<div class="layui-input-inline">
						<input type="password" name="identity" placeholder="请输入密码" autocomplete="off"
							   class="layui-input">
					</div>
				</div>

				<div class="layui-inline">
					<label class="layui-form-label">用户地址:</label>
					<div class="layui-input-inline">
						<input type="text" name="address" placeholder="请输入用户地址" autocomplete="off"
							   class="layui-input">
					</div>
				</div>
			</div>

			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">电话:</label>
					<div class="layui-input-inline">
						<input type="text" name="phone" lay-verify="required|phone" placeholder="请输入用户电话" autocomplete="off"
							   class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">Email:</label>
					<div class="layui-input-inline">
						<input type="text" name="email" placeholder="请输入邮箱" autocomplete="off"
							   class="layui-input">
					</div>
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">性别:</label>
				<div class="layui-input-inline">
					<input type="radio" name="sex" value="1" checked="checked" title="男">
					<input type="radio" name="sex" value="0" title="女">
				</div>
				</div>

				<div class="layui-inline">
					<label class="layui-form-label">是否可用:</label>
					<div class="layui-input-inline">
						<input type="radio" name="available" value="1" checked="checked" title="可用">
                        <input type="radio" name="available" value="0" title="不可用">
					</div>
				</div>
				<br>
				<br>
				<br>
				<div class="layui-form-item" style="text-align: center;">
					<div class="layui-input-block">
						<button type="button" class="layui-btn layui-btn-normal layui-btn-sm layui-icon layui-icon-release" lay-filter="doSubmit" lay-submit="">提交</button>
						<button type="reset" class="layui-btn layui-btn-warm layui-btn-sm layui-icon layui-icon-refresh" >重置</button>
					</div>
				</div>

		</form>
	</div>
	<!-- 添加和修改的弹出层结束 -->
	<!-- 用户分配菜单的弹出层开始 -->


	<div style="display: none;padding: 10px" id="selectUserRole">
		<table  id="roleTable" lay-filter="roleTable"></table>

	</div>
	<!-- 用户分配菜单的弹出层结束 -->


	<script src="${ctx }/resources/layui/layui.js"></script>

	<script type="text/javascript">
	    var tableIns;
	    layui.extend({
			dtree:'${ctx}/resources/layui_ext/dist/dtree'
		}).use([ 'jquery', 'layer', 'form', 'table','dtree'  ], function() {
			var $ = layui.jquery;
			var layer = layui.layer;
			var form = layui.form;
			var table = layui.table;
			var dtree=layui.dtree;
			//渲染数据表格
			 tableIns=table.render({
					 elem: '#UserTable'   //渲染的目标对象
					,url:'${ctx}/user/loadAllUser.action' //数据接口
			    ,title: '用户数据表'//数据导出来的标题
			    ,toolbar:"#UserToolBar"   //表格的工具条
			    ,height:'full-200'
			    ,cellMinWidth:100 //设置列的最小默认宽度
			    ,page: true  //是否启用分页
			    ,cols: [[   //列表数据
			     {type: 'checkbox', fixed: 'left'}
			        ,{field:'type', title:'权限',align:'center',width:'120',templet:function (d) {
							 if (d.type==0){
							     return  '<font color=black>用户</font>'
							 }
							 if (d.type==1){
                                 return  '<font color=blue>管理员</font>'
							 }
                             if (d.type==2){
                                 return  '<font color=green>超级管理员</font>'
                             }
                             if (d.type==3){
                                 return  '<font color=red>OA</font>'
                             }
                         }}
                     ,{field:'username', title:'账号',align:'center',width:'100'}

                     ,{field:'realname', title:'用户姓名',align:'center',width:'100'}
                   ,{field:'email', title:'邮箱',align:'center',width:'150'}
                   ,{field:'phone', title:'电话',align:'center',width:'150'}
                   ,{field:'address', title:'地址',align:'center',width:'105'}
                     ,{field:'sex', title:'性别',align:'center',width:'80',templet:function(d){
                             if (d.sex==0){
                                 return  '<font color=black>女</font>'
                             }
                             if (d.sex==1){
                                 return  '<font color=blue>男</font>'
                             }else {
                                 return  '<font color=blue>保密</font>'
                             }
            }}
                   ,{field:'available', title:'是否可用',align:'center',width:'80',templet:function (d) {
                             if (d.sex==0){
                                 return  '<font color=black>不可用</font>'

                           }else {
                                 return  '<font color=blue>可用</font>'
							 }
                         }}
                     ,{field:'created', title:'创建时间',align:'center',width:'150'}
			      ,{fixed: 'right', title:'操作', toolbar: '#UserBar', width:'200',align:'center'}
			    ]]
			})
			//模糊查询
			$("#doSearch").click(function(){
				var params=$("#searchFrm").serialize();
				tableIns.reload({
					url:"${ctx}/user/loadAllUser.action?"+params,
                    page:{curr:1}
				})
			});
			//监听头部工具栏事件
			table.on("toolbar(UserTable)",function(obj){
				 switch(obj.event){
				    case 'add':
				        openAddUser();
				    break;
				    case 'deleteBatch':
				    	deleteBatch();
					break;
				  };
			})
			//监听行工具事件
		   table.on('tool(UserTable)', function(obj){
				   var data = obj.data; //获得当前行数据
				   var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
		    	  if(layEvent === 'del'){ //删除
				  layer.confirm('真的删除【'+data.realname +'】这个用户吗', function(index){
				       //向服务端发送删除指令
				    $.post("${ctx}/user/deleteUser.action",{id:data.id},function(res){
				    	   layer.msg(res.msg);
				    	    //刷新数据 表格
							tableIns.reload();
				       })
				     });
			   } else if(layEvent === 'edit'){ //编辑
			         openUpdateUser(data);
			   }else if(layEvent==='selectUserRole'){
				     openselectUserRole(data);
			   }
			 });
			var url;
			var mainIndex;
			//打开修改页面
			function openUpdateUser(data){
				mainIndex=layer.open({
					type:1,
					title:'修改用户',
					content:$("#saveOrUpdateDiv"),
					area:['700px','450px'],
					success:function(index){
						form.val("dataFrm",data);
						url="${ctx}/user/updateUser.action";
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
				var checkStatus = table.checkStatus('UserTable');
			    var data = checkStatus.data;
			    var params="";
			    $.each(data,function(i,item){
			    	if(i==0){
			    		params+="ids="+item.id;
			    	}else{
			    		params+="&ids="+item.id;
			    	}
			    });
			    layer.confirm('真的删除选中的这些用户吗', function(index){
				       //向服务端发送删除指令
				       $.post("${ctx}/user/deleteBatchUser.action",
						   params,
						   function(res){
				    	   layer.msg(res.msg);
				    	    //刷新数据 表格
							tableIns.reload();
				       })
				     });
			}
			//打开分配角色的弹出层
			function openselectUserRole(data){

                mainIndex=layer.open({
                    type:1,
                    title:'分配【'+data.realname+'】的角色',
                    content:$("#selectUserRole"),
                    area:['800px','400px'],
                    btnAlign:'c',
                    btn:['<div class="layui-icon layui-icon-release">确认分配</div>','<div class="layui-icon layui-icon-close">取消分配</div>'],
                    yes:function(index, layero){
                        //得到选中的数据行
                        var checkStatus = table.checkStatus('roleTable');
                        var roleData = checkStatus.data;
                        var params="id="+data.id;
                        $.each(roleData,function(i,item){
                                params+="&ids="+item.roleid;
                        });
                        // alert(params);
						//保存
						$.post("${ctx}/user/saveUserRole.action",params,function (obj) {
							layer.msg(obj.msg);
                            //关闭弹出层
                            //刷新数据 表格
                            tableIns.reload();
                            layer.close(mainIndex)
                        })
                    },
                    success:function(index){
                        //渲染数据表格
                        var roleTableIns=table.render({
                            elem: '#roleTable'   //渲染的目标对象
                            ,url:'${ctx}/user/initUserRole.action?id='+data.id //数据接口
                            ,title: '角色列表'//数据导出来的标题
							,toolbar:"<div>角色列表</div>"  //表格的工具（导出。。。。工具栏）
                            ,cellMinWidth:100 //设置列的最小默认宽度
                            // ,page: true  //是否启用分页
                            ,cols: [[   //列表数据
                                {type: 'checkbox', fixed: 'left'}
                                ,{field:'roleid', title:'ID',align:'center'}
                                ,{field:'rolename', title:'角色名称',align:'center'}
                                ,{field:'roledesc', title:'角色备注',align:'center'}


                            ]]
                        })
                    }
                });
			}
		});
	</script>
</body>
</html>