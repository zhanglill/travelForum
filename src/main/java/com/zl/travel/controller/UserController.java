package com.zl.travel.controller;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.zl.travel.domain.LoginLog;
import com.zl.travel.domain.Questions;
import com.zl.travel.domain.Tab;
import com.zl.travel.domain.Topic;
import com.zl.travel.domain.User;
import com.zl.travel.service.impl.LoginLogServiceImpl;
import com.zl.travel.service.impl.QuestionsServiceImpl;
import com.zl.travel.service.impl.TabServiceImpl;
import com.zl.travel.service.impl.TopicServiceImpl;
import com.zl.travel.service.impl.UserServiceImpl;
import com.zl.travel.util.MD5Util;

/**
 * 用户相关控制类
 */
@Controller
@RequestMapping(value = "/user")
@ResponseBody
public class UserController {

    @Autowired
    public UserServiceImpl userService;

    @Autowired
    public TopicServiceImpl topicService;

    @Autowired
    public LoginLogServiceImpl loginLogService;
    
    @Autowired
    public TabServiceImpl tabService;

    @Autowired
    public QuestionsServiceImpl questionsService;
    
    /**
     * 用户注册
     * 
     * @param request
     * @return
     */

    @RequestMapping("/register")
    public ModelAndView register(HttpServletRequest request) {
        // 用户类型(后期删除)
        Byte type = new Byte("0");
        // 密码加密处理
        String password = MD5Util.getMD5(request.getParameter("password"));
        // 生成随机数，用于生成头像URL
        Random rand = new Random();
        int randomNum = rand.nextInt(10) + 1;
        String avatarUrl = "/img/avatar/avatar-default-" + randomNum + ".png";
        // 新建User对象
        User user = new User();
        // 初始化User对象
        user.setUsername(request.getParameter("username"));
        user.setPassword(password);
        user.setEmail(request.getParameter("email"));
        user.setPhoneNum(request.getParameter("tel"));
        user.setCreateTime(new Date());
        user.setUpdateTime(new Date());
        user.setCredit(0);
        user.setType(type);
        user.setAvatar(avatarUrl);
        user.setIsLocked("0");
        user.setDelFlag("0");
        userService.save(user);
        
        ModelAndView indexPage = new ModelAndView("jsp/login");
        
        return indexPage;
    }

    /**
     * 普通用户登录
     * 
     * @param request
     * @param session
     * @return 0:用户名不存在 1:密码错误 2:登录成功
     */

    @RequestMapping("/loginCheck")
    @ResponseBody
    public Object login(HttpServletRequest request, HttpSession session) {

        HashMap<String, String> rtnMap = new HashMap<String, String>();

        // 获取用户名和密码
        String username = request.getParameter("username");
        String password = MD5Util.getMD5(request.getParameter("password"));

        // 验证用户名密码
        int judgeResult = userService.loginCheck(username, password);

        // 登录成功
        if (judgeResult == 2) {

            // 添加积分后期删除
            User user = userService.getUserByUsername(username);
            Integer userId = user.getId();
            // 添加积分
            boolean ifSuccAddCredit = userService.addCredit(1, userId);

            // 用户信息写入session
            session.setAttribute("userId", userId);
            session.setAttribute("username", username);

            // 获取登录信息
            String ip = getRemortIP(request);
            String Agent = request.getHeader("User-Agent");
            StringTokenizer st = new StringTokenizer(Agent, ";");
            st.nextToken();
            // 获取用户的浏览器名
            String userbrowser = st.nextToken();
            System.out.println(userbrowser);
            // 写入登录日志
            LoginLog log = new LoginLog();
            log.setDevice(userbrowser);
            log.setIp(ip);
            log.setUserId(userId);
            log.setLoginTime(new Date());
            boolean ifSuccAddLog = loginLogService.addLog(log);

            rtnMap.put("stateCode", "2");
        }
        // 密码错误
        else if (judgeResult == 1) {
            rtnMap.put("stateCode", "1");
        }
        // 用户名不存在
        else {
            rtnMap.put("stateCode", "0");
        }

        return rtnMap;
    }

