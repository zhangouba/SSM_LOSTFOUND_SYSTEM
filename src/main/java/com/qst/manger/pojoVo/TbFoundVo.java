package com.qst.manger.pojoVo;

import com.qst.manger.pojo.TbFound;

public class TbFoundVo extends TbFound {
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
    private Long ids[];

    public Long[] getIds() {
        return ids;
    }

    public void setIds(Long[] ids) {
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
