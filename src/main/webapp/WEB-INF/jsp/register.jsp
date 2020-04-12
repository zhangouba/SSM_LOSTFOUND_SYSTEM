<%--
  Created by IntelliJ IDEA.
  User: zhangouba
  Date: 2020/2/26
  Time: 20:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
    pageContext.setAttribute("path",request.getContextPath());
    %>
    <meta charset="UTF-8" http-equiv="content-type" content="text/html" >
    <title>注册 - 校园招领网 - Thousands Find</title>
    <link rel="stylesheet" type="text/css" href="../../login_js/style/register-login.css">

    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
<div id="box"></div>
<div class="cent-box register-box">
    <div class="cent-box-header">
        <h1 style="font-size: 50px"><a href="/admin/toIndex">校园失物招领</a></h1>
        <h2 class="sub-title">生活热爱分享 - Thousands Find</h2>
    </div>

    <div class="cont-main clearfix">
        <div class="index-tab">
            <div class="index-slide-nav">
                <a href="/admin/login.action">登录</a>
                <a href="/admin/register.action" class="active">注册</a>
                <div class="slide-bar slide-bar1"></div>
            </div>
        </div>

        <form id="FormGE" method="post">
            <div class="input-group">
                <span class="input-group-addon"> 账号</span>
                <input type="text" class="form-control" id="username" name="username" placeholder="请输入账号" aria-describedby="sizing-addon1">
            </div>
            <div style="color:red;"></div>

            <div class="input-group">
                <span class="input-group-addon"> 昵称</span>
                <input type="text" class="form-control" id="realname" name="realname" placeholder="请输入昵称" aria-describedby="sizing-addon1">

            </div>
            <div style="color:red;"></div>

            <div class="input-group">
                <span class="input-group-addon"> 密码</span>
                <input type="password" class="form-control"  id="password" name="password" placeholder="请输入密码" aria-describedby="sizing-addon1">

            </div>
            <div style="color:red;"></div>


            <div class="input-group">
                <span class="input-group-addon"> 邮箱</span>
                <input type="text" class="form-control" id="email" name="email" placeholder="请输入邮箱" aria-describedby="sizing-addon1">

            </div>
            <div style="color:red;"></div>

            <div class="input-group">
                <span class="input-group-addon"> 手机号</span>
                <input type="text" class="form-control" id="phone" name="phone" placeholder="请输入手机号" aria-describedby="sizing-addon1">

            </div>
            <div style="color:red;"></div>


            <div class="button">
                <button type="button" class="login-btn register-btn" id="button">注册</button>
            </div>



        </form>

    </div>
</div>

<div class="footer">
    <p>校园 失物招领网 - Thousands Find</p>
    <p>Designed By zhanghao & May the world be a better place 2020</p>
</div>

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
        $(this).attr('src','' + Math.random());
    })

    $(".login-btn").click(function(){
        var email = $("#email").val();
        var password = $("#password").val();
        var verify = $("#verify").val();
    })


    //发送ajax请求验证 用户名是否存在
    $("#username").change(function () {
        var empName=this.value;
       // alert(1);
        $.ajax({
            url:"/user/checkuser.action",
            type:"POST",
            data:"username="+empName,
            success:function (result) {
                if (result.status==200){
                    show_validate_msg("#username","success","");
                    $("#button").attr("ajax-va","success");
                }else{
                    show_validate_msg("#username","error","用户名已被使用");
                    $("#button").attr("ajax-va","error");
                }
            }
        });
    });

    $("#button").click(function () {
        //1点击保存按钮将数据提交到数据库进行保存
        //进行数据校验
        if (!emp_validate_add_form()) {
            return false;
        };
        //1.5判断用户名校验是否成功了，成功了才继续往下走
        if ($(this).attr("ajax-va")=="error") {
            //  show_validate_msg("#empName_add_input","error","用户名已被使用");
            return false;
        }
        //2发送ajax请求保存数据
        $.ajax({
            url:"/user/adduser.action",
            type:"POST",
            data:$("#FormGE").serialize(),
            success:function (result) {
                if (result.status==200) {
                    alert("恭喜您注册成功");
                    window.location.href = "/admin/login.action";
                //    alert("success");
                }else {
                    window.location.href = "/admin/rgister.action";
                  //  alert("eroor");

                }
            }
        });
    });

    //验证
    function emp_validate_add_form() {

        // 拿到要校验的数据，使用正则表达式校验
        var empName = $("#username").val();
        //英文，数字，下划线，中文
        var regName = /^[\u4e00-\u9fa5a-zA-Z\d_,\.!\r\n]{2,15}$/;
        //        /(^[a-zA-Z0-9_-]{4,10}$)|(^[\u2E80-\u9FFF]{2,8})/;
        if (!regName.test(empName)) {
            //清空元素之前的格式
            show_validate_msg("#username","error","用户名长度为3-10为的英文字母下划线！");
            //  alert("用户名长度为3-10为的英文字母下划线！");
            return false;
        }else{
            show_validate_msg("#username","success","");

        }


        var realname=$("#realname").val();

        if (realname.length==0){
            show_validate_msg("#realname", "error", "昵称不能为空");
            return false;
        } if (realname.length>15){
            show_validate_msg("#realname", "error", "昵称不能多于十五个字符");
            return false;
        } else {
            show_validate_msg("#realname", "success", "");
        }





        var temppassword=$("#password").val();

        if (temppassword.length<=5){
            show_validate_msg("#password", "error", "密码不能少于五个字符");
            return false;
        } if (temppassword.length>15){
            show_validate_msg("#password", "error", "密码不能多于十五个字符");
            return false;
        } else {
            show_validate_msg("#password", "success", "");
        }



        //验证邮箱
        var email = $("#email").val();
        var regemail = /^([0-9A-Za-z\-_\.]+)@([0-9a-z]+\.[a-z]{2,3}(\.[a-z]{2})?)$/;
        if (!regemail.test(email)) {
            show_validate_msg("#email","error","邮箱格式不正确！");
            return false;
        }else {
            show_validate_msg("#email","success","");
        }


        var phone=$("#phone").val();

        if (!(/^1[3456789]\d{9}$/.test(phone))) {

            show_validate_msg("#phone", "error", "手机号格式不正确！");
            return false;
        } else {
            show_validate_msg("#phone", "success", "");
        }

        return true;

    }
    // 显示校验信息
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