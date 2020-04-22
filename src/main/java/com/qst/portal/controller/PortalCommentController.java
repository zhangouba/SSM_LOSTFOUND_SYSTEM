package com.qst.portal.controller;

import com.qst.common.pojo.LostResult;
import com.qst.common.pojo.PageResult;
import com.qst.manger.pojo.TbComment;
import com.qst.portal.service.PortalCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/Portalcomment")
public class PortalCommentController {

	@Autowired
	private PortalCommentService portalCommentService;
	

		@RequestMapping(value = "/add",method = RequestMethod.POST)
		public LostResult createdComment(TbComment comment){
		LostResult result = portalCommentService.addComment(comment);
		return result;
	}

	@RequestMapping("/getAllcomment")
	public PageResult getAllcomment(TbComment tbComment){
		return portalCommentService.getAllcomment(tbComment.getGoodsId(),1,5);
	}


	
}
