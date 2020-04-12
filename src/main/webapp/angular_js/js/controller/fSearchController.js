
app.controller('fSearchController',function($scope,$timeout,$controller,fSearchService){
		
			$controller('baseController',{$scope:$scope});//继承
	
			//查询最近一周内的失物
			$scope.findNewest=function(page,size){
			
				fSearchService.findNewest(page,size).success(
					function(response){
						$scope.listNewest=response.rows;//显示当前页数据
						$scope.paginationConf.totalItems=response.total;//更新总记录数
					}
				);	
			}
			
			//监听entity如果发生变化则加载失物类别
            $scope.$watch('entity',function(){
                $scope.findAllCategory();
            });
			
			$scope.searchEntity={};
			
			//日期控件引入开始
			 //下拉列表的数据
            $scope.formats=['yyyy-MM-dd', 'yyyy/MM/dd', 'dd.MM.yyyy', 'shortDate']
            $scope.format=$scope.formats[0];
            //datepickerpopup的数据
            $scope.today=new Date();
            $scope.altInputFormats=['yyyy/M!/d!','yyyy.M!.d!','yyyy M! d!'];//手动输入支持的格式
            $scope.datepickerOptions1={
                maxDate:$scope.searchEntity.fSearchTime2,
                startingDay:1
            };
            $scope.datepickerOptions2={
                minDate:$scope.searchEntity.fSearchTime1,
                maxDate:$scope.today,
                startingDay:1
            };
            //打开popup
            $scope.pop1={
                opened:false
            };
            $scope.pop2={
                opened:false
            };
            $scope.openpop1=function(){
                $scope.pop1.opened=true;
            };
            $scope.openpop2=function(){
                $scope.pop2.opened=true;
            };

            //监听dt1 和dt2 如果dt1 变化就设置 datepickeroptions.mindate就变化
            $scope.$watch('searchEntity.fSearchTime1',function(newValue,oldValue){
                $scope.datepickerOptions2.minDate=newValue;
            });
            $scope.$watch('searchEntity.fSearchTime2',function(newValue,oldValue){
                $scope.datepickerOptions1.maxDate=newValue;
            });
            /*手动输入限制 使用表单验证
            *datepicker输入限制 使用maxDate minDate
            *startPopup   最小时间  没有限制 最大时间 endTime
            *endPopup 最小时间 startTime 最大时间 today
            */
          //日期控件引入结束
			
			//查询所有失物分类
			$scope.findAllCategory=function(){
				fSearchService.findAllCategory().success(
					function(response){
						$scope.categoryList = response;
					}
				);
			}
			
			//查询品牌列表
			$scope.findAll=function(){
				fSearchService.findAll().success(
					function(response){
						$scope.list=response;
					}
				);			
			}	
			
			//分页
			$scope.findPage=function(page,size){
				fSearchService.findPage(page,size).success(
					function(response){
						$scope.list=response.rows;//显示当前页数据
						$scope.paginationConf.totalItems=response.total;//更新总记录数
					}
				);	
			}
			
			//新增或更新数据
			$scope.save=function(){
				var object=null;
				if($scope.entity.id!=null){
					object=fSearchService.update($scope.entity);
				}else{
					object=fSearchService.add($scope.entity);
				}
			
				object.success(
					function(response){
						if(response.status == 200){
							$scope.reloadList();//刷新
							layer.msg('编辑成功', {icon: 1,time:1000});
						}else{
							alert(response.message);
						}
					}
				)		
			}
			
			//查询实体
			$scope.findOne=function(id){
				fSearchService.findOne(id).success(
					function(response){
						$scope.entity=response;
					}
				)
			}
			
			//删除
			$scope.del=function(){
				if($scope.selectIds.length == 0){
					layer.alert('您还未有任何选中哦', {icon: 6});
				}else{
					layer.confirm('您确定要删除吗？', {
						  btn: ['确定','取消'] //按钮
						}, function(){
							
							fSearchService.del($scope.selectIds).success(
									function(response){
										if(response.status == 200){
											$scope.reloadList();//刷新
											 layer.msg('删除成功', {icon: 1,time: 1000});
										}else{
											alert(response.message);
										}
									}
								)			
						}, function(){
						 // layer.msg('也可以这样', {
						   // time: 20000, //20s后自动关闭
						   // btn: ['明白了', '知道了']
						  //});
						})
				 	}
			}
			
			//条件查询
			$scope.search=function(page,size){
			
				fSearchService.search(page,size,$scope.searchEntity).success(
					function(response){
						$scope.list=response.rows;//显示当前页数据
						$scope.paginationConf.totalItems=response.total;//更新总记录数
					}
				);	
			}
			
			//分页控件配置 currentPage:当前页 totalItems：总记录数
			//itemsPerPage:每页记录数 perPageOptions：分页选项  onChange:当页码变更后自动触发的方法
			$scope.paginationConf = {
					 currentPage: 1,
					 totalItems: 10,
					 itemsPerPage: 8,
					 perPageOptions: [8,12, 16, 20, 24],
					 onChange: function(){
					       $scope.reloadList();//重新加载
					 }
			}; 
			
			//重新加载列表 数据 刷新列表
			$scope.reloadList=function(){
				 //切换页码  
				 $scope.search( $scope.paginationConf.currentPage, $scope.paginationConf.itemsPerPage);
				 //$scope.findNewest( $scope.paginationConf.currentPage, $scope.paginationConf.itemsPerPage);
			}
			
		
		});