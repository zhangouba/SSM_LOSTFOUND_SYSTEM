package com.qst.manger.mapper;

import com.qst.manger.pojo.TbTextinfo;
import com.qst.manger.pojo.TbTextinfoExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TbTextinfoMapper {
    int countByExample(TbTextinfoExample example);

    int deleteByExample(TbTextinfoExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TbTextinfo record);

    int insertSelective(TbTextinfo record);

    List<TbTextinfo> selectByExample(TbTextinfoExample example);

    TbTextinfo selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TbTextinfo record, @Param("example") TbTextinfoExample example);

    int updateByExample(@Param("record") TbTextinfo record, @Param("example") TbTextinfoExample example);

    int updateByPrimaryKeySelective(TbTextinfo record);

    int updateByPrimaryKey(TbTextinfo record);
}