package com.qst.manger.controller.check;

import com.qst.manger.pojoVo.TbFoundVo;
import com.qst.manger.service.CheckFoundService;
import com.qst.manger.utils.DataGridView;
import com.qst.manger.utils.ResultObj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("check")
public class CheckFoundController {

    @Autowired
    private CheckFoundService checkFoundService;

    @RequestMapping("loadAllFound")
    public DataGridView loadAllFound(TbFoundVo tbFoundVo){
            return  checkFoundService.loadAllFound(tbFoundVo);
    }

    @RequestMapping("checkFoundStatus")
    public ResultObj checkFoundStatus(TbFoundVo tbFoundVo){
        return  checkFoundService.checkFoundStatus(tbFoundVo);
    }

}
