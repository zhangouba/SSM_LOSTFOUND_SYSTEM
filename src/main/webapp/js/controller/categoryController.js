
app.controller('categoryController',function($scope,$timeout,$controller,categoryService){
		
			$controller('baseController',{$scope:$scope});//继承
			
			//查询品牌列表
			$scope.findAll=function(){
				categoryService.findAll().success(
					function(response){
						$scope.list=response;
					}
				);			
			}	
			
			//分页
			$scope.findPage=function(page,size){
				categoryService.findPage(page,size).success(
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
					object=categoryService.update($scope.entity);
				}else{
					object=categoryService.add($scope.entity);
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
				categoryService.findOne(id).success(
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
							
							categoryService.del($scope.selectIds).success(
									function(response){
										if(response.status == 200){
											//重置全选中为空
											$("#selall").prop("checked",false);
											 
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
			
			$scope.searchEntity={};
			//条件查询
			$scope.search=function(page,size){
			
				categoryService.search(page,size,$scope.searchEntity).success(
					function(response){
						$scope.list=response.rows;//显示当前页数据
						$scope.paginationConf.totalItems=response.total;//更新总记录数
					}
				);	
			}
			
		
		});