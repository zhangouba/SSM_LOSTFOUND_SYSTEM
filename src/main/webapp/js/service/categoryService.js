	//品牌服务
		app.service("categoryService",function($http){
		
			this.findAll=function(){
				return $http.get("../Mangercategory/findAll.do");
			}
			
			this.findPage=function(page,size){
				return $http.get('../Mangercategory/findPage.do?page='+page+'&size='+size);
			}
			
			this.findOne=function(id){
				return $http.get("../Mangercategory/findOne.do?id="+id);
			}
			
			this.add=function(entity){
				return $http.post("../Mangercategory/add.do",entity);
			}
			
			this.update=function(entity){
				return $http.post("../Mangercategory/update.do",entity);
			}
			
			this.del=function(ids){
				return $http.get('../Mangercategory/delete.do?ids='+ids);
			}
			
			this.search=function(page,size,searchEntity){
				return $http.post('../Mangercategory/search.do?page='+page+'&size='+size,searchEntity);
			}
		
		});