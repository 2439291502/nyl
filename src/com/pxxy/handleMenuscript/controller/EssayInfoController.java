package com.pxxy.handleMenuscript.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageInfo;
import com.pxxy.handleMenuscript.bean.AddressList;
import com.pxxy.handleMenuscript.bean.EssayInfo;
import com.pxxy.handleMenuscript.bean.Fund;
import com.pxxy.handleMenuscript.bean.LeaveMessage;
import com.pxxy.handleMenuscript.bean.ResponseResult;
import com.pxxy.handleMenuscript.bean.UserInfo;
import com.pxxy.handleMenuscript.service.IEssayInfoService;
import com.pxxy.handleMenuscript.service.IUserInfoService;

/**
 * 稿件管理
 * 
 * @author ASUS
 *
 */
@Controller
@RequestMapping("/essay")
public class EssayInfoController {
	@Resource
	private IEssayInfoService essayInfoService;
	@Resource
	private IUserInfoService userService;

	/**
	 * 待修改、待审核、已通过 用户通过用户名username及状态statusId=0
	 * 
	 * @param statusId
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping("/selectEssayByUsernameAndStatusId.do")
	public String selectEssayByUsernameAndStatusId(
			@RequestParam(value = "statusId", defaultValue = "0", required = false) Integer statusId,
			@RequestParam(value = "pageCode", defaultValue = "1", required = false) Integer pageCode,
			HttpSession session, HttpServletRequest request) {
		int pageSize = 4;

		UserInfo user = (UserInfo) session.getAttribute("user");
		PageInfo<EssayInfo> pageInfo = essayInfoService.selectEssayByUsernameAndStatusId(pageCode, pageSize,
				user.getUsername(), statusId);

		if (pageInfo != null) {
			request.setAttribute("statusId", statusId);
			request.setAttribute("pageInfo", pageInfo);
		} else {
			// System.out.println("pageInfo为空");
			request.setAttribute("msg", "还没有数据");
		}
		return "author_paper_center";
	}

	/**
	 * 批量删除稿件并跳转到author_paper_center
	 * 
	 * @param essayId
	 * @param request
	 * @return
	 */
	@RequestMapping("/deleteEssayInfo.do")
	public String deleteEssayInfo(
			@RequestParam(value = "statusId", defaultValue = "0", required = false) Integer statusId,
			@RequestParam(value = "pageCode", defaultValue = "1", required = false) Integer pageCode,
			@RequestParam("essayIds") String[] essayIds) {
		// System.out.println("获取essayIds的值："+essayIds);
		try {
			essayInfoService.deleteEssayByIds(essayIds);

			return "redirect:/essay/selectEssayByUsernameAndStatusId.do?statusId=" + statusId + "&pageCode=" + pageCode;
		} catch (Exception e) {

			return "404";
		}

	}

	/**
	 * 
	 * @return
	 */
	@RequestMapping("/editContributeEssay.do")
	public String editContributeEssay(String essayId, Model model) {
		EssayInfo essay = essayInfoService.preLoadEssayById(essayId);
		model.addAttribute("essay", essay);
		return "edit_contribute_essay";
	}

	/**
	 * 
	 * @return
	 */
	@RequestMapping("/showAddFund.do")
	public String addFund(String essayId, Model model) {
		EssayInfo essay = essayInfoService.preLoadEssayById(essayId);

		model.addAttribute("essay", essay);
		System.out.println(essayId + ",添加稿件基金信息======" + essay);
		return "add_fund";
	}

	/**
	 * 加载稿件信息
	 */
	@RequestMapping("/preLoadEssayInfo.do")
	public String preLoadEssayInfo(String essayId, Model model) {
		EssayInfo essayInfo = essayInfoService.preLoadEssayById(essayId);
		// UserInfo user = (UserInfo) session.getAttribute("user");
		if (essayInfo != null) {
			// session.setAttribute("essay", essayInfo);
			model.addAttribute("essay", essayInfo);
			// request.setAttribute("user", user);
			// System.out.println("essayInfo:.........."+essayInfo);
			return "edit_contribute_essay";
		} else {
			return "404";
		}
	}

