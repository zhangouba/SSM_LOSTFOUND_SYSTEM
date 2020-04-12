<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>失物招领-寻物启事信息</title>
<!-- link start -->
<jsp:include page="commons/head-link.jsp"/>
<!-- link end -->

<!-- lost script start -->
<script type="text/javascript" src="../../angular_js/js/base_pageUibs.js"></script>
<script type="text/javascript" src="../../angular_js/js/controller/baseController.js"></script>
<script type="text/javascript" src="../../angular_js/js/service/lSearchService.js"></script>
<script type="text/javascript" src="../../angular_js/js/controller/lSearchController.js"></script>
<!-- lost script end -->
</head>

<body ng-app="portalRest"  ng-controller="lSearchController" ng-init="searchEntity={status:1}">
<!-- header start-->
<jsp:include page="commons/header.jsp"/>
<!-- //header end-->

<!-- breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
				<li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>首页</a></li>
				<li class="active">寻物启事</li>
			</ol>
		</div>
	</div>
<!-- //breadcrumbs -->

<!-- collections -->
	<div class="new-collections">
		<div class="container">
			<h3>寻物启事</h3>
			<p class="est">本页面默认显示所有寻物启事信息，可以选择任意查询条件进行查询。</p>
			<div class="mail-grids">
			
			<div align="center">
				 <form>
				    <div class="form-group form-inline">
			            <p class="input-group">
			                <input class="form-control" uib-datepicker-popup="{{format}}" ng-model="searchEntity.lostTime1" is-open="pop1.opened"
			                     placeholder="请选择开始日期" close-text="关闭" clear-text="清空" current-text="今天" alt-input-formats="altInputFormats" datepicker-options="datepickerOptions1"/>
			                <span class="input-group-btn">
			                    <button class="btn btn-default" ng-click="openpop1()"><i class="glyphicon  glyphicon-calendar"></i></button>
			                </span>
			            </p>
			            <p class="input-group">
			                <input class="form-control" uib-datepicker-popup="{{format}}" ng-model="searchEntity.lostTime2" is-open="pop2.opened"
			                     placeholder="请选择结束日期" close-text="关闭" clear-text="清空" current-text="今天" alt-input-formats="altInputFormats" datepicker-options="datepickerOptions2"/>
			                <span class="input-group-btn">
			                    <button class="btn btn-default" ng-click="openpop2()"><i class="glyphicon  glyphicon-calendar"></i></button>
			                </span>
			            </p>
			        </div>
			        <div class="form-group form-inline">
                  	         <select class="form-control" ng-model="searchEntity.categoryName">
                                 <option value="">请选择失物类别</option>
                                 <option ng-repeat="categoryEntity in categoryList" value="{{categoryEntity.categoryName}}">{{categoryEntity.categoryName}}</option>
                             </select>
                             <input placeholder="请输入失物地点" class="form-control" ng-model="searchEntity.lostPlace"/>
						<input placeholder="关键字查询" class="form-control" ng-model="searchEntity.keyword"/>

					</div>
                    <div class="newsletter" data-wow-delay=".5s">
                 	  <button class="btn btn-info" onclick="window.location.reload();">刷新</button>
                  	  <input type="submit" ng-click="reloadList()" value="查 询" >
                    </div>

               	 </form>
              </div>
                
              <div class="clearfix"> </div>       
				
			<div class="grid_3 grid_5 animated wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="500ms">
				<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
					<ul id="myTab" class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">寻物信息展示</a></li>
					</ul>
					<div id="myTabContent" class="tab-content">
						<div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledby="home-tab">
						
							    <div class="new-collections-grids">
							    <!-- 失物遍历开始 -->
									<div ng-repeat="entity in list" class="custom-div new-collections-grid">
											<div class="new-collections-grid-sub-grids">
												<div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
													<div class="new-collections-grid1-image">
														<div class="new-collections-grid1-image-pos">
															<a href="/Portallost/findOne/{{entity.id}}.action">查看 详情</a>
														</div>
													</div>
													<h4><a href="single.html">{{entity.infoTitle | textLengthSet:true:12:'... '}}</a></h4>
													<p><h5><b>{{entity.lostPlace | textLengthSet:true:10:'... '}} -寻物启事</b></h5></p>
													<p class="show-limit">{{entity.description | textLengthSet:true:45:'...'}}</p>
													<div class="new-collections-grid1-left simpleCart_shelfItem">
														<span>丢失时间：{{entity.lostTime1 | date:'yyyy.MM.dd'}}</span>
													</div>
												</div> 
											</div>
									</div>
								<!-- 失物遍历结束 -->
									
								</div>
								
								<div class="clearfix"> </div>
								<hr/>
								<!-- 分页处理开始 -->
								<div style="float:right">
									<tm-pagination conf="paginationConf"></tm-pagination>
								</div>
								<!-- 分页处理结束 -->
								<div class="clearfix"> </div>
								
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