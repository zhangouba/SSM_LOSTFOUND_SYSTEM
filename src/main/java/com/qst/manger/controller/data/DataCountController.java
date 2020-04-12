package com.qst.manger.controller.data;

import com.qst.manger.pojo.Data.BaseEntity;
import com.qst.manger.service.DataCountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RequestMapping("data")
@RestController
public class DataCountController {
@Autowired
        private DataCountService dataCountService;

    @RequestMapping("loadUserLostCategory")
    public List<BaseEntity> loadUserLostCategory(){
       return    dataCountService.loadUserLostCategory();
    }


    @RequestMapping("loadUserFoundCategory")
    public List<BaseEntity> loadUserFoundCategory(){
        return  dataCountService.loadUserFoundCategory();
    }

    @RequestMapping("loadUserLostReward")
    public List<BaseEntity> loadUserLostReward(){
        return    dataCountService.loadUserLostCategory();
    }
}
