package com.pxxy.handleMenuscript.bean;

import java.io.Serializable;
import java.util.Date;

public class EssayComment implements Serializable {

	/**
	 * 评语表
	 */
	private static final long serialVersionUID = 1L;
	private String commentId; // 评语编号
	private String essayId; // 稿件编号
	private String cUsernameId; // 评语人编号
	private String designCommentId; // 设计评语编号
	private String contentCommentId;// 内容评语编号
	private String dataCommentId; // 数据评语编号
	private String discussCommentId;// 讨论评语编号
	private String resultCommentId; // 结果评语编号
	private String commentDetails; // 具体意见
	private Integer commentLevel; // 评审级别（20专家审核、30审核）
	private Date commentDate; // 评论时间

	private ContributeEssay cEssay; // 一个评语对应一个已分配的稿件
	private DesignComment designComment;// 设计评语表一对一
	private ContentComment contentComment;// 内容评语表一对一
	private DataComment dataComment;// 数据评语表一对一
	private DiscussComment discussComment;// 讨论评语表一对一
	private ResultComment ResultComment;// 结果评语表一对一

	private EssayInfo essay;

	public EssayComment() {
	}

	public EssayComment(String commentId, String essayId, String cUsernameId, String designCommentId,
			String contentCommentId, String dataCommentId, String discussCommentId, String resultCommentId,
			String commentDetails, Integer commentLevel, Date commentDate, ContributeEssay cEssay,
			DesignComment designComment, ContentComment contentComment, DataComment dataComment,
			DiscussComment discussComment, com.pxxy.handleMenuscript.bean.ResultComment resultComment,
			EssayInfo essay) {
		super();
		this.commentId = commentId;
		this.essayId = essayId;
		this.cUsernameId = cUsernameId;
		this.designCommentId = designCommentId;
		this.contentCommentId = contentCommentId;
		this.dataCommentId = dataCommentId;
		this.discussCommentId = discussCommentId;
		this.resultCommentId = resultCommentId;
		this.commentDetails = commentDetails;
		this.commentLevel = commentLevel;
		this.commentDate = commentDate;
		this.cEssay = cEssay;
		this.designComment = designComment;
		this.contentComment = contentComment;
		this.dataComment = dataComment;
		this.discussComment = discussComment;
		ResultComment = resultComment;
		this.essay = essay;
	}

	public String getCommentId() {
		return commentId;
	}

	public void setCommentId(String commentId) {
		this.commentId = commentId;
	}

	public String getEssayId() {
		return essayId;
	}

	public void setEssayId(String essayId) {
		this.essayId = essayId;
	}

	public String getcUsernameId() {
		return cUsernameId;
	}

	public void setcUsernameId(String cUsernameId) {
		this.cUsernameId = cUsernameId;
	}

	public String getDesignCommentId() {
		return designCommentId;
	}

	public void setDesignCommentId(String designCommentId) {
		this.designCommentId = designCommentId;
	}

	public String getContentCommentId() {
		return contentCommentId;
	}

	public void setContentCommentId(String contentCommentId) {
		this.contentCommentId = contentCommentId;
	}

	public String getDataCommentId() {
		return dataCommentId;
	}

	public void setDataCommentId(String dataCommentId) {
		this.dataCommentId = dataCommentId;
	}

	public String getDiscussCommentId() {
		return discussCommentId;
	}

	public void setDiscussCommentId(String discussCommentId) {
		this.discussCommentId = discussCommentId;
	}

	public String getResultCommentId() {
		return resultCommentId;
	}

	public void setResultCommentId(String resultCommentId) {
		this.resultCommentId = resultCommentId;
	}

	public String getCommentDetails() {
		return commentDetails;
	}

	public void setCommentDetails(String commentDetails) {
		this.commentDetails = commentDetails;
	}

	public Integer getCommentLevel() {
		return commentLevel;
	}

	public void setCommentLevel(Integer commentLevel) {
		this.commentLevel = commentLevel;
	}

	public Date getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}

	public ContributeEssay getcEssay() {
		return cEssay;
	}

	public void setcEssay(ContributeEssay cEssay) {
		this.cEssay = cEssay;
	}

	public DesignComment getDesignComment() {
		return designComment;
	}

	public void setDesignComment(DesignComment designComment) {
		this.designComment = designComment;
	}

	public ContentComment getContentComment() {
		return contentComment;
	}

	public void setContentComment(ContentComment contentComment) {
		this.contentComment = contentComment;
	}

	public DataComment getDataComment() {
		return dataComment;
	}

	public void setDataComment(DataComment dataComment) {
		this.dataComment = dataComment;
	}

	public DiscussComment getDiscussComment() {
		return discussComment;
	}

	public void setDiscussComment(DiscussComment discussComment) {
		this.discussComment = discussComment;
	}

	public ResultComment getResultComment() {
		return ResultComment;
	}

	public void setResultComment(ResultComment resultComment) {
		ResultComment = resultComment;
	}

	public EssayInfo getEssay() {
		return essay;
	}

	public void setEssay(EssayInfo essay) {
		this.essay = essay;
	}

	@Override
	public String toString() {
		return "EssayComment [commentId=" + commentId + ", essayId=" + essayId + ", cUsernameId=" + cUsernameId
				+ ", designCommentId=" + designCommentId + ", contentCommentId=" + contentCommentId + ", dataCommentId="
				+ dataCommentId + ", discussCommentId=" + discussCommentId + ", resultCommentId=" + resultCommentId
				+ ", commentDetails=" + commentDetails + ", commentLevel=" + commentLevel + ", commentDate="
				+ commentDate + ", cEssay=" + cEssay + ", designComment=" + designComment + ", contentComment="
				+ contentComment + ", dataComment=" + dataComment + ", discussComment=" + discussComment
				+ ", ResultComment=" + ResultComment + ", essay=" + essay + "]";
	}
	

}