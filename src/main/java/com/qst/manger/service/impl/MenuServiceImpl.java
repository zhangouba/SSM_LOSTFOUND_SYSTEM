package com.qst.manger.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.qst.manger.mapper.MenuMapper;
import com.qst.manger.pojo.Menu;
import com.qst.manger.pojoVo.MenuVo;
import com.qst.manger.service.MenuService;
import com.qst.manger.utils.DataGridView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuServiceImpl implements MenuService {
    @Autowired
    private MenuMapper menuMapper;

    @Override
    public List<Menu> queryAllMenuForList(MenuVo menuVo) {
        return menuMapper.queryAllMenu(menuVo);
    }
    /*
    * 管理权限
    * @parm userid
    * */
    @Override
    public List<Menu> queryMenuByUserIdList(MenuVo menuVo, Integer userid) {
        return menuMapper.queryMenuByUid(menuVo.getAvailable(),userid);

    }
    //查询
    @Override
    public DataGridView queryAllMenu(MenuVo menuVo) {
        Page<Object> page=PageHelper.startPage(menuVo.getPage(), menuVo.getLimit());
        List<Menu> data = menuMapper.queryAllMenu(menuVo);

        return new DataGridView(page.getTotal(), data);
    }
    //添加菜单
    @Override
    public void addMenu(MenuVo menuVo) {
        menuMapper.insertSelective(menuVo);
    }
   //修改菜单
    @Override
    public void updateMenu(MenuVo menuVo) {
        menuMapper.updateByPrimaryKeySelective(menuVo);
    }

    /*根据PID查询菜单数量*/
    @Override
    public Integer queryMenuByPid(Integer id) {
       int a= menuMapper.queryMenuByPid(id);
        System.out.println(a);
        return a;
    }
    /*根据ID删除*/
    @Override
    public Integer deletemenu(Integer id) {

       menuMapper.deleteRoleMenuByMid(id);

        return  menuMapper.deleteByPrimaryKey(id);
    }

}
