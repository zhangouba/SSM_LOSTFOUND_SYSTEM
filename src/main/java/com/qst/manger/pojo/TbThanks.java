package com.qst.manger.pojo;

import java.io.Serializable;
import java.util.Date;

public class TbThanks implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = -3641213418674119813L;

	private Long id;

    private String title;

    private String images;

    private Integer letterView;

    private Date publishTime;

    private Date created;

    private Date updated;

    private String thanksText;

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

    public Integer getLetterView() {
        return letterView;
    }

    public void setLetterView(Integer letterView) {
        this.letterView = letterView;
    }

    public Date getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
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

    public String getThanksText() {
        return thanksText;
    }

    public void setThanksText(String thanksText) {
        this.thanksText = thanksText == null ? null : thanksText.trim();
    }
}