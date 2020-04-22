<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%
		pageContext.setAttribute("ctx",request.getContextPath());
	%>
	<meta charset="utf-8">
	<title>我的评论</title>
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
	<legend style="font-weight:bold">我的评论</legend>
</fieldset>
<!-- 数据表格开始 -->
<table class="layui-hide" id="UserTable" lay-filter="UserTable"></table>

<div  id="UserBar" style="display: none;">
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</div>
<!-- 数据表格结束 -->


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
            ,url:'${ctx}/myself/loadAllMyComment.action' //数据接口
            ,title: '我的评论'//数据导出来的标题
            ,toolbar:"#UserToolBar"   //表格的工具条
            ,height:'full-68'
            ,cellMinWidth:100 //设置列的最小默认宽度
            ,page: true  //是否启用分页
            ,cols: [[   //列表数据
                {type: 'checkbox', fixed: 'left'}
                ,{field:'id', title:'编号',align:'center',width:'100'}
                ,{field:'goodsId', title:'评论的编号',align:'center',width:'190'}
                ,{field:'title', title:'评论的标题',align:'center',width:'170'}

                ,{field:'commentcontent', title:'评论内容',align:'center',width:'400'}

                ,{field:'createDate', title:'创建时间',align:'center',width:'270'}
                ,{fixed: 'right', title:'操作', toolbar: '#UserBar', width:'100',align:'center'}
            ]]
        })

        //监听行工具事件
        table.on('tool(UserTable)', function(obj){
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if(layEvent === 'edit'){ //编辑
                openUpdateUser(data);
            }else  if(layEvent === 'del'){ //删除
                layer.confirm('真的删除这条评论吗', function(index){
                    //向服务端发送删除指令
                    $.post("${ctx}/myself/deleteMyComment.action",{id:data.id},function(res){
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
                $.post("${ctx}/myself/deleteBatchMyComment.action",
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