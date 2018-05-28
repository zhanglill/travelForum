package com.zl.travel.domain;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 用户信息实体类
 */
public class User {

    private LoginLog log;

    // id
    private Integer id;

    // 用户名
    private String username;

    // 密码
    private String password;

    // 邮箱
    private String email;

    // 手机号
    private String phoneNum;

    // 注册时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    // 最新资料修改时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

    // 积分
    private Integer credit;

    // 头像
    private String avatar;

    // 类别（管理员、用户）
    private Byte type;

    // 删除标志
    private String delFlag;

    private String isLocked;

    @Override
    public String toString() {
        return "User{" + "id=" + id + ",username=" + username + ",email=" + email + ",phoneNum=" + phoneNum
                + ",createTime=" + createTime + ",updateTime=" + updateTime + ",credit=" + credit + ",avatar=" + avatar
                + ",type=" + type + "}";
    }

    public LoginLog getLog() {
        return log;
    }

    public void setLog(LoginLog log) {
        this.log = log;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum == null ? null : phoneNum.trim();
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

    public Integer getCredit() {
        return credit;
    }

    public void setCredit(Integer credit) {
        this.credit = credit;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar == null ? null : avatar.trim();
    }

    public Byte getType() {
        return type;
    }

    public void setType(Byte type) {
        this.type = type;
    }

    public String getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag;
    }

    public String getIsLocked() {
        return isLocked;
    }

    public void setIsLocked(String isLocked) {
        this.isLocked = isLocked;
    }

    public String getLocalCreateTime() {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-M-dd HH:mm");// 设置日期格式
        String date = df.format(this.createTime);
        return date;
    }

    public String getLocalUpdateTime() {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-M-dd HH:mm");// 设置日期格式
        String date = df.format(updateTime);
        return date;
    }
}