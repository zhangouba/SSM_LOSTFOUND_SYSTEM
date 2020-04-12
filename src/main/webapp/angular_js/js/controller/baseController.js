app.controller('baseController',function($scope){
	
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
	
	
	
});