package com.qst.manger.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.qst.common.constast.SysConstast;
import com.qst.common.utils.WebUtils;
import com.qst.manger.mapper.RoleMapper;
import com.qst.manger.mapper.TbUsersMapper;
import com.qst.manger.pojo.Role;
import com.qst.manger.pojo.TbUsers;
import com.qst.manger.pojoVo.RoleVo;
import com.qst.manger.pojoVo.UserVo;
import com.qst.manger.service.UserService;
import com.qst.manger.utils.DataGridView;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private TbUsersMapper userMapper;

    @Autowired
    private RoleMapper roleMapper;



    @Override
    public DataGridView queryAllUser(UserVo userVo) {
        Page<Object> page= PageHelper.startPage(userVo.getPage(),userVo.getLimit());
       List<TbUsers> data= userMapper.queryAllUser(userVo);

        return new DataGridView(page.getTotal(),data);
    }


    @Override
    public void updateUser(UserVo userVo) {
          userMapper.updateByPrimaryKeySelective(userVo);
    }

    @Override
    public void deleteUser(Integer userid) {
            userMapper.deleteByPrimaryKey(userid);
            roleMapper.deleteRoleUserByUid(userid);
    }

    @Override
    public void deleteBatchUser(Integer[] ids) {
          for (Integer uid:ids){
            deleteUser(uid);
          }
    }



    @Override
    public DataGridView queryUserRole(Integer userid) {
        //查看分配用户的权限
        TbUsers tbUsers1 = userMapper.selectByPrimaryKey(userid);
        TbUsers tbUsers = (TbUsers) WebUtils.getHttpSession().getAttribute("user");
        int type = tbUsers.getType();


        List<Map<String, Object>> data = new ArrayList<>();


        if (tbUsers1.getType() >= type) {
            Map<String, Object> map = new HashMap<>();
            map.put("roleid", 1);
            map.put("rolename","权限不足");
            map.put("roledesc", "抱歉，您的权限不足");
            data.add(map);
            return   new DataGridView(data);
        } else {

            //查询所有可用角色
            RoleVo roleVo = new RoleVo();
            roleVo.setAvailable(SysConstast.AVAILABLE_TRUE);
            List<Role> allRole = roleMapper.queryAllRole(roleVo);

            //根据用户id查询已拥有的角色

//         List<Map<String,Object>> data=new ArrayList<>();
//         Map<String,Object> map=new HashMap<>();
//         System.out.println("quanxian_type"+type);
//         for (Role role:allRole){
//             if (role.getRoleid()<type){
//                 System.out.println(role.getRoleid()+"????");
//                 map.put("roleid",role.getRoleid());
//                 map.put("rolename",role.getRolename());
//                 map.put("roledesc",role.getRoledesc());
//                 data.add(map);
//             }
//
//         }
            //   List<Role> userRole =  roleMapper.queryRoleByUid(SysConstast.AVAILABLE_TRUE,userid);

            for (Role r1 : allRole) {
                // boolean LAY_CHECKED=false;
                //  for (Role r2:userRole){
                if (r1.getRoleid() < type) {
                    Map<String, Object> map = new HashMap<>();
                    map.put("roleid", r1.getRoleid());
                    map.put("rolename", r1.getRolename());
                    map.put("roledesc", r1.getRoledesc());
                    //  map.put("LAY_CHECKED",LAY_CHECKED);
                    data.add(map);
                }
                //   }
//          Map<String,Object> map=new HashMap<>();
//          map.put("roleid",r1.getRoleid());
//          map.put("rolename",r1.getRolename());
//          map.put("roledesc",r1.getRoledesc());
//        //  map.put("LAY_CHECKED",LAY_CHECKED);
//          data.add(map);
            }

            return new DataGridView(data);
        }
    }

    // 保存用户分配角色
    @Override
    public void saveUserRole(UserVo userVo) {
        roleMapper.deleteRoleUserByUid(userVo.getId());
        if (userVo.getIds() != null && userVo.getIds().length > 0) {
            Integer s[]=userVo.getIds();
            Arrays.sort(s);
            int temp=s[s.length-1];
            System.out.println(temp);
            userMapper.updateTbUserType(userVo.getId(),temp);
            userMapper.saveUserRole(userVo.getId(),temp);
        }
    }


}
