<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <head>
        <meta charset="utf-8">
        <title>个人资料--layui后台管理模板 2.0</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="format-detection" content="telephone=no">
        <link rel="stylesheet" href="../../../../resources/layui/css/layui.css" media="all" />
        <link rel="stylesheet" href="../../../../resources/css/public.css" media="all" />
    </head>
<body class="childrenBody">
<form class="layui-form layui-row" id="dataForm">


    <div class="layui-col-md3 layui-col-xs12 user_right">
        <div class="layui-upload-list">
            <img class="layui-upload-img layui-circle userFaceBtn userAvatar" id="userFace" src="${pageContext.request.contextPath}/${user.img}">
            <p id="demoText"></p>
        </div>
        <button type="button" class="layui-btn layui-btn-primary userFaceBtn" id="test1"><i class="layui-icon">&#xe67c;</i> 更要换头像</button>
    </div>


    <div class="layui-col-md6 layui-col-xs12">
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="hidden" name="id" value="${user.id}">
                <input type="text" value="${user.username}" disabled class="layui-input layui-disabled">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">权限等级</label>
            <div class="layui-input-block">
                <input type="text" value="${user.type}"   disabled class="layui-input layui-disabled">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">昵称</label>
            <div class="layui-input-block">
                <input type="text" name="realname" placeholder="请输入真实姓名" value="${user.realname}"  class="layui-input realName">
            </div>
        </div>
        <div class="layui-form-item" pane="">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block userSex">
                <input type="radio" name="sex" value="1" title="男" checked="">
                <input type="radio" name="sex" value="0" title="女">
                <input type="radio" name="sex" value="" title="保密">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">手机号码</label>
            <div class="layui-input-block">
                <input type="tel" name="phone" value="${user.phone}" placeholder="请输入手机号码" lay-verify="phone" class="layui-input userPhone">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">邮箱</label>
            <div class="layui-input-block">
                <input type="text" value="${user.email}" name="email" placeholder="请输入邮箱" lay-verify="email" class="layui-input userEmail">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">家乡</label>
            <div class="layui-input-block">
                <input type="text" value="${user.address}" name="address" placeholder="您的家乡"  class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="changeUser" onclick="btn()">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </div>
</form>
<script src='../../../../login_js/js/jquery.min.js' type="text/javascript"></script>
<script type="text/javascript" src="../../../../resources/layui/layui.js"></script>
<script type="text/javascript" src="../../../../resources/page/user/userInfo.js"></script>
<script type="text/javascript" src="../../../../resources/js/cacheUserInfo.js"></script>
<script type="text/javascript">
   function btn() {
       $.ajax({
           url:"/user/changUserData.action",
           type:"POST",
           data: $("#dataForm").serialize(),
           async:false,
           success:function (result) {
               if (result.status==200){
                  alert("修改成功");
                  window.location.href="/admin/rearIndex";
               }else{
                   alert("修改失败");
               }
           }
       });
   }

   layui.use('upload', function() {
       var $ = layui.jquery
           , upload = layui.upload;

       //普通图片上传
       var uploadInst = upload.render({
             elem: '#test1'
           , url: '/user/changMyPhoto' //改成您自己的上传接口
           , acceptMime: 'images/*',
           field: "uploadFile"
           , before: function (obj) {
               //预读本地文件示例，不支持ie8
               obj.preview(function (index, file, result) {
                   $('#userFace').attr('src', result); //图片链接（base64）
               });
           }
           , done: function (res) {
               //如果上传失败
               if (res.code > 0) {
                   return layer.msg('上传失败');
               }
               //上传成功
           }
           , error: function () {
               //演示失败状态，并实现重传
               var demoText = $('#demoText');
               demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
               demoText.find('.demo-reload').on('click', function () {
                   uploadInst.upload();
               });
           }
       });
   });
</script>
</body>
</html>
