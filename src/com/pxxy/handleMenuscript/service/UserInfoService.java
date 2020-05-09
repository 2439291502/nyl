package com.pxxy.handleMenuscript.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pxxy.handleMenuscript.bean.AddressList;
import com.pxxy.handleMenuscript.bean.UserInfo;
import com.pxxy.handleMenuscript.ex.PasswordNotFoundException;
import com.pxxy.handleMenuscript.ex.UserNotFoundException;
import com.pxxy.handleMenuscript.ex.UsernameAlreadyExistException;
import com.pxxy.handleMenuscript.mapper.AddressListMapper;
import com.pxxy.handleMenuscript.mapper.UserInfoMapper;
/**
 * 系统用户业务层
 */
@Service
public class UserInfoService implements IUserInfoService {
	@Resource
	private UserInfoMapper userMapper;
	@Resource
	private AddressListMapper aListMapper;
	
	//=======================投稿作者操作==============================
	@Override
	public boolean checkUserByUsername(String username) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.selectUserByUsername(username) != null;
	}
	@Override
	public void register(UserInfo user) throws Exception {
		// TODO Auto-generated method stub
		UserInfo user1 = userMapper.selectUserByUsername(user.getUsername());
		if (user1 == null) {
			userMapper.insertUser(user);
		} else {
			throw new UsernameAlreadyExistException("用户名已经存在");
		}

	}
	/**
	 * 专家/作者登录验证
	 */
	@SuppressWarnings("unused")
	@Override
	public UserInfo login(String username, String password) throws Exception {
		// TODO Auto-generated method stub
		UserInfo user = userMapper.selectUserByUsername(username);
		Integer state=user.getState();
		System.out.println("state:........"+state);
		if (user == null) {
			throw new UserNotFoundException("用户名不存在");
		} else if (user.getState() == 0) {
			throw new UserNotFoundException("用户还未激活，等管理员审核");
		} else {
			System.out.println(user.getPassword());
			if (user.getPassword().equals(password)) {
				return user;
			} else {
				throw new PasswordNotFoundException("密码不正确");
			}
		}
	}

	/**
	 * 编辑登录验证
	 */
	@SuppressWarnings("null")
	@Override
	public UserInfo editorLogin(String username, String password) throws Exception {
		// TODO Auto-generated method stub
		UserInfo user = userMapper.selectUserByUsername(username);
		if (user == null && (user.getTypeId()==30||user.getTypeId()==31)) {
			throw new UserNotFoundException("你还不是编辑管理员");
		} else {
			if (user.getPassword().equals(password)) {
				return user;
			} else {
				throw new PasswordNotFoundException("密码不正确");
			}
		}
	}
	
	/**
	 * 查询所有用户
	 */
	@Override
	public PageInfo<UserInfo> selectAllUsers(int pageCode, int pageSize) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageCode, pageSize);
		List<UserInfo> userList = userMapper.selectAllUsers();
		PageInfo<UserInfo> pageInfo = new PageInfo<>(userList);
		return pageInfo;
	}
	@Override
	public PageInfo<UserInfo> selectState(Integer state, int pageCode, int pageSize) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageCode, pageSize);
		List<UserInfo> userList = userMapper.selectState(state);
		PageInfo<UserInfo> pageInfo = new PageInfo<>(userList);
		return pageInfo;
	}
	
	// 激活系统用户
	@Override
	public void activeUsers(String[] userIds) {
		// TODO Auto-generated method stub
		userMapper.activeUsers(userIds);
	}
	
	// 批量冻结系统用户
	@Override
	public void freezeUsers(String[] userIds) {
		// TODO Auto-generated method stub
		userMapper.freezeUsers(userIds);
	}
	/**
	 * 查询用户
	 */
	@Override
	public UserInfo selectUserById(String userId) {
		// TODO Auto-generated method stub
		return userMapper.selectUserById(userId);
	}
	
	//更新用户信息
	@Override
	public void updateUserInfo(UserInfo user) {
		// TODO Auto-generated method stub
		userMapper.updateUserInfo(user);
	}
	
	//模糊分页查询系统用户
	@Override
	public PageInfo<UserInfo> selectUsersByUsername(String username, int pageCode, int pageSize) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageCode, pageSize);
		List<UserInfo> userList = userMapper.selectUsersByUsername(username);
		PageInfo<UserInfo> pageInfo = new PageInfo<>(userList);
		return pageInfo;
	}
	
	//==============用户联系人操作================
	@Override
	public void insertAList(AddressList addressList) {
		// TODO Auto-generated method stub
		aListMapper.insertAList(addressList);
	}

	//查找稿件相关作者
	@Override
	public AddressList selectAListById(String aListId) {
		// TODO Auto-generated method stub
		return aListMapper.selectAListById(aListId);
	}
	//删除稿件相关作者信息
	@Override
	public void deleteAListById(String aListId) {
		// TODO Auto-generated method stub
		aListMapper.deleteAListById(aListId);
	}
	
}
