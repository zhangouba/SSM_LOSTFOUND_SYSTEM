package com.qst.manger.controller.business;

import com.qst.manger.pojoVo.TbLostVo;
import com.qst.manger.service.BusLostService;
import com.qst.manger.utils.DataGridView;
import com.qst.manger.utils.ResultObj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("business")
public class BusLostController {

    @Autowired
    private BusLostService busLostService;

    @RequestMapping("loadAllLost")
    public DataGridView loadAllLost(TbLostVo tbLostVo) {
        return busLostService.loadAllLost(tbLostVo);
    }

    @RequestMapping("deleteLost")
    public ResultObj deleteLost(TbLostVo tbLostVo) {
        return busLostService.deleteLost(tbLostVo.getId());
    }

    @RequestMapping("deleteBatchLost")
    public ResultObj deleteBatchLost(TbLostVo tbLostVo) {
        return busLostService.deleteBatchLost(tbLostVo);
    }
}
