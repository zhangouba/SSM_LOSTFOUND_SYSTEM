package com.qst.portal.controller;

import com.qst.common.pojo.LostResult;
import com.qst.common.pojo.PageResult;
import com.qst.manger.customPojo.DetFound;
import com.qst.manger.pojo.TbFound;
import com.qst.manger.pojo.TbTextinfo;
import com.qst.portal.service.PortalFoundService;
import com.qst.portal.service.PortalTextService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/Portalfound")
public class PortalFoundController {

	@Autowired
	private PortalFoundService portalFoundService;
	@Autowired
	private PortalTextService portalTextService;
	
	@RequestMapping("/newest")
	@ResponseBody
	public PageResult getByTimeFound(int page, int size){
		PageResult result = portalFoundService.getFoundByTime(page, size);
		return result;
	}
	
	/*
	 * 根据条件查询数据
	 */
	@RequestMapping("/search")
	@ResponseBody
	public PageResult getByConditionFound(@RequestBody DetFound detFound, int page, int size){
		PageResult result = portalFoundService.getFoundByCondition(detFound, page, size);
		return result;
	}
	
	/*
	 * 添加招领信息
	 */
	@RequestMapping("/add")
	@ResponseBody
	public LostResult addFound(@RequestBody TbFound tbFound){
		return portalFoundService.addFoundInfo(tbFound);
	}
	
	/*
	 * 根据Id获取失物信息
	 */
	@RequestMapping("/findOne/{foundId}")
	public String findFoundById(@PathVariable Long foundId,Model model){
		DetFound found = portalFoundService.getDetFoundById(foundId);
		model.addAttribute("found",found);
		//增加该失物文章信息浏览次数
		TbTextinfo textInfo = portalTextService.getTextInfo(foundId);
		model.addAttribute("foundTextInfo", textInfo);
		
		return "foundDetail";
	}
	
	/*
	 * 更新失物根据ID查询信息
	 */
	@RequestMapping("/findOneUpdate/{foundId}")
	@ResponseBody
	public TbFound findFoundByIdUpdate(@PathVariable Long foundId){
		TbFound result = portalFoundService.getFoundById(foundId);
		
		return result;
	}
	
	/*
	 * 验证密码是否正确
	 */
	@RequestMapping("/pwd/validate")
	@ResponseBody
	public LostResult validatePwd(@RequestBody TbFound tbFound){
		return portalFoundService.getValidatePwd(tbFound);
	}
	
	/*
	 * 更新失物信息
	 */
	@RequestMapping("/update")
	@ResponseBody
	public LostResult toUpdateFound(@RequestBody TbFound tbFound){
		return portalFoundService.updateFound(tbFound);
	}
	
	/*
	 * 删除招领信息级联删除启事信息和评论信息
	 */
	@RequestMapping("/delete/{foundId}")
	@ResponseBody
	public LostResult removeFound(@PathVariable Long foundId){
		return portalFoundService.deleteFound(foundId);
	}
	
	/*
	 * 根据物品ID发送邮件给用户
	 */
//	@RequestMapping("/sendEmail/{foundId}")
//	@ResponseBody
//	public LostResult sendEmailToUser(@PathVariable Long foundId){
//		return portalFoundService.sendEmail(foundId);
//	}
	
	/*
	 * 获取所有招领物
	 */
	@RequestMapping("/findAll")
	@ResponseBody
	public List<TbFound> findAllFound(){
		return portalFoundService.getAllFound();
	}
	
	
}
