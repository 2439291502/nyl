package com.pxxy.handleMenuscript.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pxxy.handleMenuscript.bean.ContributeEssay;
import com.pxxy.handleMenuscript.bean.EssayComment;
import com.pxxy.handleMenuscript.bean.EssayInfo;
import com.pxxy.handleMenuscript.mapper.EssayCommentMapper;
@Service
public class EssayCommentService implements IEssayCommentService {
	@Resource
	private EssayCommentMapper eCommentMapper;//稿件评语操作
	@Override
	public void insertEssayComment(EssayComment eComment) {
		// TODO Auto-generated method stub
		eCommentMapper.insertEssayComment(eComment);
	}

	@Override
	public void updateEssayCommentById(EssayComment eComment) {
		// TODO Auto-generated method stub
		eCommentMapper.updateEssayCommentById(eComment);
	}

	@Override
	public EssayInfo selectECommentById(String essayId) {
		// TODO Auto-generated method stub
		
 		return eCommentMapper.selectECommentById(essayId);
	}

	@Override
	public List<EssayComment> selectComment() {
		// TODO Auto-generated method stub
		return eCommentMapper.selectComment();
	}

	@Override
	public EssayComment selectCommentDetails(String commentId, String userId) {
		// TODO Auto-generated method stub
		return eCommentMapper.selectCommentDetails(commentId, userId);
	}

	@Override
	public EssayComment selectCommentDetailsById(String essayId) {
		// TODO Auto-generated method stub
		return eCommentMapper.selectCommentDetailsById(essayId);
	}

}
