package com.zl.travel.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zl.travel.dao.QuestionsMapper;
import com.zl.travel.domain.Questions;
import com.zl.travel.domain.Topic;
import com.zl.travel.service.QuestionsService;

@Service
public class QuestionsServiceImpl implements QuestionsService {

    @Autowired
    private QuestionsMapper questionsMapper;
	/*private List<Questions> question;*/

    /**
     * 获取全部主题
     */
    public List<Questions> getAllQuestions() {
        return questionsMapper.getAllQuestions();
    }

    public List<Questions> myQuestionList(Integer id) {
    	return questionsMapper.myQuestionList(id);
    }
    
    /**
     * 获取指定id主题
     */
    public Questions selectById(Integer id) {
    	return questionsMapper.selectById(id);
    }
    
    /**
     * 获取指定id主题
     */
    public Questions selectOneById(Integer id) {
    	return questionsMapper.selectOneById(id);
    }

    /**
     * 热门话题
     */
    public List<Questions> listMostCommentsQuestions() {
        return questionsMapper.listMostCommentsQuestions();
    }

    /**
     * 用户个人发表的文章
     */
    public List<Questions> listUserPersonalQuestions(Integer userId) {
    	return questionsMapper.listUserPersonalQuestions(userId);
    }
    
    /**
     * 发表
     */
    public boolean addQuestions(Questions Questions) {
        return questionsMapper.insert(Questions)>0;
    }

    /**
     * 增加点击量
     */
    public boolean clickAddOne(Integer id) {
        return questionsMapper.clickAddOne(id)>0;
    }

    /**
     * 获取话题数
     */
    public int getQuestionsNum() {
        return questionsMapper.getQuestionsNum();
    }

    public List<Questions> listQuestionsAndUsers() {
        return questionsMapper.listQuestionsAndUsers();
    }
    
    public List<Questions> listQuestionsAndUsersByCount() {
        return questionsMapper.listQuestionsAndUsersByCount();
    }
    
    public List<Questions> listQuestionsAndUsersByClick() {
        return questionsMapper.listQuestionsAndUsersByClick();
    }
    
    public List<Questions> listQuestionsAndUsersNoReply() {
        return questionsMapper.listQuestionsAndUsersNoReply();
    }
    
    public List<Questions> listQuestionsAndUsersNoReplyLimit() {
        return questionsMapper.listQuestionsAndUsersNoReplyLimit();
    }
    
    public List<Questions> listQuestionsAndUsersNoReplyByClick() {
        return questionsMapper.listQuestionsAndUsersNoReplyByClick();
    }
    
    public List<Questions> listQuestionsAndUsersNoReplyByClickLimit() {
        return questionsMapper.listQuestionsAndUsersNoReplyByClickLimit();
    }
    
    public List<Questions> listQuestionsAndUser() {
        return questionsMapper.listQuestionsAndUser();
    }
    
    public boolean deleteByPrimaryKey(Integer id) {
    	return questionsMapper.deleteByPrimaryKey(id)>0;
    }

    public boolean updateByPrimaryKeySelective(Questions record) {
    	return questionsMapper.updateByPrimaryKeySelective(record) > 0;
    }
    
    public List<Questions> listQuestionsAndUsersOfTab(Integer tabId) {
        return questionsMapper.listQuestionsAndUsersOfTab(tabId);
    }
}
