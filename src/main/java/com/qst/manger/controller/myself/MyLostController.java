package com.qst.manger.controller.myself;

import com.qst.manger.pojoVo.TbLostVo;
import com.qst.manger.service.MyLostService;
import com.qst.manger.utils.DataGridView;
import com.qst.manger.utils.ResultObj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("myself")
public class MyLostController {

    @Autowired
    private MyLostService myLostService;

    //加载 我发布的招领
    @RequestMapping("loadAllMyLost")
    public DataGridView loadAllMyLost(TbLostVo tbLostVo){
        return myLostService.loadAllMyLost(tbLostVo);
    }


    @RequestMapping("updateMyLost")
    public ResultObj updateMyLost(TbLostVo tbLostVo){
        return myLostService.updateMyLost(tbLostVo);
    }



    @RequestMapping("deleteMyLost")
    public ResultObj deleteMyLost(TbLostVo tbLostVo){
        return myLostService.deleteMyLost(tbLostVo.getId());
    }

    @RequestMapping("deleteBatchMyLost")
    public ResultObj deleteBatchMyLost(TbLostVo tbLostVo){
        return myLostService.deleteBatchMyLost(tbLostVo);
    }
}
