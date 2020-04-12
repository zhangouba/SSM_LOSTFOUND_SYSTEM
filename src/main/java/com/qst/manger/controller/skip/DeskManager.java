package com.qst.manger.controller.skip;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/*
*
* 工作台控制器*/
@Controller
@RequestMapping("desk")
public class DeskManager {
//跳转到控制台


    @RequestMapping("toDeskManager")
    public String toDeskManager(){
        return "sys/main/DeskManger";
    }

}
