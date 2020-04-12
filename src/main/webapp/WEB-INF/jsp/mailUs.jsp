<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>失物招领首页</title>
<!-- link start -->
<jsp:include page="commons/head-link.jsp"/>
<!-- link end -->

</head>
	
<body>
<!-- header start-->
<jsp:include page="commons/header.jsp"/>
<!-- //header end-->

<!-- breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
				<li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>首页</a></li>
				<li class="active">联系我们</li>
			</ol>
		</div>
	</div>
<!-- //breadcrumbs -->

<!-- mail -->
	<div class="mail animated wow zoomIn" data-wow-delay=".5s">
		<div class="container">
			<h3>联系我们</h3>
			<p class="est" style="font-size: 20px">如果您对我们有什么更好的建议或者有什么问题，请联系我们！</p>
			<div class="mail-grids">
				<div class="col-md-8 mail-grid-left animated wow slideInLeft" data-wow-delay=".5s">
					<form id="emailForm" onsubmit="return false;">
						<input type="text" name="name" placeholder="您的姓名姓名" required="">
						&nbsp;
						<input type="text" name="email" placeholder="您的联系方式" required="">
						&nbsp;
						<input type="text" name="subject" placeholder="主题" required="">
						&nbsp;
						<textarea type="text" name="text" placeholder="内容..." required=""></textarea>
						<input type="submit" id="submitBtn" value="提交">
					</form>
				</div>
				<div class="col-md-4 mail-grid-right animated wow slideInRight" data-wow-delay=".5s">
					<div class="mail-grid-right1">
						<img src="../../images/mailus.jpg" alt="这里应该是一张图片" class="img-responsive" />
						<h4> 张 浩<span>管理员</span></h4>
						<ul class="phone-mail">
							<li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>手机号码: 198 5419 4579</li>
							<li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i>邮箱: <a href="#">zhanghao2902@q63.com</a></li>
						</ul>
						<ul class="social-icons">
							<li><a href="#" class="wechat"></a></li>
						</ul>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
<!-- //mail -->

<script type="text/javascript">
	$("#submitBtn").click(function(){
		if($("input[name='name']").val().length > 0 && $("input[name='email']").val().length > 0
				&& $("input[name='subject']").val().length > 0 && $("textarea[name='text']").val().length > 0){
						$.post("/mail/toUs.action",$("#emailForm").serialize(),function(response){
							
							if(response.status == 200){
								layer.msg('发送成功', {icon: 1,time: 1200});
								$("input[name='name']").val("");
								$("input[name='email']").val("");
								$("input[name='subject']").val("");
								$("textarea[name='text']").val("");
								location.reload();
							}else{
								layer.msg('发送失败', {icon: 2,time: 1200});
								location.reload();
							}
						
						});
						layer.msg('发送中请稍等...', {
						  icon: 16,
						  shade: 0.01,
						  time: 10000
						});
		}
	});
</script>

<!-- fooer start-->
<jsp:include page="commons/footer.jsp"/>
<!-- //footer end-->
</body>
</html>