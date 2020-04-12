package com.qst.portal.service;

import com.qst.common.pojo.LostResult;
import com.qst.common.pojo.PageResult;
import com.qst.manger.pojo.TbComment;
import org.springframework.stereotype.Service;

@Service

public interface PortalCommentService {
	
	//根据物品ID查询评论信息分页显示
	public PageResult getCommentById(Long goodsId, int page, int size);
	//添加评论
	public LostResult addComment(TbComment comment);
}
