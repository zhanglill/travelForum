package com.zl.travel.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zl.travel.dao.UserMapper;
import com.zl.travel.domain.User;
import com.zl.travel.service.UserService;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    public UserMapper userDao;

    public List<User> listUserByCredit() {
    	return userDao.listUserByCredit();
    };
    
    /**
     * 用户注册
     */
    public boolean save(User user) {

        return userDao.insertSelective(user) > 0;
    }

    /**
     * 登录验证
     */
    public int loginCheck(String username, String password) {

        // 判断用户名是否存在
        //		boolean existUsername = existUsername(username);
        boolean existUsername = (userDao.existUsername(username) == 1);

        // 若用户名存在，验证密码
        if (existUsername) {
            User rtnUser = userDao.selectByUsername(username);
            if (rtnUser.getPassword().equals(password)) {

                // 2:验证成功
                return 2;
            }

            // 1:密码错误
            return 1;
        }

        // 0:用户名不存在
        return 0;
    }

    
    /**
     * 用户名是否存在
     */
    public boolean existUsername(String username) {
        // 若为1,则用户存在，返回true,否则返回false
        return userDao.existUsername(username) == 1;
    }

    /**
     * 登录后获取用户信息
     */
    public User getUserByUsername(String username) {
        User rtnUser = userDao.selectByUsername(username);
        return rtnUser;
    }

   

    /**
     * 根据id获取用户信息
     */
    public User getUserById(Integer id) {
        return userDao.selectByPrimaryKey(id);
    }

    /**
     * 更新用户
     */
    @Override
    public boolean updateUser(User user) {
        return userDao.updateByPrimaryKeySelective(user) > 0;
    }



    /**
     * 获取用户数
     */
    //	public int getUserCount() {
    //		return userDao.getUserCount();
    //	}

    /**
     * 增加积分
     */
    public boolean addCredit(Integer points, Integer id) {
        return userDao.addCredit(points, id) > 0;
    }

/*==========================后台方法==============*/

    /**
     * 管理员登录验证
     */
    public int userLoginCheck(String username, String password) {

        // 判断用户名是否存在
        //      boolean existUsername = existUsername(username);
        boolean existUsername = (userDao.existUsername2(username) == 1);

        // 若用户名存在，验证密码
        if (existUsername) {
            User rtnUser = userDao.selectByUsername2(username);
            if (rtnUser.getPassword().equals(password)) {

                // 2:验证成功
                return 2;
            }

            // 1:密码错误
            return 1;
        }

        // 0:用户名不存在
        return 0;
    }


    /**
     * 登录后获取用户信息
     */
    public User getUserByUsername2(String username) {
        User rtnUser = userDao.selectByUsername2(username);
        return rtnUser;
    }

    // 查询系统中的所有用户信息
    public List<User> getUserList(Map<String, Object> param) {
        return userDao.getUserList(param);
    }

    // 超级管理员角色 查询系统中的所有用户信息
    public List<User> getAllUserList(Map<String, Object> param) {
        return userDao.getAllUserList(param);
    }

    // 删除用户
    public int deleteByPrimaryKey(Integer id) {
        return userDao.deleteByPrimaryKey(id);
    }

    // 查询用户相关信息
    public User selectUserInfoByPrimaryKey(Integer id) {
        return userDao.selectUserInfoByPrimaryKey(id);
    }

        /**
     * 锁定用户
     * 
     * @param user
     * @return
     */
    @Override
    public boolean updateLockUser(Integer id) {
        return userDao.updateLockUserByPrimaryKey(id) > 0;
    }

    /**
     * 解锁用户
     * 
     * @param user
     * @return
     */
    @Override
    public boolean updateUnLockUser(Integer id) {
        return userDao.updateUnLockUserByPrimaryKey(id) > 0;
    }

     // 设置用户角色
    @Override
    public boolean settingUserRole(Integer id, Integer type) {
        return userDao.updateUserRole(id, type) > 0;
    }
}
