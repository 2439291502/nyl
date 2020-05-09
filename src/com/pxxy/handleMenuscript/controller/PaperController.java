package com.pxxy.handleMenuscript.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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

import com.pxxy.handleMenuscript.bean.Paper;
import com.pxxy.handleMenuscript.bean.PaperVO;
import com.pxxy.handleMenuscript.service.IPaperService;

@Controller
@RequestMapping("/paper")
public class PaperController {
	@Resource
	private IPaperService paperService;
	
	/**
	 * 多条件查询稿件
	 * 
	 * @return
	 */
	@RequestMapping("/selectPaper.do")
	public String selectPaper(String year, String issue, String columns, String essayId,
			String author, String workUnit, String title, String abstracts, String keywords,
			@RequestParam("styleId") Integer styleId,
			Model model) {

		PaperVO pv = new PaperVO();
		pv.setYear(year);
		pv.setIssue(issue);
		pv.setColumns(columns);
		pv.setStyleId(styleId);
		pv.setEssayId(essayId);

		pv.setAuthor(author);
		pv.setWorkUnit(workUnit);
		pv.setTitle(title);
		pv.setAbstracts(abstracts);
		pv.setKeywords(keywords);
		//System.out.println(pv);
 		List<Paper> paperList = paperService.selectPaper(pv);
		model.addAttribute("paperList", paperList);
		//System.out.println(paperList.get(0).getEssay());

		return "select_paper_result";

	}
	//selectPaperByTitle.do
	@RequestMapping("/selectPaperByTitle.do")
	public String selectPaperByTitle(String title,Model model) {
		PaperVO pv = new PaperVO();
		pv.setTitle(title);	
 		List<Paper> paperList = paperService.selectPaper(pv);
		model.addAttribute("paperList", paperList);
		//System.out.println(paperList.get(0).getEssay());
		return "select_paper_result";

	}

	//selectPaperById
	/**
	 * 通过id查询稿件详情
	 * @param paperId
	 * @param model
	 * @return
	 */
	@RequestMapping("/selectPaperDetails.do")
	public String selectPaperDetails(
			@RequestParam("paperId") Integer paperId,
			Model model
			) {
		Paper paper=paperService.selectPaperById(paperId);
		//修改浏览次数
		model.addAttribute("paper",paper);
		Paper p=new Paper();
		p.setPaperId(paperId);
		p.setReadTime(paper.getReadTime()+1);
		//System.out.println(p);
		paperService.updatePaper(p);
		
		return "paper_detials";
		
	}
	//本期目录
	@RequestMapping("/selectPaperByYearAIssue.do")
	public String selectPaperByYearAIssue(
			String year,
			String issue,
			Model model) {
		//System.out.println("year+issue:"+year+issue);
		List<Paper> paperList=paperService.selectPaperByYearAIssue(year, issue);
		//System.out.println(paperList);
		model.addAttribute("paperList", paperList);
		return "select_paper_result";
		
	}
	@RequestMapping("/showSelectPaper.do")
	public String showSelectPaper() {
		return "select_paper";
	}
	/**
	 * 上传了之后再下载
	 * @param request
	 * @param contentUrl
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@GetMapping("/download.do") // 
	public ResponseEntity<byte[]> download(
			HttpServletRequest request,
			@RequestParam("contentUrl") String contentUrl,
			@RequestParam("essayId") String essayId,
			Model model) throws Exception {
		// 获取文件所在路径
		String path = request.getServletContext().getRealPath("/files/");
		contentUrl = new String(contentUrl.getBytes("ISO-8859-1"), "UTF-8"); 
		File file = new File(path + File.separator + contentUrl);
		
		//System.out.println("file="+file);
		HttpHeaders headers = new HttpHeaders();
		Paper p=paperService.selectPaperByEssayId(essayId);
		Paper paper=new Paper();
		paper.setEssayId(essayId);
		paper.setDownTime(p.getDownTime()+1);
		
		//essay
		try {
			String downloadFileName = new String(contentUrl); 
			headers.setContentDispositionFormData("attachment", downloadFileName);
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);// 设置MIME类型
			//下载成功，更改期刊稿件下载次数
			paperService.updatePaper(p);

			return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);//
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e);
			return null;
		}
		

	}
	
	

}
