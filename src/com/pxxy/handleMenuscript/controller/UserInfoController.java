package com.pxxy.handleMenuscript.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pxxy.handleMenuscript.bean.ResponseResult;
import com.pxxy.handleMenuscript.bean.UserInfo;

import com.pxxy.handleMenuscript.service.IUserInfoService;

/**
 * 投稿作者控制层
 * @author ASUS
 */
@Controller
@RequestMapping("/user")
public class UserInfoController {
	@Resource
	private IUserInfoService userService;

	/* =========================注册======================= */
	// 显示注册页面
	@RequestMapping("/showRegister.do")
	public String showRegister() {
		return "userRegister";

	}

	/**
	 * 验证用户名是否已注册
	 * 
	 * @param username
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/checkUsername.do")
	@ResponseBody // 不经过视图解析
	public ResponseResult<Void> checkUsername(@RequestParam("username") String username) throws Exception {
		ResponseResult<Void> rr = new ResponseResult<Void>();
		boolean b = userService.checkUserByUsername(username);
		//System.out.println(b + "已存在.ture............");
		if (b) {
			rr.setState(0);
			rr.setMessage("该用户名已存在");
		} else {
			rr.setState(1);
			rr.setMessage("用户名可以使用");
		}
		return rr;

	}

	/**
	 * 注册
	 * 
	 * @param username
	 * @param password
	 * @param uRealname
	 * @param uAddress
	 * @param uPhone
	 * @return
	 */
	@RequestMapping("/register.do")
	@ResponseBody
	public ResponseResult<Void> register(@RequestParam("username") String username,
			@RequestParam("password") String password, String trueName, String email, @RequestParam("sex") Integer sex,
			@RequestParam("profession") Integer profession, String research, @RequestParam("postId") Integer postId,
			@RequestParam("eBackgroundId") Integer eBackgroundId, String workUnit, String address, String postcode,
			String phone, String telephone, @RequestParam("applyExpert") Integer applyExpert,
			// @RequestParam("typeId") Integer typeId, //10
			Model model) {
		//System.out.println("applyExpert:" + applyExpert);
		ResponseResult<Void> rr = new ResponseResult<Void>();
		// String psdMd5=Md5.MD5(password);
		String userId = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss").format(new Date()).toString().replace("-", "")
				.toUpperCase();
		UserInfo user = new UserInfo();
		Integer typeId = null;// 投稿作者
		Integer state = null;// 默认激活
		if (applyExpert == 0) {
			// 作者
			state = 1;
			typeId = 10;
			rr.setState(1);
		}
		if (applyExpert == 1) {
			// 专家
			state = 0;
			typeId = 20;
			rr.setState(2);
		}
		user.setUserId(userId);
		user.setUsername(username);
		user.setPassword(password);
		user.setTureName(trueName);
		user.setEmail(email);
		user.setSex(sex);
		user.setProfession(profession);
		user.setResearch(research);
		user.setPostId(postId);
		user.seteBackgroundId(eBackgroundId);
		user.setWorkUnit(workUnit);
		user.setAddress(address);
		user.setPostcode(postcode);
		user.setPhone(phone);
		user.setTelephone(telephone);
		user.setApplyExpert(applyExpert);
		user.setCreateData(new Date());
		user.setUpdateDate(new Date());
		user.setTypeId(typeId);
		user.setState(state);
		model.addAttribute("user", user);
		//System.out.println(user);
		try {
			userService.register(user);
			rr.setMessage("注册成功");
		} catch (Exception e) {
			rr.setState(0);
			rr.setMessage(e.getMessage());
		}
		return rr;
	}

