package com.zl.travel.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zl.travel.domain.Questions;
import com.zl.travel.domain.QuestionsReply;
import com.zl.travel.domain.Reply;
import com.zl.travel.domain.Tab;
import com.zl.travel.domain.Topic;
import com.zl.travel.domain.User;
import com.zl.travel.service.impl.QuestionsServiceImpl;
import com.zl.travel.service.impl.ReplyServiceImpl;
import com.zl.travel.service.impl.TabServiceImpl;
import com.zl.travel.service.impl.UserServiceImpl;

/**
 * 主题相关控制类
 */
@Controller
@RequestMapping("/question")
@ResponseBody
public class QuestionsController {

	@Autowired
	public QuestionsServiceImpl questionsService;

	@Autowired
	public ReplyServiceImpl replyService;

	@Autowired
	public UserServiceImpl userService;

	@Autowired
	public TabServiceImpl tabService;

	// log4j对象
	private final Log log = LogFactory.getLog(getClass());

	/**
	 * 渲染首页 按时间降序排列
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping("/questions/Index")
	public ModelAndView toMain(@RequestParam(required = false, defaultValue = "1", value = "pn") Integer pn,
			Map<String, Object> map, HttpSession session) {

		ModelAndView indexPage = new ModelAndView("jsp/questions-index");

		// 全部主题
		List<Questions> questionList = questionsService.listQuestionsAndUsers();

		// List<Questions> questionList =
		// questionsService.listQuestionsAndUsersByClick();
		List<Questions> questions = new ArrayList<>();
		Questions newQuestion = new Questions();

		for (int i = 0; i < questionList.size(); i++) {
			newQuestion = questionList.get(i);
			if (newQuestion.getContent().length() > 200) {
				String cotnent = newQuestion.getContent().substring(0, 200);
				newQuestion.setContent(cotnent);
			}
			questions.add(newQuestion);
		}

		// 未有评论的问答
		List<Questions> noReply = new ArrayList<>();
		for (int i = 0; i < questionList.size(); i++) {
			if (questionList.get(i).getCountReplies() == 0) {
				for (int j = 0; j < 5; j++) {
					noReply.add(questionList.get(i));
					j++;
				}
			}
			System.out.println(questionList.get(i).getCountReplies());
		}

		List<Tab> tab = tabService.getQuestionTabs();

		// 获取统计信息

		int questionsNum = questionsService.getQuestionsNum();
		// int usersNum = userService.getUserCount();

		// 获取用户信息
		Integer userId = (Integer) session.getAttribute("userId");
		User user = userService.getUserById(userId);

		// 最热问答
		List<Questions> hotestQuestions = questionsService.listMostCommentsQuestions();

		// 用户个人发表的文章
		List<Questions> userPersonalQuestions = questionsService.listUserPersonalQuestions(userId);

		List<User> userByCredit = userService.listUserByCredit();
		indexPage.addObject("userByCredit", userByCredit);
		// indexPage.addObject("pageInfo", pageInfo);
		indexPage.addObject("questions", questions);
		indexPage.addObject("tab", tab);
		indexPage.addObject("noReply", noReply);
		indexPage.addObject("hotestQuestions", hotestQuestions);
		indexPage.addObject("userPersonalQuestions", userPersonalQuestions);

		indexPage.addObject("questionsNum", questionsNum);
		indexPage.addObject("tabMessage", "timeDesc");

		// indexPage.addObject("usersNum", usersNum);

		// indexPage.addObject("user", user);

		return indexPage;
	}

	/**
	 * 渲染首页 按评论数降序排列
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping("/questions/IndexByCount")
	public ModelAndView indexByCount(@RequestParam(required = false, defaultValue = "1", value = "pn") Integer pn,
			HttpSession session) {

		ModelAndView indexPage = new ModelAndView("jsp/questions-index");

		PageHelper.startPage(pn, 5);

		// 按阅读量查询全部主题
		List<Questions> questionList = questionsService.listQuestionsAndUsersByCount();

		// List<Questions> questionList =
		// questionsService.listQuestionsAndUsersByClick();
		List<Questions> questions = new ArrayList<>();
		Questions newQuestion = new Questions();

		for (int i = 0; i < questionList.size(); i++) {
			newQuestion = questionList.get(i);
			if (newQuestion.getContent().length() > 200) {
				String cotnent = newQuestion.getContent().substring(0, 200);
				newQuestion.setContent(cotnent);
			}
			questions.add(newQuestion);
		}

		// 未有评论的问答
		List<Questions> noReply = new ArrayList<>();

		for (int i = 0; i < questions.size(); i++) {
			if (noReply.size() < 6) {
				if (questions.get(i).getCountReplies() == 0) {
					noReply.add(questions.get(i));
				}
			}
			System.out.println(questions.get(i).getCountReplies());
		}

		List<Tab> tab = tabService.getQuestionTabs();

		// 获取统计信息
		int questionsNum = questionsService.getQuestionsNum();
		/*
		 * int usersNum = userService.getUserCount();
		 */
		// 获取用户信息
		Integer userId = (Integer) session.getAttribute("userId");
		User user = userService.getUserById(userId);

