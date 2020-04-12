
app.controller('lostController',function($scope,$timeout,$controller,lostService){
		
			$controller('baseController',{$scope:$scope});//继承
			
			//获取该物品ID
			var goodsId2 = $("#goodsId").val();
			//获取基础URL
			var baseUrl2 = $("#PageContext").val();
			
			//查询最近一周内的失物
			$scope.findNewest=function(page,size){
			
				lostService.findNewest(page,size).success(
					function(response){
						$scope.listNewest=response.rows;//显示当前页数据
						$scope.paginationConf.totalItems=response.total;//更新总记录数
					}
				);	
			}
			
			//监听entity如果发生变化则加载失物类别
            $scope.$watch('searchEntity',function(){
                $scope.findAllCategory();
                $scope.findOne();
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
               maxDate:$scope.today,
               startingDay:1
           };
           //打开popup
           $scope.pop1={
               opened:false
           };
           $scope.openpop1=function(){
               $scope.pop1.opened=true;
           };

           //监听dt1 和dt2 如果dt1 变化就设置 datepickeroptions.mindate就变化
           $scope.$watch('lostEntity.lostTime',function(newValue,oldValue){
           });
           /*手动输入限制 使用表单验证
           *datepicker输入限制 使用maxDate minDate
           *startPopup   最小时间  没有限制 最大时间 endTime
           *endPopup 最小时间 startTime 最大时间 today
           */
         //日期控件引入结束
			
			//查询所有失物分类
			$scope.findAllCategory=function(){
				lostService.findAllCategory().success(
					function(response){
						$scope.categoryList = response;
					}
				);
			}
			
			//查询品牌列表
			$scope.findAll=function(){
				lostService.findAll().success(
					function(response){
						$scope.list=response;
					}
				);			
			}	
			
			//分页
			$scope.findPage=function(page,size){
				lostService.findPage(page,size).success(
					function(response){
						$scope.list=response.rows;//显示当前页数据
						$scope.paginationConf.totalItems=response.total;//更新总记录数
					}
				);	
			}
			
			/*
			 * 验证管理密码是否正确并修改
			 */
			$scope.validate=function(){

				if($scope.entity.password != null){
					lostService.validate($scope.entity).success(
							function(response){
								console.log("response============：" + response);
								if(response.msg == "OK"){
									$("#confirmPassword").val($scope.lostEntity.password).trigger('change');
									$("#modal-620847").trigger("click");
								}else if(response.msg == 'ERROR'){
									$("#msg").html("<font color='red'>密码错误！请重新输入。</font>");
								}
							}
					);
				}

			}
			
			//更新失物信息
			$scope.update=function(){
				if($scope.lostEntity.categoryId != null && $scope.lostEntity.lostPlace != null 
						&& $scope.lostEntity.lostTime != null && $scope.lostEntity.infotitle != null 
						&& $scope.lostEntity.email != null && $scope.lostEntity.description != null
						&& $scope.lostEntity.password != null && $scope.confirmPwd != null){
								
						if($scope.lostEntity.password != $scope.confirmPwd){
							$("#lostMsg").html("<font color='red'>密码不一致！请重新填写。</font>");
						}else if($scope.lostEntity.password.length < 6 || $scope.confirmPwd.length < 6){
							$("#lostMsg").html("<font color='red'>密码不得少于6位！请重新填写。</font>");
						}else{
								lostService.update($scope.lostEntity).success(
									function(response){
										if(response.status == 200){
											layer.msg('修改成功', {icon: 1,time:1200});
											window.location.reload();
										}else{
											alert(response.message);
										}
									}
								)
						}
				}
			}
			
			//新增或更新数据
			$scope.save=function(){
				var object=null;
				if($scope.entity.id!=null){
					object=lostService.update($scope.entity);
				}else{
					object=lostService.add($scope.entity);
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
			
			//根据ID查询失物
			$scope.findOne=function(){
				lostService.findOne().success(
						function(response){
							$scope.lostEntity=response;//显示当前页数据
						}
				);
			}
			
			/*
			 * 验证管理密码是否正确并删除
			 */
			$scope.validateDel=function(){

				if($scope.entity.password != null){
					lostService.validate($scope.entity).success(
							function(response){
								console.log("response============：" + response);
								if(response.msg == "OK"){
									$scope.del();
								}else if(response.msg == 'ERROR'){
									$("#msgDel").html("<font color='red'>密码错误！请重新输入。</font>");
								}
							}
					);
				}

			}
			
			//删除
			$scope.del=function(){
					layer.confirm('您确定要删除该启事吗？', {
						  btn: ['确定','取消'] //按钮
						}, function(){
							
							lostService.del().success(
									function(response){
										if(response.status == 200){
											 layer.msg('删除成功', {icon: 1,time: 1200});
											 window.location = baseUrl2 + "/index.html";
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
			
			//发送邮件
			$scope.sendEmail=function(){
				
				//倒计时开始
				var InterValObj; //timer变量，控制时间
				var count = 60; //间隔函数，1秒执行
				var curCount;//当前剩余秒数
				
			  　      curCount = count;
			　    　//设置button效果，开始计时
			     $("#btnSendCode").attr("disabled", "true");
			     $("#btnSendCode").val(curCount + "秒后可重新发送");
			     InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
			     
			   //timer处理函数
			     function SetRemainTime() {
	                 if (curCount == 0) {                
	                     window.clearInterval(InterValObj);//停止计时器
	                     $("#btnSendCode").removeAttr("disabled");//启用按钮
	                     $("#btnSendCode").val("重新发送");
	                 }
	                 else {
	                     curCount--;
	                     $("#btnSendCode").val(curCount + "秒后可重新发送");
	                 }
	             }
			    //倒计时开始
				
				
				//邮件发送
				if($scope.entity.id != null){
					
					lostService.sendEmail($scope.entity.id).success(
							function(response){
								if(response.status == 200){
									$("#emailMsg").html("<font color='green'>发送成功！管理密码已发送至您的邮箱。</font>");
								}else{
									$("#emailMsg").html("<font color='red'>发送失败！出现未知错误。</font>");
								}
							}
					);
					
				}
				
			}
			
			
			//条件查询
			$scope.search=function(page,size){
			
				lostService.search(page,size,$scope.searchEntity).success(
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
				 //$scope.search( $scope.paginationConf.currentPage, $scope.paginationConf.itemsPerPage);
				 $scope.findNewest( $scope.paginationConf.currentPage, $scope.paginationConf.itemsPerPage);
			}
			
		
		});