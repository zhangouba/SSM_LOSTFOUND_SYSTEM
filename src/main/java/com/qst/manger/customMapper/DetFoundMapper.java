package com.qst.manger.customMapper;

import com.qst.manger.customPojo.DetFound;

import java.util.List;

public interface DetFoundMapper {

	//分页查询所有明细招领物
	List<DetFound> selectAllDetailFound();
	//按条件分页查询所有明细招领物
	List<DetFound> selectConditionFound(DetFound detFound);
	//根据ID查询明细招领物
	DetFound selectFoundById(Long id);
}