    /**
     * 获取客户端IP
     */
    public String getRemortIP(HttpServletRequest request) {
        if (request.getHeader("x-forwarded-for") == null) {
            return request.getRemoteAddr();
        }
        return request.getHeader("x-forwarded-for");
    }

    /**
     * 用户退出
     * 
     * @param session
     * @return
     */

    @RequestMapping("/signout")
    public ModelAndView signout(HttpSession session) {
        session.removeAttribute("userId");
        session.removeAttribute("username");
        
        ModelAndView indexPage = new ModelAndView("jsp/index");

		// 全部主题
		List<Topic> topics = topicService.listTopicsAndUsers();

		// 获取统计信息
		/*
		 * int topicsNum = topicService.getTopicsNum(); int usersNum =
		 * userService.getUserCount();
		 */

		// 获取用户信息
		//Integer userId = (Integer) session.getAttribute("userId");
		//User user = userService.getUserById(userId);

		// 最热主题
		List<Topic> hotestTopics = topicService.listMostCommentsTopics();
		
		List<Questions> hotestQuestions = questionsService.listMostCommentsQuestions();

		List<Tab> tabs = tabService.getAllTabs();
		List<Tab> tab = tabService.getQuestionTabs();
		//List<Place> place = placeService.getAllPlace();

		// 全部问答
		List<Questions> questions = questionsService.listQuestionsAndUsers();

		// 获取统计信息
		/*
		 * int topicsNum = topicService.getTopicsNum(); int usersNum =
		 * userService.getUserCount();
		 */
		//indexPage.addObject("place", place);
		
		indexPage.addObject("tab", tab);

		// 添加问答模块内容

		//indexPage.addObject("topics", topics);
		indexPage.addObject("tabs", tabs);
		indexPage.addObject("questions", questions);
		indexPage.addObject("hotestTopics", hotestTopics);
		indexPage.addObject("hotestQuestions", hotestQuestions);
		/*
		 * indexPage.addObject("topicsNum", topicsNum);
		 * indexPage.addObject("usersNum", usersNum);
		 */
		//indexPage.addObject("user", user);

		return indexPage;
    }

