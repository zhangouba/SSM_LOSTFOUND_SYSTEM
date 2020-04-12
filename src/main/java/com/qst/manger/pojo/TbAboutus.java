package com.qst.manger.pojo;

import java.io.Serializable;
import java.util.Date;

public class TbAboutus implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -290925330503391441L;

	private Long id;

    private String title;

    private String images;

    private Date created;

    private Date updated;

    private String usText;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images == null ? null : images.trim();
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

    public String getUsText() {
        return usText;
    }

    public void setUsText(String usText) {
        this.usText = usText == null ? null : usText.trim();
    }
}