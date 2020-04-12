package com.qst.manger.pojoVo;

import com.qst.manger.pojo.Role;

public class RoleVo extends Role {
    private Integer page;
    private Integer limit;

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
