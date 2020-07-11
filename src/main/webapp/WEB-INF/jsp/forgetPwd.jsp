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
    <br>

    <div class="cont-main clearfix">
        <div class="index-tab">
            <div class="index-slide-nav">
               <div style="font-size: 35px;color: black">密码找回</div>
                <div class="slide-bar slide-bar1"></div>
            </div>
        </div>

        <form id="FormGE">
        <br> <br>
            <div class="input-group">
                <span class="input-group-addon" >邮箱</span>
                <input type="text" class="form-control" id="email" name="email" placeholder="请输入您的邮箱" aria-describedby="basic-addon1">
            </div>
            <div style="color: red;font-weight: bold;text-align: center"></div>


            <div class="input-group">
                <input type="text" class="form-control" placeholder="请输入验证码" name="code" aria-describedby="basic-addon2" id="code">
                <div class="input-group-addon" id="basic-addon2" style="background-color: #1779f0 ;color: black">发送</div>
            </div>
            <div style="color: red;font-weight: bold;text-align: center"></div>

            <div class="button">
                <button type="button"  class="login-btn register-btn" id="button">确定</button>
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

    // $(function () {
    //     $("#basic-addon2").on("click", function () {
    //         show_validate_msg("#email","error","请输入邮箱!");
    //     });
    // })

    $(function () {
        $("#button").attr("ajax-va","error");
        $("#code").attr("email-va","error");
    })

    //发送ajax请求验证 用户名是否存在
    $("#email").change(function () {
        var email=$("#email").val();
        // alert(1);
        $.ajax({
            url:"/forget/checkEmail.action",
            type:"POST",
            data:"email="+email,
            success:function (result) {
                if (result.status==200){
                    show_validate_msg("#email","success","");
                     $("#code").attr("email-va","success");
                     $("#basic-addon2").on("click", function () {
                        getCode();
                    });
                }else{
                    show_validate_msg("#email","error","该邮箱未注册!");
                    $("#code").attr("email-va","error");
                }
            }
        });
    });

    var time = 60;
    //倒计时
    function getRandomCode() {
        if (time === 0) {
                time=60;
                $('#basic-addon2').text("发送");
                $("#basic-addon2").removeAttr("background-color");
                $("#basic-addon2").css("background-color","#1779f0");
                $("#basic-addon2").unbind();
                $("#basic-addon2").on("click", function () {
                getCode();
                 });
                return false;
        } else {
            time--;
            $('#basic-addon2').text(time);
        }
        setTimeout(function() {
            getRandomCode();
        },1000);
    }


    // setTimeout("showLogin()",1000);

    function getCode(){
        $("#basic-addon2").removeAttr("background-color");
        $("#basic-addon2").css("background-color","#83c7f0");
        $("#basic-addon2").unbind();
        //onclick="getCode()"

        if ($("#code").attr("email-va")=="error") {
            show_validate_msg("#code","","邮箱错误!");
            return false;
        }
        getRandomCode();
        var email=$("#email").val();
        $.ajax({
            url:"/forget/getEmailCode.action",
            type:"POST",
            data:"email="+email,
            success:function (result) {
                if (result.status==200){
                    show_validate_msg("#code","success","");
                    // $("#button").attr("ajax-va","success");
                }else{
                    show_validate_msg("#code","error","获取验证码错误!");
                    // $("#button").attr("ajax-va","error");
                }
            }
        });
    }


    $("#code").change(function () {
        $("#code").removeClass("has-success has-error");
        var code=$("#code").val();
        if (code==''){
            show_validate_msg("#code","","");
            return false;
        }
      if ($("#code").attr("email-va")=="error") {
          show_validate_msg("#code","error","请先输入邮箱!");
          return false;
      }

        $.ajax({
            url:"/forget/checkCode.action",
            type:"POST",
            data:"code="+code,
            success:function (result) {
                if (result.status==200){
                    show_validate_msg("#code","success","");
                    $("#button").attr("ajax-va","success");
                    $("#code").attr("email-va","success");
                }else{
                    show_validate_msg("#code","error","验证码输入错误!");
                     $("#button").attr("ajax-va","error");
                }
            }
        });
    });

    $("#button").click(function () {
        //1.5判断用户名校验是否成功了，成功了才继续往下走
        if ($(this).attr("ajax-va")=="error") {
               show_validate_msg("#code","","请完成以上操作！");
            return false;
        }
        if ($("#code").attr("email-va")=="error") {
            show_validate_msg("#code","","请完成以上操作！");
            return false;
        }
        $.ajax({
            url:"/forget/fuck.action",
            type:"POST",
            success:function (result) {
                if (result.status==200) {
                   // alert(1);
                    window.location.href = "/admin/toResetPwd.action";
                }else {
                    alert("发生未知错误！");
                }
            }
        });



    });


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