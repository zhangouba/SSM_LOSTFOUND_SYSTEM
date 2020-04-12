package com.qst.manger.mapper;

import com.qst.manger.pojo.TbUsers;
import com.qst.manger.pojo.TbUsersExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TbUsersMapper {
    long countByExample(TbUsersExample example);

    int deleteByExample(TbUsersExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TbUsers record);

    int insertSelective(TbUsers record);

    List<TbUsers> selectByExample(TbUsersExample example);

    TbUsers selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TbUsers record, @Param("example") TbUsersExample example);

    int updateByExample(@Param("record") TbUsers record, @Param("example") TbUsersExample example);

    int updateByPrimaryKeySelective(TbUsers record);

    int updateByPrimaryKey(TbUsers record);

    //查询用户
    List<TbUsers> queryAllUser(TbUsers tbUsers);

    void saveUserRole(@Param("uid") Integer userid,@Param("rid") Integer ids);

    void updateTbUserType(@Param("id") Integer userid,@Param("type") Integer type);

    //修改用户密码
    void updateUserData(Integer id, String password);

    TbUsers checkEmail(String email);

    void resetPwd(TbUsers tbUsers);
}