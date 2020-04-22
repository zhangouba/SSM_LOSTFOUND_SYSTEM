package com.qst.portal.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.qst.common.pojo.LostResult;
import com.qst.common.pojo.PageResult;
import com.qst.common.utils.WebUtils;
import com.qst.manger.mapper.TbCommentMapper;
import com.qst.manger.mapper.TbUsersMapper;
import com.qst.manger.pojo.TbComment;
import com.qst.manger.pojo.TbUsers;
import com.qst.portal.service.PortalCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class PortalCommentServiceImpl implements PortalCommentService {


	@Autowired
	private TbCommentMapper tbCommentMapper;

	@Autowired
	private TbUsersMapper tbUsersMapper;
	/*
	 * 根据物品ID查询评论信息分页显示
	 */
	@Override
	public PageResult getAllcomment(String goodsId, int page, int size) {
		// 分页
		PageHelper.startPage(page, size);
		//根据物品ID查询评论信息

	    List<TbComment> tbComments= tbCommentMapper.getAllcomment(goodsId);

	    for (TbComment tbComment:tbComments){
		TbUsers tbUsers=	tbUsersMapper.selectByPrimaryKey(tbComment.getUserId());

			tbComment.setRealname(tbUsers.getRealname());
			tbComment.setUserPhoto(			tbUsers.getImg());
		}

		Page<TbComment> page1 = (Page<TbComment>) tbComments;
		//分页处理
		PageResult result = new PageResult(page1.getTotal(),page1.getResult());

		return result ;
	}

	/*
	 * 添加评论
	 */
	@Override
	public LostResult addComment(TbComment comment) {

		try {
			TbUsers tbUsers = (TbUsers) WebUtils.getHttpSession().getAttribute("user");
			comment.setUserId(tbUsers.getId());
			comment.setCreateDate(new Date());
			//加入数据
			tbCommentMapper.addComment(comment);

			return LostResult.ok();
		}catch (Exception e){
			return LostResult.build(500,"评论内容过长!请重新输入！");
		}

	}
	
	
	
}
