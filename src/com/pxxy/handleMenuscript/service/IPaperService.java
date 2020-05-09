package com.pxxy.handleMenuscript.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.util.MultiValueMap;

import com.github.pagehelper.PageInfo;
import com.pxxy.handleMenuscript.bean.Paper;
import com.pxxy.handleMenuscript.bean.PaperVO;

public interface IPaperService {
	// 添加期刊信息
	void insertPaper(Paper paper);

	// 通过style查询所有相应的期刊栏目
	PageInfo<Paper> selectPaperByStyleId(Integer styleId, Integer pageCode, Integer pageSize);

	//
	List<Paper> selectPaperByYearAIssue(@Param("year") String year, @Param("issue") String issue);

	// paperId 查询期刊
	Paper selectPaperById(Integer paperId);

	// 查询所有期刊信息
	MultiValueMap<String, String> selectAllPaper();

	// 多条件查询稿件
	List<Paper> selectPaper(PaperVO pv);

	void updatePaper(Paper paper);

	// 按下载量查看期刊
	List<Paper> selectPaperByDownTimes();

	// 最新期刊年份selectNewPaperYear
	String selectNewPaperYear();

	// 最新期刊期刊号selectNewPaperIssue
	String selectNewPaperIssue(@Param("year") String year);

	// 通过essayId查询期刊稿件信息
	Paper selectPaperByEssayId(@Param("essayId") String essayId);

}
