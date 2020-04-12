package com.qst.manger.service;

import com.qst.manger.pojoVo.TbLostVo;
import com.qst.manger.utils.DataGridView;
import com.qst.manger.utils.ResultObj;
import org.springframework.stereotype.Service;

@Service
public interface CheckLostService {
    //加载所有待审核寻味
    DataGridView loadAllLost(TbLostVo tbLostVo);

    ResultObj checkLostStatus(TbLostVo tbLostVo);

}
