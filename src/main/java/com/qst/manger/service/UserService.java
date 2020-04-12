package com.qst.manger.service;

import com.qst.manger.pojoVo.UserVo;
import com.qst.manger.utils.DataGridView;
import org.springframework.stereotype.Service;

@Service
public interface UserService {
      //LOGIN


    /**
     * 查询所有用户返回
     * List<User>
     */

    public DataGridView queryAllUser(UserVo userVo);



    /**
     * 修改用户
     * @param userVo
     */
    public void updateUser(UserVo userVo);

    /**
     * 根据id删除用户
     * @param userid
     */
    public void deleteUser(Integer userid);
    /**
     * 批量删除用户
     * @param ids
     */
    public void deleteBatchUser(Integer[] ids);



    DataGridView queryUserRole(Integer userid);

    void saveUserRole(UserVo userVo);
}
