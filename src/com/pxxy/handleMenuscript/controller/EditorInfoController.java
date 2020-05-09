package com.pxxy.handleMenuscript.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.pxxy.handleMenuscript.bean.ContributeEssay;
import com.pxxy.handleMenuscript.bean.EssayComment;
import com.pxxy.handleMenuscript.bean.EssayInfo;
import com.pxxy.handleMenuscript.bean.Fund;
import com.pxxy.handleMenuscript.bean.Paper;
import com.pxxy.handleMenuscript.bean.ResponseResult;
import com.pxxy.handleMenuscript.bean.UserInfo;
import com.pxxy.handleMenuscript.service.IContributeEssayService;
import com.pxxy.handleMenuscript.service.IEssayCommentService;
import com.pxxy.handleMenuscript.service.IEssayInfoService;
import com.pxxy.handleMenuscript.service.IPaperService;
import com.pxxy.handleMenuscript.service.IUserInfoService;

/**
 * 编辑管理员控制层
 * @author ASUS
 */
@Controller
@RequestMapping("/editor")
public class EditorInfoController {
	@Resource
	private IUserInfoService userService; // 用户
	@Resource
	private IEssayInfoService essayService;// 稿件
	@Resource
	private IContributeEssayService cEssayService;// 分配稿件
	@Resource
	private IEssayCommentService eCommentService; // 稿件评语
	@Resource
	private IPaperService paperService; //期刊稿件

	/* ============================================== */
	// 显示登陆页面
	@RequestMapping("/showLogin.do")
	public String showLogin() {
		return "editor_login";

	}

	// editor_workdesk
	@RequestMapping("/editorWorkdesk.do")
	public String editorWorkdesk() {
		return "editor_workdesk";

	}

	// editor_paper_center
	@RequestMapping("/paperCenter.do")
	public String paperCenter() {
		return "editor_paper_center";

	}

