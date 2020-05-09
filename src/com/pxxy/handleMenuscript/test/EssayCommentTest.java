package com.pxxy.handleMenuscript.test;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.util.MultiValueMap;

import com.github.pagehelper.PageInfo;
import com.pxxy.handleMenuscript.bean.EssayComment;
import com.pxxy.handleMenuscript.bean.EssayInfo;
import com.pxxy.handleMenuscript.bean.Paper;
import com.pxxy.handleMenuscript.bean.PaperVO;
import com.pxxy.handleMenuscript.mapper.EssayCommentMapper;
import com.pxxy.handleMenuscript.mapper.PaperMapper;
import com.pxxy.handleMenuscript.service.IEssayCommentService;
import com.pxxy.handleMenuscript.service.IPaperService;

@RunWith(SpringRunner.class)
@ContextConfiguration({
	"classpath:application-dao.xml",
	"classpath:application-service.xml"
	})
public class EssayCommentTest {
	@Autowired
	private EssayCommentMapper eCMapper;
	
	@Autowired
	private IEssayCommentService eCommentService; 
	
	@Autowired
	private PaperMapper paperMapper;
	@Autowired
	private IPaperService paperService;
	
	@Test
	public void insertEssayComment(){
		EssayComment eComment=new EssayComment();
		eComment.setCommentId("1");
		eComment.setEssayId("1");
		eComment.setDesignCommentId("1");
		eComment.setContentCommentId("1");
		eComment.setDataCommentId("1");
		eComment.setDiscussCommentId("1");
		eComment.setResultCommentId("1");
		eComment.setCommentDetails("details");
		eComment.setCommentLevel(1);
		eCMapper.insertEssayComment(eComment);
	}
	//selectEssayComment
	@Test
	public void selectEssayComment() {
		EssayInfo essay=eCMapper.selectECommentById("202003110008");
		System.out.println(essay.geteCommentList());
	}
	//service
	@Test
	public void selectEssayComment1(){
	
		try {
			EssayInfo essay=eCommentService.selectECommentById("202003110008");
			System.out.println(essay.geteCommentList());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}
	}
	//selectComment
	@Test
	public void selectComment() {
		List<EssayComment> eComment=eCommentService.selectComment();
		System.out.println(eComment);
	}
	
	//selectCommentDetails
	@Test
	public void selectCommentDetails() {
		EssayComment eComment=eCMapper.selectCommentDetails("202002211449", "12345");
		System.out.println(eComment);
	}
	//updateEssayCommentById
	@Test
	public void updateEssayComment() {
		EssayComment eComment=new EssayComment();
		eComment.setCommentId("20200311171626");
		eComment.setEssayId("202003110051");
		eComment.setcUsernameId("12345");
		eComment.setDesignCommentId("1");
		eComment.setContentCommentId("1");
		eComment.setDataCommentId("2");
		eComment.setDiscussCommentId("3");
		eComment.setResultCommentId("3");
		eComment.setCommentDetails("4");
		eComment.setCommentLevel(30);//专家评论
		eComment.setCommentDate(new Date());
		eCMapper.updateEssayCommentById(eComment);
	}
	@Test
	public void updateEssayCommentService() {
		EssayComment eComment=new EssayComment();
		eComment.setCommentId("20200311171626");
		eComment.setEssayId("202003110051");
		eComment.setcUsernameId("12345");
		eComment.setDesignCommentId("4");
		eComment.setContentCommentId("3");
		eComment.setDataCommentId("2");
		eComment.setDiscussCommentId("3");
		eComment.setResultCommentId("3");
		eComment.setCommentDetails("4");
		eComment.setCommentLevel(30);//专家评论
		eComment.setCommentDate(new Date());
		eCommentService.updateEssayCommentById(eComment);
	}
	//paper表
	//insertPaper
	@Test
	public void paperMapper() {
		Paper paper=new Paper();
		paper.setYear("2020");
		paperMapper.insertPaper(paper);
	}
	@Test
	public void insertPaper() {
		Paper paper=new Paper();
		paper.setYear("2019");
		paper.setIssue("02");
		paper.setStyleId(1);
		paper.setColumns("社会与科学");
		//System.out.println(paper);
		paperService.insertPaper(paper);
	}
	@Test
	public void selectAll() {
		List<Paper> list=paperMapper.selectAllPaper();
		System.out.println(list);
	}
	@Test
	public void selectAllPaper() {
		MultiValueMap<String, String> list=paperService.selectAllPaper();
		System.out.println(list);
	}
	//List<Paper> selectPaperByYearAIssue
	@Test
	public void selectPaperByYearAIssue() {
		List<Paper> list=paperMapper.selectPaperByYearAIssue("2020", "02");
		System.out.println(paperMapper);
		System.out.println(list.size());
	}
	//
	@Test
	public void selectPaperByYearAIssue2() {
		List<Paper> list=paperService.selectPaperByYearAIssue("2020", "02");
		System.out.println(list.size());
	}
	
	
	//selectPaper
	@Test
	public void selectPaper() {
		//Paper p=new Paper();
		
		PaperVO pv=new PaperVO();
		pv.setYear("2019");
		pv.setIssue("01");
		pv.setColumns("社会");
		pv.setStyleId(1);
		//pv.setEssayId(essayId);
		//pv.setAuthor("1");
		//pv.setWorkUnit(workUnit);
		 // pv.setTitle("1");
		
		List<Paper> pvList=paperMapper.selectPaper(pv);
		System.out.println(pvList);
	}
	//PageInfo<Paper> selectPaper
	@Test
	public void s() {
		PaperVO pv=new PaperVO();
		pv.setYear("2020");
		pv.setIssue("01");
		pv.setColumns("社会");
	 
		List<Paper>list=paperService.selectPaper(pv);
		System.out.println(list);
	}
	@Test
	public void TestCheckEssay() {
		String paper=paperMapper.selectNewPaperYear();
		System.out.println(paper);
		
	}
	@Test
	public void TestCheckEssayAndYear() {
		String year=paperMapper.selectNewPaperYear();
		String issue=paperMapper.selectNewPaperIssue(year);
				
		System.out.println(year+issue);
		
	}
}
