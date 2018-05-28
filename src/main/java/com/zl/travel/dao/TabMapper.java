package com.zl.travel.dao;


import java.util.List;

import com.zl.travel.domain.Tab;

public interface TabMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Tab record);

    int insertSelective(Tab record);

    Tab selectByPrimaryKey(Integer id);

    Tab getByTabNameEn(String tabName);

    int updateByPrimaryKeySelective(Tab record);

    int updateByPrimaryKey(Tab record);

    List<Tab> getAllTabs();
}