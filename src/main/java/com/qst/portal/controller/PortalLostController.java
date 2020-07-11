package com.qst.portal.controller;

import com.qst.common.pojo.LostResult;
import com.qst.common.pojo.PageResult;
import com.qst.manger.customPojo.DetLost;
import com.qst.manger.pojo.TbLost;
import com.qst.manger.pojo.TbTextinfo;
import com.qst.portal.service.PortalLostService;
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
@RequestMapping("/Portallost")
public class PortalLostController {

	@Autowired
	private PortalLostService portalLostService;
	@Autowired
	private PortalTextService portalTextService;

	/*
	 * 根据时间查询数据
	 */
	@RequestMapping("/newest")
	@ResponseBody
	public PageResult getByTimeLost(int page, int size){
		PageResult result = portalLostService.getLostByTime(page, size);
		return result;
	}

	/*
	 * 根据条件查询数据
	 */
	@RequestMapping("/search")
	@ResponseBody
	public PageResult getByConditionLost(@RequestBody DetLost detLost, int page, int size){
		PageResult result = portalLostService.getLostByCondition(detLost, page, size);
		return result;
	}

	/*
	 * 添加失物信息
	 */
	@RequestMapping("/add")
	@ResponseBody
	public LostResult addLost(@RequestBody TbLost tbLost){
		return portalLostService.addLostInfo(tbLost);
	}

	/*
	 * 根据Id获取明细失物详细信息
	 */
	@RequestMapping("/findOne/{lostId}")
	public String findDetLostById(@PathVariable Long lostId,Model model){
		DetLost lost = portalLostService.getDetLostById(lostId);
		model.addAttribute("lost",lost);
		//增加该失物文章信息浏览次数
		TbTextinfo textInfo = portalTextService.getTextInfo(lostId);
		model.addAttribute("lostTextInfo", textInfo);

		return "lostDetail";
	}

	/*
	 * 更新失物根据ID查询信息
	 */
	@RequestMapping("/findOneUpdate/{lostId}")
	@ResponseBody
	public TbLost findLostByIdUpdate(@PathVariable Long lostId){
		TbLost result = portalLostService.getLostById(lostId);

		return result;
	}

	/*
	 * 验证密码是否正确
	 */
	@RequestMapping("/pwd/validate")
	@ResponseBody
	public LostResult validatePwd(@RequestBody TbLost tbLost){
		return portalLostService.getValidatePwd(tbLost);
	}

	/*
	 * 更新失物信息
	 */
	@RequestMapping("/update")
	@ResponseBody
	public LostResult toUpdateLost(@RequestBody TbLost tbLost){
		return portalLostService.updateLost(tbLost);
	}

	/*
	 * 删除失物信息级联删除启事信息和评论信息
	 */
	@RequestMapping("/delete/{lostId}")
	@ResponseBody
	public LostResult removeLost(@PathVariable Long lostId){
		return portalLostService.deleteLost(lostId);
	}

	/*
	 * 根据物品ID发送邮件给用户
	 */
//	@RequestMapping("/sendEmail/{lostId}")
//	@ResponseBody
//	public LostResult sendEmailToUser(@PathVariable Long lostId){
//		return portalLostService.sendEmail(lostId);
//	}

	/*
	 * 获取所有失物
	 */
	@RequestMapping("/findAll")
	@ResponseBody
	public List<TbLost> findAllLost(){
		return portalLostService.getAllLost();
	}


}
