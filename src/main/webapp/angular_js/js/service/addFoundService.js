	//添加招领物服务
		app.service("addFoundService",function($http){
			
			//查询最近一周内的招领物
			this.findNewest=function(page,size){
				return $http.get('../Portalfound/newest.action?page='+page+'&size='+size)
			}
			
			//查询所有物品分类
			this.findAllCategory=function(){
				return $http.get("../Portalcategory/findAll.action");
			}
			
			this.findAll=function(){
				return $http.get("../Portalfound/findAll.action");
			}
			
			this.findPage=function(page,size){
				return $http.get('../Portalfound/findPage.action?page='+page+'&size='+size);
			}
			
			this.findOne=function(id){
				return $http.get("../Portalfound/findOne.action?id="+id);
			}
			
			this.add=function(entity){
				return $http.post("../Portalfound/add.action",entity);
			}
			
			this.update=function(entity){
				return $http.post("../Portalfound/update.action",entity);
			}
			
			this.del=function(ids){
				return $http.get('../Portalfound/delete.action?ids='+ids);
			}
			
			this.search=function(page,size,searchEntity){
				return $http.post('../Portalfound/search.action?page='+page+'&size='+size,searchEntity);
			}
		
		});