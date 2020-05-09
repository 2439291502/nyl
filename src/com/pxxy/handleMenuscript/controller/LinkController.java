package com.pxxy.handleMenuscript.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pxxy.handleMenuscript.bean.Paper;
import com.pxxy.handleMenuscript.service.IPaperService;

/**
 * index链接地址
 * 
 * @author ASUS
 *
 */
@Controller
@RequestMapping("/index")
public class LinkController {
	@Resource
	private IPaperService paperService;

	//期刊稿件在线处理系统首页
	@RequestMapping("/showIndex.do")
	public String selectPaperByYearAIssue(Model model) {
		// System.out.println("year+issue:"+year+issue);
		String year=paperService.selectNewPaperYear();
		String issue=paperService.selectNewPaperIssue(year);
		List<Paper> paperList = paperService.selectPaperByYearAIssue(year, issue);
		// System.out.println(paperList);
		model.addAttribute("paperList", paperList);
		return "index";

	}

	// 期刊详情页
	@RequestMapping("/magazineDetails.do")
	public String magazineDetails() {
		return "magazine_details";

	}

	// 联系我们
	@RequestMapping("/contactUs.do")
	public String contactUs() {
		return "contact_us";

	}

	// contribute_guide 投稿指南
	@RequestMapping("/contributeGuide.do")
	public String contributeGuide() {
		return "contribute_guide";

	}

	// contribute_request 投稿需求
	@RequestMapping("/contributeRequest.do")
	public String contributeRequest() {
		return "contribute_request";

	}

	// copyright_assignment 投稿授权
	// editorial_board 编辑介绍
	@RequestMapping("/editorialBoard.do")
	public String editorialBoard() {
		return "editorial_board";

	}

	// editorial_flow 编辑流程editorialFlow.do
	@RequestMapping("/editorialFlow.do")
	public String editorialFlow() {
		return "editorial_flow";

	}

	/* ========================== */
	/* 左侧链接部分 */
	// abstract_request 英文摘要写作要求
	@RequestMapping("/abstractRequest.do")
	public String abstractRequest() {
		return "abstract_request";

	}

	// essay_mode 稿件模板
	@RequestMapping("/essayMode.do")
	public String essayMode() {
		return "essay_mode";

	}

	// essay_pact 文稿合同
	@RequestMapping("/essayPact.do")
	public String essayPact() {
		return "essay_pact";

	}

	// essay_register_from 稿件登记表
	@RequestMapping("/essayRegisterFrom.do")
	public String essayRegisterFrom() {
		return "essay_register_from";

	}

	// review_requirement 审稿要求
	@RequestMapping("/reviewRequirement.do")
	public String reviewRequirement() {
		return "essay_register_from";

	}
	//check_request
	@RequestMapping("/checkRequest.do")
	public String checkRequest() {
		return "check_request";

	}

	// 刷新首页
	@RequestMapping("/newPaperList.do")
	public String newPaperList(Model model) {
		String year=paperService.selectNewPaperYear();
		String issue=paperService.selectNewPaperIssue(year);
		List<Paper> paperList = paperService.selectPaperByYearAIssue(year, issue);
		
		model.addAttribute("paperList", paperList);
		return "index_paper_catalogue";

	}

	// 过往期刊管理
	@RequestMapping("/selectPaperCatalog.do")
	public String selectAllPaper(Model model) {
		MultiValueMap<String, String> yearList = paperService.selectAllPaper();
		model.addAttribute("yearList", yearList);
		System.out.println(yearList);
		return "index_paper_catalogue";

	}
	
	//selectPaperByDownTimes
	@RequestMapping("/orderPaperByDownTimes.do")
	public String orderPaperByDownTimes(Model model) {
		List<Paper> paperList = paperService.selectPaperByDownTimes();
		model.addAttribute("paperList", paperList);
		System.out.println(paperList);
		return "index";

	}
	@RequestMapping("/selectPaperByYearAIssue.do")
	public String selectPaperByYearAIssue(String year, String issue, Model model) {
		// System.out.println("year+issue:"+year+issue);
		List<Paper> paperList = paperService.selectPaperByYearAIssue(year, issue);
		// System.out.println(paperList);
		// paperList.get(0).getEssayList();
		model.addAttribute("paperList", paperList);
		return "index";
	}
	
}