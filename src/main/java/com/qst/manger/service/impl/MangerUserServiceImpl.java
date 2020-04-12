package com.qst.manger.service.impl;

import com.qst.common.pojo.LostResult;
import com.qst.common.utils.WebUtils;
import com.qst.manger.mapper.TbUsersMapper;
import com.qst.manger.pojo.TbUsers;
import com.qst.manger.pojo.TbUsersExample;
import com.qst.manger.pojo.TbUsersExample.Criteria;
import com.qst.manger.service.MangerUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
@Service
public class MangerUserServiceImpl implements MangerUserService {

	@Autowired
	private TbUsersMapper userMapper;

	
	//管理员登录
	@Override
	public TbUsers userLogin(TbUsers tbUsers) {
		
		//校验

			
			TbUsersExample example = new TbUsersExample();

			Criteria createCriteria = example.createCriteria();

			createCriteria.andUsernameEqualTo(tbUsers.getUsername());

			List<TbUsers> list = userMapper.selectByExample(example);
			//获取管理员
			if (list.size() == 0) {
				return new TbUsers();
			} else {
				TbUsers admin = list.get(0);
				return admin;

			}
	}

	@Override
	public LostResult changePwd(String oldPwd, String newPwd) {
		
		//获取管理员
		TbUsersExample example = new TbUsersExample();
		Criteria createCriteria = example.createCriteria();
		createCriteria.andUsernameEqualTo("admin");
		List<TbUsers> list = userMapper.selectByExample(example);
		TbUsers admin = list.get(0);
		
		//密码加密
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		if(!passwordEncoder.matches(oldPwd, admin.getPassword())){
			return LostResult.build(400, "原密码输入错误!");
		}
		
		//否则更新密码
		String encode = passwordEncoder.encode(newPwd);
		admin.setPassword(encode);
		admin.setUpdated(new Date());
		userMapper.updateByPrimaryKeySelective(admin);
		return LostResult.ok();
	}

	@Override
	public LostResult checkuser(String username) {

		TbUsersExample example = new TbUsersExample();
		Criteria createCriteria = example.createCriteria();
		createCriteria.andUsernameEqualTo(username);
		List<TbUsers> list = userMapper.selectByExample(example);

		if (list.size()==0){
			return LostResult.build(200,"恭喜您可以使用同");
		}
		else {
			return LostResult.build(100,"用户已经存在");
		}
	}

	@Override
	public void adduser(TbUsers users) {
		users.setCreated(new Date());
		users.setUpdated(new Date());
		//0 用户
		//1 管理员
		//2超级管理员
		//3 OA
		//设置默认权限为用户
		users.setType(0);
		userMapper.insertSelective(users);
		//设置tb_role+suers表的权限
		TbUsersExample example = new TbUsersExample();
		Criteria createCriteria = example.createCriteria();
		createCriteria.andUsernameEqualTo(users.getUsername());
		List<TbUsers> list = userMapper.selectByExample(example);
         TbUsers tbUsers= list.get(0);

		userMapper.saveUserRole( tbUsers.getId(),0);
	}

	//修改个人资料
	@Override
	public void updateMySelfDate(TbUsers tbUsers) {
		userMapper.updateByPrimaryKeySelective(tbUsers);

		//更新资料以后session也需要更新
		TbUsers tbUsers1=userMapper.selectByPrimaryKey(tbUsers.getId());
		WebUtils.getHttpSession().setAttribute("user",tbUsers1);
	}

	@Override
	public void updateUserData(TbUsers tbUsers) {
		userMapper.updateByPrimaryKeySelective(tbUsers);
		TbUsers tbUsers1=	userMapper.selectByPrimaryKey(tbUsers.getId());
		WebUtils.getHttpSession().setAttribute("user",tbUsers1);
	}

	@Override
	public void changMyPhoto(TbUsers tbUsers1) {
		userMapper.updateByPrimaryKeySelective(tbUsers1);
	}

	@Override
	public TbUsers seleteSession(Integer id) {
		return userMapper.selectByPrimaryKey(id);
	}

	@Override
	public TbUsers checkEmail(String email) {
		return userMapper.checkEmail(email);
	}

	@Override
	public void resetPwd(String email,String password) {
		TbUsers tbUsers=new TbUsers();
		tbUsers.setPassword(password);
		tbUsers.setPassword(email);
		userMapper.resetPwd(tbUsers);
	}

}
