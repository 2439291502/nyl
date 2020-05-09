package com.pxxy.handleMenuscript.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.pxxy.handleMenuscript.bean.EssayComment;
import com.pxxy.handleMenuscript.bean.EssayInfo;

public interface IEssayCommentService {
	//添加稿件评论
	void insertEssayComment(EssayComment eComment);
	//修改稿件评论
	void updateEssayCommentById(EssayComment eComment);
	//查询稿件评语
	/**
	 * 通过分配稿件Id 稿件评语
	 * @param pageCode
	 * @param pageSize
	 * @return
	 */
	EssayInfo selectECommentById(String essayId);
	//加载评语要求
	List<EssayComment> selectComment();
	//查询稿件评语详情
	EssayComment selectCommentDetails(String essayId,String userId);
	//更根据commentId查询评语详情
	//编辑查询稿件
	EssayComment selectCommentDetailsById(String commentId);
}
