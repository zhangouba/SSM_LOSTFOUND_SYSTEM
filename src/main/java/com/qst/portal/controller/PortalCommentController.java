package com.qst.portal.controller;

import com.qst.common.pojo.LostResult;
import com.qst.common.pojo.PageResult;
import com.qst.manger.pojo.TbComment;
import com.qst.portal.service.PortalCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/Portalcomment")
public class PortalCommentController {

	@Autowired
	private PortalCommentService portalCommentService;
	
	/*
	 * 根据物品ID查询评论信息分页显示
	 */
	@RequestMapping("/findAll/{goodsId}")
	public PageResult selectCommentById(@PathVariable Long goodsId, int page, int size){
		PageResult result = portalCommentService.getCommentById(goodsId, page, size);
		return result;
	}
	
	/*
	 * 添加评论
	 */
	@RequestMapping("/add")
	public LostResult createdComment(@RequestBody TbComment comment){
		LostResult result = portalCommentService.addComment(comment);
		return result;
	}
	
	
}
