package com.zl.travel.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zl.travel.dao.TabMapper;
import com.zl.travel.domain.Tab;
import com.zl.travel.service.TabService;

@Service
public class TabServiceImpl implements TabService {

    @Autowired
    public TabMapper tabDao;

    public List<Tab> getAllTabs() {
        return tabDao.getAllTabs();
    }

    public Tab getByTabNameEn(String tabNameEn) {
        return tabDao.getByTabNameEn(tabNameEn);
    }

    public boolean insertSelective(Tab tab) {
    	return tabDao.insertSelective(tab) > 0;
    }

    public boolean updateByPrimaryKeySelective(Tab tab) {
    	return tabDao.updateByPrimaryKeySelective(tab) >0;
    }

    public Tab selectByPrimaryKey(Integer id) {
    	return tabDao.selectByPrimaryKey(id);
    }

    public boolean deleteByPrimaryKey(Integer id) {
    	return tabDao.deleteByPrimaryKey(id)>0;
    }
}
