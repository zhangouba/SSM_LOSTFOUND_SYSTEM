package com.qst.common.pojo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.io.Serializable;
import java.util.List;

/*
 * 分页结果类
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class PageResult implements Serializable{

	private static final long serialVersionUID = 6418469403093199737L;

	private long total;// 总记录数
	private List rows;// 当前记录数
	
	public PageResult() {
	}

	public PageResult(long total, List rows) {
		super();
		this.total = total;
		this.rows = rows;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public List getRows() {
		return rows;
	}

	public void setRows(List rows) {
		this.rows = rows;
	}

}
