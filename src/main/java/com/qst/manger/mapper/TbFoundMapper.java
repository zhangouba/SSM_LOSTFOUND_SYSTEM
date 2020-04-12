package com.qst.manger.mapper;

import com.qst.manger.pojo.Data.BaseEntity;
import com.qst.manger.pojo.TbFound;
import com.qst.manger.pojo.TbFoundExample;
import com.qst.manger.pojoVo.TbFoundVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TbFoundMapper {
	
	//自定义开始
	
	List<TbFound> selectByTime();
		
	//自定义结束
	
    int countByExample(TbFoundExample example);

    int deleteByExample(TbFoundExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TbFound record);

    int insertSelective(TbFound record);

    List<TbFound> selectByExampleWithBLOBs(TbFoundExample example);

    List<TbFound> selectByExample(TbFoundExample example);

    TbFound selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TbFound record, @Param("example") TbFoundExample example);

    int updateByExampleWithBLOBs(@Param("record") TbFound record, @Param("example") TbFoundExample example);

    int updateByExample(@Param("record") TbFound record, @Param("example") TbFoundExample example);

    int updateByPrimaryKeySelective(TbFound record);

    int updateByPrimaryKeyWithBLOBs(TbFound record);

    int updateByPrimaryKey(TbFound record);

    List<TbFound> loadAllFound();

    //审核
    void updateFoundStatus(@Param("id") Long id, @Param("status") int status);

    List<TbFound> BusloadAllFound(TbFoundVo tbFoundVo);

    //加载我自己的寻物启事
    List<TbFound> loadAllMyFound(String password);

    //拾取物品类别统计
    List<BaseEntity> loadAllFoundForData();
}