package com.zl.travel.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.zl.travel.domain.QuestionsReply;
import com.zl.travel.domain.Reply;
import com.zl.travel.service.impl.ReplyServiceImpl;
import com.zl.travel.service.impl.UserServiceImpl;

/**
 * 回复相关控制类
 */
@Controller
@ResponseBody
public class ReplyController {

	@Autowired
	public ReplyServiceImpl replyService;

	@Autowired
	public UserServiceImpl userService;

	/**
	 * 添加评论
	 */
	@RequestMapping(value = "/reply/add", method = RequestMethod.POST)
	public ModelAndView addReply(HttpServletRequest request, HttpSession session) {
		ModelAndView view = new ModelAndView();
		// 未登陆
		if (session.getAttribute("userId") == null) {
			view = new ModelAndView("jsp/login");
			return view;
		}

		// 获取参数
		Integer topicId = Integer.parseInt(request.getParameter("topicId"));
		Integer replyUserId = Integer.parseInt(request.getParameter("replyUserId"));
		String content = request.getParameter("content");

		// 创建reply
		Reply reply = new Reply();
		reply.setTopicId(topicId);
		reply.setReplyUserId(replyUserId);
		reply.setContent(content);
		reply.setCreateTime(new Date());
		reply.setUpdateTime(new Date());

		// 添加
		boolean ifSucc = replyService.addReply(reply);

		// 添加积分
		boolean ifSuccAddCredit = userService.addCredit(1, replyUserId);

		// 新建视图
		view = new ModelAndView("redirect:/topic/" + topicId);
		return view;
	}

	/**
	 * 添加评论
	 */
	@RequestMapping(value = "/getReplyById/{id}", method = RequestMethod.GET)
	public Map<String, Object> getReplyById(@PathVariable Integer id) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		List<Reply> reply = replyService.getRepliesOfTopic(id);
		rtnMap.put("data", reply);
		return rtnMap;

	}

	/**
	 * 添加评论
	 */
	@RequestMapping(value = "/questionReply/add", method = RequestMethod.POST)
	public ModelAndView addQuestionsReply(HttpServletRequest request, HttpSession session) {
		ModelAndView view = new ModelAndView();
		// 未登陆
		if (session.getAttribute("userId") == null) {
			view = new ModelAndView("jsp/login");
			return view;
		}

		// 获取参数
		Integer questionId = Integer.parseInt(request.getParameter("questionId"));
		Integer replyUserId = Integer.parseInt(request.getParameter("replyUserId"));
		String content = request.getParameter("content");

		// 创建reply
		QuestionsReply questionsReply = new QuestionsReply();
		questionsReply.setQuestionsId(questionId);
		questionsReply.setReplyUserId(replyUserId);
		questionsReply.setContent(content);
		questionsReply.setCreateTime(new Date());
		questionsReply.setUpdateTime(new Date());

		// 添加
		boolean ifSucc = replyService.addQuestionsReply(questionsReply);

		// 添加积分
		boolean ifSuccAddCredit = userService.addCredit(1, replyUserId);

		// 新建视图
		view = new ModelAndView("redirect:/question/questions/" + questionId);
		return view;
	}

	/**
	 * 查询评论
	 */
	@RequestMapping(value = "/getQuestionReplyById/{id}", method = RequestMethod.GET)
	public Map<String, Object> getQuestionReplyById(@PathVariable Integer id) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		List<Reply> reply = replyService.getRepliesOfTopic(id);
		rtnMap.put("data", reply);
		return rtnMap;

	}
}
