package com.zl.travel.service;

import java.util.List;

import com.zl.travel.domain.Tab;

public interface TabService {
	
    List<Tab> getAllTabs();
    
    List<Tab> getQuestionTabs();

    Tab getByTabNameEn(String tabName);    
 
 	boolean insertSelective(Tab record);   

 	boolean updateByPrimaryKeySelective(Tab record);

 	Tab selectByPrimaryKey(Integer id);

 	boolean deleteByPrimaryKey(Integer id);
}
