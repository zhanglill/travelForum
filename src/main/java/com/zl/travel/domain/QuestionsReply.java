package com.zl.travel.domain;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 回复实体类
 */
public class QuestionsReply {
    private User user;

    private Long id;

    private Integer QuestionsId;

    private Integer replyUserId;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

    private String content;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getQuestionsId() {
        return QuestionsId;
    }

    public void setQuestionsId(Integer questionsId) {
        QuestionsId = questionsId;
    }

    public Integer getReplyUserId() {
        return replyUserId;
    }

    public void setReplyUserId(Integer replyUserId) {
        this.replyUserId = replyUserId;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
    
    public String getLocalCreateTime() {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-M-dd HH:mm:ss");//设置日期格式
        String date = df.format(this.createTime);
        return date;
    }

    public String getLocalUpdateTime() {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-M-dd HH:mm:ss");//设置日期格式
        String date = df.format(updateTime);
        return date;
    }

}