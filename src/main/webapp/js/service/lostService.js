	//物品服务
		app.service("lostService",function($http){
		
			//查询所有物品分类
			this.findAllCategory=function(){
				return $http.get("../Mangercategory/findAll.do");
			}
			
			this.findAll=function(){
				return $http.get("../Mangerlost/findAll.do");
			}
			
			this.findPage=function(page,size){
				return $http.get('../Mangerlost/findPage.do?page='+page+'&size='+size);
			}
			
			this.findOne=function(id){
				return $http.get("../Mangerlost/findOne.do?id="+id);
			}
			
			this.add=function(entity){
				return $http.post("../Mangerlost/add.do",entity);
			}
			
			this.update=function(entity){
				return $http.post("../Mangerlost/update.do",entity);
			}
			
			this.del=function(ids){
				return $http.get('../Mangerlost/delete.do?ids='+ids);
			}
			
			this.search=function(page,size,searchEntity){
				return $http.post('../Mangerlost/search.do?page='+page+'&size='+size,searchEntity);
			}
			
			//更改状态
			this.updateStatus=function (lostId,status) {
				return $http.get('../Mangerlost/updateStatus.do?lostId='+ lostId +'&status='+ status);
			}
			
		
		});