	@RequestMapping("/addUser.do")
	@ResponseBody
	public ResponseResult<Void> addUser(@RequestParam("username") String username,
			@RequestParam("password") String password, String tureName, String email, @RequestParam("sex") Integer sex,
			@RequestParam("profession") Integer profession, String research, @RequestParam("postId") Integer postId,
			@RequestParam("eBackgroundId") Integer eBackgroundId, String workUnit, String address, String postcode,
			String phone, String telephone, @RequestParam("applyExpert") Integer applyExpert,
			@RequestParam("typeId") Integer typeId, Model model) {
		ResponseResult<Void> rr = new ResponseResult<Void>();
		// String psdMd5=Md5.MD5(password);
		String date = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss").format(new Date()).toString().replace("-", "")
				.toUpperCase();
		String userId = date;
		Integer state = 1;// 默认激活
		UserInfo user = new UserInfo();
		user.setUserId(userId);
		user.setUsername(username);
		user.setPassword(password);
		user.setTureName(tureName);
		user.setEmail(email);
		user.setSex(sex);
		user.setProfession(profession);
		user.setResearch(research);
		user.setPostId(postId);
		user.seteBackgroundId(eBackgroundId);
		user.setWorkUnit(workUnit);
		user.setAddress(address);
		user.setPostcode(postcode);
		user.setPhone(phone);
		user.setTelephone(telephone);
		user.setApplyExpert(applyExpert);
		user.setCreateData(new Date());
		user.setUpdateDate(new Date());
		user.setTypeId(typeId);
		user.setState(state);
		model.addAttribute("user", user);
		//System.out.println(user);
		try {
			userService.register(user);
			rr.setState(1);
			rr.setMessage("注册成功");
		} catch (Exception e) {
			rr.setState(0);
			rr.setMessage(e.getMessage());
		}
		return rr;
	}

	/* =========================登录======================= */
	// 显示登陆页面
	@RequestMapping("/showLogin.do")
	public String showLogin() {
		return "author_login";

	}

	@RequestMapping("/login.do")
	@ResponseBody // 不经过视图解析
	public ResponseResult<Void> login(String username, String password, HttpSession session) {
		ResponseResult<Void> rr = new ResponseResult<Void>();
		try {
			// String psdMd5=Md5.MD5(password);
			// System.out.println("获取页面数据：" + username + password);
			UserInfo user = userService.login(username, password);
			session.setAttribute("user", user);
			rr.setState(1);
			rr.setMessage("登陆成功");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			rr.setState(0);
			rr.setMessage(e.getMessage());
		}
		return rr;
	}

	/* 加载用户信息 */
	@RequestMapping("/preLoadUser.do")
	public String preLoadUser(String userId, Model model) {
		UserInfo user = userService.selectUserById(userId);
		model.addAttribute("user", user);
		return "edit_user";

	}

	/**
	 * 系统用户退出登录
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping("/exit.do")
	public String exit(HttpSession session) {
		session.invalidate();
		return "index";

	}
	//个人信息页面
	@RequestMapping("/showUserInfo.do")
	public String showUserInfo(HttpSession session,Model model) {
		UserInfo user1=(UserInfo) session.getAttribute("user");
		UserInfo user = userService.selectUserById(user1.getUserId());
		model.addAttribute("user", user);
  		return "user_info";

	}
	
	//更新用户updateUser
	@RequestMapping("/updateUser.do")
	@ResponseBody
	public ResponseResult<Void> updateUser(HttpSession session,String username,String npassword) {
		ResponseResult<Void> rr=new ResponseResult<Void>();
		UserInfo user1=(UserInfo) session.getAttribute("user");
		UserInfo user=new UserInfo();
		user.setUserId(user1.getUserId());
		user.setUsername(username);
		user.setPassword(npassword);
		user.setUpdateDate(new Date());
		try {
			userService.updateUserInfo(user);
			//System.out.println("rr.setMessage(\"修改成功\")");
			rr.setState(1);
			rr.setMessage("修改成功");
			return rr;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			//System.out.println(e);
			rr.setState(0);
			rr.setMessage("操作失败");
			return rr;
		}
	}
	

}
