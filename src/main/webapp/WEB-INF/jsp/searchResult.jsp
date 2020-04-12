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

<style type="text/css">
        .search
        {
            left: 0;
            position: relative;
        }
        #auto_div
        {
            display: none;
            width: 300px;
            border: 1px #74c0f9 solid;
            background: #FFF;
            position: absolute;
            top: 24px;
            left: 0;
            color: #323232;
        }
</style>

<!-- index script start -->
<script type="text/javascript" src="../../angular_js/js/base_pagination.js"></script>
<script type="text/javascript" src="../../angular_js/js/controller/baseController.js"></script>
<script type="text/javascript" src="../../angular_js/js/service/searchService.js"></script>
<script type="text/javascript" src="../../angular_js/js/controller/searchController.js"></script>
<!-- index script end -->
</head>
	
<body ng-app="portalRest" ng-controller="searchController" ng-init="queryEntity={status:1}">
<!-- header start-->
<jsp:include page="commons/header.jsp"/>
<!-- //header end-->

<!-- breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
				<li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>首页</a></li>
				<li class="active">快速查询信息</li>
			</ol>
		</div>
	</div>
<!-- //breadcrumbs -->


<!-- collections -->
	<div class="new-collections">
		<div class="container">
		
		<div align="center">
			<form>
			    <div class="col-sm-9">
	           		<div class="input-group">


						<%--<div class="form-group form-inline">--%>
						<%--<select class="form-control" ng-model="searchEntity.categoryName">--%>
						<%--<option value="">请选择失物类别</option>--%>
						<%--<option ng-repeat="categoryEntity in categoryList" value="{{categoryEntity.categoryName}}">{{categoryEntity.categoryName}}</option>--%>
						<%--</select>--%>
						<%--<input placeholder="请输入失物地点" class="form-control" ng-model="searchEntity.lostPlace"/>--%>
						<%--<input placeholder="关键字查询" class="form-control" ng-model="searchEntity.keyword"/>--%>

						<%--</div>--%>

		            	<input type="text" id="search_text" ng-model="queryEntity.keyword" placeholder="输入物品特征快速查询信息..." class="form-control mySearch"/>
		            	<div id="auto_div" style="position:absolute;z-index: 999;top: 45px;width: 600px">
	        			</div>
		            	<span class="input-group-btn">
		            		<button type="button" style="height:45px;width:150px" ng-click="reloadQuery()" class="btn btn-warning">搜索</button>
		            	</span>
		            </div>
		        </div>
		        <div class="clearfix"> </div>
			</form>
		</div>

			<div class="grid_3 grid_5 animated wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="500ms">
				<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
					<ul id="myTab" class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">寻物启事查询结果</a></li>
						<li role="presentation"><a href="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile">招领启事查询结果</a></li>
					</ul>
					<div id="myTabContent" class="tab-content">
						<div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledby="home-tab">

							    <div class="new-collections-grids">
							    <!-- 失物遍历开始 -->
									<div ng-repeat="entity in listLost" class="custom-div new-collections-grid">
											<div class="new-collections-grid-sub-grids">
												<div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
													<div class="new-collections-grid1-image">
														<div class="new-collections-grid1-image-pos">
															<a href="${pageContext.request.contextPath}/Portallost/findOne/{{entity.id}}.html">查看 详情</a>
														</div>
													</div>
													<h4><a href="#">{{entity.infoTitle | textLengthSet:true:12:'... '}}</a></h4>
													<p><h5><b>{{entity.lostPlace | textLengthSet:true:10:'... '}} -寻物启事</b></h5></p>
													<p class="show-limit">{{entity.description | textLengthSet:true:45:'...'}}</p>
													<div class="new-collections-grid1-left simpleCart_shelfItem">
														<span class="time-type">丢失时间：{{entity.lostTime1 | date:'yyyy.MM.dd'}}</span>
													</div>
												</div>
											</div>
									</div>
								<!-- 失物遍历结束 -->

								</div>

								<div class="clearfix"> </div>
								<hr/>
								<!-- 分页处理开始-->
								<div style="float:right">
									<tm-pagination conf="paginationConf1"></tm-pagination>
								</div>
								<!-- 分页处理结束 -->


						</div>

						<div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledby="profile-tab">

							<div class="new-collections-grids">
								<!-- 招领遍历开始 -->
									<div ng-repeat="entitys in listFound" class="custom-div new-collections-grid">
											<div class="new-collections-grid-sub-grids">
												<div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
										 			<div class="new-collections-grid1-image">
														<div class="new-collections-grid1-image-pos">
															<a href="${pageContext.request.contextPath}/Portalfound/findOne/{{entitys.id}}.html">查看 详情</a>
														</div>
													</div>
													<h4><a href="#">{{entitys.infoTitle}}</a></h4>
													<p><h5><b>{{entitys.foundPlace | textLengthSet:true:10:'... '}} -招领启事</b></h5></p>
													<p class="show-limit">{{entitys.description | textLengthSet:true:45:'...'}}</p>
													<div class="new-collections-grid1-left simpleCart_shelfItem">
														<span class="time-type">拾取时间：{{entitys.foundTime1 | date:'yyyy.MM.dd'}}</span>
													</div>
												</div>
											</div>
									</div>
								<!-- 招领遍历结束 -->

							</div>
							<div class="clearfix"> </div>
							<hr/>
							<!-- 分页处理开始-->
							<div style="float:right">
									<tm-pagination conf="paginationConf2"></tm-pagination>
							</div>
							<!-- 分页处理结束 -->

						</div>

					</div>
				</div>
			</div>

		</div>
	</div>

<!-- //collections -->

<!-- fooer start-->
<jsp:include page="commons/footer.jsp"/>
<!-- //footer end-->
</body>
</html>