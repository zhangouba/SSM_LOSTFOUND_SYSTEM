package com.qst.manger.mapper;

import com.qst.manger.pojo.Role;
import com.qst.manger.pojoVo.RoleVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoleMapper {
	int deleteByPrimaryKey(Integer roleid);

	int insert(Role record);

	int insertSelective(Role record);

	Role selectByPrimaryKey(Integer roleid);

	int updateByPrimaryKeySelective(Role record);

	int updateByPrimaryKey(Role record);

	/**
	 * 查询角色
	 */
	List<Role> queryAllRole(RoleVo roleVo);

	/**
	 * 根据角色id删除tb_role_role里面的数据
	 * 
	 * @param roleid
	 */
	void deleteRolMenuByRid(Integer roleid);

	/**
	 * 根据角色id删除tb_role_user里面的数据
	 * 
	 * @param roleid
	 */
	void deleteRoleUserByRid(Integer roleid);

	/**
	 * 保存角色和菜单的关系 tb_role_menu
	 * @param rid
	 * @param mid
	 */
	void insertRoleMenu(@Param("rid") Integer rid, @Param("mid") Integer mid);
	

	/**
	 * 根据用户id删除tb_role_users里面的数据
	 * @param userid
	 */
	void deleteRoleUserByUid(@Param("uid") Integer userid);

	/**
	 * 根据用户ID查询角色
	 * @param available
	 * @param userid
	 * @return
	 */
	List<Role> queryRoleByUid(@Param("available") Integer available, @Param("uid") Integer userid);

}