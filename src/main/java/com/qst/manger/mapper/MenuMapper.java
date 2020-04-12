package com.qst.manger.mapper;

import com.qst.manger.pojo.Menu;
import com.qst.manger.pojo.MenuExample;
import com.qst.manger.pojoVo.MenuVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MenuMapper {
    long countByExample(MenuExample example);

    int deleteByExample(MenuExample example);

    int deleteByPrimaryKey(@Param("id") Integer id);

    int insert(Menu record);

    int insertSelective(Menu record);

    List<Menu> selectByExample(MenuExample example);

    Menu selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Menu record, @Param("example") MenuExample example);

    int updateByExample(@Param("record") Menu record, @Param("example") MenuExample example);

    int updateByPrimaryKeySelective(Menu record);

    int updateByPrimaryKey(Menu record);

    //查询所有菜单
    List<Menu> queryAllMenu(Menu menu);

    void insertSelective(MenuVo menuVo);
    //根据pid查询菜单数量，决定是否有子菜单，没有子菜单然后删除
    Integer queryMenuByPid(@Param("pid") Integer pid);
    //根据菜单id删除sys_role_menu里面的数据
    void deleteRoleMenuByMid(@Param("mid") Integer id);
      //根据角色id查询菜单
    List<Menu> queryMenuByRoleId(@Param("available") Integer availableTrue, @Param("rid") Integer roleid);
      /**
       * 根据用户id查询菜单
       * @param available
      * */
    List<Menu> queryMenuByUid(@Param("available") Integer available, @Param("uid") Integer userid);
}