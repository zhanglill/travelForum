package com.zl.travel.dao;


import java.util.List;

import com.zl.travel.domain.Questions;
import com.zl.travel.domain.Topic;

public interface QuestionsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Questions record);

    int insertSelective(Questions record);

    Questions selectById(Integer id);
    
    Questions selectOneById(Integer id);

    List<Questions> myQuestionList(Integer id);
    
    List<Questions> listQuestionsAndUsers();
    
    List<Questions> listQuestionsAndUsersByCount();
    
    List<Questions> listQuestionsAndUsersByClick();
    
    List<Questions> listQuestionsAndUsersNoReply();
    
    List<Questions> listQuestionsAndUsersNoReplyByClick();
    
    List<Questions> listQuestionsAndUser();

    List<Questions>  listMostCommentsQuestions();

    List<Questions> listUserPersonalQuestions(Integer userId);
    
    int updateByPrimaryKeySelective(Questions record);

    int updateByPrimaryKeyWithBLOBs(Questions record);

    int updateByPrimaryKey(Questions record);

    List<Questions> getAllQuestions();

    int clickAddOne(Integer id);

    //获取主题总数
    int getQuestionsNum();
    
    List<Questions> listQuestionsAndUsersOfTab(Integer tabId);
    
}