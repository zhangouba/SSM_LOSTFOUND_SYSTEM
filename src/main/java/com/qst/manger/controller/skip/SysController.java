package com.qst.manger.controller.skip;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/*页面跳转控制器*/
@Controller
@RequestMapping("sys")
public class SysController {

    //菜单管理
    @RequestMapping("toMenuManager")
    public String toMenuManager(){
        return "sys/menu/MenuManager";
    }
    //左边菜单管理

    @RequestMapping("toMenuLeft")
    public String toMenuLeft(){
        return "sys/menu/menuLeft";
    }
    //右边菜单管理

    @RequestMapping("toMenuRight")
    public String toMenuRight(){
        return "sys/menu/menuRight";
    }


      //跳转到角色管理页面
    @RequestMapping("toRoleManager")
    public String toRoleManger(){
        return "sys/role/roleManager";
    }
    //跳转到用户管理页面
    @RequestMapping("toUserManager")
    public String toUserManager(){
        return "sys/user/userManager";
    }

    //跳转到日志管理页面
    @RequestMapping("toLogInfoManager")
    public String toLogInfoManager(){
        return "sys/logInfo/logInfoManager";
    }

    //跳转到公告管理页面
    @RequestMapping("toNewsManager")
    public String toNewsManager(){
        return "sys/news/newsManager";
    }


}
