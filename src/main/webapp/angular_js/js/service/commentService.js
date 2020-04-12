		app.service("commentService",function($http){

			//获取该物品ID
			var goodsId = $("#goodsId").val();
			//获取基础URL
			var baseUrl = $("#PageContext").val();
			
			this.search=function(page,size){
				return $http.post( baseUrl +'/Portalcomment/findAll/'+ goodsId +'.action?page='+page+'&size='+size);
			}
			
			this.add=function(entity){
				entity.goodsId = goodsId;
				return $http.post(baseUrl + '/Portalcomment/add.action',entity);
			}
		
		});