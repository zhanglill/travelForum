package com.zl.travel.dao;

import java.util.List;

import com.zl.travel.domain.Topic;

public interface TopicMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(Topic record);

	int insertSelective(Topic record);

	Topic selectById(Integer id);
	
	Topic selectTopicById(Integer id);

	List<Topic> listTopicsAndUsers();
	
	
	List<Topic> listAllTopicsAndUsers();

	/* 模糊查询 */
	List<Topic> listTopicsAndUsersByParam(String params);

	List<Topic> listTopicsAndUsersOfTab(Integer tabId);

	List<Topic> listMostCommentsTopics();

	List<Topic> listUserPersonalTopics(Integer userId);
	
	List<Topic> listUserPersonalDraftTopics(Integer userId);

	List<Topic> listUserTransmitTopics(Integer userId);

	List<Topic> listUserCollectTopics(Integer userId);

	int updateByPrimaryKeySelective(Topic record);

	int updateByPrimaryKeyWithBLOBs(Topic record);

	int updateByPrimaryKey(Topic record);

	List<Topic> getAllTopics();

	int clickAddOne(Integer id);

	// 获取主题总数
	int getTopicsNum();
}