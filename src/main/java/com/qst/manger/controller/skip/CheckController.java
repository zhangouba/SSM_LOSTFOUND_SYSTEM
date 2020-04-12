package com.qst.manger.controller.skip;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("check")
public class CheckController {

    @RequestMapping("toFoundCheck")
    public  String  toFoundCheck(){
        return "sys/check/foundCheck";
    }


    @RequestMapping("toLostCheck")
    public  String  toLostCheck(){
        return "sys/check/lostCheck";
    }
}
