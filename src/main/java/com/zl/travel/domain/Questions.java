package com.zl.travel.domain;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 问答实体类
 */
public class Questions {

	// 板块信息
    private Tab tab;
    
	private User user;

	private Integer countReplies;

	private Integer id;

	private Integer userId;

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date createTime;

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date updateTime;

	private Integer click;

	private String title;

	private String content;

	private String delFlag;

	// 板块id
    private Integer tabId;
    
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Integer getCountReplies() {
		return countReplies;
	}

	public void setCountReplies(Integer countReplies) {
		this.countReplies = countReplies;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Integer getClick() {
		return click;
	}

	public void setClick(Integer click) {
		this.click = click;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

	public String getLocalCreateTime() {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-M-dd HH:mm:ss");// 设置日期格式
		String date = df.format(this.createTime);
		return date;
	}

	public String getLocalUpdateTime() {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-M-dd HH:mm:ss");// 设置日期格式
		String date = df.format(updateTime);
		return date;
	}

	public Tab getTab() {
		return tab;
	}

	public void setTab(Tab tab) {
		this.tab = tab;
	}

	public Integer getTabId() {
		return tabId;
	}

	public void setTabId(Integer tabId) {
		this.tabId = tabId;
	}

}