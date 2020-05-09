package com.pxxy.handleMenuscript.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pxxy.handleMenuscript.bean.UserInfo;

public interface UserInfoMapper {
	 
	/**
	 * 模糊查询
	 * @param username
	 * @return
	 */
	List<UserInfo> selectUsersByUsername(@Param(value="username")String username);
	/**
	 * Id查询用户信息
	 * @param userId
	 * @return
	 */
	UserInfo selectUserById(String userId);
	/**
	 * 注册用户
	 * @param user
	 */
	void insertUser(UserInfo user);
	/**
	 * 更新用户信息
	 * @param user
	 */
	void updateUserInfo(UserInfo user);
	
	/**
	 * 查询所有用户信息
	 * @return
	 */
	List<UserInfo> selectAllUsers();
	/**
	 * 激活用户信息
	 * @param userIds
	 */
	void activeUsers(String[] userIds);
	/**
	 * 批量冻结
	 * @param userIds
	 */
	void freezeUsers(String[] userIds);
	/**
	 * 查询激活状态sate
	 * @param sate
	 * @return
	 */
	List<UserInfo> selectState(@Param(value="state")Integer state);
	/**
	 * 登录
	 * @param username
	 * @return
	 */
	UserInfo selectUserByUsername(String username);
	
	
}
