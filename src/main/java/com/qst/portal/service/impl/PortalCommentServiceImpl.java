package com.qst.portal.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
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

		//封装了相信的分页信息包括我们查询出来的数据,传入连续显示的页数
		PageInfo page2=new PageInfo(tbComments,5);
		//分页处理
		PageResult result = new PageResult(page1.getTotal(),page1.getResult());
		result.setPageNum(page1.getPageNum());		//当前页码
		result.setFirstPage(page2.isIsFirstPage());//是否为第一页
		result.setLastPage(page2.isIsLastPage());//是否为最后一页
		result.setHasNextPage(page2.isHasNextPage());//是否有下一页
		result.setHasPreviousPage(page2.isHasPreviousPage());//是否有上一页

		result.setNavigatePages(page2.getNavigatePages()); //导航页码数
		result.setNavigatepageNums(page2.getNavigatepageNums()); //所有导航页号
		result.setPrePage(page2.getPrePage());//前一页
		result.setNextPage(page2.getNextPage());	//后一页
		result.setNavigateFirstPage(page2.getNavigateFirstPage());	//导航条上的第一页
		result.setNavigateLastPage(page2.getNavigateLastPage());	//导航条上的zuihou一页
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
