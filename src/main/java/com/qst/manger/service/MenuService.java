package com.qst.manger.service;

import com.qst.manger.pojo.Menu;
import com.qst.manger.pojoVo.MenuVo;
import com.qst.manger.utils.DataGridView;
import org.springframework.stereotype.Service;

import java.util.List;

/*菜单管理接口*/
@Service

public interface MenuService {
    //查询所有菜单返回
    public List<Menu> queryAllMenuForList(MenuVo menuVo);

    //根据用户id查询用户可用菜单
    public List<Menu> queryMenuByUserIdList(MenuVo menuVo, Integer userid);

    //
    public DataGridView queryAllMenu(MenuVo menuVo);


    public void  addMenu(MenuVo menuVo);

    public  void updateMenu(MenuVo menuVo);

    Integer queryMenuByPid(Integer id);

    Integer deletemenu(Integer id);
}
