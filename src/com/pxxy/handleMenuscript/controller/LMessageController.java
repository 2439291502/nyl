package com.pxxy.handleMenuscript.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.pxxy.handleMenuscript.bean.LeaveMessage;
import com.pxxy.handleMenuscript.bean.ResponseResult;
import com.pxxy.handleMenuscript.bean.UserInfo;
import com.pxxy.handleMenuscript.service.IEssayInfoService;
/**
 * 留言信息控制层
 * @author ASUS
 *
 */
@Controller
@RequestMapping("/lMessage")
public class LMessageController {
	@Resource
	private IEssayInfoService essayInfoService;
	/**
	 * 用户通过 用户名状态及留言状态查询稿件信息
	 * @param lMessageState
	 * @param pageCode
	 * @param session
	 * @return
	 */
	@RequestMapping("/selectLMessageByUsernameAState.do")
	public String selectLMessageByUsernameAState(
			@RequestParam(value = "lMessageState", defaultValue = "0", required = false) Integer lMessageState,
			@RequestParam(value = "pageCode", defaultValue = "1", required = false) Integer pageCode,
			HttpSession session) {
		//Integer pageCode=1;
		Integer pageSize=4;
		UserInfo user = (UserInfo) session.getAttribute("user");
		
		if(user.getTypeId()==10) {
			PageInfo<LeaveMessage> pageInfo=essayInfoService.selectLMessageByUsernameAState(pageCode, pageSize, user.getUsername(), lMessageState);
			session.setAttribute("pageInfo", pageInfo);
			return "author_paper_center_lMessage";
		}
		if(user.getTypeId()==20 ||user.getState()==21||user.getState()==22) {
			PageInfo<LeaveMessage> pageInfo=essayInfoService.selectLMessageByUsernameAState(pageCode, pageSize, user.getUsername(), lMessageState);
			session.setAttribute("pageInfo", pageInfo);
			return "professor_paper_center_lMessage";
		}
		else {
			PageInfo<LeaveMessage> pageInfo=essayInfoService.selectLMessageByState(lMessageState,pageCode, pageSize);
			session.setAttribute("pageInfo", pageInfo);
			return "editor_paper_center_lMessage";
		}
		
	}
	//加载留言信息preLoadLMessage
	@RequestMapping("/preLoadLMessage.do")
	public String preLoadLMessage(
			String leaveMessageId,
			HttpSession session) {
		try {
			LeaveMessage lMessage=essayInfoService.selectLMessageById(leaveMessageId);
			session.setAttribute("lMessage", lMessage);
			System.out.println(lMessage);
			return"edit_lMessage";
		}catch(Exception e) {
			return"edit_lMessage";
		}
		
	}
	@RequestMapping("/editLMessage.do")
	public String editLMessage() {
		return"edit_lMessage";
	}
	//更新&保存留言String lMessageContent,
	@RequestMapping("/updateLMessage.do")
	@ResponseBody
	public ResponseResult<Void> updateLMessage(
			String leaveMessageId,
			String lMessageContent,
			HttpSession session,
			Model model) {
		ResponseResult<Void> rr=new ResponseResult<Void>();
		System.out.println("修改页面获取的leaveMessageId:"+leaveMessageId);
		UserInfo user=(UserInfo) session.getAttribute("user");
		LeaveMessage lMessage=new LeaveMessage();
		lMessage.setLeaveMessageId(leaveMessageId);
		lMessage.setUsername(user.getUsername());
		lMessage.setlMessageContent(lMessageContent);
		lMessage.setlMessageTime(new Date());
		//lMessage.setlMessageState(1);
		try {
			essayInfoService.updateLMessageById(lMessage);
			rr.setState(1);
			rr.setMessage("修改留言成功");
		}catch(Exception e) {
			rr.setState(0);
			rr.setMessage("修改留言失败");
		}
		return rr;
		
	}
	
	
	//删除留言deleteLMessage
	@RequestMapping("/deleteLMessage.do")
	public String deleteLMessage(
			String leaveMessageId,
			@RequestParam(value = "lMessageState", defaultValue = "0", required = false) Integer lMessageState,
			@RequestParam(value = "pageCode", defaultValue = "1", required = false) Integer pageCode
			) {
		try {
		essayInfoService.deleteLMessageById(leaveMessageId);
		return "redirect:/lMessage/selectLMessageByUsernameAState.do?lMessageState="+lMessageState+"&pageCode"+pageCode;
		}catch(Exception e) {
			return "404";
		}
	}
	/**
	 * 跳转到留言页面
	 * @return
	 */
	@RequestMapping("/showLMessage.do")
	public String showLMessage(HttpSession session) {
		UserInfo user=(UserInfo) session.getAttribute("user");
		if(user.getTypeId()==10) {
			//作者
			return "send_lMessage";
		}
		else{
			//专家
			return "send_lMessage2";
		}
		
	}
	/**
	 * 发送留言	留言状态为1
	 * @return
	 */
	@RequestMapping("/sendLMessage.do")
	@ResponseBody
	public ResponseResult<Void> sendLMessage(
			String leaveMessageId,
			String lMessageContent,
			HttpSession session
			) {
		ResponseResult<Void> rr=new ResponseResult<Void>();
		UserInfo user=(UserInfo) session.getAttribute("user");
		if(leaveMessageId.trim()=="") {
			leaveMessageId= new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss")
					.format(new Date()).toString().replace("-", "")
					.toUpperCase();
			
		}
		LeaveMessage lMessage=new LeaveMessage();
		lMessage.setLeaveMessageId(leaveMessageId);
		lMessage.setUsername(user.getUsername());
		lMessage.setlMessageContent(lMessageContent);
		lMessage.setlMessageTime(new Date());
		lMessage.setlMessageState(1);
		try {
			essayInfoService.insertLeaveMessage(lMessage);
			rr.setState(1);
			rr.setMessage("发送成功");
		}catch(Exception e) {
			rr.setState(0);
			rr.setMessage("操作失误");
		}
		return rr;
		
	}
	/**
	 * 保存留言信息 	 留言状态为0
	 * @return
	 */
	@RequestMapping("/saveLMessage.do")
	@ResponseBody
	public ResponseResult<Void> saveLMessage(
			String lMessageContent,
			HttpSession session) {
		ResponseResult<Void> rr=new ResponseResult<Void>();
		String leaveMessageId= new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss")
				.format(new Date()).toString().replace("-", "")
				.toUpperCase();
		UserInfo user=(UserInfo) session.getAttribute("user");
		LeaveMessage lMessage=new LeaveMessage();
		lMessage.setLeaveMessageId(leaveMessageId);
		lMessage.setUsername(user.getUsername());
		lMessage.setlMessageContent(lMessageContent);
		lMessage.setlMessageTime(new Date());
		lMessage.setlMessageState(0); 
		try {
			essayInfoService.insertLeaveMessage(lMessage);
			rr.setState(1);
			rr.setMessage("保存到草稿中");
		}catch(Exception e) {
			rr.setState(0);
			rr.setMessage("操作失误");
		}
		return rr;
	}
	
