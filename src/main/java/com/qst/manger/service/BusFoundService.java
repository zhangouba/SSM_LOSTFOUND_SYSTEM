package com.qst.manger.service;

import com.qst.manger.pojoVo.TbFoundVo;
import com.qst.manger.utils.DataGridView;
import com.qst.manger.utils.ResultObj;
import org.springframework.stereotype.Service;

@Service
public interface BusFoundService {
    DataGridView loadAllFound(TbFoundVo tbFoundVo);

    ResultObj deleteFound(Long id);

    ResultObj deleteBatchFound(TbFoundVo tbFoundVo);
}