	/**
	 * 上传稿件文件
	 * 
	 * @param uploadFile
	 * @param request
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping("/upload.do")
	@ResponseBody
	public ResponseResult<String> upload(@RequestParam("file") MultipartFile uploadFile, HttpServletRequest request,
			String essayId, Model model) throws IllegalStateException, IOException {
		// System.out.println("6+uploadFile");
		ResponseResult<String> rr = new ResponseResult<String>();// 获取服务器中的真实路径（文件保存路径）
		String path = request.getServletContext().getRealPath("/files");
		// .getRealPath("/images/product_detail");
		// System.out.println("path:..........."+path);
		// System.out.println(path);
		// 获取文件原始名称
		String fileName = uploadFile.getOriginalFilename();

		// 随机化文件名
		String date = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss").format(new Date()).toString().replace("-", "")
				.toUpperCase();

		// String uuid = UUID.randomUUID().toString().replaceAll("-", "").toUpperCase();
		fileName = date;
		// System.out.println("fileName:........"+fileName+"uploadFile"+uploadFile);

		// 把文件写到指定的位置
		// 上传文件
		// request.setAttribute("pImage", fileName);
		try {
			uploadFile.transferTo(new File(path, fileName));
			// System.out.println("6uploadFile");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e);
		}
		rr.setData(fileName);
		EssayInfo essay = essayInfoService.preLoadEssayById(essayId);
		model.addAttribute("essay", essay);
		return rr;
	}

	//插入数据
	@RequestMapping("/insertEssayInfo.do")
	@ResponseBody
	public String insertEssayInfo(String essayId, String title, String etitle, String abstracts, String englishAbstract,
			String keywords, @RequestParam(value = "styleId", defaultValue = "0", required = false) Integer styleId,
			String reference, String fundId, String contentUrl, Model model, HttpSession session) {
		UserInfo user = (UserInfo) session.getAttribute("user");
		EssayInfo essayInfo = new EssayInfo();
		if(essayId==null||essayId.trim()=="") {
			essayId = new SimpleDateFormat("yyyy-MM-dd-HH-mm").format(new Date()).toString().replace("-", "")
					.toUpperCase();
		}
		essayInfo.setEssayId(essayId);
		essayInfo.setTitle(title);
		essayInfo.setEtitle(etitle);
		essayInfo.setAbstracts(abstracts);
		essayInfo.setEnglishAbstract(englishAbstract);
		essayInfo.setStyleId(styleId);
		essayInfo.setKeywords(keywords);
		essayInfo.setReference(reference);
		essayInfo.setStatusId(60);
		// essayInfo.setFundId(fundId);
		essayInfo.setContentUrl(contentUrl);
		essayInfo.setUsername(user.getUsername());
		essayInfo.setContributor(user.getUsername());
		essayInfo.setContributeDate(new Date());
		//model.addAttribute("essay", essayInfo);
		try {
			essayInfoService.insertEssay(essayInfo);
			model.addAttribute("essay", essayInfo);
			return "contribute_one_step";
		} catch (Exception e) {
			return "404";
		}
	}

	//更新稿件信息
	@SuppressWarnings("unused")
	@RequestMapping("/updatEssayInfo.do")
	@ResponseBody
	public String updatEssayInfo(String essayId, String title, String etitle, String abstracts, String englishAbstract,
			String keywords, @RequestParam(value = "styleId", defaultValue = "0", required = false) Integer styleId,
			String reference, String fundId, String contentUrl, Model model, HttpSession session) {
		EssayInfo essayInfo = new EssayInfo();
		essayInfo.setEssayId(essayId);
		essayInfo.setTitle(title);
		essayInfo.setEtitle(etitle);
		essayInfo.setAbstracts(abstracts);
		essayInfo.setEnglishAbstract(englishAbstract);
		essayInfo.setStyleId(styleId);
		essayInfo.setKeywords(keywords);
		essayInfo.setReference(reference);
		essayInfo.setStatusId(60);
		// essayInfo.setFundId(fundId);
		essayInfo.setContentUrl(contentUrl);
		essayInfo.setContributeDate(new Date());
		// System.out.println();
		// System.out.println("updatEssayInfo====="+essayInfo);
		UserInfo user = (UserInfo) session.getAttribute("user");
		if (essayId == null) {
			essayId = new SimpleDateFormat("yyyy-MM-dd-HH-mm").format(new Date()).toString().replace("-", "")
					.toUpperCase();
			essayInfo.setEssayId(essayId);
			essayInfo.setUsername(user.getUsername());
			essayInfo.setContributor(user.getUsername());
			essayInfo.setTitle(title);
			essayInfo.setEtitle(etitle);
			essayInfo.setStatusId(60);
			essayInfo.setEssayId(essayId);
			essayInfoService.insertEssay(essayInfo);
			/*
			 * EssayInfo essay1 = essayInfoService.preLoadEssayById(essayId); String id =
			 * essay1.getEssayId();
			 */
			return "redirect:/essay/preLoadEssayInfo.do?essayId="+essayId;
		} else {
			try {
				essayInfoService.updateEssayById(essayInfo);
				return "redirect:/essay/selectEssayByUsernameAndStatusId.do?statusId=0&pageCode=1";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				return "404";
			}
		}

	}

	// 修改后 一步投稿contributeEssay
	@RequestMapping("/contributeEssay.do")
	public String contributeEssay(String essayId, String title, String etitle, String abstracts, String englishAbstract,
			String keywords, String englishKeywords,
			@RequestParam(value = "styleId", defaultValue = "60", required = false) Integer styleId, String reference,
			String contentUrl, HttpSession session,Model model) {
		UserInfo user = (UserInfo) session.getAttribute("user");
		EssayInfo essayInfo = new EssayInfo();
		essayInfo.setEssayId(essayId);
		essayInfo.setTitle(title);
		essayInfo.setAbstracts(abstracts);
		essayInfo.setEnglishAbstract(englishAbstract);
		essayInfo.setStyleId(styleId);
		essayInfo.setKeywords(keywords);
		essayInfo.setReference(reference);
		essayInfo.setContributor(user.getUsername());// 投稿人
		// essayInfo.setFundId(fundId);
		essayInfo.setContentUrl(contentUrl);
		essayInfo.setStatusId(61);// 待审核稿件 2
		essayInfo.setIsContribute(1);// 投稿状态1
		essayInfo.setContributeDate(new Date());
		// 留言信息状态改为1
		// 留言状态
		LeaveMessage lMessage = essayInfoService.selectLMessageByEssayId(essayId);
		if (lMessage != null) {
			lMessage.setlMessageState(1);
			lMessage.setLeaveMessageId(lMessage.getLeaveMessageId());
			lMessage.setlMessageTime(new Date());
			essayInfoService.updateLMessageById(lMessage);
		}
		try {
			essayInfoService.updateEssayById(essayInfo);
			EssayInfo essay = essayInfoService.preLoadEssayById(essayId);
			model.addAttribute("essay", essay);

			return "contribute_success";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			return "404";
		}
	}

	/**
	 * 上传了之后再下载
	 * 
	 * @param request
	 * @param contentUrl
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@GetMapping("/download.do") //
	public ResponseEntity<byte[]> download(HttpServletRequest request, @RequestParam("contentUrl") String contentUrl,
			Model model) throws Exception {
		// 获取文件所在路径
		String path = request.getServletContext().getRealPath("/files/");
		contentUrl = new String(contentUrl.getBytes("ISO-8859-1"), "UTF-8");
		File file = new File(path + File.separator + contentUrl);
		// System.out.println("file="+file);
		HttpHeaders headers = new HttpHeaders();
		try {
			String downloadFileName = new String(contentUrl);
			headers.setContentDispositionFormData("attachment", downloadFileName);
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);// 设置MIME类型
			return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);//
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e);
			return null;
		}

	}

	/* =====================一部投稿====================== */
	// contribute_notice
	@RequestMapping("/contributeNotice.do")
	public String contributeNotice() {

		return "contribute_notice";
	}

	// copyright_assignment
	@RequestMapping("/copyrightAssignment.do")
	public String copyrightAssignment() {

		return "copyright_assignment";
	}

	@RequestMapping("/paperCenter.do")
	public String paperCenter() {

		return "author_paper_center";

	}

	@RequestMapping("/authorWorkDesk.do")
	public String authorWorkDesk() {
		return "author_workdesk";
	}

	// 一步投稿contribute_one_step页面
	@RequestMapping("/contributeOneStep.do")
	public String contributeOneStep() {

		return "contribute_one_step";

	}

	// ========添加稿件信息=========

	// 稿件标题页面
	@RequestMapping("/contributeTitle.do")
	public String contributeTitle(HttpSession session) {
		EssayInfo essay = new EssayInfo();
		session.setAttribute("essay", essay);
		return "contribute_title";

	}

	@RequestMapping("/showContributeTitle.do")
	public String showContributeTitle() {

		return "contribute_title";

	}

	// 添加稿件标题并跳转到 摘要页面
	@RequestMapping("/addContributeTitle.do")
	@ResponseBody
	public ResponseResult<Void> addContributeTitle(String essayId, String title, String etitle, HttpSession session,
			Model model) {
		ResponseResult<Void> rr = new ResponseResult<Void>();// 获取服务器中的真实路径（文件保存路径）
		UserInfo user = (UserInfo) session.getAttribute("user");
		EssayInfo essayInfo = new EssayInfo();
		if (essayId.trim() == null || essayId.trim() == "") {
			essayId = new SimpleDateFormat("yyyy-MM-dd-HH-mm").format(new Date()).toString().replace("-", "")
					.toUpperCase();
			essayInfo.setEssayId(essayId);
			essayInfo.setUsername(user.getUsername());
			essayInfo.setContributor(user.getUsername());
			essayInfo.setTitle(title);
			essayInfo.setEtitle(etitle);
			essayInfo.setStatusId(60);
			try {
				essayInfoService.insertEssay(essayInfo);
				session.setAttribute("essay", essayInfo);
				// System.out.println("1");
				rr.setState(1);
				// rr.setMessage("注册成功");
			} catch (Exception e) {
				rr.setState(0);
				rr.setMessage(e.getMessage());
			}
		} else {
			essayInfo.setEssayId(essayId);
			essayInfo.setContributor(user.getUsername());
			essayInfo.setTitle(title);
			essayInfo.setEtitle(etitle);
			// essayInfo.setStatusId(6);
			try {
				essayInfoService.updateEssayById(essayInfo);
				session.setAttribute("essay", essayInfo);
				// System.out.println("10更新稿件");
				rr.setState(1);
			} catch (Exception e) {
				rr.setState(0);
				rr.setMessage(e.getMessage());
			}
		}
		return rr;
	}

	// ================稿件作者信息==============
	@RequestMapping("/contributeAuthor.do")
	public String contributeAuthor() {

		return "contribute_author";

	}

	@RequestMapping("/addContributeAuthor.do")
	public String addContributeAuthor() {

		return "add_contribute_author";

	}

	// ==========添加稿件作者信息=========
	@RequestMapping("/addAuthor.do")
	@ResponseBody
	public ResponseResult<Void> addAuthor(String essayId, String userId, String contributor, String tureName,
			String email, String phone, String profession, String research, @RequestParam("postId") Integer postId,
			String workUnit, String address, String postcode, HttpSession session, HttpServletRequest request) {// createData
		// System.out.println("addAuthor...................");
		ResponseResult<Void> rr = new ResponseResult<Void>();// 获取服务器中的真实路径（文件保存路径）
		AddressList aList = new AddressList();
		String aListId = new SimpleDateFormat("yyyy-MM-dd-HH-mm").format(new Date()).toString().replace("-", "")
				.toUpperCase();
		aList.setaListId(aListId);
		aList.setUserId(userId);
		aList.setTureName(tureName);
		aList.setEmail(email);
		aList.setPhone(phone);
		aList.setProfession(profession);
		aList.setResearch(research);
		aList.setPostId(postId);
		aList.setWorkUnit(workUnit);
		aList.setAddress(address);
		aList.setPostcode(postcode);
		aList.setCreateData(new Date());
		try {
			userService.insertAList(aList);// 添加联系人信息
			AddressList addrestList = userService.selectAListById(aListId);
			session.setAttribute("aList", addrestList);

			// 更新稿件作者信息
			String username = contributor + ";" + tureName;
			EssayInfo essayInfo = new EssayInfo();
			essayInfo.setEssayId(essayId);
			essayInfo.setUsername(username);
			essayInfoService.updateEssayById(essayInfo);
			// System.out.println("更新稿件作者信息");

			// 加载保存essay到session
			EssayInfo essay = essayInfoService.preLoadEssayById(essayId);
			session.setAttribute("essay", essay);

			// System.out.println("加载保存essay到session"+essay);
			rr.setState(1);
			rr.setMessage("添加成功");

		} catch (Exception e) {
			rr.setState(0);
			rr.setMessage("请重新添加");
		}
		return rr;

	}

	/**
	 * 删除稿件作者
	 * 
	 * @param essayId
	 * @param aListId
	 * @param contributor
	 * @param atureName
	 * @return
	 */
	@RequestMapping("/delectUser.do")
	@ResponseBody
	public ResponseResult<Void> delectUser(String essayId, String aListId, String contributor, // 投稿人+作者
			String atureName, HttpSession session, HttpServletRequest request) {
		ResponseResult<Void> rr = new ResponseResult<Void>();
		/*
		 * System.out.println("atureName........."+atureName);
		 * System.out.println("contributor...."+contributor);
		 */
		EssayInfo essayInfo = new EssayInfo();
		essayInfo.setEssayId(essayId);
		if (contributor != null) {
			essayInfo.setUsername(atureName);
		}
		if (atureName != null) {
			essayInfo.setUsername(contributor);
			// userService
			userService.deleteAListById(aListId);
		}
		try {
			essayInfoService.updateEssayById(essayInfo);
			rr.setState(1);
			rr.setMessage("删除成功");
		} catch (Exception e) {
			rr.setState(0);
			rr.setMessage("删除失败");
		}
		return rr;

	}

	// 稿件摘要contributeAbstract.do
	@RequestMapping("/contributeAbstract.do")
	public String contributeAbstract() {

		return "contribute_abstract";

	}

	// 添加稿件摘要
	@RequestMapping("/addContributeAbstract.do")
	@ResponseBody
	public ResponseResult<Void> addContributeAbstract(String essayId, String abstracts, String englishAbstract,
			Model model, HttpSession session) {
		ResponseResult<Void> rr = new ResponseResult<Void>();// 获取服务器中的真实路径（文件保存路径）
		EssayInfo essayInfo = new EssayInfo();
		essayInfo.setEssayId(essayId);
		essayInfo.setAbstracts(abstracts);
		essayInfo.setEnglishAbstract(englishAbstract);
		try {
			essayInfoService.updateEssayById(essayInfo);
			EssayInfo essay = essayInfoService.preLoadEssayById(essayId);
			session.setAttribute("essay", essay);
			// System.out.println("2");
			rr.setState(1);
			// rr.setMessage("注册成功");
		} catch (Exception e) {
			rr.setState(0);
			rr.setMessage("请重新添加摘要");
		}
		return rr;

	}

	// 关键词
	@RequestMapping("/contributeKeywords.do")
	public String contributeKeywords() {

		return "contribute_keywords";

	}

	// 添加关键词
	@RequestMapping("/addContributeKeywords.do")
	@ResponseBody
	public ResponseResult<Void> addContributeKeywords(String essayId, String keywords, String englishKeywords,
			Model model, HttpSession session) {
		ResponseResult<Void> rr = new ResponseResult<Void>();// 获取服务器中的真实路径（文件保存路径）
		EssayInfo essayInfo = new EssayInfo();
		essayInfo.setEssayId(essayId);
		essayInfo.setKeywords(keywords);
		essayInfo.setEnglishKeywords(englishKeywords);
		try {
			essayInfoService.updateEssayById(essayInfo);
			EssayInfo essay = essayInfoService.preLoadEssayById(essayId);
			session.setAttribute("essay", essay);
			// System.out.println("3添加|更新稿件关键词成功");
			rr.setState(1);
			// rr.setMessage("注册成功");
		} catch (Exception e) {
			rr.setState(0);
			rr.setMessage("请重新添加关键词");
		}
		return rr;

	}

	// 学科分类信息
	@RequestMapping("/contributeStyle.do")
	public String contributeStyle() {
		return "contribute_style";
	}

	// 添加学科分类信息 并跳转 参考文献
	@RequestMapping("/addContributeStyle.do")
	@ResponseBody
	public ResponseResult<Void> addContributeStyle(String essayId,
			@RequestParam(value = "styleId", defaultValue = "0", required = false) Integer styleId, HttpSession session,
			Model model) {
		ResponseResult<Void> rr = new ResponseResult<Void>();// 获取服务器中的真实路径（文件保存路径）
		EssayInfo essayInfo = new EssayInfo();
		essayInfo.setEssayId(essayId);
		essayInfo.setStyleId(styleId);
		try {
			essayInfoService.updateEssayById(essayInfo);
			EssayInfo essay = essayInfoService.preLoadEssayById(essayId);
			session.setAttribute("essay", essay);
			// System.out.println("4添加|更新稿件类型文献成功");
			rr.setState(1);
			// rr.setMessage("注册成功");
		} catch (Exception e) {
			rr.setState(0);
			rr.setMessage("请重新添加类型");
		}
		return rr;

	}

	// 参考文献
	@RequestMapping("/contributeReference.do")
	public String contributeReference() {

		return "contribute_reference";

	}

	// 添加参考文献信息 并跳转 参考文献contribute_reference
	@RequestMapping("/addContributeReference.do")
	@ResponseBody
	public ResponseResult<Void> addContributeReference(String essayId, String reference, HttpSession session,
			Model model) {
		ResponseResult<Void> rr = new ResponseResult<Void>();// 获取服务器中的真实路径（文件保存路径）
		EssayInfo essayInfo = new EssayInfo();
		essayInfo.setEssayId(essayId);
		essayInfo.setReference(reference);
		try {
			essayInfoService.updateEssayById(essayInfo);
			EssayInfo essay = essayInfoService.preLoadEssayById(essayId);
			session.setAttribute("essay", essay);
			// System.out.println("5添加|更新稿件参考文献成功");
			rr.setState(1);
			// rr.setMessage("注册成功");
		} catch (Exception e) {
			rr.setState(0);
			rr.setMessage("请重新添加参考文献");
		}
		return rr;
	}

	// contribute_fundId基金
	@RequestMapping("/contributeFund.do")
	public String contributeFund() {
		return "contribute_fund";

	}

	@RequestMapping("/addContributeFund.do")
	public String addContributeFund() {

		return "add_contribute_fund";

	}

	/* =================稿件基金信息操作================ */
	// 添加稿件基金信息
	@RequestMapping("/addFund.do")
	@ResponseBody
	public ResponseResult<Void> addFund(String essayId, String fundLevel, String fundCName, String fundEName,
			String fundNumber, String fundPs, HttpSession session, Model model) {
		ResponseResult<Void> rr = new ResponseResult<Void>();// 获取服务器中的真实路径（文件保存路径）
		// EssayInfo essayInfo=(EssayInfo) session.getAttribute("essay");
		Fund fund = new Fund();
		String fundId = new SimpleDateFormat("yyyy-MM-dd-HH-mm").format(new Date()).toString().replace("-", "")
				.toUpperCase();
		fund.setFundId(fundId);
		fund.setEssayId(essayId);
		fund.setFundLevel(fundLevel);
		fund.setFundCName(fundCName);
		fund.setFundEName(fundEName);
		fund.setFundNumber(fundNumber);
		fund.setFundPs(fundPs);
		try {
			essayInfoService.insertFund(fund);
			// System.out.println("5-1添加基金信息fund:........." + fund);
			EssayInfo essayInfo = essayInfoService.preLoadEssayById(essayId);
			session.setAttribute("essay", essayInfo);
			// model.addAttribute("essay", essayInfo);
			rr.setState(1);
		} catch (Exception e) {
			rr.setState(0);
			rr.setMessage("基金添加失败重新添加");
		}
		return rr;

	}

	// 删除稿件基金信息返回稿件编辑
	@RequestMapping("/deleteFundReturn.do")
	public String deleteFundReturn(@RequestParam("fundId") String fundId) {
		essayInfoService.deleteFundById(fundId);
		// System.out.println("删除基金信息fundId："+fundId);
		return "edit_contribute_essay";

	}

	// 删除稿件基金信息返回导航投稿
	@RequestMapping("/deleteFund.do")
	public String deleteFund(@RequestParam("fundId") String fundId) {

		essayInfoService.deleteFundById(fundId);
		// System.out.println("删除基金信息fundId："+fundId);
		return "contribute_fund";

	}
	/* =================编辑部的留言信息操作=====userService=========== */

	// 给编辑部的留言
	@RequestMapping("/contributeLeaveMessage.do")
	public String contributeLeaveMessage() {

		return "contribute_leaveMessage";

	}

	// 给编辑部的留言
	@RequestMapping("/addContributeLeaveMessage.do")
	@ResponseBody
	public ResponseResult<Void> addContributeLeaveMessage(String essayId, String leaveMessageId, String lMessageContent,
			HttpSession session, Model model) {
		ResponseResult<Void> rr = new ResponseResult<Void>();// 获取服务器中的真实路径（文件保存路径）
		EssayInfo essay = essayInfoService.preLoadEssayById(essayId);
		// System.out.println("编辑部的留言:essay..............."+essay);
		LeaveMessage leaveMessage = new LeaveMessage();
		if (leaveMessageId.trim() == null || leaveMessageId.trim() == "") {
			leaveMessageId = new SimpleDateFormat("yyyy-MM-dd-HH-mm").format(new Date()).toString().replace("-", "")
					.toUpperCase();
			leaveMessage.setLeaveMessageId(leaveMessageId);
			leaveMessage.setEssayId(essayId);
			// 发件人
			leaveMessage.setUsername(essay.getContributor());//
			// 收件人
			leaveMessage.setToUsername("123456");
			leaveMessage.setlMessageContent(lMessageContent);
			leaveMessage.setlMessageTime(new Date());
			leaveMessage.setlMessageState(0); // 未发送状态
			essayInfoService.insertLeaveMessage(leaveMessage);
			EssayInfo essayInfo = essayInfoService.preLoadEssayById(essayId);
			model.addAttribute("essay", essayInfo);
			// System.out.println("5-2-1添加");
			rr.setState(1);
			rr.setMessage("留言添加成功");
			return rr;
		} else {
			leaveMessage.setLeaveMessageId(leaveMessageId);
			// leaveMessage.setEssayId(essayId);
			// leaveMessage.setUsername(essay.getUsername());
			leaveMessage.setlMessageContent(lMessageContent);
			leaveMessage.setlMessageTime(new Date());
			// leaveMessage.setlMessageState(0); //未发送状态
			essayInfoService.updateLMessageById(leaveMessage);
			EssayInfo essayInfo = essayInfoService.preLoadEssayById(essayId);
			model.addAttribute("essay", essayInfo);
			// System.out.println("5-2-2更新");
			rr.setState(0);
			rr.setMessage("留言更新");
			return rr;

		}

	}

	// 上传稿件内容及附件页面
	@RequestMapping("/contributeUploadfile.do")
	public String contributeUploadfile() {

		return "contribute_uploadfile";

	}

	// 上传稿件内容及附件/upload.do
	@RequestMapping("/addUploadfile.do")
	public String uploadfile(String essayId, String contentUrl, HttpSession session, Model model) {
		EssayInfo essayInfo = new EssayInfo();
		essayInfo.setEssayId(essayId);
		essayInfo.setContentUrl(contentUrl);
		try {
			essayInfoService.updateEssayById(essayInfo);
			EssayInfo essay = essayInfoService.preLoadEssayById(essayId);
			session.setAttribute("essay", essay);
			// System.out.println("7");
			return "contribute_uploadfile";

		} catch (Exception e) {
			return "contribute_confirm";

		}
	}

	// 确认信息&投稿
	@RequestMapping("/contributeConfirm.do")
	public String contributeConfirm() {

		return "contribute_confirm";

	}

	// 立即投稿 投稿完成&邮件通知稿件状态为0 投稿状态1
	@RequestMapping("/contributeSuccess.do")
	public String contributeSuccess(String leaveMessageId, String essayId, HttpSession session, Model model) {
		System.out.println("leaveMessageId:" + leaveMessageId);

		EssayInfo essayInfo = new EssayInfo();
		// 投稿
		essayInfo.setEssayId(essayId);
		essayInfo.setIsContribute(1);
		essayInfo.setStatusId(61); // 投稿
		essayInfo.setContributeDate(new Date());

		// essayInfo.setFinishDate(finishDate);
		essayInfoService.updateEssayById(essayInfo);
		EssayInfo essay = essayInfoService.preLoadEssayById(essayId);
		session.setAttribute("essay", essay);

		// 留言状态
		LeaveMessage lMessage = new LeaveMessage();
		if (leaveMessageId != null) {
			lMessage.setLeaveMessageId(leaveMessageId);
			lMessage.setlMessageState(1);
			lMessage.setLeaveMessageId(lMessage.getLeaveMessageId());
			lMessage.setlMessageTime(new Date());
			essayInfoService.updateLMessageById(lMessage);
		}
		System.out.println("success");
		return "contribute_success";

	}

	// 保存到待修改稿件中 稿件状态为0 投稿状态0
	@RequestMapping("/saveEssay.do")
	public String saveEssay(String essayId) {
		// System.out.println("90"+essayId);
		EssayInfo essayInfo = new EssayInfo();
		// 投稿
		essayInfo.setEssayId(essayId);
		essayInfo.setIsContribute(0);
		/*
		 * essayInfo.setFinishDate(new SimpleDateFormat("yyyy-MM-dd HH:mm") .format(new
		 * Date()).toString());
		 */
		essayInfoService.updateEssayById(essayInfo);
		return "author_paper_center";

	}

	@RequestMapping("/exitContribute.do")
	public String exitContribute(HttpSession session) {
		session.invalidate();

		return "author_paper_center";

	}

}