    /**
     * 前台用户修改信息
     * 
     * @return
     */
    @RequestMapping(value = "/updateMyInfo", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView updateMyInfo(HttpServletRequest request) {

        Integer userId = Integer.parseInt(request.getParameter("id"));
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        User user = new User();
        user.setId(userId);
        user.setUsername(username);
        user.setEmail(email);
        user.setPhoneNum(phone);
        Boolean bool = userService.updateUser(user);

        ModelAndView mv = new ModelAndView("jsp/my_info");

        if (bool) {
            mv.addObject("message", "更新成功！");
        } else {
            mv.addObject("message", "更新失败！");
        }
        return mv;
    }

    /**
     * 用户个人主页
     * 
     * @param username
     * @param session
     * @return
     */
    @RequestMapping("/member/{username}")
    public ModelAndView personalIndex(@PathVariable("username") String username, HttpSession session) {

        // 判断用户是否存在
        boolean ifExistUser = userService.existUsername(username);

        // 获取统计信息
        // int topicsNum = topicService.getTopicsNum();
        // int usersNum = userService.getUserCount();

        // 获取用户信息
        Integer userId = (Integer) session.getAttribute("userId");
        User user = userService.getUserById(userId);

        // 用户个人发表的文章
        List<Topic> userPersonalTopics = topicService.listUserPersonalTopics(userId);

        // 最热主题
        // List<Topic> hotestTopics = topicService.listMostCommentsTopics();

        ModelAndView mv = new ModelAndView("jsp/user_info");
        // mv.addObject("hotestTopics", hotestTopics);
        mv.addObject("userPersonalTopics", userPersonalTopics);

        if (ifExistUser) {
            // User rtnUser = userService.getUserByUsername(username);
            mv.addObject("userInfo", user);
            // mv.addObject("topicsNum", topicsNum);
            // mv.addObject("usersNum", usersNum);
            mv.addObject("user", user);
            return mv;
        } else {
            String errorInfo = new String("用户不存在");
            mv.addObject("errorInfo", errorInfo);
            return mv;
        }
    }

    /**
     * 前台用户个人主页
     * 
     * @param username
     * @param session
     * @return
     */
    @RequestMapping("/getUserInfoById/{id}")
    @ResponseBody
    public ModelAndView myInfo(@PathVariable Integer id, HttpSession session) {

        ModelAndView mv = new ModelAndView("jsp/my_info");

        // 获取用户信息
        User user = userService.getUserById(id);

        mv.addObject("data", user);
        return mv;
    }

    /**
     * 后台用户个人主页
     * 
     * @param username
     * @param session
     * @return
     */
    @RequestMapping("/getUserById/{id}")
    @ResponseBody
    public Map<String, Object> userInfo(@PathVariable("id") Integer id) {

        Map<String, Object> rtnMap = new HashMap<String, Object>();
        // 获取用户信息
        User user = userService.getUserById(id);
        rtnMap.put("data", user);
        return rtnMap;
    }

    /**
     * 设置功能
     * 
     * @param request
     * @param session
     * @return
     */
    @RequestMapping("/settings")
    public ModelAndView settings(HttpServletRequest request, HttpSession session) {

        Integer userId = (Integer) session.getAttribute("userId");
        User user = userService.getUserById(userId);

        // 最热主题
        // List<Topic> hotestTopics = topicService.listMostCommentsTopics();

        // 用户个人发表的文章
        List<Topic> userPersonalTopics = topicService.listUserPersonalTopics(userId);

        ModelAndView mv = new ModelAndView("jsp/user-settings");
        mv.addObject("user", user);
        mv.addObject("userPersonalTopics", userPersonalTopics);
        // mv.addObject("hotestTopics", hotestTopics);
        return mv;
    }

    /**
     * 设置用户头像
     * 
     * @param request
     * @param session
     * @return
     */
    @RequestMapping(value = "/settings/avatar", method = RequestMethod.GET)
    public ModelAndView updateAvatar(HttpServletRequest request, HttpSession session) {

        Integer userId = (Integer) session.getAttribute("userId");
        User user = userService.getUserById(userId);

        // 最热主题
        // List<Topic> hotestTopics = topicService.listMostCommentsTopics();

        // 用户个人发表的文章
        List<Topic> userPersonalTopics = topicService.listUserPersonalTopics(userId);

        ModelAndView mv = new ModelAndView("jsp/update_avatar");
        mv.addObject("user", user);
        mv.addObject("userPersonalTopics", userPersonalTopics);
        // mv.addObject("hotestTopics", hotestTopics);
        return mv;
    }

    /**
     * 更新用户头像（存在问题）
     * 
     * @param avatarFile
     * @param request
     * @param session
     * @return
     */
    @RequestMapping(value = "/settings/avatar/update", method = RequestMethod.POST)
    public ModelAndView updateAvatarDo(@RequestPart("avatar") MultipartFile avatarFile, HttpServletRequest request,
            HttpSession session) {
        Integer userId = (Integer) session.getAttribute("userId");

        String fileName = avatarFile.getOriginalFilename();
        String suffix = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length());
        Long date = new Date().getTime();
        String newFileName = date + "-" + userId + "." + suffix;
        String absolutePath = session.getServletContext().getRealPath("/skins/skin/img/avatar") + "/" + newFileName;
        String relativePath = "img/avatar" + "/" + newFileName;

        User newUser = new User();
        newUser.setAvatar(relativePath);
        newUser.setId(userId);
        File file = new File(absolutePath);

        if (!file.exists()) {
            try {
                avatarFile.transferTo(file);
                userService.updateUser(newUser);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        User user = userService.getUserById(userId);

        // 最热主题
        // List<Topic> hotestTopics = topicService.listMostCommentsTopics();
        // 用户个人发表的文章
        List<Topic> userPersonalTopics = topicService.listUserPersonalTopics(userId);

        ModelAndView mv = new ModelAndView("jsp/update_avatar");
        mv.addObject("user", user);
        mv.addObject("userPersonalTopics", userPersonalTopics);
        // mv.addObject("hotestTopics", hotestTopics);
        return mv;
    }

    /* ============================后台管理系统相关方法===================================
     * = */

    /**
     * 管理员登录
     * 
     * @param request
     * @param session
     * @return 0:用户名不存在 1:密码错误 2:登录成功
     */

    @RequestMapping("/userLoginCheck")
    @ResponseBody
    public Object loginCheck(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

        HashMap<String, String> rtnMap = new HashMap<String, String>();

        // 获取用户名和密码
        String username = request.getParameter("username");
        String password = MD5Util.getMD5(request.getParameter("password"));

        // 验证用户名密码
        int judgeResult = userService.userLoginCheck(username, password);

        // 登录成功
        if (judgeResult == 2) {

            // 添加积分后期删除
            User user = userService.getUserByUsername2(username);
            Integer userId = user.getId();
            // 添加积分
            // boolean ifSuccAddCredit = userService.addCredit(1, userId);

            // 用户信息写入session
            session.setAttribute("userId", userId);
            session.setAttribute("username", username);
            session.setAttribute("userType", user.getType());

            // 获取登录信息
            /* String ip = getRemortIP(request); String Agent =
             * request.getHeader("User-Agent"); StringTokenizer st = new
             * StringTokenizer(Agent, ";"); st.nextToken(); // 获取用户的浏览器名 String
             * userbrowser = st.nextToken(); System.out.println(userbrowser); //
             * 写入登录日志 LoginLog log = new LoginLog(); log.setDevice(userbrowser);
             * log.setIp(ip); log.setUserId(userId); log.setLoginTime(new
             * Date()); boolean ifSuccAddLog = loginLogService.addLog(log); */

            rtnMap.put("stateCode", "2");
        }
        // 密码错误
        else if (judgeResult == 1) {
            rtnMap.put("stateCode", "1");
        }
        // 用户名不存在
        else {
            rtnMap.put("stateCode", "0");
        }

        return rtnMap;
        // response.setCharacterEncoding("UTF-8");
        // response.setContentType("application/json; charset=utf-8");
        // try {
        // PrintWriter writer = response.getWriter();
        // writer.write(rtnMap.toString());
        // writer.flush();
        // writer.close();
        // } catch (IOException e) {
        // e.printStackTrace();
        // }
    }

    /**
     * 管理员获取系统所有用户信息
     */
    @RequestMapping(value = "/allUserList", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getAllUserList(Map<String, Object> param) {
        Map<String, Object> rtnMap = new HashMap<String, Object>();
        rtnMap.put("data", userService.getAllUserList(param));
        return rtnMap;
    }

    /**
     * 超级管理员获取系统所有用户信息
     */
    @RequestMapping(value = "/userList", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getUserList(Map<String, Object> param) {
        Map<String, Object> rtnMap = new HashMap<String, Object>();
        rtnMap.put("data", userService.getUserList(param));
        return rtnMap;
    }

    /**
     * 锁定用户
     */
    @RequestMapping(value = "/lockUser/{userId}", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> lockUser(@PathVariable Integer userId) {
        Map<String, Object> rtnMap = new HashMap<String, Object>();
        Boolean bool = userService.updateLockUser(userId);
        if (bool) {
            rtnMap.put("message", "锁定成功！");
        } else {
            rtnMap.put("message", "锁定失败！");
        }
        return rtnMap;
    }

    /**
     * 解锁用户
     */
    @RequestMapping(value = "/unLockUser/{userId}", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> unLockUser(@PathVariable Integer userId) {
        Map<String, Object> rtnMap = new HashMap<String, Object>();
        Boolean bool = userService.updateUnLockUser(userId);
        if (bool) {
            rtnMap.put("message", "解锁成功！");
        } else {
            rtnMap.put("message", "解锁失败！");
        }
        return rtnMap;
    }

    /**
     * 根据id查询用户相关信息
     */
    @RequestMapping(value = "/seleteUserInfo/{userId}", method = RequestMethod.GET)
    @ResponseBody
    public User selectUserInfoByPrimaryKey(@PathVariable Integer userId) {
        User user = userService.selectUserInfoByPrimaryKey(userId);
        return user;
    }

    /**
     * 根据id删除用户
     */
    @RequestMapping(value = "/delete/{userId}", method = RequestMethod.DELETE)
    @ResponseBody
    public Map<String, Object> deleteByPrimaryKey(@PathVariable Integer userId) {
        Map<String, Object> rtnMap = new HashMap<String, Object>();

        userService.deleteByPrimaryKey(userId);

        // 根据id查询用户
        User user = userService.getUserById(userId);
        if (user == null) {
            rtnMap.put("message", "删除成功");
        } else {
            rtnMap.put("message", "删除失败");
        }

        return rtnMap;
    }

    /**
     * 设置用户角色
     */
    @RequestMapping(value = "/settingUserRole", method = RequestMethod.POST)
    @ResponseBody
    public Object settingUserRole(HttpServletRequest request) {

        Map<String, Object> rtnMap = new HashMap<String, Object>();

        Integer userId = Integer.parseInt(request.getParameter("userId"));
        Integer type = Integer.parseInt(request.getParameter("type"));

        if (type == 1) {
            userService.settingUserRole(userId, 1);
            if (userService.getUserById(userId).getType() == 1) {
                rtnMap.put("message", "设置成功！");
                rtnMap.put("data", "取消管理员");
            } else {
                rtnMap.put("message", "设置失败！");
            }

        } else if (type == 0) {
            userService.settingUserRole(userId, 0);
            if (userService.getUserById(userId).getType() == 0) {
                rtnMap.put("message", "取消成功！");
                rtnMap.put("data", "设为管理员");
            } else {
                rtnMap.put("message", "取消失败！");
            }

        }

        return rtnMap;

    }

    /**
     * 修改用户信息
     * 
     * @return
     */
    @RequestMapping(value = "/updateUser", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateUser(HttpServletRequest request) {
        Map<String, Object> rtnMap = new HashMap<String, Object>();

        Integer userId = Integer.parseInt(request.getParameter("id"));
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        User user = new User();
        user.setId(userId);
        user.setUsername(username);
        user.setEmail(email);
        user.setPhoneNum(phone);
        Boolean bool = userService.updateUser(user);

        if (bool) {
            rtnMap.put("message", "更新成功！");
        } else {
            rtnMap.put("message", "更新失败！");
        }
        return rtnMap;
    }

    /**
     * 修改用户信息
     * 
     * @return
     */
    @RequestMapping(value = "/updatePassword", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updatePassword(HttpServletRequest request, HttpSession session) {
        Map<String, Object> rtnMap = new HashMap<String, Object>();

        Integer userId = (Integer) session.getAttribute("userId");

        String oldPassword = MD5Util.getMD5(request.getParameter("oldPassword"));
        String newPassword = MD5Util.getMD5(request.getParameter("newPassword"));

        String password = userService.getUserById(userId).getPassword();
        if (oldPassword.equals(password)) {
            User user = new User();
            user.setId(userId);
            user.setPassword(newPassword);
            Boolean bool = userService.updateUser(user);
            if (bool) {
                rtnMap.put("message", "success");
            } else {
                rtnMap.put("message", "fail");
            }
        } else {
            rtnMap.put("message", "no");
        }

        return rtnMap;
    }

}