	//显示回复填写信息页面
	@RequestMapping("/preRespondLMessage.do")
	public String preRespondLMessage(
			String username,
			String essayId,
			Model model,
			HttpServletRequest request) {
		request.setAttribute("username", username);
		request.setAttribute("essayId", essayId);
		model.addAttribute("username", username);
		return "response_lMessage";
		
	}
	//添加留言addResponseLMessage@RequestMapping("preRespondLMessage.do")
	@RequestMapping("/addResponseLMessage.do")
	@ResponseBody
	public ResponseResult<Void> addResponseLMessage(
			String username,
			String essayId,
			String lMessageContent, 
			Model model,
			HttpSession session) {
		ResponseResult<Void> rr=new ResponseResult<Void>();
		UserInfo user=(UserInfo) session.getAttribute("user");
		LeaveMessage leaveMessage = new LeaveMessage();
		String leaveMessageId = new SimpleDateFormat("yyyy-MM-dd-HH-mm")
				.format(new Date()).toString().replace("-", "")
				.toUpperCase();
		leaveMessage.setLeaveMessageId(leaveMessageId);
		//发送人
 		leaveMessage.setUsername(user.getUsername());//
 		//收件人
 		leaveMessage.setToUsername(username);
 		leaveMessage.setEssayId(essayId);
 		
		leaveMessage.setlMessageContent(lMessageContent);
		leaveMessage.setlMessageTime(new Date());
		leaveMessage.setlMessageState(1); //发送状态
		System.out.println(leaveMessage);
		try {
			essayInfoService.insertLeaveMessage(leaveMessage);
			rr.setState(1);
			rr.setMessage("已发送");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			rr.setState(0);
			rr.setMessage("回复失败");
			System.out.println(e);
		}
		return rr;
		
	}
	
	//查询回复稿件selectGetLMessage
	@RequestMapping("/selectGetLMessage.do")
	public String selectGetLMessage(
 			@RequestParam(value = "lMessageState", defaultValue = "1", required = false) Integer lMessageState,
			@RequestParam(value = "pageCode", defaultValue = "1", required = false) Integer pageCode,
			HttpSession session) {
		//Integer pageCode=1;
		Integer pageSize=4;
		UserInfo user = (UserInfo) session.getAttribute("user");
		
		if(user.getTypeId()==10) {
			PageInfo<LeaveMessage> pageInfo=essayInfoService.selectGetLMessage(pageCode, pageSize, user.getUsername(), lMessageState);
			session.setAttribute("pageInfo", pageInfo);
			return "author_paper_center_lMessage";
		}
		if(user.getTypeId()==20 ||user.getState()==21||user.getState()==22) {
			PageInfo<LeaveMessage> pageInfo=essayInfoService.selectGetLMessage(pageCode, pageSize, user.getUsername(), lMessageState);
			session.setAttribute("pageInfo", pageInfo);
			return "professor_paper_center_lMessage";
		}
		else {
			PageInfo<LeaveMessage> pageInfo=essayInfoService.selectGetLMessage(pageCode, pageSize, user.getUsername(), lMessageState);
			session.setAttribute("pageInfo", pageInfo);
			return "editor_paper_center_lMessage";
		}
		
	}
	
}
