package com.zl.travel.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.zl.travel.domain.User;

public interface UserMapper {

	List<User> listUserByCredit();
	
    // 用户注册
    int insert(User user);

    // 保存用户
    int insertSelective(User user);

    // 查询用户名是否存在
    int existUsername(String username);

    // 通过用户名查询用户
    User selectByUsername(String username);

    
    // 根据id查询用户
    User selectByPrimaryKey(Integer id);

    // 根据id查询用户
    User selectUserInfoByPrimaryKey(Integer id);

    // 根据id删除用户
    int deleteByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);    

    // 多参数注解
    int addCredit(@Param("points") Integer points, @Param("id") Integer id);

    // 查询用户数
    // int getUserCount();


/*====================后台方法=====================*/

    // 查询用户名是否存在
    int existUsername2(String username);

    // 通过用户名查询用户
    User selectByUsername2(String username);


    // 查询系统中的所有用户信息
    List<User> getUserList(@Param("param") Map<String, Object> param);

    // 查询系统中的所有用户信息
    List<User> getAllUserList(@Param("param") Map<String, Object> param);

    // 锁定用户
    int updateLockUserByPrimaryKey(Integer id);

    // 解锁用户
    int updateUnLockUserByPrimaryKey(Integer id);

    // 更新用户角色
    int updateUserRole(@Param("id")Integer id, @Param("type") Integer type);

}