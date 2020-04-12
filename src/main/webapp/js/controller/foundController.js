
app.controller('foundController',function($scope,$timeout,$controller,foundService){

			$controller('baseController',{$scope:$scope});//继承
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
                maxDate:$scope.searchEntity.foundTime2,
                startingDay:1
            };

            $scope.datepickerOptions2={
                minDate:$scope.searchEntity.foundTime1,
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
            $scope.$watch('searchEntity.foundTime1',function(newValue,oldValue){
                $scope.datepickerOptions2.minDate=newValue;
            });
            $scope.$watch('searchEntity.foundTime2',function(newValue,oldValue){
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
				foundService.findAllCategory().success(
					function(response){
						$scope.categoryList = response;
					}
				);
			}
			
			//查询品牌列表
			$scope.findAll=function(){
				foundService.findAll().success(
					function(response){
						$scope.list=response;
					}
				);			
			}	
			
			//分页
			$scope.findPage=function(page,size){
				foundService.findPage(page,size).success(
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
					object=foundService.update($scope.entity);
				}else{
					object=foundService.add($scope.entity);
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
				foundService.findOne(id).success(
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
							
							foundService.del($scope.selectIds).success(
									function(response){
										if(response.status == 200){
											//重置全选中为空
											$("#selallFound").prop("checked",false);
											
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
			
				foundService.search(page,size,$scope.searchEntity).success(
					function(response){
						$scope.list=response.rows;//显示当前页数据
						$scope.paginationConf.totalItems=response.total;//更新总记录数
					}
				);	
			}
			
			//更改状态
			$scope.updateFoundStatus=function (foundId,status) {
				foundService.updateFoundStatus(foundId,status).success(
					function (response) {
						if(response.status == 200){
							$scope.reloadList();//刷新
							layer.msg('完成审核', {icon: 1,time: 1500});
						}else{
							alert("发生未知错误！");
						}

					}
				)
			}
			
			
		
		});