package com.zl.travel.domain;

import java.util.Date;

/**
 * 标注实体类
 * 
 * @author Administrator
 *
 */
public class Label {
	private String id;

	private String labelName;

	private Date date;

	private String place;

	private String desc;

	private String pointX;

	private String pointY;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getLabelName() {
		return labelName;
	}

	public void setLabelName(String labelName) {
		this.labelName = labelName;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getPointX() {
		return pointX;
	}

	public void setPointX(String pointX) {
		this.pointX = pointX;
	}

	public String getPointY() {
		return pointY;
	}

	public void setPointY(String pointY) {
		this.pointY = pointY;
	}

}
