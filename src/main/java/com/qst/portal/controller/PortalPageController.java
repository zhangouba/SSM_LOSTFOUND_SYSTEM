package com.qst.portal.controller;

import com.qst.common.utils.WebUtils;
import com.qst.manger.pojo.TbUsers;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class PortalPageController {

	//映射表单修正页面
	@RequestMapping("/changeForm")
	public String showChange(){
		return "changeForm";
	}
	
	//映射图片上传测试页面
	@RequestMapping("/file")
	public String showFond(){
		return "fileUpload";
	}
	
	//映射首页
	@RequestMapping("/index")
	public String showIndex(){
		return "index";
	}
	
	//映射寻物页面
	@RequestMapping("/lost")
	public String showLost(){
		return "lost";
	}
	
	//映射招领物页面
	@RequestMapping("/found")
	public String showFound(){
		return "found";
	}
	
	//映射发布寻物页面
	@RequestMapping("/addLost")
	public String showAddLost() {
		TbUsers tbUsers = (TbUsers) WebUtils.getHttpSession().getAttribute("user");
		if (tbUsers == null) {
			return "login";
		} else {
			return "addLost";
		}
	}
	//映射发布招领物页面
	@RequestMapping("/addFound")
	public String showAddFound(){
		TbUsers tbUsers = (TbUsers) WebUtils.getHttpSession().getAttribute("user");
		if (tbUsers == null) {
			return "login";
		} else {
			return "addFound";
		}
	}
	
	//映射查询结果页面
	@RequestMapping("/searchResult")
	public String showSearchResult(){
		return "searchResult";
	}
	
	//映射更新结果页面
	@RequestMapping("/updateLost")
	public String showUpdateLost(){
		return "updateLost";
	}
	
	//映射联系我们页面
	@RequestMapping("/mailUs")
	public String showMailUs(){
		return "mailUs";
	}
	
	//映射关于我们页面
	@RequestMapping("/aboutUs")
	public String showAboutUs(){
		return "aboutUs";
	}
	
		
}
