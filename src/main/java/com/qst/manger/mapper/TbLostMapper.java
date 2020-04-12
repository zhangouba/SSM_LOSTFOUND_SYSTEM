package com.qst.manger.mapper;

import com.qst.manger.pojo.Data.BaseEntity;
import com.qst.manger.pojo.TbLost;
import com.qst.manger.pojo.TbLostExample;
import com.qst.manger.pojoVo.TbLostVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TbLostMapper {
	
	//自定义开始
	
	List<TbLost> selectByTime();
		
	//自定义结束
	
    int countByExample(TbLostExample example);

    int deleteByExample(TbLostExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TbLost record);

    int insertSelective(TbLost record);

    List<TbLost> selectByExampleWithBLOBs(TbLostExample example);

    List<TbLost> selectByExample(TbLostExample example);

    TbLost selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TbLost record, @Param("example") TbLostExample example);

    int updateByExampleWithBLOBs(@Param("record") TbLost record, @Param("example") TbLostExample example);

    int updateByExample(@Param("record") TbLost record, @Param("example") TbLostExample example);

    int updateByPrimaryKeySelective(TbLost record);

    int updateByPrimaryKeyWithBLOBs(TbLost record);

    int updateByPrimaryKey(TbLost record);

    List<TbLost> loadAllLost();

    //审核
    void updateLostStatus(@Param("id") Long id, @Param("status") int status);

    List<TbLost> BusloadAllLost(TbLostVo tbLostVo);

    //加载我自己的寻物启事
    List<TbLost> loadAllMyLost(String password);

    List<BaseEntity> loadAllLostForData();
}