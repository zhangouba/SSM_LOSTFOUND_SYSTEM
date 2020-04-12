package com.qst.portal.service;

import com.qst.common.pojo.LostResult;
import com.qst.common.pojo.PageResult;
import com.qst.manger.customPojo.DetLost;
import com.qst.manger.pojo.TbLost;
import org.springframework.stereotype.Service;

import java.util.List;
@Service

public interface PortalLostService {

	//根据时间查询失物
	public PageResult getLostByTime(int page, int size);
	//根据条件查询失物
	public PageResult getLostByCondition(DetLost detLost, int page, int size);
	//添加失物信息
	public LostResult addLostInfo(TbLost tbLost);
	//根据Id查询明细失物信息
	public DetLost getDetLostById(Long lostId);
	//验证密码是否正确
	public LostResult getValidatePwd(TbLost tbLost);
	//根据Id查询失物信息
	public TbLost getLostById(Long lostId);
	//更新失物信息
	public LostResult updateLost(TbLost tbLost);
	//删除失物信息级联删除启事信息和评论信息
	public LostResult deleteLost(Long lostId);
	//获取所有失物
	public List<TbLost> getAllLost();
	
}
