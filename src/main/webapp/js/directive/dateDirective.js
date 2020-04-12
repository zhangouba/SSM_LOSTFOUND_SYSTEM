app.directive('ngcLayDate', function($timeout) {
      return {
        require: '?ngModel',
        restrict: 'A',
        scope: {
          ngModel: '=',
          maxDate:'@',
          minDate:'@'
        },
        link: function(scope, element, attr, ngModel) {
           // 渲染模板完成后执行
          $timeout(function(){ 
        	  
        	  layui.use('laydate', function(){
          		var laydate = layui.laydate;
          		//执行一个laydate实例
          		laydate.render({
          		elem: '#' + attr.id, //指定元素
          	    done: function (value) {              
	          		scope.$apply(function () {
	          			 setViewValue(value);
	      			 });
          	    	}
          		});
          	});
        	  
          function setViewValue(val){
        	  ngModel.$setViewValue(val);
          }
        	  
          },0); 
        }
      };
    })