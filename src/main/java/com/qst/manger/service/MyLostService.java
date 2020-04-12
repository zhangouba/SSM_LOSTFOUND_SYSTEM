package com.qst.manger.service;

import com.qst.manger.pojoVo.TbLostVo;
import com.qst.manger.utils.DataGridView;
import com.qst.manger.utils.ResultObj;
import org.springframework.stereotype.Service;

@Service
public interface MyLostService {
    DataGridView loadAllMyLost(TbLostVo tbLostVo);

    ResultObj updateMyLost(TbLostVo tbLostVo);

    ResultObj deleteBatchMyLost(TbLostVo tbLostVo);

    ResultObj deleteMyLost(Long id);
}
