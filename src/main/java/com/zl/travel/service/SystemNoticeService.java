package com.zl.travel.service;

import java.util.List;
import java.util.Map;

import com.zl.travel.domain.SystemNotice;

public interface SystemNoticeService {


	boolean addSystemNotice(SystemNotice record);

	SystemNotice selectById(Integer id);

	List<SystemNotice> listSystemNotice(Map<String, Object> params);
	
	boolean updateByPrimaryKeySelective(SystemNotice record);
	
	boolean deleteByPrimaryKey(Integer id);

	int getSystemNoticeNum();
	

}
