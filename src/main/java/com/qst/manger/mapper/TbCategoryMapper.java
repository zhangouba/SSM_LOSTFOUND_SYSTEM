package com.qst.manger.mapper;

import com.qst.manger.pojo.TbCategory;
import com.qst.manger.pojo.TbCategoryExample;
import com.qst.manger.pojoVo.TbCategoryVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TbCategoryMapper {
    int countByExample(TbCategoryExample example);

    int deleteByExample(TbCategoryExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TbCategory record);

    int insertSelective(TbCategory record);

    List<TbCategory> selectByExample(TbCategoryExample example);

    TbCategory selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TbCategory record, @Param("example") TbCategoryExample example);

    int updateByExample(@Param("record") TbCategory record, @Param("example") TbCategoryExample example);

    int updateByPrimaryKeySelective(TbCategory record);

    int updateByPrimaryKey(TbCategory record);

    //加载所有标题
    List<TbCategory> BusloadAllCategory(TbCategoryVo tbCategoryVo);

    void updateByID(@Param("id") Long id,@Param("categoryName")  String categoryName);

    List<TbCategory> loadAllCategoryForSelect();
}