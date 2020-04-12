package com.qst.manger.controller.business;

import com.qst.manger.pojoVo.TbFoundVo;
import com.qst.manger.service.BusFoundService;
import com.qst.manger.utils.DataGridView;
import com.qst.manger.utils.ResultObj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("business")
public class BusFoundController {
    @Autowired
    private BusFoundService busFoundService;
    @RequestMapping("loadAllFound")
    public DataGridView loadAllLost(TbFoundVo tbFoundVo){
        return busFoundService.loadAllFound(tbFoundVo);
    }
    @RequestMapping("deleteFound")
    public ResultObj deleteFound(TbFoundVo tbFoundVo){
        return busFoundService.deleteFound(tbFoundVo.getId());
    }
      @RequestMapping("deleteBatchFound")
      public ResultObj deleteBatchFound(TbFoundVo tbFoundVo){
          return busFoundService.deleteBatchFound(tbFoundVo);
      }
}
