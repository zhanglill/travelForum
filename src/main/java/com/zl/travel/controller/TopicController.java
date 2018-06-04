package com.zl.travel.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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

import com.zl.travel.domain.Place;
import com.zl.travel.domain.Questions;
import com.zl.travel.domain.Reply;
import com.zl.travel.domain.Tab;
import com.zl.travel.domain.Topic;
import com.zl.travel.domain.User;
import com.zl.travel.service.impl.PlaceServiceImpl;
import com.zl.travel.service.impl.QuestionsServiceImpl;
import com.zl.travel.service.impl.ReplyServiceImpl;
import com.zl.travel.service.impl.TabServiceImpl;
import com.zl.travel.service.impl.TopicServiceImpl;
import com.zl.travel.service.impl.UserServiceImpl;

/**
 * 主题相关控制类
 */
@Controller
@ResponseBody
public class TopicController {

	@Autowired
	public TopicServiceImpl topicService;

	@Autowired
	public ReplyServiceImpl replyService;

	@Autowired
	public UserServiceImpl userService;

	@Autowired
	public TabServiceImpl tabService;

	@Autowired
	public PlaceServiceImpl placeService;

	@Autowired
	private QuestionsServiceImpl questionsService;

	// log4j对象
	private final Log log = LogFactory.getLog(getClass());

	/**
	 * 渲染首页
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping("/")
	public ModelAndView toMain(HttpSession session) {

		ModelAndView indexPage = new ModelAndView("jsp/index");

		// 全部主题
		List<Topic> topics = topicService.listTopicsAndUsers();

		/*
		 * Topic newTopic = new Topic(); List<Topic> topics = new ArrayList<>();
		 * 
		 * for(int i=0; i < topicsList.size(); i++) {
		 * if(topicsList.get(i).getContent().length() > 200){ String cotnent =
		 * topicsList.get(i).getContent().substring(0, 200);
		 * newTopic.setContent(cotnent); topics.add(newTopic); } }
		 */

		// 获取统计信息
		/*
		 * int topicsNum = topicService.getTopicsNum(); int usersNum =
		 * userService.getUserCount();
		 */

		// 获取用户信息
		Integer userId = (Integer) session.getAttribute("userId");
		User user = userService.getUserById(userId);

		// 最热主题
		List<Topic> hotestTopics = topicService.listMostCommentsTopics();

		List<Questions> hotestQuestions = questionsService.listMostCommentsQuestions();

		List<Tab> tabs = tabService.getAllTabs();
		List<Tab> tab = tabService.getQuestionTabs();
		// List<Place> place = placeService.getAllPlace();

		// 全部问答
		List<Questions> questions = questionsService.listQuestionsAndUsers();

		// 获取统计信息
		/*
		 * int topicsNum = topicService.getTopicsNum(); int usersNum =
		 * userService.getUserCount();
		 */
		// indexPage.addObject("place", place);

		indexPage.addObject("tab", tab);

		// 添加问答模块内容

		// indexPage.addObject("topics", topics);
		indexPage.addObject("tabs", tabs);
		indexPage.addObject("questions", questions);
		indexPage.addObject("hotestTopics", hotestTopics);
		indexPage.addObject("hotestQuestions", hotestQuestions);
		/*
		 * indexPage.addObject("topicsNum", topicsNum);
		 * indexPage.addObject("usersNum", usersNum);
		 */
		indexPage.addObject("user", user);