		// 最热问答
		List<Questions> hotestQuestions = questionsService.listMostCommentsQuestions();

		// 用户个人发表的文章
		List<Questions> userPersonalQuestions = questionsService.listUserPersonalQuestions(userId);

		List<User> userByCredit = userService.listUserByCredit();

		indexPage.addObject("userByCredit", userByCredit);
		indexPage.addObject("questions", questions);
		// indexPage.addObject("pageInfo", pageInfo);
		indexPage.addObject("tab", tab);
		indexPage.addObject("noReply", noReply);
		indexPage.addObject("hotestQuestions", hotestQuestions);
		indexPage.addObject("userPersonalQuestions", userPersonalQuestions);
		indexPage.addObject("questionsNum", questionsNum);
		indexPage.addObject("tabMessage", "hot");

		/*
		 * indexPage.addObject("usersNum", usersNum);
		 */
		// indexPage.addObject("user", user);

		return indexPage;
	}

	@RequestMapping("/questions/questionNoReply")
	public ModelAndView questionNoReply(HttpSession session) {

		ModelAndView indexPage = new ModelAndView("jsp/questions-noReply");

		// 查询所有未有评论的问答
		List<Questions> questionList = questionsService.listQuestionsAndUsers();
		List<Questions> noReply = new ArrayList<>();
		for (int i = 0; i < questionList.size(); i++) {
			if (questionList.get(i).getCountReplies() == 0) {
				noReply.add(questionList.get(i));
			}
			System.out.println(questionList.get(i).getCountReplies());
		}

		// 截取内容长度
		List<Questions> questions = new ArrayList<>();
		Questions newQuestion = new Questions();

		for (int i = 0; i < questionList.size(); i++) {
			newQuestion = questionList.get(i);
			if (newQuestion.getContent().length() > 200) {
				String cotnent = newQuestion.getContent().substring(0, 200);
				newQuestion.setContent(cotnent);
			}
			questions.add(newQuestion);
		}

		List<Tab> tab = tabService.getQuestionTabs();

		int questionsNum = questionsService.getQuestionsNum();

		// 获取统计信息
		/*
		 * int usersNum = userService.getUserCount();
		 */
		// 获取用户信息
		Integer userId = (Integer) session.getAttribute("userId");
		User user = userService.getUserById(userId);

		// 最热问答
		List<Questions> hotestQuestions = questionsService.listMostCommentsQuestions();

		// 用户个人发表的文章
		List<Questions> userPersonalQuestions = questionsService.listUserPersonalQuestions(userId);

		// 添加问答模块内容

		List<User> userByCredit = userService.listUserByCredit();
		indexPage.addObject("userByCredit", userByCredit);
		indexPage.addObject("questions", questions);
		indexPage.addObject("tab", tab);
		indexPage.addObject("noReply", noReply);
		indexPage.addObject("hotestQuestions", hotestQuestions);
		indexPage.addObject("userPersonalQuestions", userPersonalQuestions);

		indexPage.addObject("questionsNum", questionsNum);
		indexPage.addObject("tabMessage", "timeDesc");
		/*
		 * indexPage.addObject("usersNum", usersNum);
		 */
		// indexPage.addObject("user", user);

		return indexPage;
	}

	@RequestMapping("/questions/questionNoReplyByClick")
	public ModelAndView questionNoReplyByCount(HttpSession session) {

		ModelAndView indexPage = new ModelAndView("jsp/questions-noReply");

		// 全部主题
		List<Questions> questionsList = questionsService.listQuestionsAndUsersByClick();

		List<Questions> noReply = new ArrayList<>();

		for (int i = 0; i < questionsList.size(); i++) {
			if (questionsList.get(i).getCountReplies() == 0) {
				noReply.add(questionsList.get(i));
			}
			System.out.println(questionsList.get(i).getCountReplies());
		}

		// 截取内容长度
		List<Questions> questions = new ArrayList<>();
		Questions newQuestion = new Questions();

		for (int i = 0; i < questionsList.size(); i++) {
			newQuestion = questionsList.get(i);
			if (newQuestion.getContent().length() > 200) {
				String cotnent = newQuestion.getContent().substring(0, 200);
				newQuestion.setContent(cotnent);
			}
			questions.add(newQuestion);
		}

		List<Tab> tab = tabService.getQuestionTabs();
		int questionsNum = questionsService.getQuestionsNum();

		// 获取统计信息
		/*
		 * int usersNum = userService.getUserCount();
		 */
		// 获取用户信息
		Integer userId = (Integer) session.getAttribute("userId");
		User user = userService.getUserById(userId);

		// 最热问答
		List<Questions> hotestQuestions = questionsService.listMostCommentsQuestions();

		// 用户个人发表的文章
		List<Questions> userPersonalQuestions = questionsService.listUserPersonalQuestions(userId);

		// 添加问答模块内容

		List<User> userByCredit = userService.listUserByCredit();
		indexPage.addObject("userByCredit", userByCredit);
		indexPage.addObject("questions", questions);
		indexPage.addObject("tab", tab);
		indexPage.addObject("noReply", noReply);
		indexPage.addObject("hotestQuestions", hotestQuestions);
		indexPage.addObject("userPersonalQuestions", userPersonalQuestions);

		indexPage.addObject("questionsNum", questionsNum);
		indexPage.addObject("tabMessage", "hot");

		/*
		 * 
		 * indexPage.addObject("usersNum", usersNum);
		 */
		// indexPage.addObject("user", user);

		return indexPage;
	}

	/**
	 * 渲染首页
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping("/questions/myQuestionList")
	public ModelAndView myQuestion(HttpSession session) {

		ModelAndView indexPage = new ModelAndView();

		// 全部主题
		List<Questions> questions = questionsService.listQuestionsAndUsers();

		for (int i = 0; i < questions.size(); i++) {
			System.out.println(questions.get(i).getContent());
		}

		int questionsNum = questionsService.getQuestionsNum();

		// 获取统计信息
		/*
		 * int usersNum = userService.getUserCount();
		 */
		// 获取用户信息
		Integer userId = (Integer) session.getAttribute("userId");
		User user = userService.getUserById(userId);

		// 最热问答
		List<Questions> hotestQuestions = questionsService.listMostCommentsQuestions();

		// 用户个人发表的文章
		List<Questions> userPersonalQuestions = questionsService.listUserPersonalQuestions(userId);

		// 添加问答模块内容

		indexPage.addObject("questions", questions);
		indexPage.addObject("hotestQuestions", hotestQuestions);
		indexPage.addObject("userPersonalQuestions", userPersonalQuestions);
		indexPage.addObject("questionsNum", questionsNum);

		/*
		 * 
		 * indexPage.addObject("usersNum", usersNum);
		 */
		// indexPage.addObject("user", user);

		return indexPage;
	}

	/**
	 * 进入新建问答页面
	 */
	@RequestMapping(value = { "/new" })
	public ModelAndView newTopic(HttpServletRequest request, HttpSession session) {

		ModelAndView indexPage;
		// 未登陆
		if (session.getAttribute("userId") == null) {
			indexPage = new ModelAndView("jsp/login");
		} else {

			indexPage = new ModelAndView("jsp/questions-new");
			List<Tab> tabs = tabService.getQuestionTabs();

			// 获取统计信息
			/*
			 * int topicsNum = topicService.getTopicsNum(); int usersNum =
			 * userService.getUserCount();
			 */
			indexPage.addObject("tabs", tabs);
		}

		/*
		 * newTopicPage.addObject("topicsNum", topicsNum);
		 * newTopicPage.addObject("usersNum", usersNum);
		 */
		List<User> userByCredit = userService.listUserByCredit();
		indexPage.addObject("userByCredit", userByCredit);
		return indexPage;
	}

	/**
	 * 发表提问
	 * 
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/questions/add", method = RequestMethod.POST)
	public ModelAndView addQuestion(HttpServletRequest request, HttpSession session) {
		ModelAndView indexPage;
		// 未登陆
		if (session.getAttribute("userId") == null) {
			indexPage = new ModelAndView("jsp/login");
			return indexPage;
		}
		// 处理参数
		Integer userId = (Integer) session.getAttribute("userId");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		Integer tabId = Integer.parseInt(request.getParameter("tabId"));

		// 新建Topic
		Questions questions = new Questions();
		questions.setUserId(userId);
		questions.setTitle(title);
		questions.setContent(content);
		questions.setCreateTime(new Date());
		questions.setUpdateTime(new Date());
		questions.setDelFlag("0");
		questions.setTabId(tabId);

		Tab tab = tabService.selectByPrimaryKey(tabId);
		tab.setCount(tab.getCount() + 1);
		tabService.updateByPrimaryKeySelective(tab);

		// 添加topic
		boolean ifSucc = questionsService.addQuestions(questions);
		boolean ifSuccAddCredit = userService.addCredit(1, userId);

		indexPage = new ModelAndView("redirect:/question/questions/Index");

		return indexPage;
	}

	/**
	 * 更新提问
	 * 
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/questions/update", method = RequestMethod.POST)
	public ModelAndView updateQuestion(HttpServletRequest request, HttpSession session) {
		ModelAndView indexPage;
		// 未登陆
		if (session.getAttribute("userId") == null) {
			indexPage = new ModelAndView("jsp/login");
			return indexPage;
		}
		// 处理参数
		Integer userId = (Integer) session.getAttribute("userId");
		Integer id = Integer.parseInt(request.getParameter("id"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		// 新建Topic
		Questions questions = new Questions();
		questions.setId(id);
		questions.setUserId(userId);
		questions.setTitle(title);
		questions.setContent(content);
		questions.setCreateTime(new Date());
		questions.setUpdateTime(new Date());
		questions.setDelFlag("0");
		// 添加topic
		boolean ifSucc = questionsService.updateByPrimaryKeySelective(questions);
		boolean ifSuccAddCredit = userService.addCredit(1, userId);

		indexPage = new ModelAndView("redirect:/question/questions/Index");

		return indexPage;
	}

	/**
	 * 根据tab查询问答
	 */
	@RequestMapping("/tab/{tabId}")
	public ModelAndView toTabPage(@PathVariable("tabId") int tabId, HttpSession session) {

		/*
		 * Tab tab = tabService.getByTabNameEn(tabNameEn); Integer tabId =
		 * tab.getId();
		 */

		ModelAndView indexPage = new ModelAndView("jsp/questions-index");

		// 根据tab查询所有问答
		List<Questions> questionsList = questionsService.listQuestionsAndUsersOfTab(tabId);

		// 截取内容长度
		List<Questions> questions = new ArrayList<>();
		Questions newQuestion = new Questions();

		for (int i = 0; i < questionsList.size(); i++) {
			newQuestion = questionsList.get(i);
			if (newQuestion.getContent().length() > 200) {
				String cotnent = newQuestion.getContent().substring(0, 200);
				newQuestion.setContent(cotnent);
			}
			questions.add(newQuestion);
		}

		List<Tab> tab = tabService.getQuestionTabs();
		Tab oneTab = tabService.selectByPrimaryKey(tabId);
		// 获取用户信息
		Integer uid = (Integer) session.getAttribute("userId");
		User user = userService.getUserById(uid);

		// 根据tab查询所有未有评论的问答
		List<Questions> question = questionsService.listQuestionsAndUsers();
		List<Questions> noReply = new ArrayList<>();

		for (int i = 0; i < question.size(); i++) {
			if (noReply.size() < 6) {
				if (question.get(i).getCountReplies() == 0) {
					noReply.add(question.get(i));
				}
			}
			System.out.println(question.get(i).getCountReplies());
		}

		int questionsNum = questionsService.getQuestionsNum();

		List<User> userByCredit = userService.listUserByCredit();
		indexPage.addObject("userByCredit", userByCredit);

		indexPage.addObject("questionsNum", questionsNum);
		indexPage.addObject("questions", questions);
		indexPage.addObject("noReply", noReply);

		indexPage.addObject("tab", tab);
		indexPage.addObject("oneTab", oneTab);
		indexPage.addObject("user", user);
		return indexPage;
	}

	/**
	 * 渲染主题详细页面
	 * 
	 * @param id
	 * @param session
	 * @return
	 */
	@RequestMapping("/questions/{id}")
	public ModelAndView ToQquestion(@PathVariable("id") Integer id, HttpSession session) {

		boolean ifSucc = questionsService.clickAddOne(id);
		// 获取主题信息
		Questions questions = questionsService.selectById(id);

		String questionTabName = questions.getTab().getTabName();
		// 获取主题全部评论
		List<QuestionsReply> replies = replyService.getRepliesOfQuestions(id);

		// 获取评论数
		int repliesNum = replyService.questionzReplyNum(id);

		// 获取统计信息
		/*
		 * int questionsNum = questionsService.getQuestionsNum(); int usersNum =
		 * userService.getUserCount();
		 */

		// 获取用户信息
		Integer uid = (Integer) session.getAttribute("userId");
		User user = userService.getUserById(uid);

		// 最热主题
		List<Questions> hotestQuestions = questionsService.listMostCommentsQuestions();

		// 用户个人发表的文章
		List<Questions> userPersonalQuestions = questionsService.listUserPersonalQuestions(uid);

		List<Questions> allQuestion = questionsService.listQuestionsAndUsers();

		List<Questions> noReplyQuestion = new ArrayList<>();

		for (int i = 0; i < allQuestion.size(); i++) {
			if (allQuestion.get(i).getCountReplies() == 0) {
				noReplyQuestion.add(allQuestion.get(i));
			}
			System.out.println(allQuestion.get(i).getCountReplies());
		}

		// 渲染视图
		ModelAndView indexPage = new ModelAndView("jsp/questions-detail");
		List<User> userByCredit = userService.listUserByCredit();
		indexPage.addObject("userByCredit", userByCredit);
		indexPage.addObject("noReplyQuestion", noReplyQuestion);
		indexPage.addObject("questions", questions);
		indexPage.addObject("replies", replies);
		indexPage.addObject("repliesNum", repliesNum);
		/*
		 * topicPage.addObject("questionsNum", questionsNum);
		 * topicPage.addObject("usersNum", usersNum);
		 */
		indexPage.addObject("user", user);
		indexPage.addObject("hotestQuestions", hotestQuestions);
		indexPage.addObject("userPersonalQuestions", userPersonalQuestions);
		indexPage.addObject("questionTabName", questionTabName);
		return indexPage;
	}

	@RequestMapping("/questions/noReply/{id}")
	public ModelAndView noReply(@PathVariable("id") Integer id, HttpSession session) {

		// 获取主题信息
		Questions questions = questionsService.selectById(id);

		// 获取主题全部评论
		List<QuestionsReply> replies = replyService.getRepliesOfQuestions(id);

		// 获取评论数
		int repliesNum = replyService.questionzReplyNum(id);

		// 获取统计信息
		/*
		 * int questionsNum = questionsService.getQuestionsNum(); int usersNum =
		 * userService.getUserCount();
		 */

		// 获取用户信息
		Integer uid = (Integer) session.getAttribute("userId");
		User user = userService.getUserById(uid);

		// 最热主题
		List<Questions> hotestQuestions = questionsService.listMostCommentsQuestions();

		// 用户个人发表的文章
		List<Questions> userPersonalQuestions = questionsService.listUserPersonalQuestions(uid);

		List<Questions> allQuestion = questionsService.listQuestionsAndUsers();

		List<Questions> noReplyQuestion = new ArrayList<>();

		for (int i = 0; i < allQuestion.size(); i++) {
			if (allQuestion.get(i).getCountReplies() == 0) {
				noReplyQuestion.add(allQuestion.get(i));
			}
			System.out.println(allQuestion.get(i).getCountReplies());
		}

		// 渲染视图
		ModelAndView indexPage = new ModelAndView("jsp/questions-noReplyDetail");
		List<User> userByCredit = userService.listUserByCredit();
		indexPage.addObject("userByCredit", userByCredit);

		indexPage.addObject("noReplyQuestion", noReplyQuestion);
		indexPage.addObject("questions", questions);
		indexPage.addObject("replies", replies);
		indexPage.addObject("repliesNum", repliesNum);
		/*
		 * topicPage.addObject("questionsNum", questionsNum);
		 * topicPage.addObject("usersNum", usersNum);
		 */
		indexPage.addObject("user", user);
		indexPage.addObject("hotestQuestions", hotestQuestions);
		indexPage.addObject("userPersonalQuestions", userPersonalQuestions);
		return indexPage;
	}

	/**
	 * 更新界面调整
	 * 
	 * @param id
	 * @param session
	 * @return
	 */
	@RequestMapping("/questions/update/{id}")
	public ModelAndView ToUpdateQquestion(@PathVariable("id") Integer id, HttpSession session) {

		// 点击量加一
		boolean ifSucc = questionsService.clickAddOne(id);

		// 获取主题信息
		Questions questions = questionsService.selectById(id);

		// 获取主题全部评论
		List<Reply> replies = replyService.getRepliesOfTopic(id);

		// 获取评论数
		int repliesNum = replyService.repliesNum(id);

		// 获取用户信息
		Integer uid = (Integer) session.getAttribute("userId");
		User user = userService.getUserById(uid);

		// 最热主题
		List<Questions> hotestQuestions = questionsService.listMostCommentsQuestions();

		// 用户个人发表的文章
		List<Questions> userPersonalQuestions = questionsService.listUserPersonalQuestions(uid);

		// 渲染视图
		ModelAndView indexPage = new ModelAndView("jsp/questions-update");
		List<User> userByCredit = userService.listUserByCredit();
		indexPage.addObject("userByCredit", userByCredit);

		indexPage.addObject("questions", questions);
		indexPage.addObject("replies", replies);
		indexPage.addObject("repliesNum", repliesNum);
		/*
		 * topicPage.addObject("questionsNum", questionsNum);
		 * topicPage.addObject("usersNum", usersNum);
		 */
		indexPage.addObject("user", user);
		indexPage.addObject("hotestQuestions", hotestQuestions);
		indexPage.addObject("userPersonalQuestions", userPersonalQuestions);
		return indexPage;
	}

	@RequestMapping(value = "/deleteQuestion/{id}")
	@ResponseBody
	public ModelAndView deleteById(@PathVariable Integer id) {
		Boolean bool = questionsService.deleteByPrimaryKey(id);
		ModelAndView indexPage = new ModelAndView("redirect:/question/questions/Index");

		Integer tabId = questionsService.selectById(id).getTabId();
		Tab tab = tabService.selectByPrimaryKey(tabId);
		tab.setCount(tab.getCount() - 1);
		tabService.updateByPrimaryKeySelective(tab);

		if (bool) {
			indexPage.addObject("message", "删除成功");
		} else {
			indexPage.addObject("message", "删除失败");
		}

		return indexPage;
	}

	/* ===================后台======================== */
	/**
	 * 查询所有的问答
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping("/questions/list")
	@ResponseBody
	public Map<String, Object> listQuestion() {
		Map<String, Object> rtnMap = new HashMap<String, Object>();

		// 全部主题
		List<Questions> questions = questionsService.listQuestionsAndUser();
		rtnMap.put("questions", questions);
		return rtnMap;
	}

	/**
	 * 渲染主题详细页面
	 * 
	 * @param id
	 * @param session
	 * @return
	 */
	@RequestMapping("/selectById/{id}")
	@ResponseBody
	public Map<String, Object> selectById(@PathVariable("id") Integer id, HttpSession session) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		// 获取主题信息
		Questions questions = questionsService.selectOneById(id);

		rtnMap.put("questions", questions);
		return rtnMap;

	}

	// 删除tab
	@RequestMapping(value = "/delete/{id}")
	@ResponseBody
	public Map<String, Object> delete(@PathVariable("id") Integer id) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		Boolean bool = questionsService.deleteByPrimaryKey(id);

		Integer tabId = questionsService.selectById(id).getTabId();
		Tab tab = tabService.selectByPrimaryKey(tabId);
		tab.setCount(tab.getCount() - 1);
		tabService.updateByPrimaryKeySelective(tab);

		if (bool) {
			rtnMap.put("message", "删除成功");
		} else {
			rtnMap.put("message", "删除失败");

		}
		return rtnMap;
	}
}
