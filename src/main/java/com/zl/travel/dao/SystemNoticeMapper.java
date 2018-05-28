package com.zl.travel.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.zl.travel.domain.SystemNotice;

public interface SystemNoticeMapper {

	int insertSelective(SystemNotice record);

	SystemNotice selectById(Integer id);

	List<SystemNotice> listSystemNotice(@Param("params") Map<String, Object> params);
	
	int updateByPrimaryKeySelective(SystemNotice record);
	
	int deleteByPrimaryKey(Integer id);

	int getSystemNoticeNum();
}