package com.qst.manger.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.qst.common.constast.SysConstast;
import com.qst.manger.mapper.MenuMapper;
import com.qst.manger.mapper.RoleMapper;
import com.qst.manger.pojo.Menu;
import com.qst.manger.pojo.Role;
import com.qst.manger.pojoVo.RoleVo;
import com.qst.manger.service.RoleService;
import com.qst.manger.utils.DataGridView;
import com.qst.manger.utils.TreeNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleMapper roleMapper;

	@Autowired
	private MenuMapper menuMapper;

	@Override
	public List<Role> queryAllRoleForList(RoleVo roleVo) {
		return roleMapper.queryAllRole(roleVo);
	}

	/**
	 * 后期权限管理完成之后再来改
	 */
	@Override
	public List<Role> queryRoleByUserIdForList(RoleVo roleVo, Integer userId) {
		return roleMapper.queryAllRole(roleVo);
	}

	@Override
	public DataGridView queryAllRole(RoleVo roleVo) {
		Page<Object> page = PageHelper.startPage(roleVo.getPage(), roleVo.getLimit());
		List<Role> data = this.roleMapper.queryAllRole(roleVo);
//		for (Role role:data){
//			System.out.println(role.getRolename());
//		}
		return new DataGridView(page.getTotal(), data);
	}

	@Override
	public void addRole(RoleVo roleVo) {
		//roleVo.setRoleid(roleVo.getRoleid()+1);
		this.roleMapper.insertSelective(roleVo);
	}

	@Override
	public void updateRole(RoleVo roleVo) {
		this.roleMapper.updateByPrimaryKeySelective(roleVo);
	}

	@Override
	public void deleteRole(Integer roleid) {
		// 删除角色表的数据
		this.roleMapper.deleteByPrimaryKey(roleid);
		// 根据角色id删除sys_role_meun里面的数据
		this.roleMapper.deleteRolMenuByRid(roleid);
		// 根据角色id删除sys_role_user里面的数据
		this.roleMapper.deleteRoleUserByRid(roleid);

	}

	@Override
	public void deleteBatchRole(Integer[] ids) {
		for (Integer rid : ids) {
			deleteRole(rid);
		}
	}

	//角色管理-分配菜单
	@Override
	public DataGridView initRoleMenuTreeJson(Integer roleid) {
		// 查询所有的可用的菜单
		Menu menu = new Menu();
		menu.setAvailable(SysConstast.AVAILABLE_TRUE);
		List<Menu> allMenu = menuMapper.queryAllMenu(menu);
		// 根据角色ID查询当前角色拥有的菜单
		List<Menu> roleMenu = menuMapper.queryMenuByRoleId(SysConstast.AVAILABLE_TRUE, roleid);

		List<TreeNode> data = new ArrayList<>();
		for (Menu m1 : allMenu) {
			String checkArr = SysConstast.CODE_ZERO+"";
			for (Menu m2 : roleMenu) {
				if (m1.getId() == m2.getId()) {
					checkArr = SysConstast.CODE_ONE+"";
					break;
				}
			}
			Integer id = m1.getId();
			Integer pid = m1.getPid();
			String title = m1.getTitle();
			Boolean spread = m1.getSpread() == SysConstast.SPREAD_TRUE ? true : false;
			data.add(new TreeNode(id, pid, title, spread, checkArr));
		}
		return new DataGridView(data);
	}

    	//角色管理-分配菜单  保存角色和菜单的关系
	@Override
	public void saveRoleMenu(RoleVo roleVo) {
		Integer rid=roleVo.getRoleid();
		Integer [] mids=roleVo.getIds();
		//根据rid删除sys_role_menu里面所有数据
		roleMapper.deleteRolMenuByRid(rid);
		//保存角色和菜单的关系
		for (Integer mid : mids) {
			this.roleMapper.insertRoleMenu(rid,mid);
		}
	}

}
