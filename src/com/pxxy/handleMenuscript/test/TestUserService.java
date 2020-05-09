package com.pxxy.handleMenuscript.test;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.github.pagehelper.PageInfo;
import com.pxxy.handleMenuscript.bean.UserInfo;
import com.pxxy.handleMenuscript.mapper.UserInfoMapper;
import com.pxxy.handleMenuscript.service.IUserInfoService;

@RunWith(SpringRunner.class)
@ContextConfiguration({
	"classpath:application-dao.xml",
	"classpath:application-service.xml"
	})
public class TestUserService {
	@Autowired
	private UserInfoMapper userMapper;
	@Resource
	private IUserInfoService userService;
	@Test
	public void selectUserByUsername() throws Exception {
		UserInfo list=userMapper.selectUserByUsername("123456");
		System.out.println("list:"+list);
		
	}
	
	
	@Test
	public void insert() {
		UserInfo user=new UserInfo();
		String date =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		user.setUserId(/*UUID.randomUUID().toString().trim()+*/date);
		user.setUsername("12345");
		user.setPassword("12345");
		user.setEmail("12345@qq.com");
		user.setTureName("12345_");
		userMapper.insertUser(user);
	}
	/**
	 *service层验证注册
	 * @throws Exception
	 */
	@Test
	public void register() throws Exception {
		try {
			UserInfo user=new UserInfo();
			
			user.setUserId(new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss")
					.format(new Date()).toString().replace("-", "")
					.toUpperCase());
			user.setUsername("username");
			user.setPassword("123456");
			user.setTureName("tureName");
			user.setEmail("email");
			
			userService.register(user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Test
	public void editorLogin() throws Exception {
		UserInfo user=userService.editorLogin("123456", "123456");
		System.out.println(user);
	}
	
	@Test
	public void selectAllUsers() {
		PageInfo<UserInfo> list=userService.selectAllUsers(1, 2);
		System.out.println(list);
	}
	
	//是否激活
	@Test
	public void selectState() {
		List<UserInfo> list=userMapper.selectState(0);//0未激活
		System.out.println(list.size());
		
	}
	//selectUsersByUsername模糊查询
	@Test
	public void selectUsersByUsername() {
		List<UserInfo> list=userMapper.selectUsersByUsername("3");
		System.out.println(list.size());
	}
	
	

}
