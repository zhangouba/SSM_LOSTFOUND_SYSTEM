package com.qst.manger.service;

import com.qst.manger.pojoVo.TbLostVo;
import com.qst.manger.utils.DataGridView;
import com.qst.manger.utils.ResultObj;
import org.springframework.stereotype.Service;

@Service
public interface BusLostService {
    DataGridView loadAllLost(TbLostVo tbLostVo);

    ResultObj deleteLost(Long id);

    ResultObj deleteBatchLost(TbLostVo tbLostVo);
}
