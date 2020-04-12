	//失物服务
		app.service("lSearchService",function($http){
			
			//查询最近一周内的失物
			this.findNewest=function(page,size){
				return $http.get('../Portallost/newest.action?page='+page+'&size='+size)
			}
			
			//查询所有物品分类
			this.findAllCategory=function(){
				return $http.get("../Portalcategory/findAll.action");
			}
			
			this.findAll=function(){
				return $http.get("../Portallost/findAll.action");
			}
			
			this.findPage=function(page,size){
				return $http.get('../Portallost/findPage.action?page='+page+'&size='+size);
			}
			
			this.findOne=function(id){
				return $http.get("../Portallost/findOne.action?id="+id);
			}
			
			this.add=function(entity){
				return $http.post("../Portallost/add.action",entity);
			}
			
			this.update=function(entity){
				return $http.post("../Portallost/update.action",entity);
			}
			
			this.del=function(ids){
				return $http.get('../Portallost/delete.action?ids='+ids);
			}
			
			this.search=function(page,size,searchEntity){
				return $http.post('../Portallost/search.action?page='+page+'&size='+size,searchEntity);
			}
		
		});