	@RequestMapping("/login.do")
	@ResponseBody // 不经过视图解析
	public ResponseResult<Void> login(String username, String password, HttpSession session) {
		ResponseResult<Void> rr = new ResponseResult<Void>();
		try {
			UserInfo user = userService.editorLogin(username, password);
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
	 * 查询所有用户
	 * @param pageCode
	 * @param model
	 * @return
	 */
	@RequestMapping("/selectAllUsers.do")
	public String selectAllUsers(
			@RequestParam(value = "pageCode", defaultValue = "1", required = false) Integer pageCode, Model model) {
		Integer pageSize = 10;
		PageInfo<UserInfo> pageInfo = userService.selectAllUsers(pageCode, pageSize);
		model.addAttribute("pageInfo", pageInfo);
		// System.out.println(pageInfo);
		return "editor_paper_center";
	}

	/**
	 * 条件username
	 * 
	 * @param username
	 * @param pageCode
	 * @param model
	 * @return
	 */
	@RequestMapping("/selectUsersByUsername.do")
	public String selectUsersByUsername(
			@RequestParam(value = "username", defaultValue = "", required = false) String username,
			@RequestParam(value = "pageCode", defaultValue = "1", required = false) Integer pageCode, Model model) {
		Integer pageSize = 10;
		PageInfo<UserInfo> pageInfo = userService.selectUsersByUsername(username, pageCode, pageSize);
		model.addAttribute("pageInfo", pageInfo);
		// System.out.println("selectUsersByUsername:..."+pageInfo);
		return "editor_paper_center";
	}

	/**
	 * 查询所有待激活的专家用户
	 * @param state
	 * @param pageCode
	 * @param pageSize
	 * @param model
	 * @return
	 */
	@RequestMapping("/selectState.do")
	public String selectState(@RequestParam(value = "state", defaultValue = "0", required = false) Integer state,
			@RequestParam(value = "pageCode", defaultValue = "1", required = false) Integer pageCode,
			@RequestParam(value = "pageSize", defaultValue = "10", required = false) Integer pageSize, Model model) {
		PageInfo<UserInfo> pageInfo = userService.selectState(state, pageCode, pageSize);
		model.addAttribute("pageInfo", pageInfo);
		// System.out.println(pageInfo);
		return "editor_paper_center";
	}

	/**
	 * 批量激活专家
	 * @param userIds
	 * @param pageCode
	 * @param pageSize
	 * @param model
	 * @return
	 */
	@RequestMapping("/activeUsers.do")
	public String activeUsers(@RequestParam(value = "username", defaultValue = "", required = false) String username,
			@RequestParam(value = "userIds", defaultValue = "0", required = false) String[] userIds,
			@RequestParam(value = "pageCode", defaultValue = "1", required = false) Integer pageCode,
			@RequestParam(value = "state", defaultValue = "0", required = false) Integer state, Model model) {
		// System.out.println(userIds);
		userService.activeUsers(userIds);

		return "redirect:/editor/selectState.do?state=" + state + "&pageCode=" + pageCode + "&username=" + username;

	}

	/**
	 * 批量冻结用户freezeUsers
	 * @param userIds
	 * @param pageCode
	 * @param pageSize
	 * @param model
	 * @return
	 */
	@RequestMapping("/freezeUsers.do")
	public String freezeUsers(@RequestParam(value = "userIds", defaultValue = "0", required = false) String[] userIds,
			@RequestParam(value = "pageCode", defaultValue = "1", required = false) Integer pageCode,
			@RequestParam(value = "state", defaultValue = "0", required = false) Integer state, Model model) {
		userService.freezeUsers(userIds);

		return "redirect:/editor/selectState.do?state=" + state + "&pageCode=" + pageCode;

	}

	@RequestMapping("/showEditUser.do")
	public String editUser() {

		return "edit_user";
	}

	/* 修改user/preLoadUser.do */
	// updateUserInfo
	@RequestMapping("/updateUser.do")
	@ResponseBody
	public ResponseResult<Void> addUser(@RequestParam("userId") String userId,
			@RequestParam("username") String username, @RequestParam("password") String password, String tureName,
			String email, @RequestParam("sex") Integer sex, @RequestParam("profession") Integer profession,
			String research, @RequestParam("postId") Integer postId,
			@RequestParam("eBackgroundId") Integer eBackgroundId, String workUnit, String address, String postcode,
			String phone, String telephone, @RequestParam("applyExpert") Integer applyExpert,
			@RequestParam("typeId") Integer typeId, Model model) {
		ResponseResult<Void> rr = new ResponseResult<Void>();
		// Integer state = 1;// 默认激活
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
		// user.setCreateData(new Date());
		user.setUpdateDate(new Date());
		user.setTypeId(typeId);
		// user.setState(state);
		model.addAttribute("user", user);
		// System.out.println(user);
		try {
			userService.updateUserInfo(user);
			rr.setState(1);
			rr.setMessage("修改成功");
		} catch (Exception e) {
			rr.setState(0);
			rr.setMessage("修改失败");
		}
		return rr;
	}

	// 稿件信息后台管理
	// selectEssayByStatusId 查询待分配稿件61（已提交）
	@RequestMapping("/selectNContribute.do")
	public String preContribute(
			@RequestParam(value = "statusId", defaultValue = "0", required = false) Integer statusId,
			@RequestParam(value = "pageCode", defaultValue = "1", required = false) Integer pageCode, Model model) {
		Integer pageSize = 10;
		PageInfo<EssayInfo> pageInfo = essayService.selectEssayByStatusId(statusId, pageCode, pageSize);
		model.addAttribute("pageInfo", pageInfo);

		return "editor_essay_preconteribute";
	}

	/**
	 * 1、加载分类专家信息（根据稿件的分类） 2、提交(essayId、userId:专家id 2.1修改稿件的状态为62（已分配） 2.2添加分配稿件信息
	 * tb_essay_contribute 3、返回待分配页面
	 */

	@RequestMapping("/preAddCheckUser.do")
	public String preAddCheckUser(
			@RequestParam(value = "styleId", defaultValue = "0", required = false) Integer styleId, String essayId,
			Model model) {
		// System.out.println("1、essayId:"+essayId);
		EssayInfo essay = essayService.preLoadEssayById(essayId);
		// System.out.println("2、essay:"+essay.getStyleId());
		List<UserInfo> list = cEssayService.selectUserByProfession(essay.getStyleId());
		// System.out.println("3、preAddCheckUser.do......"+list);
		model.addAttribute("userList", list);
		model.addAttribute("essay", essay);
		return "contribute_examine_professor";

	}
	// add_checkProfessor

	/**
	 * 添加分配稿件信息
	 * 
	 * @return
	 */
	@RequestMapping("/addContributeProfessor.do")
	public String addContributeProfessor(String essayId, String userId, Model model, HttpSession session) {
		UserInfo editior = (UserInfo) session.getAttribute("user");
		ContributeEssay cEssay = new ContributeEssay();
		cEssay.setContributeId(new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss").format(new Date()).toString()
				.replace("-", "").toUpperCase());
		cEssay.setEditorId(editior.getUserId());
		cEssay.setEssayId(essayId);
		cEssay.setCheckUserId(userId);
		cEssay.setContributeDate(new Date());

		EssayInfo essay = new EssayInfo();
		essay.setEssayId(essayId);
		essay.setStatusId(62);
		try {
			// 添加分配稿件信息
			cEssayService.insertContributeEssay(cEssay);
			// 修改稿件状态为62（已分配专家）
			System.out.println(essay);
			essayService.updateEssayById(essay);
			System.out.println("分配成功");
			return "redirect:/editor/selectNContribute.do?statusId=61&pageCode=1";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			return "404";
		}
	}

	/**
	 * editor_essay_conteribute 查看已分配稿件信息
	 * @param pageCode
	 * @param model
	 * @return
	 */
	@RequestMapping("/selectContributeEssay.do")
	public String selectContributeEssay(
			@RequestParam(value = "pageCode", defaultValue = "1", required = false) Integer pageCode, Model model) {
		// System.out.println("selectContributeEssay/////////");
		Integer pageSize = 10;
		PageInfo<ContributeEssay> pageInfo = cEssayService.selectContributeEssay(pageCode, pageSize);
		model.addAttribute("pageInfo", pageInfo);
		return "editor_essay_conteribute";
	}

	/**
	 * 通过essayId查询稿件评语
	 * 
	 * @param essayId
	 * @param pageCode
	 * @param model
	 * @return
	 */
	@RequestMapping("/selectECommentById.do")
	public String selectECommentById(@RequestParam("essayId") String essayId, Model model) {
		EssayInfo essay = eCommentService.selectECommentById(essayId);
		System.out.println(essayId);
		model.addAttribute("essay", essay);

		return "editor_examine_essay";
	}

	// 编辑审理稿件页面
	@RequestMapping("/showComment.do")
	public String showComment(String essayId, Model model) {
		EssayInfo essay = essayService.preLoadEssayById(essayId);
		model.addAttribute("essay", essay);
		return "editor_comment_essay";

	}

	/**
	 * 编辑 查询稿件信息
	 * 
	 * @param essayId
	 * @param commentId
	 * @param model
	 * @return
	 */
	// selectCommentDetails
	@RequestMapping("/selectCommentDetailsById.do")
	public String selectCommentDetailsById(String essayId, String commentId, Model model) {
		EssayInfo essay = essayService.preLoadEssayById(essayId);
		// System.out.println("selectCommentDetails-essayId:"+essay.getEssayId());
		EssayComment eComment = eCommentService.selectCommentDetailsById(commentId);
		model.addAttribute("eComment", eComment);
		model.addAttribute("essay", essay);
		return "select_comment_details";
	}

	// insertEssayComment
	@RequestMapping("/addEssayComment.do")
	@ResponseBody
	public ResponseResult<Void> addEssayComment(String essayId, String designCommentId, String contentCommentId,
			String dataCommentId, String discussCommentId, String resultCommentId, String commentDetails,
			HttpSession session) {
		ResponseResult<Void> rr = new ResponseResult<Void>();
		UserInfo user = (UserInfo) session.getAttribute("user");
		EssayComment eComment = new EssayComment();
		eComment.setCommentId(new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss").format(new Date()).toString().replace("-", "")
				.toUpperCase());
		eComment.setEssayId(essayId);
		eComment.setcUsernameId(user.getUserId());
		eComment.setDesignCommentId(designCommentId);
		eComment.setContentCommentId(contentCommentId);
		eComment.setDataCommentId(dataCommentId);
		eComment.setDiscussCommentId(discussCommentId);
		eComment.setResultCommentId(resultCommentId);
		eComment.setCommentDetails(commentDetails);
		eComment.setCommentLevel(30);// 专家评论
		eComment.setCommentDate(new Date());

		EssayInfo essay = new EssayInfo();
		essay.setEssayId(essayId);
		System.out.println("resultCommentId:" + resultCommentId);
		// 结果resultCommentId：1、可刊用 稿件状态改为：66可刊用稿件
		if (resultCommentId.trim().equals("1")) {
			essay.setStatusId(66);
		}
		// 结果resultCommentId：2/3 状态改为：68 待修改稿件（审核了待修改）
		if (resultCommentId.trim().equals("2") || resultCommentId.trim().equals("3")) {
			essay.setStatusId(67);
		}
		// 结果resultCommentId：4/5 退稿 状态改为：68 退稿
		if (resultCommentId.trim().equals("4") || resultCommentId.trim().equals("5")) {
			essay.setStatusId(68);
			// 删除稿件 分配表中
			List<ContributeEssay> cEssayList = (List<ContributeEssay>) cEssayService.selectContributeById(essayId);
			List<String> list = new ArrayList<String>();
			for (int i = 0; i < cEssayList.size(); i++) {
				list.add(cEssayList.get(i).getContributeId());
			}
			String[] contributeId = new String[list.size()];

			cEssayService.delectContributeById(list.toArray(contributeId));
			System.out.println("删除稿件 分配表中");
		}

		try {
			eCommentService.insertEssayComment(eComment);
			// 修改稿件状态为
			essayService.updateEssayById(essay);
			// System.out.println("编辑审核稿件成功。。。。。。。。。。。");
			rr.setState(1);
			rr.setMessage("编辑审核成功");
			return rr;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			rr.setState(0);
			rr.setMessage("操作失败");
			return rr;
		}

	}

	// updateEssayCommentById
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
		eComment.setCommentLevel(30);// 专家评论
		eComment.setCommentDate(new Date());

		EssayInfo essay = new EssayInfo();
		essay.setEssayId(essayId);
		// 结果resultCommentId：1、可刊用 稿件状态改为：66可刊用稿件
		if (resultCommentId.trim().equals("1")) {
			essay.setStatusId(66);
		}
		// 结果resultCommentId：2/3 状态改为：68 待修改稿件（审核了待修改）
		if (resultCommentId.trim().equals("2") || resultCommentId.trim().equals("3")) {
			essay.setStatusId(67);
		}
		// 结果resultCommentId：4/5 退稿 状态改为：68 退稿
		if (resultCommentId.trim().equals("4") || resultCommentId.trim().equals("5")) {
			essay.setStatusId(68);
			// 删除稿件 分配表中
			List<ContributeEssay> cEssayList = (List<ContributeEssay>) cEssayService.selectContributeById(essayId);
			List<String> list = new ArrayList<String>();
			for (int i = 0; i < cEssayList.size(); i++) {
				list.add(cEssayList.get(i).getContributeId());
			}
			String[] contributeId = new String[list.size()];

			cEssayService.delectContributeById(list.toArray(contributeId));
			System.out.println("删除稿件 分配表中");
		}

		try {

			eCommentService.updateEssayCommentById(eComment);
			// 修改稿件状态为
			essayService.updateEssayById(essay);
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

	// selectEssayByStatusId
	// 查询可刊用稿件
	@RequestMapping("/selectProduce.do")
	public String selectProduce(
			@RequestParam(value = "statusId", defaultValue = "0", required = false) Integer statusId,
			@RequestParam(value = "pageCode", defaultValue = "1", required = false) Integer pageCode, Model model) {
		Integer pageSize = 10;
		PageInfo<EssayInfo> pageInfo = essayService.selectEssayByStatusId(statusId, pageCode, pageSize);
		model.addAttribute("pageInfo", pageInfo);

		return "pass_essay_center";

	}
	//contribute_fund2
	@RequestMapping("/showContributeFund2.do")
	public String showContributeFund2(
			String essayId, Model model) {
		List<Fund> fundList=essayService.selectFundByEssayId(essayId);
		model.addAttribute("fundList", fundList);
		return "contribute_fund2";

	}

	// paperService
	/**
	 * 添加期刊栏目
	 * 
	 * @param year
	 * @param issue
	 * @param styleId
	 * @param column
	 * @return
	 */
	@RequestMapping("/addPaper.do")
	@ResponseBody
	public ResponseResult<Void> addPaper(String year, String issue, @RequestParam("styleId") Integer styleId,
			String column) {
		ResponseResult<Void> rr = new ResponseResult<Void>();
		Paper paper = new Paper();
		paper.setYear(year);
		paper.setIssue(issue);
		paper.setStyleId(styleId);
		paper.setColumns(column);
		paper.setDate(new Date());
		try {
			paperService.insertPaper(paper);
			rr.setState(1);
			rr.setMessage("添加期刊栏目成功");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			rr.setState(0);
			rr.setMessage("添加期刊栏目失败");
		}
		return rr;

	}

	// add_paper_center
	/**
	 * 显示添加期刊栏目页面
	 * 
	 * @return
	 */
	@RequestMapping("/showAddPaper.do")
	public String showAddPaper() {
		return "add_paper_center";

	}

	// 通过期刊栏目styleId查询期刊栏目selectPaperByStyleId
	/**
	 * 
	 * @param essayId
	 * @param styleId
	 * @param pageCode
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/selectPaperByStyle.do")
	public String selectPaperByStyle(String essayId, @RequestParam("styleId") Integer styleId,
			@RequestParam(value = "pageCode", defaultValue = "1", required = false) Integer pageCode, Model model,
			HttpServletRequest request) {
		// System.out.println("selectPaperByStyle~essayId:"+essayId);
		Integer pageSize = 10;
		PageInfo<Paper> pageInfo = paperService.selectPaperByStyleId(styleId, pageCode, pageSize);
		if (pageInfo.getList().size() != 0) {
			System.out.println(pageInfo.getList());
			model.addAttribute("pageInfo", pageInfo);
			request.setAttribute("essayId", essayId);
			return "paper_list_center";
		} else {
			// 查询为空添加期刊栏目页面
			return "add_paper_center";
		}

	}
	// add_paper_center

	// showPaperList
	@RequestMapping("/showPaperList.do")
	public String showPaperList() {

		return "paper_list_center";

	}

	// addEssayToPaper
	/**
	 * 添加稿件essay到paper
	 * 
	 * @param essayId
	 * @param paperId
	 * @param pageCode
	 * @param model
	 * @return
	 */
	@RequestMapping("/addEssayToPaper.do")
	public String addEssayToPaper(String essayId, @RequestParam("paperId") Integer paperId,
			@RequestParam(value = "pageCode", defaultValue = "1", required = false) Integer pageCode, Model model) {
		System.out.println("addEssayToPaper~essayId:" + essayId);
		Paper p = paperService.selectPaperById(paperId);
		Paper paper = new Paper();
		paper.setYear(p.getYear());
		paper.setIssue(p.getIssue());
		paper.setColumns(p.getColumns());
		paper.setEssayId(essayId);
		paper.setDownTime(0);
		paper.setReadTime(0);
		paper.setDate(p.getDate());

		System.out.println("paper:...." + paper);
		EssayInfo essay = new EssayInfo();
		essay.setEssayId(essayId);
		essay.setStatusId(70); // 设置稿件状态70（已刊用稿件）

		try {
			paperService.insertPaper(paper);
			essayService.updateEssayById(essay);
			System.out.println("添加稿件essay到paper");

			return "redirect:/editor/selectProduce.do?statusId=66&pageCode=" + pageCode;

		} catch (Exception e) {
			System.out.println(e);
			return "404";
		}
	}

	@RequestMapping("/selectAllPaper.do")
	public String selectAllPaper(Model model) {
		MultiValueMap<String, String> yearList = paperService.selectAllPaper();
		model.addAttribute("yearList", yearList);
		System.out.println(yearList);
		return "paper_catalogue";

	}

	// selectPaperByYearAIssue
	@RequestMapping("/selectPaperByYearAIssue.do")
	public String selectPaperByYearAIssue(String year, String issue, Model model) {
		// System.out.println("year+issue:"+year+issue);
		List<Paper> paperList = paperService.selectPaperByYearAIssue(year, issue);
		// System.out.println(paperList);
		// paperList.get(0).getEssayList();
		model.addAttribute("paperList", paperList);
		return "paper_list";

	}

}
