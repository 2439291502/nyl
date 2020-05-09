package com.pxxy.handleMenuscript.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pxxy.handleMenuscript.bean.Paper;
import com.pxxy.handleMenuscript.bean.PaperVO;
import com.pxxy.handleMenuscript.mapper.PaperMapper;

@Service
public class PaperServcie implements IPaperService {

	@Resource
	private PaperMapper paperMapper;

	@Override
	public void insertPaper(Paper paper) {
		// TODO Auto-generated method stub
		System.out.println("insertPaperServcie.............");
		paperMapper.insertPaper(paper);
	}

	@Override
	public PageInfo<Paper> selectPaperByStyleId(Integer styleId, Integer pageCode, Integer pageSize) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageCode, pageSize);
		List<Paper> paperYear = paperMapper.selectPaperByStyleId(styleId);
		PageInfo<Paper> pageInfo = new PageInfo<>(paperYear);
		return pageInfo;
	}

	@Override
	public Paper selectPaperById(Integer paperId) {
		// TODO Auto-generated method stub
		return paperMapper.selectPaperById(paperId);
	}

	@Override
	public MultiValueMap<String, String> selectAllPaper() { // TODO
		// Auto-generated method stub
		MultiValueMap<String, String> Lpaper = new LinkedMultiValueMap<String, String>(); // 年
		List<Paper> paperYear = paperMapper.selectAllPaper();

		for (int j = 0; j < paperYear.size(); j++) {
			if (Lpaper.containsKey(paperYear.get(j).getYear())) {
				Lpaper.get(paperYear.get(j).getYear()).add(paperYear.get(j).getIssue());

			} else {
				Lpaper.set(paperYear.get(j).getYear(), paperYear.get(j).getIssue());
			}
		}

		return Lpaper;
	}

	@Override
	public List<Paper> selectPaperByYearAIssue(String year, String issue) {
		// TODO Auto-generated method stub
		return paperMapper.selectPaperByYearAIssue(year, issue);
	}

	@Override
	public List<Paper> selectPaper(PaperVO pv) {
		// TODO Auto-generated method stub
		List<Paper> paperList = paperMapper.selectPaper(pv);
		return paperList;
	}

	@Override
	public void updatePaper(Paper paper) {
		// TODO Auto-generated method stub
		paperMapper.updatePaper(paper);
	}

	@Override
	public List<Paper> selectPaperByDownTimes() {
		// TODO Auto-generated method stub
		return paperMapper.selectPaperByDownTimes();
	}

	@Override
	public String selectNewPaperYear() {
		// TODO Auto-generated method stub
		return paperMapper.selectNewPaperYear();
	}

	@Override
	public String selectNewPaperIssue(String year) {
		// TODO Auto-generated method stub
		return paperMapper.selectNewPaperIssue(year);
	}

	@Override
	public Paper selectPaperByEssayId(String essayId) {
		// TODO Auto-generated method stub
		return paperMapper.selectPaperByEssayId(essayId);
	}

}
