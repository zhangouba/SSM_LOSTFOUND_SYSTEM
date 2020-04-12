<%--
  Created by IntelliJ IDEA.
  User: zhangouba
  Date: 2020/2/29
  Time: 15:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>修改密码</title>
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
<form class="layui-form layui-row changePwd">
    <div class="layui-col-xs12 layui-col-sm6 layui-col-md6">
        <div class="layui-form-item">
            <label class="layui-form-label">账号</label>
            <div class="layui-input-block">
                <input type="text" value="${user.username}"  disabled class="layui-input layui-disabled">
                <input type="hidden" value="${user.id}" id="id">
                <input type="hidden" value="${user.password}" id="sessionPWD">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">旧密码</label>
            <div class="layui-input-block">
                <input type="password" id="oldPwd" name="oldPwd" placeholder="请输入旧密码"  class="layui-input pwd">
            </div>
            <div style="color: red;text-align: center;font-weight: bold"></div>

        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">新密码</label>
            <div class="layui-input-block">
                <input type="password" name="newPwd"   placeholder="请输入新密码"  id="newPwd1" class="layui-input pwd">
            </div>
            <div style="color: red;text-align: center;font-weight: bold"></div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">确认密码</label>
            <div class="layui-input-block">
                <input type="password" name="newPwd2"  id="newPwd2" placeholder="请确认密码"  class="layui-input pwd">
            </div>
            <div style="color: red;text-align: center;font-weight: bold"></div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn"   id="button">立即修改</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </div>
</form>
<script type="text/javascript" src="../../../../resources/layui/layui.js"></script>
<script type="text/javascript" src="../../../../resources/page/user/user.js"></script>
<script src='../../../../login_js/js/jquery.min.js' type="text/javascript"></script>
<script type="text/javascript">
    $("#button").click(function () {
        //1点击保存按钮将数据提交到数据库进行保存
        //进行数据校验
        if (!emp_validate_add_form()) {
            return false;
        };

        var password=$("#newPwd1").val();
        var id=$("#id").val();
        //2发送ajax请求保存数据
        $.ajax({
            url:"/user/changeUserPwd.action",
            type:"POST",
            data:{"id":id,"password":password},
            async:false,
            success:function (result) {
                if (result.status==200) {
                    alert("更改密码成功！");
                   // window.location.href = "/admin/login.action";
                    //    alert("success");
                }else {
                }
            }
        });
    });

    //验证
    function emp_validate_add_form() {

        var newPwd1=$("#newPwd1").val();
        var newPwd2=$("#newPwd2").val();

        if (newPwd1.length<=5){
            show_validate_msg("#newPwd1", "", "密码不能少于五个字符");
            return false;
        } if (newPwd1.length>15){
            show_validate_msg("#newPwd1", "", "密码不能多于十五个字符");
            return false;
        } else {
            show_validate_msg("#newPwd1", "", "");
        }

        if (newPwd2.length<=5){
            show_validate_msg("#newPwd2", "", "密码不能少于五个字符");
            return false;
        } if (newPwd2.length>15){
            show_validate_msg("#newPwd2", "", "密码不能多于十五个字符");
            return false;
        } else {
            show_validate_msg("#newPwd2", "", "");
        }


        if (newPwd1!=newPwd2){
            show_validate_msg("#newPwd2", "", "两次输入的密码不一致，请重现输入");
            return false;
        }
       // checkOldPwd();

        return true;
    }


    $("#oldPwd").change(function () {
        var sessionPWd=$("#sessionPWD").val();
        var oldPwd=$("#oldPwd").val();
      //  alert(sessionPWd);
      //  alert(oldPwd);
        if (sessionPWd!=oldPwd){
            show_validate_msg("#oldPwd","","原密码输入错误,请重新输入");
        }else{
            show_validate_msg("#oldPwd","","");
        }
    });


    function show_validate_msg(ele,status,msg){

        $(ele).parent().removeClass("has-success has-error");
        $(ele).parent().next("div").text("");
        if ("success"==status) {
            $(ele).parent().addClass("has-success");
            $(ele).parent().next("div").text(msg);
        }else  if ("error==status") {
            $(ele).parent().addClass("has-error");
            $(ele).parent().next("div").text(msg);
        }
    }
</script>
</body>
</html>
