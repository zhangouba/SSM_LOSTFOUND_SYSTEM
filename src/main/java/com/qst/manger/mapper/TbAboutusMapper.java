package com.qst.manger.mapper;

import com.qst.manger.pojo.TbAboutus;
import com.qst.manger.pojo.TbAboutusExample;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TbAboutusMapper {
    int countByExample(TbAboutusExample example);

    int deleteByExample(TbAboutusExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TbAboutus record);

    int insertSelective(TbAboutus record);

    List<TbAboutus> selectByExampleWithBLOBs(TbAboutusExample example);

    List<TbAboutus> selectByExample(TbAboutusExample example);

    TbAboutus selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TbAboutus record, @Param("example") TbAboutusExample example);

    int updateByExampleWithBLOBs(@Param("record") TbAboutus record, @Param("example") TbAboutusExample example);

    int updateByExample(@Param("record") TbAboutus record, @Param("example") TbAboutusExample example);

    int updateByPrimaryKeySelective(TbAboutus record);

    int updateByPrimaryKeyWithBLOBs(TbAboutus record);

    int updateByPrimaryKey(TbAboutus record);
}