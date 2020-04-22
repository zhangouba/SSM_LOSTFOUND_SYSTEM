package com.qst.manger.service;

import com.qst.manger.pojoVo.TbCommentVo;
import com.qst.manger.utils.DataGridView;
import com.qst.manger.utils.ResultObj;

public interface BusCommentService {
    DataGridView loadAllComment(TbCommentVo tbCommentVo);

    ResultObj deleteComment(Integer id);

    ResultObj deleteBatchComment(TbCommentVo tbCommentVo);
}
