package com.qst.manger.service;

import com.qst.manger.pojoVo.TbCommentVo;
import com.qst.manger.utils.DataGridView;
import com.qst.manger.utils.ResultObj;

public interface MyCommentService {
    DataGridView loadAllMyComment(TbCommentVo tbCommentVo);


    ResultObj deleteMyComment(Integer id);

    ResultObj deleteBatchMyComment(TbCommentVo tbCommentVo);
}
