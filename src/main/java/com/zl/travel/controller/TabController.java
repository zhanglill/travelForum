package com.zl.travel.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zl.travel.domain.Tab;
import com.zl.travel.service.TabService;

@Controller
@RequestMapping(value = "/tab")
@ResponseBody
public class TabController {

	@Autowired
	private TabService tabService;

	// 查询所有tab
	@RequestMapping(value = "/search")
	@ResponseBody
	public Map<String, Object> search() {
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		List<Tab> tab = tabService.getAllTabs();
		rtnMap.put("data", tab);
		return rtnMap;
	}

	// 根据id查询tab
	@RequestMapping(value = "/getTabById/{id}")
	@ResponseBody
	public Map<String, Object> selectByPrimaryKey(@PathVariable("id") Integer id) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		Tab tab = tabService.selectByPrimaryKey(id);
		rtnMap.put("data", tab);
		return rtnMap;
	}

	// 添加tab
	@RequestMapping("/add")
	public Object add(HttpServletRequest request) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();

		String tabName = request.getParameter("tabName");
		String tabNameEn = request.getParameter("tabNameEn");

		Tab tab = new Tab();
		tab.setTabName(tabName);
		tab.setTabNameEn(tabNameEn);
		tab.setDelFlag("0");

		/*Boolean bool = tabService.insertSelective(tab);

		if (bool) {
			rtnMap.put("message", "success");
		} else {
			rtnMap.put("message", "fail");
		}*/
		tabService.insertSelective(tab);
		rtnMap.put("message", "success");
		return rtnMap;

	}

	// 更新tab
	@RequestMapping(value = "/update")
	@ResponseBody
	public Object update(HttpServletRequest request) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();

		Integer tabId = Integer.parseInt(request.getParameter("tabId"));
		String tabName = request.getParameter("tabName");
		String tabNameEn = request.getParameter("tabNameEn");

		Tab tab = new Tab();
		tab.setId(tabId);
		tab.setTabName(tabName);
		tab.setTabNameEn(tabNameEn);

		Boolean bool = tabService.updateByPrimaryKeySelective(tab);

		if (bool) {
			rtnMap.put("message", "更新成功");
		} else {
			rtnMap.put("message", "更新失败");
		}
		return rtnMap;
	}

	// 删除tab
	@RequestMapping(value = "/delete/{id}")
	@ResponseBody
	public Map<String, Object> delete(@PathVariable("id") Integer id) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		Boolean bool = tabService.deleteByPrimaryKey(id);

		if (bool) {
			rtnMap.put("message", "删除成功");
		} else {
			rtnMap.put("message", "删除失败");

		}
		return rtnMap;
	}

}
