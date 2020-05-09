package com.pxxy.handleMenuscript.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pxxy.handleMenuscript.bean.Paper;
import com.pxxy.handleMenuscript.bean.PaperVO;

/**
 * 期刊操作
 * 
 * @author ASUS
 *
 */
public interface PaperMapper {
	//添加期刊信息
	void insertPaper(Paper paper);
	//通过style查询所有相应的期刊栏目
	List<Paper> selectPaperByStyleId(Integer styleId);
	//paperId 查询期刊
	Paper selectPaperById(Integer paperId);
	//查询所有期刊年份
	List<Paper> selectAllPaper();
	//查询所有期刊年份-期号
	List<Paper> selectAllIssue();
	//
	List<Paper> selectPaperByYearAIssue(@Param("year")String year,@Param("issue")String issue);
	//多条件查询稿件
	List<Paper> selectPaper(PaperVO pv);
	//更新稿件浏览次数
	void updatePaper(Paper paper);
	//按下载量查看期刊
	List<Paper> selectPaperByDownTimes();
	//最新期刊年份selectNewPaperYear
	String selectNewPaperYear();
	//最新期刊期刊号selectNewPaperIssue
	String selectNewPaperIssue(@Param("year")String year);
	//通过essayId查询期刊稿件信息
	Paper selectPaperByEssayId(@Param("essayId")String essayId);
	
	
	
}