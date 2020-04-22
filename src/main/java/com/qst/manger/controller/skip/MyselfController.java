package com.qst.manger.controller.skip;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("myself")
@Controller
public class MyselfController {
    @RequestMapping("toMyLost")
    public String tomyLost(){
        return "sys/myself/myLost";
    }


    @RequestMapping("toMyFound")
    public String tomyFound(){
        return "sys/myself/myFound";
    }

    @RequestMapping("toMyComment")
    public String toMyComment(){
        return "sys/myself/myComment";
    }
}
