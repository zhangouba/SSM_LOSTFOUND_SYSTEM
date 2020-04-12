package com.qst.portal.service;


import com.qst.common.pojo.LostResult;
import com.qst.common.pojo.PageResult;
import com.qst.manger.customPojo.DetFound;
import com.qst.manger.pojo.TbFound;
import org.springframework.stereotype.Service;

import java.util.List;

;
@Service

public interface PortalFoundService {

	//根据时间查询失物
	public PageResult getFoundByTime(int page, int size);
	//根据条件查询失物 
	public PageResult getFoundByCondition(DetFound detFound, int page, int size);
	//添加招领信息
	public LostResult addFoundInfo(TbFound tbFound);
	//根据Id查询明细招领信息
	public DetFound getDetFoundById(Long foundId);
	//验证密码是否正确
	public LostResult getValidatePwd(TbFound tbFound);
	//根据Id查询失物信息
	public TbFound getFoundById(Long foundId);
	//更新失物信息
	public LostResult updateFound(TbFound tbFound);
	//删除招领信息级联删除启事信息和评论信息
	public LostResult deleteFound(Long foundId);

	//获取所有失物
	public List<TbFound> getAllFound();

}
