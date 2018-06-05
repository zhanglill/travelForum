package com.zl.travel.service;

import java.util.List;

import com.zl.travel.domain.Questions;
import com.zl.travel.domain.Topic;

public interface QuestionsService {


    /**
     * 获取全部主题
     */
    List<Questions> getAllQuestions();

    /*
     * 个人问答
     */
    List<Questions> myQuestionList(Integer id);
    
    /**
     * 获取全部主题及用户信息 用于渲染首页
     */
     List<Questions> listQuestionsAndUsers();
     
     List<Questions> listQuestionsAndUsersByCount();
     
     List<Questions> listQuestionsAndUsersByClick();
     List<Questions> listQuestionsAndUsersByClickLimit();
     
     List<Questions> listQuestionsAndUsersNoReply();
     List<Questions> listQuestionsAndUsersNoReplyLimit();
     
     List<Questions> listQuestionsAndUsersNoReplyByClick();
     List<Questions> listQuestionsAndUsersNoReplyByClickLimit();
     
     /**
      * 获取全部主题及用户信息 用于渲染首页
      */
      List<Questions> listQuestionsAndUser();

     /**
      * 获取用户个人发表的文章
      */
     List<Questions> listUserPersonalQuestions(Integer userId);
     
    /**
     * 获取最多评论主题列表
     * @return
     */
    List<Questions> listMostCommentsQuestions();

    /**
     * 获取指定ID主题
     */
    Questions selectById(Integer id);
    
    /**
     * 获取指定ID主题
     */
    Questions selectOneById(Integer id);

    /**
     * 新建主题
     */
    boolean addQuestions(Questions questions);

    /**
     * 点击量加一
     */
    boolean clickAddOne(Integer id);

    /**
     * 获取主题总数
     */
    int getQuestionsNum();
    
    boolean deleteByPrimaryKey(Integer id);
    
    boolean updateByPrimaryKeySelective(Questions record);

    List<Questions> listQuestionsAndUsersOfTab(Integer tabId);
    

}
