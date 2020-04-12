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
    <title>重置密码 - 校园招领网 - Thousands Find</title>
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
               <div style="font-size: 35px;color: black">重置密码</div>
                <div class="slide-bar slide-bar1"></div>
            </div>
        </div>

        <form id="FormGE">
        <br> <br>
            <div class="input-group">
                <span class="input-group-addon" >新密码</span>
                <input type="password" class="form-control" id="password" name="password" placeholder="请输入您的新密码" aria-describedby="basic-addon1">
            </div>
            <div style="color: red;font-weight: bold;text-align: center"></div>

            <div class="input-group">
                <span class="input-group-addon" >确认密码</span>
                <input type="password" class="form-control" id="password1" name="password1" placeholder="请输入您的确认密码" aria-describedby="basic-addon1">
            </div>
          <div style="color: red;font-weight: bold;text-align: center"></div>

            <div></div>
            <div class="button">
                <button type="button"  ajax-va="error" class="login-btn register-btn" id="button">确定重置</button>
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


    $("#password").change(function () {
        var password=$("#password").val();

        if (password.length<=5){
            show_validate_msg("#password", "error", "密码不能少于五个字符");
            return false;
        } if (password.length>15){
            show_validate_msg("#password", "error", "密码不能多于十五个字符");
            return false;
        }else {
            show_validate_msg("#password", "success", "");
        }
    });

    $("#password1").change(function () {
        var password=$("#password").val();
        var password1=$("#password1").val();

     if (password1 != password){
         show_validate_msg("#password1", "error", "两次输入的密码不一致");
         return false;
     }
     else {
         show_validate_msg("#password1", "success", "");
         $("#button").removeAttr("ajax-va");
     }
    });


    $("#button").click(function () {

        if ($(this).attr("ajax-va")=="error") {
            show_validate_msg("#password1","error","请完成以上操作");
            show_validate_msg("#password","error","");
            return false;
        }    //2发送ajax请求保存数据
        var password=$("#password").val();
     //   alert(password);
        $.ajax({
            url:"/forget/resetPwdsss.action",
            type:"POST",
            data:"password="+password,
            success:function (result) {
                if (result.status==200) {
                    alert("重置密码成功！");
                    window.location.href = "/admin/login.action";
                    //    alert("success");
                }else {
                     alert(result.status);
                   // window.location.href = "/admin/rgister.action";
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