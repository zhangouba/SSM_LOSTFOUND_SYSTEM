package com.qst.manger.pojoVo;

import com.qst.manger.pojo.TbUsers;

public class UserVo extends TbUsers {
    private Integer page;
    private Integer limit;


    String code;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    /*接受多个角色id*/
    private Integer ids[];

    public Integer[] getIds() {
        return ids;
    }

    public void setIds(Integer[] ids) {
        this.ids = ids;
    }

    /*分页参数*/
    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }
}
