package com.pxxy.handleMenuscript.bean;

import java.io.Serializable;
/**
 * 稿件讨论评语
 * @author ASUS
 *
 */
public class DiscussComment implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer discussCommentId;	//	讨论评语编号
	private String discussCommentType;	//讨论评语类型
	
	private EssayComment essayComment;// 稿件评语表一对一

	public DiscussComment() {
		
	}

	public Integer getDiscussCommentId() {
		return discussCommentId;
	}

	public void setDiscussCommentId(Integer discussCommentId) {
		this.discussCommentId = discussCommentId;
	}

	public String getDiscussCommentType() {
		return discussCommentType;
	}

	public void setDiscussCommentType(String discussCommentType) {
		this.discussCommentType = discussCommentType;
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

	public DiscussComment(Integer discussCommentId, String discussCommentType, EssayComment essayComment) {
		super();
		this.discussCommentId = discussCommentId;
		this.discussCommentType = discussCommentType;
		this.essayComment = essayComment;
	}

	@Override
	public String toString() {
		return "DiscussComment [discussCommentId=" + discussCommentId + ", discussCommentType=" + discussCommentType
				+ ", essayComment=" + essayComment + "]";
	}

}
