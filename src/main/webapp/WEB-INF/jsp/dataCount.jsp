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
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
	<script type="text/javascript" src="${ctx}/resources/echarts/js/jquery-3.1.1.min.js"></script>
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
				<li class="active">数据统计</li>
			</ol>
		</div>
	</div>
<!-- //breadcrumbs -->
<div class="mail animated wow zoomIn" data-wow-delay=".5s">
	<div class="container">
<h3>数据统计</h3>



			<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
				<ul id="myTab" class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">丢失物品类别统计</a></li>
					<li role="presentation"><a href="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile">拾取物品类别统计</a></li>
				</ul>
				<div id="myTabContent" class="tab-content">
					<div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledby="home-tab">
						<div id="container" style="height: 600px"></div>

						<script type="text/javascript">
                            $.post("${ctx}/data/loadUserLostCategory.action",function (data) {
                                var dom = document.getElementById("container");
                                var myChart = echarts.init(dom);
                                var app = {};
                                option = null;
                                option = {
                                    title: {
                                        text: '丢失物品类别统计',
                                        subtext: '',
                                        left: 'center'
                                    },
                                    tooltip: {
                                        trigger: 'item',
                                        formatter: '{a} <br/>{b} : {c} ({d}%)'
                                    },
                                    legend: {
                                        orient: 'vertical',
                                        left: 'left',
                                        data: data,
                                    },
                                    series: [
                                        {
                                            name: '丢失物品类别以及占比',
                                            type: 'pie',
                                            radius: '55%',
                                            center: ['50%', '60%'],
                                            data: data,
                                            emphasis: {
                                                itemStyle: {
                                                    shadowBlur: 10,
                                                    shadowOffsetX: 0,
                                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                                }
                                            }
                                        }
                                    ]
                                };
                                ;
                                if (option && typeof option === "object") {
                                    myChart.setOption(option, true);
                                }
                            })
						</script>


					</div>
					<div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledby="profile-tab">
						<div id="container1" style="height: 600px"></div>
						<script type="text/javascript">
                            $.post("${ctx}/data/loadUserFoundCategory.action",function (data) {
                                var dom = document.getElementById("container1");
                                var myChart = echarts.init(dom);
                                var app = {};
                                option = null;
                                option = {
                                    title: {
                                        text: '丢失物品类别统计',
                                        subtext: '',
                                        left: 'center'
                                    },
                                    tooltip: {
                                        trigger: 'item',
                                        formatter: '{a} <br/>{b} : {c} ({d}%)'
                                    },
                                    legend: {
                                        orient: 'vertical',
                                        left: 'left',
                                        data: data,
                                    },
                                    series: [
                                        {
                                            name: '丢失物品类别以及占比',
                                            type: 'pie',
                                            radius: '55%',
                                            center: ['50%', '60%'],
                                            data: data,
                                            emphasis: {
                                                itemStyle: {
                                                    shadowBlur: 10,
                                                    shadowOffsetX: 0,
                                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                                }
                                            }
                                        }
                                    ]
                                };
                                ;
                                if (option && typeof option === "object") {
                                    myChart.setOption(option, true);
                                }
                            })
						</script>
					</div>
				</div>
			</div>



	</div></div>
<!-- fooer start-->
<jsp:include page="commons/footer.jsp"/>
<!-- //footer end-->

</body>
</html>