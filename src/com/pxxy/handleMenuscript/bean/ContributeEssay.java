package com.pxxy.handleMenuscript.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * 稿件分配表
 * 
 * @author ASUS
 *
 */
public class ContributeEssay implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String contributeId; // 审核id
	private String editorId; // 审稿人员编号: 编辑分配稿件(Editor表editorId的外键)
	private String essayId; // 文章编号(Essay表essayId的外键)
	private String checkUserId; // 审核稿件用户id 专家id
	private Date contributeDate; // 处理日期

	private EssayInfo essay; // 一对一
	private List<EssayComment> eCommentList;// 一个分配审核稿件有多个评论

	public ContributeEssay() {

	}

	public ContributeEssay(String contributeId, String editorId, String essayId, String checkUserId,
			Date contributeDate, EssayInfo essay, List<EssayComment> eCommentList) {
		super();
		this.contributeId = contributeId;
		this.editorId = editorId;
		this.essayId = essayId;
		this.checkUserId = checkUserId;
		this.contributeDate = contributeDate;
		this.essay = essay;
		this.eCommentList = eCommentList;
	}

	public String getContributeId() {
		return contributeId;
	}

	public void setContributeId(String contributeId) {
		this.contributeId = contributeId;
	}

	public String getEditorId() {
		return editorId;
	}

	public void setEditorId(String editorId) {
		this.editorId = editorId;
	}

	public String getEssayId() {
		return essayId;
	}

	public void setEssayId(String essayId) {
		this.essayId = essayId;
	}

	public String getCheckUserId() {
		return checkUserId;
	}

	public void setCheckUserId(String checkUserId) {
		this.checkUserId = checkUserId;
	}

	public Date getContributeDate() {
		return contributeDate;
	}

	public void setContributeDate(Date contributeDate) {
		this.contributeDate = contributeDate;
	}

	public EssayInfo getEssay() {
		return essay;
	}

	public void setEssay(EssayInfo essay) {
		this.essay = essay;
	}

	public List<EssayComment> geteCommentList() {
		return eCommentList;
	}

	public void seteCommentList(List<EssayComment> eCommentList) {
		this.eCommentList = eCommentList;
	}

	@Override
	public String toString() {
		return "ContributeEssay [contributeId=" + contributeId + ", editorId=" + editorId + ", essayId=" + essayId
				+ ", checkUserId=" + checkUserId + ", contributeDate=" + contributeDate + ", essay=" + essay
				+ ", eCommentList=" + eCommentList + "]";
	}
	

}