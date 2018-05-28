package com.zl.travel.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zl.travel.dao.QuestionsReplyMapper;
import com.zl.travel.dao.ReplyMapper;
import com.zl.travel.domain.QuestionsReply;
import com.zl.travel.domain.Reply;
import com.zl.travel.service.ReplyService;

@Service
public class ReplyServiceImpl implements ReplyService {

    @Autowired
    public ReplyMapper replyDao;
    
    @Autowired
    public QuestionsReplyMapper questionsReplyMapper;

    public List<Reply> getRepliesOfTopic(Integer topicId) {
        return replyDao.getRepliesOfTopic(topicId);
    }

    public boolean addReply(Reply reply) {
        return replyDao.insert(reply)>0;
    }

    public int repliesNum(Integer topicId) {
        return replyDao.getRepliesNum(topicId);
    }

	@Override
	public List<QuestionsReply> getRepliesOfQuestions(Integer questionsId) {
		return questionsReplyMapper.getRepliesOfQuestions(questionsId);
	}

	@Override
	public boolean addQuestionsReply(QuestionsReply reply) {
		return questionsReplyMapper.insert(reply)>0;
	}

	@Override
	public int questionzReplyNum(Integer topicId) {
        return questionsReplyMapper.getQuestionsRepliesNum(topicId);
	}
}
