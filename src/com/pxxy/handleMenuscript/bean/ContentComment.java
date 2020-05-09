package com.pxxy.handleMenuscript.bean;

import java.io.Serializable;
/**
 * 稿件内容评语
 * @author ASUS
 *
 */
public class ContentComment implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer contentCommentId;	//内容评语编号
	private String contentType;			//内容评语类型

	private EssayComment essayComment;// 稿件评语表一对一

	public ContentComment() {
		
	}

	public Integer getContentCommentId() {
		return contentCommentId;
	}

	public void setContentCommentId(Integer contentCommentId) {
		this.contentCommentId = contentCommentId;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
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

	public ContentComment(Integer contentCommentId, String contentType, EssayComment essayComment) {
		super();
		this.contentCommentId = contentCommentId;
		this.contentType = contentType;
		this.essayComment = essayComment;
	}

	@Override
	public String toString() {
		return "ContentComment [contentCommentId=" + contentCommentId + ", contentType=" + contentType
				+ ", essayComment=" + essayComment + "]";
	}
	

}
