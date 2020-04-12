	//招领服务
		app.service("foundService",function($http){
		
			//获取该物品ID
			var goodsId = $("#goodsId").val();
			//获取基础URL
			var baseUrl = $("#PageContext").val();
			
			//查询最近一周内的失物
			this.findNewest=function(page,size){
				return $http.get('../Portalfound/newest.action?page='+page+'&size='+size)
			}
			
			//查询所有物品分类
			this.findAllCategory=function(){
				return $http.get( baseUrl + "/Portalcategory/findAll.action");
			}
			
			this.findAll=function(){
				return $http.get("../Portalfound/findAll.action");
			}
			
			this.findPage=function(page,size){
				return $http.get('../Portalfound/findPage.action?page='+page+'&size='+size);
			}
			
			this.findOne=function(){
				return $http.get(baseUrl + "/Portalfound/findOneUpdate/"+ goodsId +".action");
			}
			
			this.add=function(entity){
				return $http.post("../Portalfound/add.action",entity);
			}
			
			this.validate=function(entity){
				entity.id = goodsId;
				return $http.post(baseUrl + '/Portalfound/pwd/validate.action',entity);
			}
			
			this.update=function(entity){
				return $http.post(baseUrl + "/Portalfound/update.action",entity);
			}
			
			this.del=function(){
				return $http.get(baseUrl + "/Portalfound/delete/"+ goodsId +".action");
			}
			
			this.search=function(page,size,searchEntity){
				return $http.post('../Portalfound/search.action?page='+page+'&size='+size,searchEntity);
			}
			
			this.sendEmail=function(id){
				return $http.get(baseUrl + "/Portalfound/sendEmail/"+ id + ".action");
			}
		
		});