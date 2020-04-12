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
				<li class="active">关于我们</li>
			</ol>
		</div>
	</div>
<!-- //breadcrumbs -->

<!--page -->
	<div class="typo">
		<div class="container">
			<div class="typo-grids">
			<h3 class="title animated wow zoomIn" data-wow-delay=".5s">关于我们</h3>
			<p class="est animated wow zoomIn" data-wow-delay=".5s">您可以通过这里了解我们！</p>
				
			<div class="grid_3 grid_5 animated wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="500ms">
				<h3 class="bars">关于我们</h3>
				<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
					<ul id="myTab" class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">基本信息</a></li>
						<li role="presentation"><a href="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile">免责声明</a></li>
						<li role="presentation"><a href="#other" role="tab" id="profile-other" data-toggle="tab" aria-controls="profile">版权声明</a></li>
					</ul>
					<div id="myTabContent" class="tab-content">
						<div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledby="home-tab">
							<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;校园失物招领网络平台，旨在帮助同学们快速检索失物招领网站相关信息，我们将及时更新，为公益，也是为我们。大家可以一起做好这个平台，一起做好公益，如果您对我们有什么更好的建议，请联系我们。我们一直坚持致力于提供方便、快捷的寻物启事发布、失物招领服务，打造国内最大最全的失物招领网站。一个公益、免费快速的寻物启事与失物招领发布平台！</p>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledby="profile-tab">
							<p>　　任何使用校园失物招领网站信息的用户均应仔细阅读本声明，用户可选择不使用校园失物招领网站，用户使用校园失物招领网站的行为将被视为对本声明全部内容的认可。
　　1、除校园失物招领网站注明之服务条款外，其他一切因使用校园失物招领网站信息而引致之任何意外、疏忽、合约毁坏、诽谤、版权或知识产权侵犯及其所造成的损失（包括因下载而感染电脑病毒），校园失物招领网站概不负责，亦不承担任何法律责任。<br/>
　　2、任何透过校园失物招领网站而链接及得到之信息及服务均系用户自行发布，校园失物招领网站对其合法性概不负责，亦不承担任何法律责任。<br/>
　　3、校园失物招领网站所有内容并不反映任何校园失物招领网站的意见。<br/>
　　4、用户对使用校园失物招领网站信息自行承担风险，校园失物招领网站不做任何形式的保证，对信息的安全性、正确性、及时性、合法性均不做担保。因网络状况、通讯线路等任何技术原因而导致用户不能正常使用校园失物招领网站，校园失物招领网站不承担任何法律责任。<br/>
　　5、校园失物招领网站尊重并保护所有使用校园失物招领网站用户的个人隐私权，用户的姓名、电话、电子邮件地址等个人资料，非经用户亲自许可或根据相关法律的强制性规定，校园失物招领网站不会主动地泄露给第三方。用户在使用校园失物招领网站时输入的关键字将不被认为是用户的个人隐私资料。<br/>
　　6、任何单位或个人认为通过校园失物招领网站的内容可能涉嫌侵犯其合法权益，应该及时向校园失物招领网站或服务网站书面反馈，并提供身份证明、权属证明及详细侵权情况证明，校园失物招领网站在收到上述法律文件后，将会尽快移除被控侵权内容。</p>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="other" aria-labelledby="profile-other">
							<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;校园失物招领网站及其任何组成部分不得被再造、复制、抄袭、交易，或为任何未经校园失物招领网站允许的商业目的所使用。如果校园失物招领网站确定用户行为违法或有损其网站的利益，则校园失物招领网站将保留，包括但不限于拒绝提供服务的权利。</p>
						</div>
					</div>
				</div>
			</div>
				
				
				
			</div>
		</div>
	</div>
<!--page end-->


<!-- fooer start-->
<jsp:include page="commons/footer.jsp"/>
<!-- //footer end-->
</body>
</html>