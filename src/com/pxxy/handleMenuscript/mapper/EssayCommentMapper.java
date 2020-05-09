package com.pxxy.handleMenuscript.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pxxy.handleMenuscript.bean.EssayComment;
import com.pxxy.handleMenuscript.bean.EssayInfo;

public interface EssayCommentMapper {
	//添加稿件评论
	void insertEssayComment(EssayComment eComment);
	//修改稿件评论
	void updateEssayCommentById(EssayComment eComment);
	//查询稿件评语
	EssayInfo selectECommentById(String essayId);
	//加载评语要求
	List<EssayComment> selectComment();
	//专家查询稿件评语详情
	EssayComment selectCommentDetails(@Param(value="essayId")String essayId,@Param(value="cUsernameId")String cUsernameId);
	//编辑查询稿件
	EssayComment selectCommentDetailsById(@Param(value="commentId")String commentId);
	
}