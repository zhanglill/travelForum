package com.zl.travel.service;

import com.zl.travel.domain.LoginLog;

public interface LoginLogService {


    /**
     * 插入一条登录日志
     */
    boolean addLog(LoginLog log);
}
