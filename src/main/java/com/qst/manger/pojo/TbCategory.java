package com.qst.manger.pojo;

import java.io.Serializable;
import java.util.Date;

public class TbCategory implements Serializable{

	/**
	 * 
	 */
	private String lostDATE;

    public String getLostDATE() {
        return lostDATE;
    }

    public void setLostDATE(String lostDATE) {
        this.lostDATE = lostDATE;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    private static final long serialVersionUID = 6455040654119398575L;

	private Long id;

    private String categoryName;

    private Date created;

    private Date updated;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName == null ? null : categoryName.trim();
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Date getUpdated() {
        return updated;
    }

    public void setUpdated(Date updated) {
        this.updated = updated;
    }
}