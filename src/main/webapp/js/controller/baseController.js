app.controller('baseController',function($scope){
	
	//分页控件配置 currentPage:当前页 totalItems：总记录数
	//itemsPerPage:每页记录数 perPageOptions：分页选项  onChange:当页码变更后自动触发的方法
	$scope.paginationConf = {
			 currentPage: 1,
			 totalItems: 10,
			 itemsPerPage: 10,
			 perPageOptions: [10, 20, 30, 40, 50],
			 onChange: function(){
			       $scope.reloadList();//重新加载
			 }
	}; 
	
	//重新加载列表 数据 刷新列表
	$scope.reloadList=function(){
		 //切换页码  
		 $scope.search( $scope.paginationConf.currentPage, $scope.paginationConf.itemsPerPage);
	}
	
	$scope.selectIds=[];//用户勾选的ID集合
	//用户勾选复选框
	$scope.updateSelection=function($event,id){
		if($event.target.checked){
			$scope.selectIds.push(id);//向集合添加元素
		}else{
			var index = $scope.selectIds.indexOf(id);//查找值的位置
			$scope.selectIds.splice(index, 1);//参数一：移除的位置   参数二：移除的个数
		}
	}
	//用户全选复选框
	$scope.getAllSelection=function($event){
		if($event.target.checked){
			angular.forEach($scope.list,function(value,key) {
				$scope.selectIds.push(value.id);//向集合添加元素
			});
		}else{
			$scope.selectIds=[];
		}
	}
	
});