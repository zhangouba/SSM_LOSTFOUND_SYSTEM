package com.qst.manger.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.qst.manger.mapper.LogInfoMapper;
import com.qst.manger.pojo.LogInfo;
import com.qst.manger.pojoVo.LogInfoVo;
import com.qst.manger.service.LogInfoService;
import com.qst.manger.utils.DataGridView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LogInfoServiceImpl  implements LogInfoService {
   @Autowired
   private LogInfoMapper logInfoMapper;

    @Override
    public DataGridView queryAllLogInfo(LogInfoVo logInfoVo) {
        Page<Object> page= PageHelper.startPage(logInfoVo.getPage(),logInfoVo.getLimit());
        List<LogInfo> data=logInfoMapper.queryAllLogInfo(logInfoVo);
        return new DataGridView(page.getTotal(),data);
    }

    @Override
    public void addLogInfo(LogInfoVo logInfoVo) {
     logInfoMapper.insertSelective(logInfoVo);
    }

    @Override
    public void deleteLogInfo(Integer logInfoVo) {
        logInfoMapper.deleteByPrimaryKey(logInfoVo);
    }

    @Override
    public void deleteBatchLogInfo(Integer[] ids) {
         for (Integer id:ids){
             deleteLogInfo(id);
         }
    }
}
