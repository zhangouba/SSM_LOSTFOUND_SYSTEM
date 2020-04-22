package com.qst.manger.controller.business;

import com.qst.manger.pojoVo.TbCommentVo;
import com.qst.manger.service.BusCommentService;
import com.qst.manger.utils.DataGridView;
import com.qst.manger.utils.ResultObj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("comment")
public class BusCommentController {

    @Autowired
    private BusCommentService busCommentService;

    @RequestMapping("loadAllComment")
    public DataGridView loadAllComment(TbCommentVo tbCommentVo) {
        return busCommentService.loadAllComment(tbCommentVo);
    }

    @RequestMapping("deleteComment")
    public ResultObj deleteComment(TbCommentVo tbCommentVo) {
        return busCommentService.deleteComment(tbCommentVo.getId());
    }

    @RequestMapping("deleteBatchComment")
    public ResultObj deleteBatchComment(TbCommentVo tbCommentVo) {
        return busCommentService.deleteBatchComment(tbCommentVo);
    }
}
