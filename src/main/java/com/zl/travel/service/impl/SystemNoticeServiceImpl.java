package com.zl.travel.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zl.travel.dao.SystemNoticeMapper;
import com.zl.travel.domain.SystemNotice;
import com.zl.travel.service.SystemNoticeService;

@Service
public class SystemNoticeServiceImpl implements SystemNoticeService {

	@Autowired
	public SystemNoticeMapper systemNoticeDao;

	public boolean addSystemNotice(SystemNotice record) {
		return systemNoticeDao.insertSelective(record) > 0;
		
	};

	public SystemNotice selectById(Integer id) {
		return systemNoticeDao.selectById(id);
		
	};

	public List<SystemNotice> listSystemNotice(Map<String, Object> params) {
		return systemNoticeDao.listSystemNotice(params);
		
	};
	
	public boolean updateByPrimaryKeySelective(SystemNotice record) {
		return systemNoticeDao.updateByPrimaryKeySelective(record) > 0;
		
	};
	
	public boolean deleteByPrimaryKey(Integer id) {
		return systemNoticeDao.deleteByPrimaryKey(id) > 0;
		
	};

	public int getSystemNoticeNum() {
		return systemNoticeDao.getSystemNoticeNum();
		
	};
	
}
