package com.qst.manger.mapper;

import com.qst.manger.pojo.TbSoulmate;
import com.qst.manger.pojo.TbSoulmateExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TbSoulmateMapper {
    int countByExample(TbSoulmateExample example);

    int deleteByExample(TbSoulmateExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TbSoulmate record);

    int insertSelective(TbSoulmate record);

    List<TbSoulmate> selectByExampleWithBLOBs(TbSoulmateExample example);

    List<TbSoulmate> selectByExample(TbSoulmateExample example);

    TbSoulmate selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TbSoulmate record, @Param("example") TbSoulmateExample example);

    int updateByExampleWithBLOBs(@Param("record") TbSoulmate record, @Param("example") TbSoulmateExample example);

    int updateByExample(@Param("record") TbSoulmate record, @Param("example") TbSoulmateExample example);

    int updateByPrimaryKeySelective(TbSoulmate record);

    int updateByPrimaryKeyWithBLOBs(TbSoulmate record);

    int updateByPrimaryKey(TbSoulmate record);
}