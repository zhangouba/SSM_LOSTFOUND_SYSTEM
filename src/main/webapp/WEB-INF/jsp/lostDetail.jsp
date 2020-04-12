<%@ page language="java" isELIgnored="false" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>  
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>失物招领-失物启事详情信息</title>
<!-- link start -->
<jsp:include page="commons/head-link.jsp"/>
<!-- link end -->
<!-- comment script start -->
<script type="text/javascript" src="${pageContext.request.contextPath}/angular_js/js/base_pageUibs.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/angular_js/js/controller/baseController.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/angular_js/js/service/commentService.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/angular_js/js/controller/commentController.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/angular_js/js/service/lostService.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/angular_js/js/controller/lostController.js"></script>
<!-- comment script end -->
</head>


<body  ng-app="portalRest">
<!-- header start-->
<jsp:include page="commons/header.jsp"/>
<!-- //header end-->

<!-- breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
				<li><a href="${pageContext.request.contextPath}/admin/index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>首页</a></li>
				<li class="active">失物启事 详情信息</li>
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
				    <input id="goodsId" type="hidden" value="${lost.id}" />
					<h3>启事详情信息</h3>
					<ul class="cate">
						<li><a href="#">信息编号：</a><span>${lost.id }</span></li>
						<li><a href="#">浏览次数：</a><span>${lostTextInfo.pageView}次</span></li>
						<c:choose>
								<c:when test="${lostTextInfo.status == 0 }">
									<li><a href="#">当前状态：</a><span>寻找中...</span></li>
								</c:when>
								<c:otherwise>
									<li><a href="#">当前状态：</a><span>已失效</span></li>
								</c:otherwise>
						</c:choose>
						<c:if test="${!empty lost.contacts }">
							<li><a href="#">联系人：</a><span>${lost.contacts }</span></li>
						</c:if>
						<c:if test="${!empty lost.tel }">
							<li><a href="#">手机号码：</a><span>${lost.tel }</span></li>
						</c:if>
						<c:if test="${!empty lost.qq }">
							<li><a href="#">QQ号码：</a><span>${lost.qq }</span></li>
						</c:if>
						<li><a href="#">联系邮箱：</a><span>${lost.email }</span></li>
						<c:if test="${!empty lost.address }">
							<li><a href="#">联系地址：</a><span>${lost.address }</span></li>
						</c:if>
						<li><a href="#">发布时间：</a> <span><fmt:formatDate pattern="yyyy年MM月dd日 HH:mm:ss" 
            					value="${lostTextInfo.publishTime}" /></span></li>
					</ul>
				</div>
				<div class="men-position animated wow slideInUp" data-wow-delay=".5s">
					<a href="#"><img src="${pageContext.request.contextPath}/images/timg.jpg" style="width: 300px" alt=" " class="img-responsive" /></a>
					<div class="men-position-pos">
						<!-- 放置文字位置点 -->
					</div>
				</div>
			</div>
			<div class="col-md-8 single-right">
				<div class="col-md-5 single-right-left animated wow slideInUp" data-wow-delay=".5s">
					<div class="men-position animated wow slideInUp" data-wow-delay=".5s">
							<c:choose>
								<c:when test="${!empty lost.images }">
									<a href="#"><img src="${pageContext.request.contextPath}/${lost.images }" alt=" " class="img-responsive" /></a>
								</c:when>
								<c:otherwise>
									<a href="#"><img src="${pageContext.request.contextPath}/images/default.jpg" alt=" " class="img-responsive" /></a>
								</c:otherwise>
							</c:choose>
						<div class="men-position-pos">
							<!-- 放置文字位置点 -->
						</div>
					</div>
				</div>
				<div class="col-md-7 single-right-left simpleCart_shelfItem animated wow slideInRight" data-wow-delay=".5s">
					<h3>${lost.infoTitle }</h3>
					<h4><span class="item_price">失物类别：</span> ${lost.categoryName }</h4>
					<div class="detail">
						<h5>丢失地点：  </h5>
						<p>${lost.lostPlace }</p>
					</div>
					<c:if test="${!empty lost.rewards }">
						<div class="detail">
							<h5>悬赏金额：  </h5>
							<p>${lost.rewards } </p>
						</div>
					</c:if>
					<div class="detail">
						<h5>丢失时间：  </h5>
						<p><fmt:formatDate pattern="yyyy年MM月dd日" 
            					value="${lost.lostTime1}" /></p>
					</div>
				</div> 
				<div class="clearfix"> </div>
				<div class="bootstrap-tab animated wow slideInUp" data-wow-delay=".5s">
					<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
						<ul id="myTab" class="nav nav-tabs" role="tablist">
							<li role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">详情描述</a></li>
							<li role="presentation"><a href="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile">评论</a></li>

						</ul>
						<div id="myTabContent" class="tab-content">
							<div role="tabpanel" class="tab-pane fade in active bootstrap-tab-text" id="home" aria-labelledby="home-tab">
								<p style='text-indent: 2em'>${lost.description }</p>
							</div>
							<div ng-controller="commentController" role="tabpanel" class="tab-pane fade bootstrap-tab-text" id="profile" aria-labelledby="profile-tab">
								<div class="bootstrap-tab-text-grids">
								
									<div ng-repeat="comment in commentList" class="bootstrap-tab-text-grid">
										<div class="bootstrap-tab-text-grid-right">
											<ul>
												<li><a href="#">信息{{comment.id}}</a></li>
												<li class="time-type2">{{comment.commentTime | date:'yyyy-MM-dd HH:mm:ss'}}</li>
											</ul>
											<p>{{comment.commentText}}</p>
										    <br/>
										</div>
									</div>
									
									<div class="clearfix"> </div>
									<!-- 分页处理开始 -->
									<hr/>
									<div style="float:right">
										<tm-pagination conf="paginationConf"></tm-pagination>
									<!-- 分页处理结束 -->
									</div>
									<div class="clearfix"> </div>
									
									<div class="add-review">
										<h4>回复</h4>
										<form>
											<textarea type="text" ng-model="entity.commentText" placeholder="评论信息..." required=""></textarea>
											<input type="submit" ng-click="add()" value="发送" >
										</form>
									</div>
								</div>
							</div>
							<div ng-controller="lostController" role="tabpanel" class="tab-pane fade bootstrap-tab-text" id="dropdown1" aria-labelledby="dropdown1-tab">
								
								<!-- password -->
									<div class="login-form-grids">
										<h5>请输入管理密码</h5>
										<form>
											<input type="password" ng-model="entity.password" placeholder="管理密码" required="" >
											<span id="msg"></span>
											<a id="modal-473189" href="#modal-container-473189" role="button" class="btn" data-toggle="modal">忘记密码？</a>
											<input type="submit" ng-click="validate()" value="前往修改">
										</form>	
									</div>
							<!-- //password -->
							
							</div>
							<div ng-controller="lostController" role="tabpanel" class="tab-pane fade bootstrap-tab-text" id="dropdown2" aria-labelledby="dropdown2-tab">
							
							<!-- password -->
									<div class="login-form-grids">
										<h5>请输入管理密码</h5>
										<form>
											<input type="password" ng-model="entity.password" placeholder="管理密码" required="" >
											<span id="msgDel"></span>
											<a id="modal-473189" href="#modal-container-473189" role="button" class="btn" data-toggle="modal">忘记密码？</a>
											<input type="submit" ng-click="validateDel()" value="确认删除">
										</form>	
									</div>
						<!-- //password -->
							
							
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
			
			<a id="modal-620847" href="#modal-container-620847" role="button" class="btn" data-toggle="modal"></a>
			
			<div ng-controller="lostController" class="modal fade" id="modal-container-620847" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							 <button type="button" onclick="window.location.reload();" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							<h4 class="modal-title" id="myModalLabel">
								修改寻物启事（表单中图片为回显图片，如需更新请重新上传。）
							</h4>
						</div>
						<div class="modal-body">						
						
								<form>
									<div class="input-group">
										<span class="input-group-addon" id="basic-addon1"><i class=" glyphicon glyphicon-star"></i> 信息标题</span>
										<input type="text" ng-model="lostEntity.infotitle" class="form-control" aria-describedby="basic-addon1" required="">
									</div>
					
									<div class="input-group">
										<span class="input-group-addon" id="basic-addon1"><i class=" glyphicon glyphicon-star"></i> 丢失地点</span>
										<input type="text" ng-model="lostEntity.lostPlace" class="form-control" aria-describedby="basic-addon1" required="">
									</div>
													 
									<div class="form-inline">
										<div class="input-group">
											<span class="input-group-addon" id="basic-addon1"><i class=" glyphicon glyphicon-star"></i> 失物类别</span>
											<select class="form-control" required="" ng-model="lostEntity.categoryId" 
											ng-options="categoryEntity.id as categoryEntity.categoryName for categoryEntity in categoryList"></select>
										</div>
									</div>
									
									<c:if test="${!empty lost.images }">
										<div class="form-inline">
											<a href="#"><img src="${pageContext.request.contextPath}/{{lostEntity.images}}" style="height: 120px;width: 120px" alt=" " class="img-responsive" /></a>
										</div>
									</c:if>
									
									
									<div class="input-group">
										<span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-picture"></i> 选择图片</span>
							        	<div class="file-loading">
											<input id="imagesFile" name="imagesFile" type="file">
										</div>
										<div id="errorBlocks" class="help-block"></div>
										<input type="text" ng-model="lostEntity.images" hidden name="image"/>
									</div>
									
									<div class="form-inline">
										
										<div class="input-group">
											<p class="input-group">
												<span class="input-group-addon" id="basic-addon1"><i class=" glyphicon glyphicon-star"></i> 丢失日期</span>
								                <input class="form-control" uib-datepicker-popup="{{format}}" ng-model="lostEntity.lostTime" is-open="pop1.opened" 
								                      required="" popup-placement="top" close-text="关闭" clear-text="清空" current-text="今天" alt-input-formats="altInputFormats" datepicker-options="datepickerOptions1"/>
								                <span class="input-group-btn">
								                    <button class="btn btn-default" ng-click="openpop1()"><i class="glyphicon  glyphicon-calendar"></i></button>
								                </span>
								            </p>
										</div>
									
									</div>
									
									<div class="form-inline">				
										<div class="input-group">
											<span class="input-group-addon" id="basic-addon1">$ 悬赏金额</span>
											<input type="text" ng-model="lostEntity.rewards" class="form-control" aria-describedby="basic-addon1">
										</div>			
									</div>
									
									<div class="form-inline">
															
										<div class="input-group">
											<span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-user"></i> 联系人</span>
											<input type="text" ng-model="lostEntity.contacts" class="form-control" aria-describedby="basic-addon1">
										</div>
									
										<div class="input-group">
											<span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-earphone"></i> 手机号码</span>
											<input type="text" ng-model="lostEntity.tel" class="form-control" aria-describedby="basic-addon1">
										</div>
									
									</div>
									
									<div class="form-inline">
										<div class="input-group">
											<span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-star"></i> 联系邮箱</span>
											<input type="email" ng-model="lostEntity.email" class="form-control" placeholder="忘记密码可通过邮箱找回" required="" aria-describedby="basic-addon1">
										</div>
										
										<div class="input-group">
											<span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-plus"></i> QQ号码</span>
											<input type="text" ng-model="lostEntity.qq" class="form-control" aria-describedby="basic-addon1">
										</div>					
									</div>	
									
									<div class="input-group">
										<span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-map-marker"></i> 联系地址</span>
										<input type="text" ng-model="lostEntity.address" class="form-control" aria-describedby="basic-addon1">
									</div>
															
									<div class="input-group">
										<span class="input-group-addon" id="basic-addon1"><i class=" glyphicon glyphicon-star"></i> 详情描述</span>
										<textarea type="text"  style="height:100px" ng-model="lostEntity.description" class="form-control" required="">{{lostEntity.description}}</textarea>
									</div>
									
									<h5><i class="glyphicon glyphicon-star"></i>必填，请牢记该密码（修改、删除信息使用）</h5>
									
									<div class="input-group">
										<span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-lock"></i> 管理密码</span>
										<input type="password" ng-model="lostEntity.password" class="form-control" aria-describedby="basic-addon1" required="">
									</div>
									
									<div class="input-group">
										<span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-lock"></i> 确认密码</span>
										<input type="password" id="confirmPassword" ng-model="confirmPwd" class="form-control" aria-describedby="basic-addon1" required="">
									</div>
									
									<div>
										<span id="lostMsg"></span>
									</div>
									
									<div class="modal-footer">
										 <button type="button" onclick="window.location.reload();" class="btn btn-default" data-dismiss="modal">关闭</button> 
										 <input type="submit" class="btn btn-primary" ng-click="update()" value="确认修改">
									</div>
									
								</form>
								
						</div>
					</div>
					
				</div>
				
		   </div>
			
			<div ng-controller="lostController" class="modal fade" id="modal-container-473189" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							<h4 class="modal-title" id="myModalLabel">
								请输入信息编号，管理密码将发送至您的预留邮箱！
							</h4>
						</div>
						<div class="modal-body">
							<form>
								<div class="form-group">
									<input type="text" class="form-control" ng-model="entity.id" placeholder="输入信息编号（信息编号在本页面启事详情信息中。）..."/>
								</div>
								
								<div>
									<span id="emailMsg"></span>
								</div>
								
								<div class="modal-footer">
									 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
									 <input type="submit" id="btnSendCode" class="btn btn-primary" ng-click="sendEmail()" value="确认发送">
								</div>
							</form>
						</div>
					</div>
					
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
			
		  <script>
			    $(document).ready(function () {
			    	$("#imagesFile").fileinput({
				 		theme: 'fas',
				 		language: 'zh',
				 		showCaption: false, 
				 		dropZoneEnabled: false,
				 		showUpload: true,
				 		showRemove: false,
				 		uploadUrl: '${pageContext.request.contextPath}/pic/upload.action',
				 		elErrorContainer: '#errorBlocks',
				 		allowedFileExtensions: ['jpg', 'png', 'gif'],
				 		fileActionSettings:{
				 			showRemove: false,
						    showUpload: false,
						    showZoom: false,
						    showDrag: true,
				 		}
				 	}).on('fileerror', function(event, data) {
			        			layer.msg('上传失败', {icon: 2,time:1200});
							}).on('fileuploaded', function(event, data) {
									//设置image路径
									$("input[name='image']").val(data.response.url).trigger('change');
									layer.msg('上传成功', {icon: 1,time:1200});
			         			});
			    });
			
			</script>
								     	
		   
			
		</div>
	</div>
<!-- //single -->



<!-- fooer start-->
<jsp:include page="commons/footer.jsp"/>
<!-- //footer end-->


</body>
</html>