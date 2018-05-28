package com.zl.travel.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zl.travel.dao.LoginLogMapper;
import com.zl.travel.domain.LoginLog;
import com.zl.travel.service.LoginLogService;

@Service
public class LoginLogServiceImpl implements LoginLogService {

    @Autowired
    public LoginLogMapper loginLogDao;

    public boolean addLog(LoginLog log) {

        if(loginLogDao.insert(log)>0){
            return true;
        }else {
            return false;
        }
    }
}
