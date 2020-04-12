package com.qst.portal.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.qst.common.pojo.LostResult;
import com.qst.common.pojo.PageResult;
import com.qst.common.utils.IDUtils;
import com.qst.manger.mapper.TbCommentMapper;
import com.qst.manger.pojo.TbComment;
import com.qst.manger.pojo.TbCommentExample;
import com.qst.manger.pojo.TbCommentExample.Criteria;
import com.qst.portal.service.PortalCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class PortalCommentServiceImpl implements PortalCommentService {


	@Autowired
	private TbCommentMapper tbCommentMapper;

	/*
	 * 根据物品ID查询评论信息分页显示
	 */
	@Override
	public PageResult getCommentById(Long goodsId, int page, int size) {
		// 分页
		PageHelper.startPage(page, size);
		//根据物品ID查询评论信息
		TbCommentExample example = new TbCommentExample();
		Criteria createCriteria = example.createCriteria();
		createCriteria.andGoodsIdEqualTo(goodsId);
		//设置集合结果排序顺序
		example.setOrderByClause("comment_time DESC");

		Page<TbComment> page1 = (Page<TbComment>) tbCommentMapper.selectByExampleWithBLOBs(example);
		//分页处理
		PageResult result = new PageResult(page1.getTotal(),page1.getResult());

		return result ;
	}

	/*
	 * 添加评论
	 */
	@Override
	public LostResult addComment(TbComment comment) {
		// 补全评论信息
		comment.setId(IDUtils.generateCommentId());
		comment.setCommentTime(new Date());
		comment.setCreated(new Date());
		comment.setUpdated(new Date());

		//加入数据
		tbCommentMapper.insert(comment);

		return LostResult.ok();
	}
	
	
	
}
