<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%
		pageContext.setAttribute("ctx",request.getContextPath());
	%>
	<meta charset="utf-8">
	<title>寻物审核</title>
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
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
	<legend style="font-weight:bold">我的寻物</legend>
</fieldset>
<!-- 数据表格开始 -->
<table class="layui-hide" id="UserTable" lay-filter="UserTable"></table>

<div  id="UserBar" style="display: none;">
	<a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="edit">编辑</a>
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</div>
<!-- 数据表格结束 -->


<!-- 添加和修改的弹出层开始 -->
<div style="display: none;padding: 20px" id="saveOrUpdateDiv" >
	<form class="layui-form layui-row layui-col-space10"  lay-filter="dataFrm" id="dataFrm">
		<div class="layui-col-md12 layui-col-xs12">
			<div class="layui-row layui-col-space10">
				<div class="layui-col-md9 layui-col-xs7">
					<div class="layui-form-item magt3">
						<label class="layui-form-label">丢失物品:</label>
						<div class="layui-input-block">
							<input type="text" name="infotitle" id="carnumber" readonly="readonly" class="layui-input"   placeholder="丢失物品">
						   <input type="hidden" name="id" id="id">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">丢失地点:</label>
						<div class="layui-input-block">
							<input type="text" name="lostPlace" class="layui-input" readonly="readonly"   placeholder="丢失地点">
						</div>
					</div>
					<div class="layui-form-item">


						<div class="layui-inline">
							<label class="layui-form-label">联系人:</label>
							<div class="layui-input-block">
								<input type="text" name="contacts" class="layui-input" readonly="readonly"   placeholder="联系人">
							</div>
						</div>
						<div class="layui-inline">
							<label class="layui-form-label">悬赏金额:</label>
							<div class="layui-input-block">
								<input type="text" name="rewards" class="layui-input" readonly="readonly"   placeholder="悬赏金额">
							</div>
						</div>

					</div>
				</div>
				<div class="layui-col-md3 layui-col-xs5">
					<div class="layui-upload-list thumbBox mag0 magt3" id="carimgDiv">
						<!-- 显示上传的图片 -->
						<img class="layui-upload-img thumbImg" id="showCarImg">
						<!-- 保存当前显示图片的地址 -->
						<input type="hidden" name="carimg" id="carimg">
					</div>
				</div>
			</div>
			<div class="layui-form-item magb0">
				<div class="layui-inline">
					<label class="layui-form-label">联系电话:</label>
					<div class="layui-input-block">
						<input type="text" name="tel" class="layui-input" readonly="readonly"   placeholder="联系电话">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">邮箱:</label>
					<div class="layui-input-block">
						<input type="text" name="email" class="layui-input" readonly="readonly"   placeholder="邮箱">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">QQ:</label>
					<div class="layui-input-block">
						<input type="text" name="QQ" class="layui-input" readonly="readonly"   placeholder="QQ">
					</div>
				</div>
			</div>
			<div class="layui-form-item magb0">
				<label class="layui-form-label">详情描述:</label>
				<div class="layui-input-block">
					<input type="text" name="description" class="layui-input" readonly="readonly"   placeholder="详情描述">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">丢失时间:</label>
				<div class="layui-input-block">
					<input type="text" name="lostDATE" class="layui-input" readonly="readonly"   placeholder="丢失时间">
				</div>
			</div>
			<div class="layui-form-item magb0" style="text-align: center;">
				<div class="layui-input-block">
					<button type="button" class="layui-btn layui-btn-normal layui-btn-sm layui-icon layui-icon-ok" lay-filter="doSubmit" lay-submit="">通过</button>
					<button type="button" class="layui-btn layui-btn-danger layui-btn-sm layui-icon layui-icon-close" lay-filter="PASS"  lay-submit="">未通过</button>
				</div>
			</div>
		</div>
	</form>
<!-- 添加和修改的弹出层结束 -->
<!-- 用户分配菜单的弹出层开始 -->

</div>

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
            ,url:'${ctx}/myself/loadAllMyLost.action' //数据接口
            ,title: '待审核寻物表'//数据导出来的标题
            ,toolbar:"#UserToolBar"   //表格的工具条
            ,height:'full-68'
            ,cellMinWidth:100 //设置列的最小默认宽度
            ,page: true  //是否启用分页
            ,cols: [[   //列表数据
                 {type: 'checkbox', fixed: 'left'},
                 {field:'id', title:'编号',align:'center',width:'180'}
                ,{field:'status', title:'状态',align:'center',width:'120',templet:function (d) {
                        if (d.status==0){
                            return  '<font color=blue>未审核</font>'
                        }
                        if (d.status==1){
                            return  '<font color=green>审核通过</font>'
                        }
                        if (d.status==2){
                            return  '<font color=red>审核未通过</font>'
                        }
                        if (d.status==3){
                            return  '<font color=#228b22>完成</font>'
                        }
                    }}
                ,{field:'infotitle', title:'丢失物品',align:'center',width:'200'}
                ,{field:'lostPlace', title:'丢失地点',align:'center',width:'180'}
                ,{field:'lostDATE', title:'丢失时间',align:'center',width:'180'}

                ,{field:'rewards', title:'悬赏金额',align:'center',width:'100'}
                ,{field:'contacts', title:'联系人',align:'center',width:'95'}
                ,{field:'tel', title:'电话',align:'center',width:'150'}
                ,{fixed: 'right', title:'操作', toolbar: '#UserBar', width:'150',align:'center'}
            ]]
        })

        //监听行工具事件
        table.on('tool(UserTable)', function(obj){
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if(layEvent === 'edit'){ //编辑
                openUpdateUser(data);
            }else  if(layEvent === 'del'){ //删除
                layer.confirm('真的删除这条记录吗', function(index){
                    //向服务端发送删除指令
                    $.post("${ctx}/myself/deleteMyLost.action",{id:data.id},function(res){
                        layer.msg(res.msg);
                        //刷新数据 表格
                        tableIns.reload();
                    })
                });
            }
        });
        var mainIndex;
        //打开查看页面
        function openUpdateUser(data){
            mainIndex=layer.open({
                type:1,
                title:'审核寻物启示',
                content:$("#saveOrUpdateDiv"),
                area:['1000px','450px'],
                success:function(index){
                    form.val("dataFrm",data);
                    $("#showCarImg").attr("src","${ctx}/"+data.images);
                }
            });
        }
        //修改
        form.on("submit(doSubmit)",function(obj){
            //序列化表单数据
            var id=$("#id").val();
            $.post("${ctx}/myself/updateMyLost.action",{"id":id,"status":1},function(obj){
                layer.msg(obj.msg);
                //关闭弹出层
                layer.close(mainIndex)
                //刷新数据 表格
                tableIns.reload();
            })
        });
        //关闭页面
        form.on("submit(PASS)",function(obj){

                //关闭弹出层
                layer.close(mainIndex)
                //刷新数据 表格
                tableIns.reload();
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
            layer.confirm('真的删除选中的这些记录吗', function(index){
                //向服务端发送删除指令
                $.post("${ctx}/myself/deleteBatchMyLost.action",
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