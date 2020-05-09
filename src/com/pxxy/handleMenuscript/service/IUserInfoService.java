package com.pxxy.handleMenuscript.service;

import org.apache.ibatis.annotations.Param;

import com.github.pagehelper.PageInfo;
import com.pxxy.handleMenuscript.bean.AddressList;
import com.pxxy.handleMenuscript.bean.UserInfo;

public interface IUserInfoService {
	//==============投稿者操作================
	
	/**
	 * 模糊查询
	 * @param username
	 * @return
	 */
	PageInfo<UserInfo> selectUsersByUsername(@Param(value="username")String username,int pageCode, int pageSize);
	/**
	 * 验证用户名是否存在
	 * @param username
	 * @return
	 */
	boolean checkUserByUsername(String username)throws Exception;
	/**
	 * 注册用户信息
	 * @param user
	 */
	void register(UserInfo user) throws Exception;
	/**
	 *专家/作者登陆验证
	 * @param username
	 * @param password
	 * @return
	 */
	UserInfo login(String username,String password) throws Exception;
	/**
	 * 编辑登录验证
	 * @param username
	 * @param password
	 * @return
	 * @throws Exception
	 */
	UserInfo editorLogin(String username, String password)throws Exception;
	//------------------管理员操作用户信息--------
	/**
	 * 查询所有用户信息
	 * @return
	 */
	PageInfo<UserInfo> selectAllUsers(int pageCode, int pageSize);
	/**
	 * 查询所有用户状态
	 * @param sate
	 * @return
	 */
	PageInfo<UserInfo> selectState(Integer state,int pageCode, int pageSize);
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
	 * Id查询用户信息
	 * @param userId
	 * @return
	 */
	UserInfo selectUserById(String userId);
	/**
	 * 更新用户信息
	 * @param user
	 */
	void updateUserInfo(UserInfo user);
	
	
	
	
	
	
	
	
	//==============用户联系人操作================
	/**
	 * 添加联系人
	 * @param addressList
	 */
	void insertAList(AddressList addressList);
	/**
	 * 查询
	 * @param aListId
	 * @return
	 */
	AddressList selectAListById(String aListId);
	/**
	 * 删除
	 * @param aListId
	 */
	void deleteAListById(String aListId);
	 
 
	 
}