		return indexPage;
	}

	/**
	 * 渲染首页
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping("/topic/Index")
	public ModelAndView toTopicIndex(HttpSession session) {

		ModelAndView indexPage = new ModelAndView("jsp/topic-index");

		// 全部主题
		List<Topic> topics = topicService.listTopicsAndUsers();

		/*
		 * Topic newTopic = new Topic(); List<Topic> topics = new ArrayList<>();
		 * 
		 * for(int i=0; i < topicsList.size(); i++) {
		 * if(topicsList.get(i).getContent().length() > 200){ String cotnent =
		 * topicsList.get(i).getContent().substring(0, 200);
		 * newTopic.setContent(cotnent); topics.add(newTopic); } }
		 */

		// 获取话题统计信息
		/*
		 * int topicsNum = topicService.getTopicsNum(); int usersNum =
		 * userService.getUserCount();
		 */

		// 获取用户信息
		Integer userId = (Integer) session.getAttribute("userId");
		User user = userService.getUserById(userId);

		// 最热主题
		List<Topic> hotestTopics = topicService.listMostCommentsTopics();

		// 用户个人发表的文章
		List<Topic> userPersonalTopics = topicService.listUserPersonalTopics(userId);

		// 用户个人保存的草稿
		List<Topic> userPersonalDraftTopics = topicService.listUserPersonalDraftTopics(userId);

		// 用户转发的文章
		List<Topic> userTransmitTopics = topicService.listUserTransmitTopics(userId);

		// 用户收藏的文章
		List<Topic> userCollectTopics = topicService.listUserCollectTopics(userId);

		List<Tab> tab = tabService.getAllTabs();

		indexPage.addObject("topics", topics);
		indexPage.addObject("hotestTopics", hotestTopics);
		indexPage.addObject("userPersonalTopics", userPersonalTopics);
		indexPage.addObject("userPersonalDraftTopics", userPersonalDraftTopics);
		indexPage.addObject("userTransmitTopics", userTransmitTopics);
		indexPage.addObject("userCollectTopics", userCollectTopics);
		/*
		 * indexPage.addObject("topicsNum", topicsNum);
		 * indexPage.addObject("usersNum", usersNum);
		 */
		indexPage.addObject("user", user);
		indexPage.addObject("tab", tab);

		return indexPage;
	}

	/**
	 * 渲染首页
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping("/topic/myIndex")
	public ModelAndView myIndex(HttpSession session) {

		ModelAndView indexPage;

		// 未登陆
		if (session.getAttribute("userId") == null) {
			indexPage = new ModelAndView("jsp/login");
			return indexPage;
		}

		// 全部主题
		List<Topic> topics = topicService.listTopicsAndUsers();

		String regex;
		List<String> srcList = new ArrayList<String>();
		regex = "src=\"(.*?)\"";

		for (int i = 0; i < topics.size(); i++) {
			
			Pattern pa = Pattern.compile(regex);
			Matcher ma = pa.matcher(topics.get(i).getContent());
			while (ma.find()) {
				srcList.add(ma.group());
			}
			
			Topic topic = topics.get(i);
			String txtcontent = topic.getContent().replaceAll("</?[^>]+>", ""); // 剔出<html>的标签
			txtcontent = txtcontent.replaceAll("<a>\\s*|\t|\r|\n</a>", "");// 去除字符串中的空格,回车,换行符,制表符
			topic.setContent(txtcontent);

		}

		// 获取用户信息
		Integer userId = (Integer) session.getAttribute("userId");
		User user = userService.getUserById(userId);

		// 用户原创的文章
		List<Topic> userPersonalTopics = topicService.listUserPersonalTopics(userId);

		// 用户原创的文章
		List<Questions> myQuestions = questionsService.myQuestionList(userId);

		// 用户转发的文章
		List<Topic> userTransmitTopics = topicService.listUserTransmitTopics(userId);

		// 用户收藏的文章
		List<Topic> userCollectTopics = topicService.listUserCollectTopics(userId);

		// 最热主题
		List<Topic> hotestTopics = topicService.listMostCommentsTopics();

		// 添加问答模块内容

		indexPage = new ModelAndView("jsp/my-index");

		indexPage.addObject("topics", topics);
		indexPage.addObject("srcList", srcList);
		indexPage.addObject("myQuestions", myQuestions);
		indexPage.addObject("hotestTopics", hotestTopics);
		indexPage.addObject("userPersonalTopics", userPersonalTopics);
		indexPage.addObject("userTransmitTopics", userTransmitTopics);
		indexPage.addObject("userCollectTopics", userCollectTopics);

		/*
		 * indexPage.addObject("topicsNum", topicsNum);
		 * indexPage.addObject("usersNum", usersNum);
		 */
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
	@RequestMapping("/topic/{id}")
	public ModelAndView toTopic(@PathVariable("id") Integer id, HttpSession session) {

		// 点击量加一
		boolean ifSucc = topicService.clickAddOne(id);

		// 获取主题信息
		Topic topic = topicService.selectById(id);

		// 获取主题全部评论
		List<Reply> replies = replyService.getRepliesOfTopic(id);

		// 获取评论数
		int repliesNum = replyService.repliesNum(id);

		// 获取统计信息
		/*
		 * int topicsNum = topicService.getTopicsNum(); int usersNum =
		 * userService.getUserCount();
		 */

		// 获取用户信息
		Integer uid = (Integer) session.getAttribute("userId");
		User user = userService.getUserById(uid);

		// 最热主题
		List<Topic> hotestTopics = topicService.listMostCommentsTopics();

		// 渲染视图
		ModelAndView topicPage = new ModelAndView("jsp/topic-detail");
		topicPage.addObject("topic", topic);
		topicPage.addObject("replies", replies);
		topicPage.addObject("repliesNum", repliesNum);
		/*
		 * topicPage.addObject("topicsNum", topicsNum);
		 * topicPage.addObject("usersNum", usersNum);
		 */
		topicPage.addObject("user", user);
		topicPage.addObject("hotestTopics", hotestTopics);
		return topicPage;
	}

	/**
	 * 点击编辑查询帖子信息
	 * 
	 * @param id
	 * @param session
	 * @return
	 */
	@RequestMapping("/getOneById/{id}")
	public ModelAndView getOneById(@PathVariable("id") Integer id, HttpSession session) {

		// 获取主题信息
		Topic topic = topicService.selectById(id);

		List<Tab> tabs = tabService.getAllTabs();

		// 获取评论数
		int repliesNum = replyService.repliesNum(id);

		// 最热主题
		List<Topic> hotestTopics = topicService.listMostCommentsTopics();

		// 渲染视图
		ModelAndView topicPage = new ModelAndView("jsp/topic-update");

		topicPage.addObject("tabs", tabs);
		topicPage.addObject("topic", topic);
		topicPage.addObject("repliesNum", repliesNum);
		topicPage.addObject("hotestTopics", hotestTopics);
		return topicPage;
	}

	/**
	 * 渲染指定板块页面
	 */
	@RequestMapping("/tab/{tabNameEn}")
	public ModelAndView toTabPage(@PathVariable("tabNameEn") String tabNameEn, HttpSession session) {

		Tab tab = tabService.getByTabNameEn(tabNameEn);
		Integer tabId = tab.getId();

		ModelAndView indexPage = new ModelAndView("jsp/index");

		List<Topic> topics = topicService.listTopicsAndUsersOfTab(tabId);

		// 获取统计信息 int topicsNum = topicService.getTopicsNum();
		// int usersNum = userService.getUserCount();

		// 获取用户信息
		Integer uid = (Integer) session.getAttribute("userId");
		User user = userService.getUserById(uid);

		List<Topic> hotestTopics = topicService.listMostCommentsTopics();

		indexPage.addObject("topics", topics);

		/*
		 * indexPage.addObject("topicsNum", topicsNum);
		 * indexPage.addObject("usersNum", usersNum);
		 */

		indexPage.addObject("tab", tab);
		indexPage.addObject("user", user);
		indexPage.addObject("hotestTopics", hotestTopics);
		return indexPage;
	}

	/**
	 * 渲染指定板块页面
	 */
	@RequestMapping("/topic/tab/{tabId}")
	public ModelAndView toTabPage(@PathVariable("tabId") int tabId, HttpSession session) {

		/*
		 * Tab tab = tabService.getByTabNameEn(tabNameEn); Integer tabId =
		 * tab.getId();
		 */

		ModelAndView indexPage = new ModelAndView("jsp/topic-index");

		List<Topic> topics = topicService.listTopicsAndUsersOfTab(tabId);
		List<Tab> tab = tabService.getAllTabs();
		Tab oneTab = tabService.selectByPrimaryKey(tabId);
		// 获取用户信息
		Integer uid = (Integer) session.getAttribute("userId");
		User user = userService.getUserById(uid);

		indexPage.addObject("topics", topics);

		indexPage.addObject("tab", tab);
		indexPage.addObject("oneTab", oneTab);
		indexPage.addObject("user", user);
		return indexPage;
	}

	/**
	 * 发表主题
	 * 
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/topic/add", method = RequestMethod.POST)
	public ModelAndView addTopic(HttpServletRequest request, HttpSession session) {
		ModelAndView indexPage;
		// 未登陆
		if (session.getAttribute("userId") == null) {
			indexPage = new ModelAndView("redirect:/jsp/login");
			return indexPage;
		}
		// 处理参数
		Integer userId = (Integer) session.getAttribute("userId");
		String title = request.getParameter("title");
		String province = request.getParameter("province");
		String city = request.getParameter("city");
		String content = request.getParameter("editorValue");
		Integer tabId = Integer.parseInt(request.getParameter("tab"));
		// Integer placeId = Integer.parseInt(request.getParameter("placeId"));

		Tab tab = tabService.selectByPrimaryKey(tabId);
		tab.setCount(tab.getCount() + 1);
		tabService.updateByPrimaryKeySelective(tab);

		/*
		 * Place place = placeService.selectByPrimaryKey(placeId);
		 * place.setCount(place.getCount() + 1);
		 * placeService.updateByPrimaryKeySelective(place);
		 */

		// 新建Topic
		Topic topic = new Topic();
		topic.setUserId(userId);
		topic.setTitle(title);
		topic.setContent(content);
		topic.setProvince(province);
		topic.setCity(city);
		topic.setTabId(tabId);
		topic.setType(0); // 原创
		topic.setCreateTime(new Date());
		topic.setUpdateTime(new Date());
		topic.setDelFlag("0");
		topic.setIsPublish("0");

		// 添加topic
		boolean ifSucc = topicService.addTopic(topic);
		boolean ifSuccAddCredit = userService.addCredit(1, userId);
		if (ifSucc) {
			if (log.isInfoEnabled()) {
				log.info("添加主题成功!");
			}
		}
		indexPage = new ModelAndView("redirect:/topic/Index");

		return indexPage;
	}

	/**
	 * 保存草稿
	 * 
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/topic/saveDraft", method = RequestMethod.POST)
	public ModelAndView saveTopicDraft(HttpServletRequest request, HttpSession session) {
		ModelAndView indexPage;

		// 处理参数
		Integer userId = (Integer) session.getAttribute("userId");
		String title = request.getParameter("title");
		String content = request.getParameter("editorValue");
		Integer tabId = Integer.parseInt(request.getParameter("tab"));
		// 新建Topic
		Topic topic = new Topic();
		topic.setUserId(userId);
		topic.setTitle(title);
		topic.setContent(content);
		topic.setTabId(tabId);
		topic.setType(0); // 原创
		topic.setCreateTime(new Date());
		topic.setUpdateTime(new Date());
		topic.setDelFlag("0");
		topic.setIsPublish("1");

		// 添加topic
		boolean ifSucc = topicService.addTopic(topic);
		boolean ifSuccAddCredit = userService.addCredit(1, userId);
		if (ifSucc) {
			if (log.isInfoEnabled()) {
				log.info("成功保存到草稿箱!");
			}
		}
		indexPage = new ModelAndView("redirect:/");

		return indexPage;
	}

	/**
	 * 编辑更新帖子
	 * 
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/topic/update", method = RequestMethod.POST)
	public ModelAndView updateTopic(HttpServletRequest request, HttpSession session) {
		ModelAndView indexPage;

		// 处理参数
		Integer userId = (Integer) session.getAttribute("userId");
		Integer id = Integer.parseInt(request.getParameter("id"));
		String title = request.getParameter("title");
		String content = request.getParameter("editorValue");
		Integer tabId = Integer.parseInt(request.getParameter("tab"));
		// 新建Topic
		Topic topic = new Topic();
		topic.setId(id);
		topic.setUserId(userId);
		topic.setTitle(title);
		topic.setContent(content);
		topic.setTabId(tabId);
		topic.setType(0); // 原创
		topic.setCreateTime(new Date());
		topic.setUpdateTime(new Date());
		topic.setDelFlag("0");
		topic.setIsPublish("0");

		// 添加topic
		boolean ifSucc = topicService.updateByPrimaryKeySelective(topic);
		boolean ifSuccAddCredit = userService.addCredit(1, userId);

		indexPage = new ModelAndView("redirect:/topic/Index");

		return indexPage;
	}

	/**
	 * 转发
	 * 
	 * @param request
	 * @param session
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(value = "/topic/transmit", method = RequestMethod.POST)
	@ResponseBody

	/*
	 * public ModelAndView transmitTopic(HttpServletRequest request, HttpSession
	 * session) throws ParseException { ModelAndView indexPage = new
	 * ModelAndView("redirect:/");
	 */

	public Map<String, Object> transmitTopic(@RequestParam Map<String, Object> params, HttpSession session)
			throws ParseException {

		Map<String, Object> map = new HashMap<String, Object>();

		// 处理参数
		Integer userId = (Integer) session.getAttribute("userId");
		String title = (String) params.get("title");
		String content = (String) params.get("content");
		Integer tabId = Integer.parseInt((String) params.get("tabId"));
		int click = Integer.parseInt((String) params.get("click"));

		String createTime = (String) params.get("createTime");

		// 新建Topic
		Topic topic = new Topic();
		topic.setUserId(userId);
		topic.setTitle(title);
		topic.setContent(content);
		topic.setTabId(tabId);
		topic.setType(1); // 转发
		topic.setClick(click);
		topic.setCreateTime(new Date());
		topic.setUpdateTime(new Date());
		topic.setDelFlag("0");
		topic.setIsPublish("0");

		// 添加topic
		boolean ifSucc = topicService.addTopic(topic);
		boolean ifSuccAddCredit = userService.addCredit(1, userId);
		if (ifSucc) {
			map.put("message", "转发成功");
		} else {
			map.put("message", "转发失败");
		}

		return map;
	}

	/**
	 * 收藏
	 * 
	 * @param request
	 * @param session
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(value = "/topic/collect", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> transmitCollect(@RequestParam Map<String, Object> params, HttpSession session)
			throws ParseException {

		Map<String, Object> rtnMap = new HashMap<String, Object>();

		Integer userId = (Integer) session.getAttribute("userId");
		String title = (String) params.get("title");
		String content = (String) params.get("content");
		int click = Integer.parseInt((String) params.get("click"));
		Integer tabId = Integer.parseInt((String) params.get("tabId"));

		String createTime = (String) params.get("createTime");

		// 新建Topic
		Topic topic = new Topic();
		topic.setUserId(userId);
		topic.setTitle(title);
		topic.setContent(content);
		topic.setTabId(tabId);
		topic.setType(2); // 收藏
		topic.setClick(click);
		topic.setCreateTime(new Date());
		topic.setUpdateTime(new Date());
		topic.setDelFlag("0");
		topic.setIsPublish("0");

		// 添加topic
		boolean ifSucc = topicService.addTopic(topic);
		boolean ifSuccAddCredit = userService.addCredit(1, userId);
		if (ifSucc) {
			rtnMap.put("message", "收藏成功");
		} else {
			rtnMap.put("message", "收藏失败");
		}

		return rtnMap;
	}

	/**
	 * 搜索功能
	 */
	/*
	 * @RequestMapping(value="/search")
	 * 
	 * @ResponseBody public Map<String, Object> searchTopic(@RequestParam
	 * Map<String, Object> params, HttpSession session) { Map<String, Object>
	 * rtnMap = new HashMap<String, Object>(); // 全部主题 List<Topic> topicsList =
	 * topicService.listTopicsAndUsers(); rtnMap.put("data", topicsList);
	 * rtnMap.put("total", topicsList.size()); return rtnMap; }
	 */

	/**
	 * 搜索功能（模糊查询）
	 */
	@RequestMapping(value = "/search/{searchParam}")
	@ResponseBody
	public Map<String, Object> searchTopic(@PathVariable String searchParam, HttpSession session) {

		Map<String, Object> rtnMap = new HashMap<String, Object>();

		// String param = (String) params.get("param");
		// 全部主题
		List<Topic> topicsList = topicService.listTopicsAndUsersByParam(searchParam);
		rtnMap.put("data", topicsList);
		rtnMap.put("total", topicsList.size());

		return rtnMap;
	}

	/*
	 * @RequestMapping(value = "/delete/{id}")
	 * 
	 * @ResponseBody public Map<String, Object> deleteById(@PathVariable Integer
	 * id) { Map<String, Object> rtnMap = new HashMap<String, Object>(); boolean
	 * bool = topicService.deleteByPrimaryKey(id); if (bool) {
	 * rtnMap.put("message", "删除成功"); } else { rtnMap.put("message", "删除失败"); }
	 * return rtnMap; }
	 */

	/**
	 * 删除帖子
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/delete/{id}")
	@ResponseBody
	public ModelAndView deleteById(@PathVariable Integer id) {
		/*
		 * Map<String, Object> rtnMap = new HashMap<String, Object>();
		 * 
		 * if (bool) { rtnMap.put("message", "删除成功"); } else {
		 * rtnMap.put("message", "删除失败"); }
		 */
		ModelAndView indexPage = new ModelAndView("redirect:/topic/Index");
		/*
		 * boolean bool = topicService.deleteByPrimaryKey(id);
		 * 
		 * if (bool) { indexPage.addObject("message", "删除成功"); } else {
		 * indexPage.addObject("message", "删除失败"); }
		 */

		return indexPage;
	}
	/* ==================后台方法========================= */

	/**
	 * 查询所有的帖子
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping("/topic/list")
	@ResponseBody
	public Map<String, Object> listTopic(RedirectAttributes redirectAttributes) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();

		// 全部主题
		List<Topic> topics = topicService.listAllTopicsAndUsers();
		rtnMap.put("topics", topics);
		return rtnMap;
	}

	@RequestMapping("/topicInfo/{id}")
	public Map<String, Object> topicInfo(@PathVariable("id") Integer id, HttpSession session) {

		Map<String, Object> rtnMap = new HashMap<String, Object>();

		// 获取主题信息
		Topic topic = topicService.selectTopicById(id);
		String txtcontent = topic.getContent().replaceAll("</?[^>]+>", ""); // 剔出<html>的标签
		txtcontent = txtcontent.replaceAll("<a>\\s*|\t|\r|\n</a>", "");// 去除字符串中的空格,回车,换行符,制表符
		topic.setContent(txtcontent);

		// 获取主题全部评论
		List<Reply> replies = replyService.getRepliesOfTopic(id);

		// 获取评论数
		int repliesNum = replyService.repliesNum(id);

		rtnMap.put("topic", topic);
		/*
		 * rtnMap.put("replies", replies); rtnMap.put("repliesNum", repliesNum);
		 */
		return rtnMap;
	}

	@RequestMapping(value = "/topic/delete/{id}")
	@ResponseBody
	public Map<String, Object> deleteByPrimaryKey(@PathVariable Integer id) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		boolean bool = topicService.deleteByPrimaryKey(id);
		if (bool) {
			rtnMap.put("message", "删除成功");
		} else {
			rtnMap.put("message", "删除失败");
		}
		return rtnMap;
	}
}
