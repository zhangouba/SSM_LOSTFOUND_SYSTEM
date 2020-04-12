app.controller('searchController',function($scope,$timeout,$controller,searchService){
		
			$controller('baseController',{$scope:$scope});//继承
			
			$scope.queryEntity={};
			//创建一个数组
			var inputValue = new Array();
			var lengths;
			
			$(function(){
				$scope.lostFindAll();
				
				setTimeout(function() {
					$scope.foundFindAll();
				}, 1000);
				console.log(inputValue);
			});
            
            //测试用的数据，这里可以用AJAX获取服务器数据
            var old_value = "";
            var highlightindex = -1;   //高亮
            //自动完成
            function AutoComplete(auto, search, mylist) {
                if ($("#" + search).val() != old_value || old_value == "") {
                    var autoNode = $("#" + auto);   //缓存对象（弹出框）
                    var carlist = new Array();
                    var n = 0;
                    old_value = $("#" + search).val();
                    for (i in mylist) {
                        if (mylist[i].indexOf(old_value) >= 0) {
                            carlist[n++] = mylist[i];
                        }
                    }
                    if (carlist.length == 0) {
                        autoNode.hide();
                        return;
                    }
                    autoNode.empty();  //清空上次的记录
                    for (i in carlist) {
                    	//显示不超过8条数据标题
                    	if(i < 8){
	                        var wordNode = carlist[i];   //弹出框里的每一条内容
	                        var newDivNode = $("<div>").attr("id", i);    //设置每个节点的id值
	                        newDivNode.attr("style", "font:14px/25px arial;height:25px;padding:0 8px;cursor: pointer;");
	                        newDivNode.html(wordNode.replace(old_value, "<strong>"+ old_value +"</strong>")).appendTo(autoNode);  //追加到弹出框
	                        //鼠标移入高亮，移开不高亮
	                        newDivNode.mouseover(function () {
	                            if (highlightindex != -1) {        //原来高亮的节点要取消高亮（是-1就不需要了）
	                                autoNode.children("div").eq(highlightindex).css("background-color", "white");
	                            }
	                            //记录新的高亮节点索引
	                            highlightindex = $(this).attr("id");
	                            $(this).css("background-color", "#ebebeb");
	                        });
	                        newDivNode.mouseout(function () {
	                            $(this).css("background-color", "white");
	                        });
	                        //鼠标点击文字上屏
	                        newDivNode.click(function () {
	                            //取出高亮节点的文本内容
	                            var comText = autoNode.hide().children("div").eq(highlightindex).text();
	                            highlightindex = -1;
	                            //文本框中的内容变成高亮节点的内容
	                            $("#" + search).val(comText).trigger("change");
	                        })
	                        if (carlist.length > 0) {    //如果返回值有内容就显示出来
	                            autoNode.show();
	                        } else {               //服务器端无内容返回 那么隐藏弹出框
	                            autoNode.hide();
	                            //弹出框隐藏的同时，高亮节点索引值也变成-1
	                            highlightindex = -1;
	                        }
                    	}
                    }
                }
                //点击页面隐藏自动补全提示框
                document.onclick = function (e) {
                    var e = e ? e : window.event;
                    var tar = e.srcElement || e.target;
                    if (tar.id != search) {
                        if ($("#" + auto).is(":visible")) {
                            $("#" + auto).css("display", "none")
                        }
                    }
                }
            }
            $(function () {
                old_value = $("#search_text").val();
                /*$("#search_text").focus(function () {
                    if ($("#search_text").val() == "") {
                        AutoComplete("auto_div", "search_text", inputValue);
                    }
                });*/
                $("#search_text").keyup(function () {
                	if($("#search_text").val() != ""){
                		AutoComplete("auto_div", "search_text", inputValue);
                	}
                });
            });
            
            //查询所有
            $scope.lostFindAll=function(){
            	searchService.lostFindAll().success(
            		function(response){
            			$scope.listAllLost = response;
            			lengths = $scope.listAllLost.length;
            			console.log(lengths);
            			 angular.forEach($scope.listAllLost,function(value,index){
                         	inputValue[index] = value.infotitle;
                         });
            		}	
            	);
            }

            $scope.foundFindAll=function(){
            	
            	searchService.foundFindAll().success(
            		function(response){
            			$scope.listAllFound = response;
            			 angular.forEach($scope.listAllFound,function(value,index){
                         	inputValue[index + lengths] = value.infotitle;
                         });
            		}	
            	);
            	
            }
            
			
			//寻物查询
			$scope.searchLost=function(page,size){
				
				searchService.searchLost(page,size,$scope.queryEntity).success(
					function(response){
						$scope.listLost=response.rows;//显示当前页数据
						$scope.paginationConf1.totalItems=response.total;//更新总记录数
					}
				);	
			}
			
			//招领查询
			$scope.searchFound=function(page,size){
			
				searchService.searchFound(page,size,$scope.queryEntity).success(
					function(response){
						$scope.listFound=response.rows;//显示当前页数据
						$scope.paginationConf2.totalItems=response.total;//更新总记录数
					}
				);	
			}
			
			//分页控件配置 currentPage:当前页 totalItems：总记录数
			//itemsPerPage:每页记录数 perPageOptions：分页选项  onChange:当页码变更后自动触发的方法
			$scope.paginationConf1 = {
					 currentPage: 1,
					 totalItems: 10,
					 itemsPerPage: 8,
					 perPageOptions: [8,12, 16, 20, 24],
					 onChange: function(){
					       $scope.reloadList1();//重新加载
					 }
			}; 
			
			//分页控件配置 currentPage:当前页 totalItems：总记录数
			//itemsPerPage:每页记录数 perPageOptions：分页选项  onChange:当页码变更后自动触发的方法
			$scope.paginationConf2 = {
					 currentPage: 1,
					 totalItems: 10,
					 itemsPerPage: 8,
					 perPageOptions: [8, 12, 16, 20, 24],
					 onChange: function(){
					       $scope.reloadList2();//重新加载
					 }
			}; 
			
			//重新加载列表 数据 刷新列表
			$scope.reloadQuery=function(){
				 //切换页码  
				 $scope.searchLost( $scope.paginationConf1.currentPage, $scope.paginationConf1.itemsPerPage );
				 $scope.searchFound( $scope.paginationConf2.currentPage, $scope.paginationConf2.itemsPerPage );
			}
			
			//重新加载列表 数据 刷新列表
			$scope.reloadList1=function(){
				 //切换页码  
				 $scope.searchLost( $scope.paginationConf1.currentPage, $scope.paginationConf1.itemsPerPage );
			}
			
			//重新加载列表 数据 刷新列表
			$scope.reloadList2=function(){
				 //切换页码  
				 $scope.searchFound( $scope.paginationConf2.currentPage, $scope.paginationConf2.itemsPerPage );
			}
			
		
		});