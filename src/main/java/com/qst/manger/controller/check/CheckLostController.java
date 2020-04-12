package com.qst.manger.controller.check;

import com.qst.manger.pojoVo.TbLostVo;
import com.qst.manger.service.CheckLostService;
import com.qst.manger.utils.DataGridView;
import com.qst.manger.utils.ResultObj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("check")
public class CheckLostController {
    @Autowired
    private CheckLostService checkLostService;

    @RequestMapping("loadAllLost")
    public DataGridView loadAllLost(TbLostVo tbLostVo){
        return  checkLostService.loadAllLost(tbLostVo);
    }
    @RequestMapping("checkLostStatus")
    public ResultObj checkLostStatus(TbLostVo tbLostVo){
        return  checkLostService.checkLostStatus(tbLostVo);
    }

}
