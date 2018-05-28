package com.zl.travel.service;

import java.util.List;

import com.zl.travel.domain.Tab;
import com.zl.travel.domain.Topic;

public interface TopicService {

    /**
     * 获取全部主题
     */
    List<Topic> getAllTopics();

    /**
     * 获取全部主题及用户信息 用于渲染首页
     */
    List<Topic> listTopicsAndUsers();

    List<Topic> listAllTopicsAndUsers();

    /**
     * 获取全部主题及用户信息 用于渲染首页(模糊查询)
     */
    List<Topic> listTopicsAndUsersByParam(String param);

    /**
     * 获取用户原创的文章
     */
    List<Topic> listUserPersonalTopics(Integer userId);

    /**
     * 获取用户原创的文章
     */
    List<Topic> listUserPersonalDraftTopics(Integer userId);

    /**
     * 获取用户转发的文章
     */
    List<Topic> listUserTransmitTopics(Integer userId);

    /**
     * 获取用户收藏的文章
     */
    List<Topic> listUserCollectTopics(Integer userId);

    /**
     * 获取最多评论主题列表
     * 
     * @return
     */
    List<Topic> listMostCommentsTopics();

    /**
     * 获取全部主题及用户信息 用于渲染板块页面
     */
    List<Topic> listTopicsAndUsersOfTab(Integer tabId);

    /**
     * 获取指定ID主题
     */
    Topic selectById(Integer id);

    Topic selectTopicById(Integer id);

    /**
     * 新建主题
     */
    boolean addTopic(Topic topic);

    /**
     * 点击量加一
     */
    boolean clickAddOne(Integer id);

    /**
     * 获取主题总数
     */
    int getTopicsNum();

    boolean deleteByPrimaryKey(Integer id);
    
    boolean updateByPrimaryKeySelective(Topic record);

}
