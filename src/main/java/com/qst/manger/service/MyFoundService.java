package com.qst.manger.service;

import com.qst.manger.pojoVo.TbFoundVo;
import com.qst.manger.utils.DataGridView;
import com.qst.manger.utils.ResultObj;
import org.springframework.stereotype.Service;


@Service
public interface MyFoundService {
    DataGridView loadAllMyFound(TbFoundVo tbFoundVo);

    ResultObj updateMyFound(TbFoundVo tbFoundVo);

    ResultObj deleteMyFound(Long id);

    ResultObj deleteBatchMyFound(TbFoundVo tbFoundVo);
}
