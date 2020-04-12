package com.qst.manger.service;

import com.qst.manger.pojoVo.TbFoundVo;
import com.qst.manger.utils.DataGridView;
import com.qst.manger.utils.ResultObj;
import org.springframework.stereotype.Service;

@Service
public interface CheckFoundService {
   /*
   * 加载所有未审核的
   * 招领启示
   */
    DataGridView loadAllFound(TbFoundVo tbFoundVo);

    ResultObj checkFoundStatus(TbFoundVo tbFoundVo);
}
