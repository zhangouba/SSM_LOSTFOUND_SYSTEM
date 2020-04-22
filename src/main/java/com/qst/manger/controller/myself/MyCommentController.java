package com.qst.manger.controller.myself;

import com.qst.manger.pojoVo.TbCommentVo;
import com.qst.manger.service.MyCommentService;
import com.qst.manger.utils.DataGridView;
import com.qst.manger.utils.ResultObj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("myself")
public class MyCommentController {

    @Autowired
    private MyCommentService myCommentService;

    //加载 我发布的招领
    @RequestMapping("loadAllMyComment")
    public DataGridView loadAllMyComment(TbCommentVo tbCommentVo){
        return myCommentService.loadAllMyComment(tbCommentVo);
    }



    @RequestMapping("deleteMyComment")
    public ResultObj deleteMyComment(TbCommentVo tbCommentVo){
        return myCommentService.deleteMyComment(tbCommentVo.getId());
    }

    @RequestMapping("deleteBatchMyComment")
    public ResultObj deleteBatchMyComment(TbCommentVo tbCommentVo){
        return myCommentService.deleteBatchMyComment(tbCommentVo);
    }
}
