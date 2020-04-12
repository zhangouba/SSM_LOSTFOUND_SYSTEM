package com.qst.manger.controller.skip;

import com.qst.common.utils.WebUtils;
import com.qst.manger.pojo.TbUsers;
import com.qst.manger.utils.DataGridView;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/admin")
@Controller
public class Chief {
    @RequestMapping("/toIndex")
    public String toindex() {
        return "index";
    }

    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @RequestMapping("/register")
    public String register() {
        return "register";
    }
    @RequestMapping("/forgetPwd")
    public String forgetPwd() {
        return "forgetPwd";
    }
    @RequestMapping("/toResetPwd")
    public String toResetPwd(){
        return "resetPwd";
    }
    //跳转到后天首页
    @RequestMapping("/rearIndex")
    public  String rearIndex(){
        return "sys/main/index";
    }
    @RequestMapping("toMySelfData")
    public  String toMySelfData(){
        return "sys/main/MyselfData";
    }
    @RequestMapping("toChangPwd")
    public  String toChangPwd(){
        return "sys/main/ChangPwd";
    }

    @RequestMapping("news")
    public String news() {
        return "news";
    }
    //数据统计页面跳转
    @RequestMapping("dataCount")
    public String dataCount(){
        return "dataCount";
    }
    //REAR数据统计页面跳转
    @RequestMapping("reardataCount")
    public String REARdataCount(){
        return "sys/stat/LostCatagoryCount";
    }

    //REAR拾取物品数据统计页面跳转
    @RequestMapping("rearFounddataCount")
    public String FoundCatagoryCount(){
        return "sys/stat/FoundCatagoryCount";
    }

}
