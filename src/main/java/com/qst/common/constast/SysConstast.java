package com.qst.common.constast;

public interface SysConstast {
    final String USER_LOGIN_ERROR_MSG="用户名或密码错误";

    /*id为1则展开*/
    Integer PID = 1;

    //是否可用
    Integer AVAILABLE_TRUE = 1;
    Integer AVAILABLE_FALSE = 2;

    //用户类型
    Integer USER_SUPER_TYPE=1;
    Integer USER_NORMALLY_TYPE=2;

    //是否可扩展
    Integer SPREAD_TRUE=1;
    Integer SPREAD_FALSE=2;
    Integer NEED_EXTENSION_PID = 1;

    /*操作状态*/
    String ADD_SUCCESS="添加成功";
    String ADD_ERROR="添加失败";

    String UPDATE_SUCCESS="更新成功";
    String UPDATE_ERROR="更新失败";

    String DELETE_SUCCESS="删除成功";
    String DELETE_ERROR="删除失败";

    String RESET_SUCCESS="重置成功";
    String RESET_ERROR="重置失败";

    String DISPATCH_SUCCESS="分配成功";
    String DISPATCH_ERROR="分配失败";

    String CHECK_SUCCESS="审核成功";
    String CHECK_ERROR="审核失败";

    Integer CODE_SUCCESS=0;
    Integer CODE_ERROR=-1;

    Integer CODE_ZERO = 0;
    Integer CODE_ONE=1;
    String DEFAULT_PWD = "123456";
    //临时文件标记
    String FILE_UPLOAD_TEMP =  "_temp";
    String DEFAULT_CAR_IMG = "images/defaultcarimage.jpg";
    String CAR_ORDER_CZ = "CZ";
    String CAR_ORDER_JC = "JC";

    //归还状态
    Integer RENT_BACK_FALSE=0;  //未归还
    Integer RENT_BACK_TRUE=1;   //已归还

    //车辆出租状态
    Integer RENT_CAR_TRUE = 0;
    Integer RENT_CAR_FALSE = 1;
    String USER_LOGIN_CODE_ERROR_MSG = "验证码不正确";
}
