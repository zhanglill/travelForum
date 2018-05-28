package com.zl.travel.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.zl.travel.domain.Tab;
import com.zl.travel.service.impl.ReplyServiceImpl;
import com.zl.travel.service.impl.TabServiceImpl;
import com.zl.travel.service.impl.TopicServiceImpl;
import com.zl.travel.service.impl.UserServiceImpl;

/**
 * 主控制类
 */
@Controller
@RequestMapping("/main")
@ResponseBody
public class MainController {

    @Autowired
    public TopicServiceImpl topicService;

    @Autowired
    public ReplyServiceImpl replyService;

    @Autowired
    public UserServiceImpl userService;

    @Autowired
    public TabServiceImpl tabService;

    /**
     * 进入登录页面
     */
    @RequestMapping("/signin")
    public ModelAndView signin() {

        ModelAndView signinPage = new ModelAndView("jsp/login");

        // 获取统计信息
        /* int topicsNum = topicService.getTopicsNum(); int usersNum =
         * userService.getUserCount(); */

        /* signinPage.addObject("topicsNum", topicsNum);
         * signinPage.addObject("usersNum", usersNum); */
        signinPage.addObject("clickType", 1);

        return signinPage;
    }

    /**
     * 进入注册页面
     */
    @RequestMapping("/signup")
    public ModelAndView signup() {

        ModelAndView signupPage = new ModelAndView("jsp/login");

        // 获取统计信息
        /* int topicsNum = topicService.getTopicsNum(); int usersNum =
         * userService.getUserCount(); */

        /* signupPage.addObject("topicsNum", topicsNum);
         * signupPage.addObject("usersNum", usersNum); */
        signupPage.addObject("clickType", 2);

        return signupPage;
    }

    /**
     * 进入新建主题页面
     */
    @RequestMapping(value = { "/new" })
    public ModelAndView newTopic(HttpServletRequest request, HttpSession session) {

        ModelAndView indexPage;
        // 未登陆
        if (session.getAttribute("userId") == null) {
            indexPage = new ModelAndView("jsp/login");
        } else {

            indexPage = new ModelAndView("jsp/topic-new");
            List<Tab> tabs = tabService.getAllTabs();

            // 获取统计信息
            /* int topicsNum = topicService.getTopicsNum(); int usersNum =
             * userService.getUserCount(); */
            indexPage.addObject("tabs", tabs);
        }

        /* newTopicPage.addObject("topicsNum", topicsNum);
         * newTopicPage.addObject("usersNum", usersNum); */
        return indexPage;
    }

    /**
     * 配置404页面
     */
    @RequestMapping("*")
    public String notFind() {
        return "404";
    }
}
