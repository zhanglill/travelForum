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

import com.zl.travel.domain.SystemNotice;
import com.zl.travel.service.impl.SystemNoticeServiceImpl;

/**
 * 主题相关控制类
 */
@Controller
@RequestMapping(value = "/notice")
@ResponseBody
public class SystemNoticeController {

    @Autowired
    public SystemNoticeServiceImpl systemNoticeService;

    @RequestMapping(value = "/add")
    public Object addSystemNotice(HttpServletRequest request, HttpSession session) {

        String noticeName = request.getParameter("noticeName");
        String noticeContent = request.getParameter("noticeContent");

        Integer userId = (Integer) session.getAttribute("userId");

        SystemNotice notice = new SystemNotice();
        notice.setUserId(userId);
        notice.setTitle(noticeName);
        notice.setContent(noticeContent);
        notice.setCreateTime(new Date());
        notice.setDelFlag("0");

        Boolean bool = systemNoticeService.addSystemNotice(notice);

        HashMap<String, String> res = new HashMap<String, String>();
        if (bool) {
            res.put("message", "success");
        } else {
            res.put("message", "fail");
        }
        return res;

    }

    @RequestMapping(value = "/selectById/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Object selectById(@PathVariable("id") Integer id) {
        Map<String, Object> rtnMap = new HashMap<String, Object>();
        SystemNotice notice = systemNoticeService.selectById(id);
        rtnMap.put("data", notice);
        return rtnMap;

    }
    /* public ModelAndView selectById(@PathVariable("id") Integer id) {
     * ModelAndView indexPage = new ModelAndView("manage/systemNotice_detail");
     * Map<String, Object> rtnMap = new HashMap<String, Object>();
     * SystemNotice notice = systemNoticeService.selectById(id);
     * //rtnMap.put("data", notice);
     * //return rtnMap;
     * indexPage.addObject("data", notice);
     * return indexPage;
     * } */

    @RequestMapping(value = "/listSytemNotice", method = RequestMethod.GET)
    @ResponseBody
    public Object listSystemNotice(HttpServletRequest request) {

    	Map<String, Object> params = new HashMap<String, Object>();
    	
    	String searchParam = request.getParameter("searchParam");
    	params.put("searchParam", searchParam);
    	
        Map<String, Object> rtnMap = new HashMap<String, Object>();
        List<SystemNotice> notice = systemNoticeService.listSystemNotice(params);
        
        
        rtnMap.put("data", notice);
        return rtnMap;

    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public Object updateByPrimaryKeySelective(HttpServletRequest request) {

        Integer noticeId = Integer.parseInt(request.getParameter("noticeId"));
        String noticeName = request.getParameter("noticeName");
        String noticeContent = request.getParameter("noticeContent");

        SystemNotice notice = new SystemNotice();
        notice.setId(noticeId);
        notice.setTitle(noticeName);
        notice.setContent(noticeContent);
        notice.setUpdateTime(new Date());

        Boolean bool = systemNoticeService.updateByPrimaryKeySelective(notice);

        HashMap<String, String> res = new HashMap<String, String>();
        if (bool) {
            res.put("message", "更新成功！");
        } else {
            res.put("message", "更新失败！");
        }
        return res;

    }

    @RequestMapping(value = "/delete/{userId}", method = RequestMethod.DELETE)
    @ResponseBody
    public Map<String, Object> deleteByPrimaryKey(@PathVariable Integer userId) {
        Map<String, Object> rtnMap = new HashMap<String, Object>();

        systemNoticeService.deleteByPrimaryKey(userId);

        // 根据id查询用户
        SystemNotice notice = systemNoticeService.selectById(userId);
        if (notice == null) {
            rtnMap.put("message", "删除成功");
        } else {
            rtnMap.put("message", "删除失败");
        }

        return rtnMap;
    }

    @RequestMapping(value = "/count", method = RequestMethod.GET)
    @ResponseBody
    public Object count() {
        Map<String, Object> rtnMap = new HashMap<String, Object>();
        int count = systemNoticeService.getSystemNoticeNum();
        rtnMap.put("data", count);
        return rtnMap;
    }

}
