package com.qst.manger.service;

import com.qst.manger.pojoVo.LogInfoVo;
import com.qst.manger.utils.DataGridView;
import org.springframework.stereotype.Service;

;

@Service
public interface LogInfoService {

    /**
     * 查询所有日志
     * @param LogInfoVo
     * @return
     */
    public DataGridView queryAllLogInfo(LogInfoVo LogInfoVo);

    /**
     * 添加日志
     * @param LogInfoVo
     */
    public void addLogInfo(LogInfoVo LogInfoVo);

    /**
     * 根据id删除日志
     * @param LogInfoid
     */
    public void deleteLogInfo(Integer LogInfoid);
    /**
     * 批量删除日志
     */
    public void deleteBatchLogInfo(Integer[] ids);
}
