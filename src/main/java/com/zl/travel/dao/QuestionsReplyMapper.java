package com.zl.travel.dao;


import java.util.List;

import com.zl.travel.domain.QuestionsReply;
import com.zl.travel.domain.Reply;

public interface QuestionsReplyMapper {
    int deleteByPrimaryKey(Long id);

    int insert(QuestionsReply record);

    int insertSelective(QuestionsReply record);

    Reply selectByPrimaryKey(Long id);

    List<QuestionsReply> getRepliesOfQuestions(Integer QuestionsId);

    int updateByPrimaryKeySelective(QuestionsReply record);

    int updateByPrimaryKeyWithBLOBs(QuestionsReply record);

    int updateByPrimaryKey(QuestionsReply record);

    int getQuestionsRepliesNum(Integer topicId);

}