package com.qst.manger.pojoVo;

import com.qst.manger.pojo.TbComment;

public class TbCommentVo extends TbComment {

    /**
     * 分页参数
     */
    private Integer page;
    private Integer limit;




    //接收多个id
    private Integer [] ids;

    public Integer[] getIds() {
        return ids;
    }
    public void setIds(Integer[] ids) {
        this.ids = ids;
    }
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
