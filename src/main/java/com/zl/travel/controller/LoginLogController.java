package com.zl.travel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.zl.travel.service.impl.LoginLogServiceImpl;

/**
 * 登录日志控制类
 */
@Controller
public class LoginLogController {

    @Autowired
    public LoginLogServiceImpl loginLogService;


}

