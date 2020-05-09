package com.pxxy.handleMenuscript.bean;

import java.io.Serializable;

/**
 * 稿件审核结果评语
 * 
 * @author ASUS
 *
 */
public class ResultComment implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer resultCommentId; // 结果评语编号
	private String resultCommentType; // 结果评语类型

	private EssayComment essayComment;// 稿件评语表一对一

	public ResultComment() {

	}

	public Integer getResultCommentId() {
		return resultCommentId;
	}

	public void setResultCommentId(Integer resultCommentId) {
		this.resultCommentId = resultCommentId;
	}

	public String getResultCommentType() {
		return resultCommentType;
	}

	public void setResultCommentType(String resultCommentType) {
		this.resultCommentType = resultCommentType;
	}

	public EssayComment getEssayComment() {
		return essayComment;
	}

	public void setEssayComment(EssayComment essayComment) {
		this.essayComment = essayComment;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public ResultComment(Integer resultCommentId, String resultCommentType, EssayComment essayComment) {
		super();
		this.resultCommentId = resultCommentId;
		this.resultCommentType = resultCommentType;
		this.essayComment = essayComment;
	}

	@Override
	public String toString() {
		return "ResultComment [resultCommentId=" + resultCommentId + ", resultCommentType=" + resultCommentType
				+ ", essayComment=" + essayComment + "]";
	}

}
