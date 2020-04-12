package com.qst.manger.customMapper;

import com.qst.manger.customPojo.DetLost;

import java.util.List;

public interface DetLostMapper {

	//分页查询所有明细失物
	List<DetLost> selectAllDetailLost();
	//按条件分页查询所有明细失物
	List<DetLost> selectConditionLost(DetLost detLost);
	//根据ID查询明细招领物
	DetLost selectLostById(Long id);
}
