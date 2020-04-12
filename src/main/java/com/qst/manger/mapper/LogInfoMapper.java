package com.qst.manger.mapper;

import com.qst.manger.pojo.LogInfo;
import com.qst.manger.pojo.LogInfoExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LogInfoMapper {
    long countByExample(LogInfoExample example);

    int deleteByExample(LogInfoExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(LogInfo record);

    int insertSelective(LogInfo record);

    List<LogInfo> selectByExample(LogInfoExample example);

    LogInfo selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") LogInfo record, @Param("example") LogInfoExample example);

    int updateByExample(@Param("record") LogInfo record, @Param("example") LogInfoExample example);

    int updateByPrimaryKeySelective(LogInfo record);

    int updateByPrimaryKey(LogInfo record);

    //查询日志
    List<LogInfo> queryAllLogInfo(LogInfo logInfo);
}