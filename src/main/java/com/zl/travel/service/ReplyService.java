package com.zl.travel.service;

import java.util.List;

import com.zl.travel.domain.QuestionsReply;
import com.zl.travel.domain.Reply;

public interface ReplyService {

    List<Reply> getRepliesOfTopic(Integer topicId);

    boolean addReply(Reply reply);

    int repliesNum(Integer topicId);
    
    
    // 问答模块回复
    
    List<QuestionsReply> getRepliesOfQuestions(Integer questionsId);

    boolean addQuestionsReply(QuestionsReply reply);

    int questionzReplyNum(Integer topicId);
}
