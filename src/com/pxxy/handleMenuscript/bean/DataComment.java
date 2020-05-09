package com.pxxy.handleMenuscript.bean;

import java.io.Serializable;

/**
 * 稿件数据评语
 * 
 * @author ASUS
 *
 */
public class DataComment implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int dataCommentId;	//数据评语编号
	private String dataCommentType;	//数据评语类型
	
	private EssayComment essayComment;//稿件评语表一对一

	public DataComment() {
	
	}

	public int getDataCommentId() {
		return dataCommentId;
	}

	public void setDataCommentId(int dataCommentId) {
		this.dataCommentId = dataCommentId;
	}

	public String getDataCommentType() {
		return dataCommentType;
	}

	public void setDataCommentType(String dataCommentType) {
		this.dataCommentType = dataCommentType;
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

	public DataComment(int dataCommentId, String dataCommentType, EssayComment essayComment) {
		super();
		this.dataCommentId = dataCommentId;
		this.dataCommentType = dataCommentType;
		this.essayComment = essayComment;
	}

	@Override
	public String toString() {
		return "EssayDataComment [dataCommentId=" + dataCommentId + ", dataCommentType=" + dataCommentType
				+ ", essayComment=" + essayComment + "]";
	}
	
}
