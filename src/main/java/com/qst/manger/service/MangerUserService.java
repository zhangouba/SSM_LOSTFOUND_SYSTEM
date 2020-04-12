package com.qst.manger.service;

import com.qst.common.pojo.LostResult;
import com.qst.manger.pojo.TbUsers;
import org.springframework.stereotype.Service;

@Service
public interface MangerUserService {
	//管理员登录
	public TbUsers userLogin(TbUsers tbUsers);

	//密码修改
	public LostResult changePwd(String oldPwd, String newPwd);

	LostResult checkuser(String username);

	void adduser(TbUsers users);

    void updateMySelfDate(TbUsers tbUsers);

	void updateUserData(TbUsers tbUsers);

    void changMyPhoto(TbUsers tbUsers1);

	TbUsers seleteSession(Integer id);

    TbUsers checkEmail(String email);

	void resetPwd(String email,String password);
}
