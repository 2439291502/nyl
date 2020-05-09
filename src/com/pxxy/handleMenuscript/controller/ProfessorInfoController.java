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

import com.github.pagehelper.PageInfo;
import com.pxxy.handleMenuscript.bean.ContributeEssay;
import com.pxxy.handleMenuscript.bean.EssayComment;
import com.pxxy.handleMenuscript.bean.EssayInfo;
import com.pxxy.handleMenuscript.bean.ResponseResult;
import com.pxxy.handleMenuscript.bean.UserInfo;
import com.pxxy.handleMenuscript.service.IContributeEssayService;
import com.pxxy.handleMenuscript.service.IEssayCommentService;
import com.pxxy.handleMenuscript.service.IEssayInfoService;
import com.pxxy.handleMenuscript.service.IUserInfoService;
/**
 * 专家操作控制层
 * @author ASUS
 *
 */
@Controller
@RequestMapping("/professor")
public class ProfessorInfoController {
	@Resource
	private IUserInfoService userService;
	@Resource
	private IEssayInfoService essayService;
	@Resource
	private IContributeEssayService cEssayService; 
	@Resource
	private IEssayCommentService eCommentService;
	/*==============================================*/
	
	//显示专家登陆页面
	@RequestMapping("/showLogin.do")
	public String showLogin() {
 		return "professor_login";
		
	}
	/**
	 * 专家注册
	 * @param username
	 * @param password
	 * @param session
	 * @return
	 */
	@RequestMapping("/login.do")
	@ResponseBody		//不经过视图解析
	public ResponseResult<Void> login(
			String username, 
			String password,
			HttpSession session
			){
		ResponseResult<Void> rr=new ResponseResult<Void>();
		try {
//			String psdMd5=Md5.MD5(password);
			System.out.println("获取页面数据："+username+password);
			UserInfo user=userService.login(username, password);
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
	/**
	 * 专家的工作空间
	 * @param session
	 * @return
	 */
	@RequestMapping("/professorWorkDesk.do")
	public String professorWorkDesk() {
		return "professor_workdesk";	
	}
	/**
	 * 专家注册   设置为未激活状态   0
	 * @param username
	 * @param password
	 * @param tureName
	 * @param email
	 * @param sex
	 * @param profession
	 * @param research
	 * @param postId
	 * @param eBackgroundId
	 * @param workUnit
	 * @param address
	 * @param postcode
	 * @param phone
	 * @param telephone
	 * @param applyExpert
	 * @param typeId     20、21、22
	 * @param model
	 * @return
	 */
	@RequestMapping("/register.do")
	@ResponseBody	
	public ResponseResult<Void> register(
			@RequestParam("username") String username,
			@RequestParam("password") String password,
			String tureName,
			String email,
			@RequestParam("sex")Integer sex,
			@RequestParam("profession") Integer profession,
			String research,
			@RequestParam("postId") Integer postId,
			@RequestParam("eBackgroundId") Integer eBackgroundId,
			String workUnit,
			String address,
			String postcode,
			String phone,
			String telephone,
			@RequestParam("applyExpert") Integer applyExpert,			
			//@RequestParam("typeId") Integer typeId,
			Model model
			){
		ResponseResult<Void> rr=new ResponseResult<Void>();
//		String psdMd5=Md5.MD5(password);
		String userId=new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss")
				.format(new Date()).toString().replace("-", "")
				.toUpperCase();
		Integer typeId=20;	// 20一、21二、22三
		Integer state=0;	//处于未激活状态待审核 0
		UserInfo user=new UserInfo();
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
		System.out.println("专家注册成功user:"+user);
		try {
			userService.register(user);
			
			rr.setState(1);
			rr.setMessage("注册成功，等待管理员审核");
		}catch(Exception e) {
			rr.setState(0);
			rr.setMessage(e.getMessage());
		}
		return rr;	
	}
	@RequestMapping("/paperCenter.do")
	public String paperCenter() {
		return "professor_paper_center";
	}
	//selectEssayByUserId
	/**
	 * 专家处理待审核稿件
	 * @param statusId
	 * @param pageCode
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/selectPreHandleEssay.do")
	public String selectPreHandleEssay(
			@RequestParam("statusId")Integer statusId,
			@RequestParam(value = "pageCode", defaultValue = "1", required = false) Integer pageCode,
			Model model,
			HttpSession session) {
		Integer pageSize=6;
		UserInfo user=(UserInfo) session.getAttribute("user");
		PageInfo<ContributeEssay>  pageInfo=cEssayService.selectEssayByUserId(user.getUserId(),statusId,pageCode, pageSize);
		
		model.addAttribute("pageInfo", pageInfo);
		return "professor_paper_center";
	}
	//rejuctComment//updateEssayIds
	/**
	 * 专家拒绝审理稿件      补充：发送留言给编辑管理员不审理稿件
	 * @param essayIds
	 * @param pageCode
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/rejuctComment.do")
	public String rejuctComment(
			@RequestParam("essayIds") String[] essayIds,
			@RequestParam(value = "pageCode", defaultValue = "1", required = false) Integer pageCode,
			Model model,
			HttpSession session) {
		try {
			essayService.updateEssayIds(essayIds);
			return "redirect:/professor/selectPreHandleEssay.do?statusId=62&pageCode="+pageCode;
		}catch(Exception e) {
			return "404";
		}
			
		
	}
	//专家审理稿件页面
	@RequestMapping("/showComment.do")
	public String showComment(String essayId,Model model) {
		EssayInfo essay=essayService.preLoadEssayById(essayId);
		model.addAttribute("essay", essay);
		return "professor_comment_essay";
		
	}
	//insertEssayComment
	@RequestMapping("/addEssayComment.do")
	@ResponseBody
	public ResponseResult<Void> addEssayComment(
			String essayId,
			String designCommentId,
			String contentCommentId,
			String dataCommentId,
			String discussCommentId,
			String resultCommentId,
			String commentDetails,
			HttpSession session) {
		ResponseResult<Void> rr=new ResponseResult<Void>();
		UserInfo user=(UserInfo) session.getAttribute("user");
		EssayComment eComment=new EssayComment();
		eComment.setCommentId(new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss")
				.format(new Date()).toString().replace("-", "")
				.toUpperCase());
		eComment.setEssayId(essayId);
		eComment.setcUsernameId(user.getUserId());
		eComment.setDesignCommentId(designCommentId);
		eComment.setContentCommentId(contentCommentId);
		eComment.setDataCommentId(dataCommentId);
		eComment.setDiscussCommentId(discussCommentId);
		eComment.setResultCommentId(resultCommentId);
		eComment.setCommentDetails(commentDetails);
		
		eComment.setCommentLevel(user.getTypeId());//专家评论
		eComment.setCommentDate(new Date());
		
		EssayInfo essay=new EssayInfo();
		essay.setEssayId(essayId);
		essay.setStatusId(63); //修改稿件转台为63（专家已审核稿件）
		
		try {
			eCommentService.insertEssayComment(eComment);
			//修改稿件状态为63
			essayService.updateEssayById(essay);
			System.out.println("专家审核稿件成功。。。。。。。。。。。");
			rr.setState(1);
			rr.setMessage("审核成功");
			return rr;
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			rr.setState(0);
			rr.setMessage("操作失败");
			return rr;
		}
		
	}
	//selectCommentDetails
	@RequestMapping("/selectCommentDetails.do")
	public String selectCommentDetails(
			String essayId,
			HttpSession session,
			Model model) {
		EssayInfo essay=essayService.preLoadEssayById(essayId);
		UserInfo user=(UserInfo) session.getAttribute("user");
		EssayComment eComment=eCommentService.selectCommentDetails(essayId, user.getUserId());
		model.addAttribute("eComment", eComment);
		model.addAttribute("essay", essay);
		return "select_comment_details";
	}
	
	//专家修改稿件
	@RequestMapping("/updateEssayComment.do")
	@ResponseBody
	public ResponseResult<Void> updateEssayComment(String commentId, // 页面获取评论id
			String essayId, String designCommentId, String contentCommentId, String dataCommentId,
			String discussCommentId, String resultCommentId, String commentDetails, HttpSession session) {
		ResponseResult<Void> rr = new ResponseResult<Void>();
		UserInfo user = (UserInfo) session.getAttribute("user");
		EssayComment eComment = new EssayComment();
		eComment.setCommentId(commentId);
		eComment.setEssayId(essayId);
		eComment.setcUsernameId(user.getUserId());
		eComment.setDesignCommentId(designCommentId);
		eComment.setContentCommentId(contentCommentId);
		eComment.setDataCommentId(dataCommentId);
		eComment.setDiscussCommentId(discussCommentId);
		eComment.setResultCommentId(resultCommentId);
		eComment.setCommentDetails(commentDetails);
		eComment.setCommentLevel(user.getTypeId());// 专家评论
		eComment.setCommentDate(new Date());

		try {
			eCommentService.updateEssayCommentById(eComment);
			// System.out.println("编辑审核稿件成功。。。。。。。。。。。");
			rr.setState(1);
			rr.setMessage("成功修改审核");
			return rr;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			rr.setState(0);
			rr.setMessage("操作失败");
			System.out.println(e);
			return rr;
		}
	}

}
