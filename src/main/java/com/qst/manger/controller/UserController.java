package com.qst.manger.controller;

import com.qst.manger.pojoVo.UserVo;
import com.qst.manger.service.RoleService;
import com.qst.manger.service.UserService;
import com.qst.manger.utils.DataGridView;
import com.qst.manger.utils.ResultObj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 用户管理控制器
 * 
 * @author LJH
 *
 */
@RestController
@RequestMapping("user")
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private RoleService roleService;
	/**
	 * 加载用户列表返回DataGridView
	 * loadAllUser
	 */
	@RequestMapping("loadAllUser")
	public DataGridView loadAllUser(UserVo UserVo) {
		//System.out.println("21312312312321312312312");
		return this.userService.queryAllUser(UserVo);
	}

	

	
	/**
	 * 修改用户
	 */
	@RequestMapping("updateUser")
	public ResultObj updateUser(UserVo UserVo) {
		try {

			this.userService.updateUser(UserVo);
			return ResultObj.UPDATE_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ResultObj.UPDATE_ERROR;
		}
	}
	
	
	/**
	 * 删除用户
	 */
	@RequestMapping("deleteUser")
	public ResultObj deleteUser(UserVo UserVo) {
		try {
			this.userService.deleteUser(UserVo.getId());
			return ResultObj.DELETE_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ResultObj.DELETE_ERROR;
		}
	}
	
	/**
	 * 批量删除用户
	 */
	@RequestMapping("deleteBatchUser")
	public ResultObj deleteBatchUser(UserVo UserVo) {
		try {
			this.userService.deleteBatchUser(UserVo.getIds());
			return ResultObj.DELETE_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ResultObj.DELETE_ERROR;
		}
	}


	//分配角色菜单列表
	@RequestMapping("initUserRole")
	public DataGridView initUserRole(UserVo UserVo) {

		return userService.queryUserRole(UserVo.getId());
	}

  //保存用户角色分配
	@RequestMapping("saveUserRole")
	public ResultObj saveUserRole(UserVo userVo){
		try {
			this.userService.saveUserRole(userVo);
			return ResultObj.UPDATE_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ResultObj.UPDATE_ERROR;
		}
	}




}
