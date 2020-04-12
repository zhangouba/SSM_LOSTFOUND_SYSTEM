package com.qst.manger.controller.skip;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("business")
public class BusinessController {
    @RequestMapping("toFoundManager")
    public  String toFoundManager(){
        return "sys/business/foundManager";
    }

    @RequestMapping("toLostManager")
    public  String toLostManager(){
        return "sys/business/lostManager";
    }
    @RequestMapping("toCategoryManager")
    public  String toCategoryManager(){
        return "sys/business/categoryManager";
    }
    @RequestMapping("toRemarkManager")
    public  String toRemarkManager(){
        return "sys/business/remarkManager";
    }
}
