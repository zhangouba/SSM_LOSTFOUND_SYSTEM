	//物品服务
		app.service("foundService",function($http){

			//查询所有物品分类
			this.findAllCategory=function(){
				return $http.get("../Mangercategory/findAll.do");
			}

			this.findAll=function(){
				return $http.get("../Mangerfound/findAll.do");
			}

			this.findPage=function(page,size){
				return $http.get('../Mangerfound/findPage.do?page='+page+'&size='+size);
			}

			this.findOne=function(id){
				return $http.get("../Mangerfound/findOne.do?id="+id);
			}

			this.add=function(entity){
				return $http.post("../Mangerfound/add.do",entity);
			}

			this.update=function(entity){
				return $http.post("../Mangerfound/update.do",entity);
			}

			this.del=function(ids){
				return $http.get('../Mangerfound/delete.do?ids='+ids);
			}

			this.search=function(page,size,searchEntity){
				return $http.post('../Mangerfound/search.do?page='+page+'&size='+size,searchEntity);
			}

			//更改状态
			this.updateFoundStatus=function (foundId,status) {
				return $http.get('../Mangerfound/updateStatus.do?foundId='+ foundId +'&status='+ status);
			}

		});