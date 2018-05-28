package com.zl.travel.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zl.travel.dao.TopicMapper;
import com.zl.travel.domain.Topic;
import com.zl.travel.service.TopicService;

@Service
public class TopicServiceImpl implements TopicService {

    @Autowired
    public TopicMapper topicDao;

    /**
     * 获取全部主题
     */
    public List<Topic> getAllTopics() {
        return topicDao.getAllTopics();
    }

    /**
     * 获取指定id主题
     */
    public Topic selectById(Integer id) {
        Topic topic = topicDao.selectById(id);
        return topic;
    }

    public Topic selectTopicById(Integer id) {
        Topic topic = topicDao.selectTopicById(id);
        return topic;
    };

    /**
     * 热门话题
     */
    public List<Topic> listMostCommentsTopics() {
        return topicDao.listMostCommentsTopics();
    }

    /**
     * 用户个人发表的文章
     */
    public List<Topic> listUserPersonalTopics(Integer userId) {
        return topicDao.listUserPersonalTopics(userId);
    }

    /**
     * 用户个人发表的文章
     */
    public List<Topic> listUserPersonalDraftTopics(Integer userId) {
        return topicDao.listUserPersonalDraftTopics(userId);
    }

    /**
     * 获取用户转发的文章
     */
    public List<Topic> listUserTransmitTopics(Integer userId) {
        return topicDao.listUserTransmitTopics(userId);
    };

    /**
     * 获取用户收藏的文章
     */
    public List<Topic> listUserCollectTopics(Integer userId) {
        return topicDao.listUserCollectTopics(userId);
    };

    /**
     * 发表
     */
    public boolean addTopic(Topic topic) {
        return topicDao.insert(topic) > 0;
    }

    /**
     * 增加点击量
     */
    public boolean clickAddOne(Integer id) {
        return topicDao.clickAddOne(id) > 0;
    }

    /**
     * 获取话题数
     */
    public int getTopicsNum() {
        return topicDao.getTopicsNum();
    }

    public List<Topic> listTopicsAndUsers() {
        return topicDao.listTopicsAndUsers();
    }

    public List<Topic> listAllTopicsAndUsers() {
        List<Topic> topic = topicDao.listAllTopicsAndUsers();
        return topicDao.listAllTopicsAndUsers();
    }

    /**
     * 获取全部主题及用户信息 用于渲染首页(模糊查询)
     */
    public List<Topic> listTopicsAndUsersByParam(String param) {
        return topicDao.listTopicsAndUsersByParam(param);
    }

    public List<Topic> listTopicsAndUsersOfTab(Integer tabId) {
        return topicDao.listTopicsAndUsersOfTab(tabId);
    }

    public boolean deleteByPrimaryKey(Integer id) {
        return topicDao.deleteByPrimaryKey(id) > 0;
    }
    
    public boolean updateByPrimaryKeySelective(Topic record) {
    	return topicDao.updateByPrimaryKeySelective(record) > 0;
    }
    
    
}
