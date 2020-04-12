<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="utf-8"%>

<html>
<head>
    <meta charset="utf-8">
    <title>登录 失物招领网</title>
    <link rel="stylesheet" href="${ctx}/resources/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="${ctx}/resources/css/public.css" media="all" />
    <link rel="stylesheet" type="text/css" href="../../login_js/style/register-login.css">
</head>

<body>
<div id="box"></div>
<div class="cent-box">
    <div class="cent-box-header">
        <h1 style="font-size: 50px"><a href="/admin/toIndex">校园失物招领</a></h1>
        <h2 class="sub-title">生活热爱分享 - Thousands Find</h2>
    </div>

    <div class="cont-main clearfix">
        <div class="index-tab">
            <div class="index-slide-nav">
                <a href="/admin/login.action" class="active">登录</a>
                <a href="/admin/register.action">注册</a>
                <div class="slide-bar"></div>
            </div>
        </div>

        <div class="login form">
            <div class="group">
                <div class="group-ipt email">
                    <input type="text" name="username" id="username" class="ipt" placeholder="请输入账号账号" required>
                </div>

                <div class="group-ipt password">
                    <input type="password" name="password" id="password" class="ipt" placeholder="输入您的登录密码" required>
                </div>
                <div class="group-ipt verify">
                    <input type="text"  name="code" id="verify" class="ipt" placeholder="输入验证码" required>
                    <img   class="imgcode" src="${ctx}/user/getCode.action" onclick="this.src=this.src+'?'">
                </div>
            </div>
            <div id="ShowMeg" style="color: red;font-size: 20px;text-align: center"></div>
        </div>

        <div class="button">
            <button type="submit" class="login-btn register-btn" id="button">登录</button>
        </div>

        <div class="remember clearfix">
            <label class="remember-me"><span class="icon"><span class="zt"></span></span><input type="checkbox" name="remember-me" id="remember-me" class="remember-mecheck" checked>记住我</label>
            <label class="forgot-password">
                <a href="/admin/forgetPwd.action">忘记密码？</a>
            </label>
        </div>
    </div>
</div>

<div class="footer">
    <p>校园 失物招领网 - Thousands Find</p>
    <p>Designed By zhanghao & May the world be a better place 2020</p>
</div>
<script type="text/javascript" src="${ctx}/resources/layui/layui.js"></script>
<script src='../../login_js/js/particles.js' type="text/javascript"></script>
<script src='../../login_js/js/background.js' type="text/javascript"></script>
<script src='../../login_js/js/jquery.min.js' type="text/javascript"></script>
<script src='../../login_js/js/layer/layer.js' type="text/javascript"></script>
<script>
    $('.imgcode').hover(function(){
        layer.tips("看不清？点击更换", '.verify', {
            time: 6000,
            tips: [2, "#3c3c3c"]
        })
    },function(){
        layer.closeAll('tips');
    }).click(function(){

    });
    $("#remember-me").click(function(){
        var n = document.getElementById("remember-me").checked;
        if(n){
            $(".zt").show();
        }else{
            $(".zt").hide();
        }
    });
    $("#button").click(function () {
        username= $("#username").val();
        password= $("#password").val();
        code    = $("#verify").val();
        $.ajax({
            url:"/user/login.action",
            type:"POST",
            data:{"username":username,"password":password,"code":code},
            success:function (data) {
                if (data.status==200){
                  //  alert(1);
                    window.location.href="/admin/toIndex.action"
                } else {
                 //   alert(data.status);
                    $("#ShowMeg").text(data.msg);
                }
            }
        })
    })

</script>
</body>
</html>