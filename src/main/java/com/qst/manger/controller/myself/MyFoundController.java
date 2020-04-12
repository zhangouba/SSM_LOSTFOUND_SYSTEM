package com.qst.manger.controller.myself;

import com.qst.manger.pojoVo.TbFoundVo;
import com.qst.manger.service.MyFoundService;
import com.qst.manger.utils.DataGridView;
import com.qst.manger.utils.ResultObj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("myself")
public class MyFoundController {
    @Autowired
    private MyFoundService myFoundService;

    //加载 我发布的招领
    @RequestMapping("loadAllMyFound")
    public DataGridView loadAllMyFound(TbFoundVo tbFoundVo){
              return myFoundService.loadAllMyFound(tbFoundVo);
    }


    @RequestMapping("updateMyFound")
    public ResultObj updateMyFound(TbFoundVo tbFoundVo){
        return myFoundService.updateMyFound(tbFoundVo);
    }



    @RequestMapping("deleteMyFound")
    public ResultObj deleteMyFound(TbFoundVo tbFoundVo){
        return myFoundService.deleteMyFound(tbFoundVo.getId());
    }

    @RequestMapping("deleteBatchMyFound")
    public ResultObj deleteBatchMyFound(TbFoundVo tbFoundVo){
        return myFoundService.deleteBatchMyFound(tbFoundVo);
    }
}
