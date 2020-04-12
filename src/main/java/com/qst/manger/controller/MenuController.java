package com.qst.manger.controller;

import com.qst.common.constast.SysConstast;
import com.qst.common.utils.WebUtils;
import com.qst.manger.pojo.Menu;
import com.qst.manger.pojo.TbUsers;
import com.qst.manger.pojoVo.MenuVo;
import com.qst.manger.service.MenuService;
import com.qst.manger.utils.DataGridView;
import com.qst.manger.utils.ResultObj;
import com.qst.manger.utils.TreeNode;
import com.qst.manger.utils.TreeNodeBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

//菜单管理控制器
@Controller
@ResponseBody
@RequestMapping("menu")
public class MenuController {

    @Autowired
    private MenuService menuService;

    @RequestMapping("loadIndexLeftMenuJson")
    public List<TreeNode>  loadIndexLeftMenuJson(MenuVo menuVo){
        //得到当前登录的用户对象
         TbUsers user= (TbUsers) WebUtils.getHttpSession().getAttribute("user");
         List<Menu> list=null;
         menuVo.setAvailable(SysConstast.AVAILABLE_TRUE);//只查询可用的
         if (user.getType()==3){
           list=  menuService.queryAllMenuForList(menuVo);
         }else {
             list=  menuService.queryMenuByUserIdList(menuVo,user.getId());
         }


         List<TreeNode> nodes=new ArrayList<>();
         for (Menu menu:list){
             Integer id=menu.getId();

             Integer pid=menu.getPid();

             String title=menu.getTitle();

             String icon=menu.getIcon();

             String href=menu.getHref();

             Boolean spread=menu.getSpread()==SysConstast.SPREAD_TRUE?true:false;

             String target=menu.getTarget();

             nodes.add(new TreeNode(id,pid,title,icon,href,spread,target));
         }

         //把查出的父子节点进行分类

        return TreeNodeBuilder.builder(nodes,SysConstast.NEED_EXTENSION_PID);
    }

     @RequestMapping("loadMenuManagerLeftTreeJson")
     public DataGridView loadMenuManagerLeftTreeJson(MenuVo menuVo){
         //得到当前登录的用户对象
         TbUsers user= (TbUsers) WebUtils.getHttpSession().getAttribute("user");
         List<Menu> list=null;
         menuVo.setAvailable(SysConstast.AVAILABLE_TRUE);//只查询可用的
         if (user.getType()==SysConstast.USER_SUPER_TYPE){
             list=  menuService.queryAllMenuForList(menuVo);
         }else {
             list=  menuService.queryMenuByUserIdList(menuVo,user.getId());
         }


         List<TreeNode> nodes=new ArrayList<>();
         for (Menu menu:list){
             Integer id=menu.getId();
             Integer pid=menu.getPid();
             String title=menu.getTitle();
             String icon=menu.getIcon();
             String href=menu.getHref();
             Boolean spread=menu.getSpread()==SysConstast.SPREAD_TRUE?true:false;
             String target=menu.getTarget();

             nodes.add(new TreeNode( id,pid,title,icon,href,spread,target));
         }
         //把查出的父子节点进行分类

         return new DataGridView(nodes);
     }


    /**
     * 加载菜单列表返回DataGridView
     */
    @RequestMapping("loadAllMenu")
    public DataGridView loadAllMenu(MenuVo menuVo) {
       // System.out.println(menuVo.getTitle());
        return this.menuService.queryAllMenu(menuVo);
    }

    /*
    * 添加菜单
    * */
    @RequestMapping("addMenu")
    private ResultObj addMenu(MenuVo menuVo){

        try {
            menuService.addMenu(menuVo);

            return ResultObj.ADD_SUCCESS;
        }catch (Exception e){
            return ResultObj.ADD_ERROR;
        }
    }



    /*
     * 修改菜单
     * */
    @RequestMapping("updateMenu")
    private ResultObj updateMenu(MenuVo menuVo){

        try {
            menuService.updateMenu(menuVo);

            return ResultObj.UPDATE_SUCCESS;
        }catch (Exception e){
            return ResultObj.UPDATE_ERROR;
        }
    }

    //根据id判断当前菜单有没有子节点，有返回code>=0
    @RequestMapping("checkMenuHasChildren")
    public ResultObj checkMenuHasChildren(MenuVo menuVo){

       Integer count= menuService.queryMenuByPid(menuVo.getId());
       if (count>0){
           return  ResultObj.STATUS_TRUE;
       }
        else {
           return  ResultObj.STATUS_FALSE;
       }
    }
   //删除
    @RequestMapping("deletemenu")
    public ResultObj deletemenu(MenuVo menuVo){

        Integer count= menuService.deletemenu(menuVo.getId());
        if (count>0){
            return  ResultObj.DELETE_SUCCESS;
        }
        else {
            return  ResultObj.DELETE_ERROR;
        }
    }









}

