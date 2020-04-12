app.controller('commentController',function($scope,$timeout,$controller,commentService){
app.controller('commentController',function($scope,$timeout,$controller,commentService){

			$controller('baseController',{$scope:$scope});//继承
			
			//条件查询
			$scope.search=function(page,size){
			
				commentService.search(page,size).success(
					function(response){
						$scope.commentList=response.rows;//显示当前页数据
						$scope.paginationConf.totalItems=response.total;//更新总记录数
					}
				);	
			}
			
			//添加评论
			$scope.add=function(){
				if($scope.entity.commentText != null){
					commentService.add($scope.entity).success(							
							function(response){
								if(response.status == 200){
									$scope.reloadList();//刷新分页
									layer.msg('评论成功！', {icon: 1,time:1200});
									window.location.reload();
								}else{
									alert(response.message);
								}
							}					
					)
					
				}
			}
			
			//分页控件配置 currentPage:当前页 totalItems：总记录数
			//itemsPerPage:每页记录数 perPageOptions：分页选项  onChange:当页码变更后自动触发的方法
			$scope.paginationConf = {
					 currentPage: 1,
					 totalItems: 10,
					 itemsPerPage: 3,
					 perPageOptions: [3, 5, 10, 15, 20],
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
});