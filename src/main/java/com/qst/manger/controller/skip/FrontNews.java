package com.qst.manger.controller.skip;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("front")
public class FrontNews {

    @RequestMapping("/new1")
    public String new1(){
        return "frontnews/news1";
    }
    @RequestMapping("/new2")
    public String new2(){
        return "frontnews/news2";
    }
    @RequestMapping("/new3")
    public String new3(){
        return "frontnews/news3";
    }
    @RequestMapping("/new4")
    public String new4(){
        return "frontnews/news4";
    }
    @RequestMapping("/new5")
    public String new5(){
        return "frontnews/news5";
    }
    @RequestMapping("/new6")
    public String new6(){
        return "frontnews/news6";
    }

    @RequestMapping("/new7")
    public String new7(){
        return "frontnews/news7";
    }

    @RequestMapping("/new8")
    public String new8(){
        return "frontnews/news8";
    }
}
