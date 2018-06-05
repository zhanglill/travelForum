package com.zl.travel.service;

import java.util.List;
import java.util.Map;

import com.zl.travel.domain.User;

public interface UserService {
	
	/**
	 * 查询所有用户
	 */
	public List<User> listUserByCredit();
	
	
	/**
	 * 用户注册
	 */
	public boolean save(User user);

	/**
	 * 登录验证
	 */
	public int loginCheck(String username, String password);

	/**
	 * 登录验证
	 */
	public int userLoginCheck(String username, String password);

	/**
	 * 检查用户名是否存在
	 * 
	 * @param username
	 * @return
	 */
	public boolean existUsername(String username);

	/**
	 * 根据用户名获取用户信息
	 * 
	 * @param username
	 * @return
	 */
	public User getUserByUsername(String username);

	/**
	 * 根据用户名获取用户信息
	 * 
	 * @param username
	 * @return
	 */
	public User getUserByUsername2(String username);

	/**
	 * 根据用户id获取用户信息
	 * 
	 * @param id
	 * @return
	 */
	public User getUserById(Integer id);

	/**
	 * 更新用户信息
	 * 
	 * @param user
	 * @return
	 */
	public boolean updateUser(User user);

	/**
	 * 获取用户数
	 */
	// public int getUserCount();

	/**
	 * 添加积分
	 */
	public boolean addCredit(Integer points, Integer id);

	/* ===================后台方法============================= */

	// 查询系统中的所有用户信息
	public List<User> getUserList(Map<String, Object> param);

	// 超级管理员角色 查询系统中的所有用户信息
	public List<User> getAllUserList(Map<String, Object> param);

	// 锁定用户
	public boolean updateLockUser(Integer id);

	// 解锁用户
	public boolean updateUnLockUser(Integer id);

	// 删除用户
	public int deleteByPrimaryKey(Integer id);

	// 查询用户相关信息
	public User selectUserInfoByPrimaryKey(Integer id);

	// 设置用户角色
	public boolean settingUserRole(Integer id, Integer type);

}
