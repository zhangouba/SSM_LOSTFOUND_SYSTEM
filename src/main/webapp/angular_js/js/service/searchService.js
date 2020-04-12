	//失物服务
		app.service("searchService",function($http){
					
			this.searchLost=function(page,size,queryEntity){
				return $http.post('../Portallost/search.action?page='+page+'&size='+size,queryEntity);
			}
			
			this.searchFound=function(page,size,queryEntity){
				return $http.post('../Portalfound/search.action?page='+page+'&size='+size,queryEntity);
			}
			
			this.lostFindAll=function(){
				return $http.get("../Portallost/findAll.action");
			}
			
			this.foundFindAll=function(){
				return $http.get("../Portalfound/findAll.action");
			}
		
		});