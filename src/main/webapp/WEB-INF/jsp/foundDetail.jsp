<%@ page language="java" isELIgnored="false" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>失物招领-招领启事详情信息</title>
<!-- link start -->
<jsp:include page="commons/head-link.jsp"/>
<!-- link end -->
<!-- comment script start -->
<script type="text/javascript" src="${pageContext.request.contextPath}/angular_js/js/base_pageUibs.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/angular_js/js/controller/baseController.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/angular_js/js/service/commentService.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/angular_js/js/controller/commentController.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/angular_js/js/service/foundService.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/angular_js/js/controller/foundController.js"></script>
<!-- comment script end -->
</head>
<body ng-app="portalRest">
<!-- header start-->
<jsp:include page="commons/header.jsp"/>
<!-- //header end-->

<!-- breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
				<li><a href="${pageContext.request.contextPath}/index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>首页</a></li>
				<li class="active">招领启事 详情信息</li>
			</ol>
		</div>
	</div>
<!-- //breadcrumbs -->
<!-- single -->
	<div class="single">
		<div class="container">
			<div class="col-md-4 products-left">
				<div class="categories animated wow slideInUp" data-wow-delay=".5s">
				    <input id="PageContext" type="hidden" value="${pageContext.request.contextPath}" />
				    <input id="goodsId" type="hidden" value="${found.id}" />
					<h3>启事详情信息</h3>
					<ul class="cate">
						<li><a href="#">信息编号：</a><span>${found.id }</span></li>
						<li><a href="#">浏览次数：</a><span>${foundTextInfo.pageView}次</span></li>
						<c:choose>
								<c:when test="${foundTextInfo.status == 0 }">
									<li><a href="#">当前状态：</a><span>寻找中...</span></li>
								</c:when>
								<c:otherwise>
									<li><a href="#">当前状态：</a><span>已失效</span></li>
								</c:otherwise>
						</c:choose>
						<c:if test="${!empty found.contacts }">
							<li><a href="#">联系人：</a><span>${found.contacts }</span></li>
						</c:if>
						<c:if test="${!empty found.tel }">
							<li><a href="#">手机号码：</a><span>${found.tel }</span></li>
						</c:if>
						<c:if test="${!empty found.qq }">
							<li><a href="#">QQ号码：</a><span>${found.qq }</span></li>
						</c:if>
						<li><a href="#">联系邮箱：</a><span>${found.email }</span></li>
						<c:if test="${!empty found.address }">
							<li><a href="#">联系地址：</a><span>${found.address }</span></li>
						</c:if>
						<li><a href="#">发布时间：</a> <span><fmt:formatDate pattern="yyyy年MM月dd日 HH:mm:ss" 
            					value="${foundTextInfo.publishTime}" /></span></li>
					</ul>
				</div>
				<div class="men-position animated wow slideInUp" data-wow-delay=".5s">
					<a href="#"><img src="${pageContext.request.contextPath}/images/timg.png" alt=" " class="img-responsive" /></a>
					<div class="men-position-pos">
						<!-- 放置文字位置点 -->
					</div>
				</div>
				
			</div>
			<div class="col-md-8 single-right">
				<div class="col-md-5 single-right-left animated wow slideInUp" data-wow-delay=".5s">
					<div class="men-position animated wow slideInUp" data-wow-delay=".5s">
							<c:choose>
								<c:when test="${!empty found.images }">
									<a href="#"><img src="${pageContext.request.contextPath}/${found.images }" alt=" " class="img-responsive" /></a>
								</c:when>
								<c:otherwise>
									<a href="#"><img src="${pageContext.request.contextPath}/images/ocean.jpg" alt=" " class="img-responsive" /></a>
								</c:otherwise>
							</c:choose>
						<div class="men-position-pos">
							<!-- 放置文字位置点 -->
						</div>
					</div>
				</div>
				<div class="col-md-7 single-right-left simpleCart_shelfItem animated wow slideInRight" data-wow-delay=".5s">
					<h3>${found.infoTitle }</h3>
					<h4><span class="item_price">招领类别：</span> ${found.categoryName }</h4>
					<div class="detail">
						<h5>拾取地点：  </h5>
						<p>${found.foundPlace }</p>
					</div>
					<div class="detail">
						<h5>拾取时间：  </h5>
						<p><fmt:formatDate pattern="yyyy年MM月dd日" 
            					value="${found.foundTime1}" /></p>
					</div>
				</div> 
				<div class="clearfix"> </div>
				<div class="bootstrap-tab animated wow slideInUp" data-wow-delay=".5s">
					<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
						<ul id="myTab" class="nav nav-tabs" role="tablist">
							<li role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">详情描述</a></li>
							<li role="presentation"><a href="#profile" role="tab" id="profile-tab" data-toggle="tab" onclick="getcomments()" aria-controls="profile">评论</a></li>

						</ul>
						<div id="myTabContent" class="tab-content">
							<div role="tabpanel" class="tab-pane fade in active bootstrap-tab-text" id="home" aria-labelledby="home-tab">
								<p style='text-indent: 2em'>${found.description }</p>
							</div>
							<div  ng-controller="commentController"  role="tabpanel" class="tab-pane fade bootstrap-tab-text" id="profile" aria-labelledby="profile-tab">
								<%--<div class="bootstrap-tab-text-grids">--%>
									<%----%>
									<%--<div ng-repeat="comments in commentList" class="bootstrap-tab-text-grid">--%>
										<%--<div class="bootstrap-tab-text-grid-right">--%>
											<%--<ul>--%>
												<%--<li><a href="#">信息{{comments.id}}</a></li>--%>
												<%--<li class="time-type2">{{comments.commentTime | date:'yyyy-MM-dd HH:mm:ss'}}</li>--%>
											<%--</ul>--%>
											<%--<p>{{comments.commentText}}</p>--%>
											<%--<br/>--%>
										<%--</div>--%>
									<%--</div>--%>
									<%----%>
									<%--<div class="clearfix"> </div>--%>
									<%--<hr/>--%>
									<%--<!-- 分页处理开始 -->--%>
									<%--<div style="float:right">--%>
										<%--<tm-pagination conf="paginationConf"></tm-pagination>--%>
									<%--<!-- 分页处理结束 -->--%>
									<%--</div>--%>
									<%--<div class="clearfix"> </div>--%>

									<table class="table table-hover" id="emps_table"  cellspacing="0" cellpadding="0" >
										<thead>
										<tr>

										</tr>
										</thead>

										<tbody >

										</tbody>
									</table>
									<div class="col-md-6" id="page_nav_area">
									</div>


									<div class="add-review">
										<h4>回复</h4>
										<form>
											<textarea type="text" id="content" name="content" ng-model="entity.commentText" placeholder="评论信息..." required=""></textarea>
											<input type="submit" id="send"  value="发送" >
										</form>
									</div>
								</div>
							</div>

							
						</div>
					</div>
				</div>
			</div>
			<div class="clearfix"> </div>
			<!-- 返回上一页 -->
			<div class="checkout-left">	
				<div class="checkout-right-basket slideInRight">
				<a href="#" onClick="javascript:history.back(-1);"><span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>返回 上一页</a>
				</div>
				<div class="clearfix"> </div>
			</div>
			


		   </div>

		   
		   <!--图片上传 开始-->
			 <link href="${pageContext.request.contextPath}/fileUpload/css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>
			 <link href="${pageContext.request.contextPath}/fileUpload/themes/explorer-fas/theme.css" media="all" rel="stylesheet" type="text/css"/>
			 <script src="${pageContext.request.contextPath}/fileUpload/js/plugins/sortable.js" type="text/javascript"></script>
			 <script src="${pageContext.request.contextPath}/fileUpload/js/fileinput.js" type="text/javascript"></script>
			 <script src="${pageContext.request.contextPath}/fileUpload/js/locales/zh.js" type="text/javascript"></script>
			 <script src="${pageContext.request.contextPath}/fileUpload/themes/fas/theme.js" type="text/javascript"></script>
			 <script src="${pageContext.request.contextPath}/fileUpload/themes/explorer-fas/theme.js" type="text/javascript"></script>
			<!--图片上传结束 -->
		<script src='../../login_js/js/jquery.min.js' type="text/javascript"></script>
		<script type="text/javascript">
            $("#send").click(
                function() {
                    var content=$("#content").val();
                    var goodsId=$("#goodsId").val();
                    if (content!=null) {
                        $.ajax({
                            url:"/Portalcomment/add.action",
                            type:"POST",
                            data:{"commentcontent":content,"goodsId":goodsId},
                            success:function (data) {
                                if (data.status==200){
                                    //  alert(1);
                                    alert("评论成功！");

                                    window.location.reload();
                                } else {
                                    //   alert(data.status);
                                    alert("评论失败！");
                                }
                            }
                        })
                    }
                });



            function getcomments() {
                var goodsId=$("#goodsId").val();
                $.ajax({
                    url:"/Portalcomment/getAllcomment.action",
                    type:"POST",
                    data:{"goodsId":goodsId},
                    success:function (result) {
                        //解析显示员工数据
                        build_emps_table(result);

                        //解析分页条
                        build_page_nav(result);
                    }
                });
            }


            function build_emps_table(result) {
                $("#emps_table tbody").empty();
                var emps=result.rows;

                $.each(emps,function(index,item){


                    var userPhoto=$("<img style='width: 30px;position:relative;top: 2px' class='img-circle'></img>").attr("src",'/'+item.userPhoto);
                    var realname=$("<td></td>").append(item.realname);



                    var commentcontent=$("<td></td>").append(item.commentcontent);

                    var createDate=$("<td></td>").append(item.createDate);

                    $("<tr></tr>")
                        .append(userPhoto).append(realname)
                        .append(commentcontent)
                        .append(createDate)
                        .appendTo("#emps_table tbody");
                });
            }

		</script>


		</div>
	</div>
<!-- //single -->



<!-- fooer start-->
<jsp:include page="commons/footer.jsp"/>
<!-- //footer end-->

</body>
</html>