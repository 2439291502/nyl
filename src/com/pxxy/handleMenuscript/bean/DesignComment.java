package com.pxxy.handleMenuscript.bean;

import java.io.Serializable;

/**
 * 稿件设计评语
 * 
 * @author ASUS
 *
 */
public class DesignComment implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer designCommentId;
	private String designType;

	private EssayComment essayComment;// 稿件评语表一对一

	public DesignComment() {
	
	}

	public Integer getDesignCommentId() {
		return designCommentId;
	}

	public void setDesignCommentId(Integer designCommentId) {
		this.designCommentId = designCommentId;
	}

	public String getDesignType() {
		return designType;
	}

	public void setDesignType(String designType) {
		this.designType = designType;
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

	public DesignComment(Integer designCommentId, String designType, EssayComment essayComment) {
		super();
		this.designCommentId = designCommentId;
		this.designType = designType;
		this.essayComment = essayComment;
	}

	@Override
	public String toString() {
		return "DesignComment [designCommentId=" + designCommentId + ", designType=" + designType + ", essayComment="
				+ essayComment + "]";
	}
	

}