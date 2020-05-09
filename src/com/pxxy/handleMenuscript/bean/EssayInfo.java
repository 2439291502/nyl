package com.pxxy.handleMenuscript.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
/**
 * 投稿稿件信息实体类
 * @author ASUS
 *
 */
public class EssayInfo implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String essayId;// 稿件编号
	private String title;// 稿件题目
	private String etitle;
	private String username;// 作者姓名
	private Integer styleId;// 稿件类型编号(Style表styleId的外键)
	private String abstracts;// 摘要
	private String englishAbstract;// 英文摘要
	private String keywords;// 英文摘要
	private String englishKeywords;// 英文关键词
	private String contributor;// 投稿人
	private Date contributeDate;// 投稿日期
	private String contentUrl;// 文章内容（附录）
	private Integer statusId;// 审核状态编号(Status表statusId的外键)
	private Integer isContribute;// 是否投稿
	private String reference;// 参考文献
	private String finishDate; // 基金类别

	private List<Fund> fundList;// 基金列表

	private LeaveMessage lMessage;// 留言

	private EssayStyle essayStyle; // 稿件类型表一对一

	private ContributeEssay cEssay;// 稿件分配表 一对一

	private List<EssayComment> eCommentList;// 一对多 稿件评语
	
	private EssayStatus status; //稿件状态表

	private UserInfo user; // 一对一

	// 期刊 一稿件对一期刊
	private Paper paper;

	public EssayInfo() {
	}

	public EssayInfo(String essayId, String title, String etitle, String username, Integer styleId, String abstracts,
			String englishAbstract, String keywords, String englishKeywords, String contributor, Date contributeDate,
			String contentUrl, Integer statusId, Integer isContribute, String reference, String finishDate,
			List<Fund> fundList, LeaveMessage lMessage, EssayStyle essayStyle, ContributeEssay cEssay,
			List<EssayComment> eCommentList, EssayStatus status, UserInfo user, Paper paper) {
		super();
		this.essayId = essayId;
		this.title = title;
		this.etitle = etitle;
		this.username = username;
		this.styleId = styleId;
		this.abstracts = abstracts;
		this.englishAbstract = englishAbstract;
		this.keywords = keywords;
		this.englishKeywords = englishKeywords;
		this.contributor = contributor;
		this.contributeDate = contributeDate;
		this.contentUrl = contentUrl;
		this.statusId = statusId;
		this.isContribute = isContribute;
		this.reference = reference;
		this.finishDate = finishDate;
		this.fundList = fundList;
		this.lMessage = lMessage;
		this.essayStyle = essayStyle;
		this.cEssay = cEssay;
		this.eCommentList = eCommentList;
		this.status = status;
		this.user = user;
		this.paper = paper;
	}

	public String getEssayId() {
		return essayId;
	}

	public void setEssayId(String essayId) {
		this.essayId = essayId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getEtitle() {
		return etitle;
	}

	public void setEtitle(String etitle) {
		this.etitle = etitle;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Integer getStyleId() {
		return styleId;
	}

	public void setStyleId(Integer styleId) {
		this.styleId = styleId;
	}

	public String getAbstracts() {
		return abstracts;
	}

	public void setAbstracts(String abstracts) {
		this.abstracts = abstracts;
	}

	public String getEnglishAbstract() {
		return englishAbstract;
	}

	public void setEnglishAbstract(String englishAbstract) {
		this.englishAbstract = englishAbstract;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public String getEnglishKeywords() {
		return englishKeywords;
	}

	public void setEnglishKeywords(String englishKeywords) {
		this.englishKeywords = englishKeywords;
	}

	public String getContributor() {
		return contributor;
	}

	public void setContributor(String contributor) {
		this.contributor = contributor;
	}

	public Date getContributeDate() {
		return contributeDate;
	}

	public void setContributeDate(Date contributeDate) {
		this.contributeDate = contributeDate;
	}

	public String getContentUrl() {
		return contentUrl;
	}

	public void setContentUrl(String contentUrl) {
		this.contentUrl = contentUrl;
	}

	public Integer getStatusId() {
		return statusId;
	}

	public void setStatusId(Integer statusId) {
		this.statusId = statusId;
	}

	public Integer getIsContribute() {
		return isContribute;
	}

	public void setIsContribute(Integer isContribute) {
		this.isContribute = isContribute;
	}

	public String getReference() {
		return reference;
	}

	public void setReference(String reference) {
		this.reference = reference;
	}

	public String getFinishDate() {
		return finishDate;
	}

	public void setFinishDate(String finishDate) {
		this.finishDate = finishDate;
	}

	public List<Fund> getFundList() {
		return fundList;
	}

	public void setFundList(List<Fund> fundList) {
		this.fundList = fundList;
	}

	public LeaveMessage getlMessage() {
		return lMessage;
	}

	public void setlMessage(LeaveMessage lMessage) {
		this.lMessage = lMessage;
	}

	public EssayStyle getEssayStyle() {
		return essayStyle;
	}

	public void setEssayStyle(EssayStyle essayStyle) {
		this.essayStyle = essayStyle;
	}

	public ContributeEssay getcEssay() {
		return cEssay;
	}

	public void setcEssay(ContributeEssay cEssay) {
		this.cEssay = cEssay;
	}

	public List<EssayComment> geteCommentList() {
		return eCommentList;
	}

	public void seteCommentList(List<EssayComment> eCommentList) {
		this.eCommentList = eCommentList;
	}

	public EssayStatus getStatus() {
		return status;
	}

	public void setStatus(EssayStatus status) {
		this.status = status;
	}

	public UserInfo getUser() {
		return user;
	}

	public void setUser(UserInfo user) {
		this.user = user;
	}

	public Paper getPaper() {
		return paper;
	}

	public void setPaper(Paper paper) {
		this.paper = paper;
	}

	@Override
	public String toString() {
		return "EssayInfo [essayId=" + essayId + ", title=" + title + ", etitle=" + etitle + ", username=" + username
				+ ", styleId=" + styleId + ", abstracts=" + abstracts + ", englishAbstract=" + englishAbstract
				+ ", keywords=" + keywords + ", englishKeywords=" + englishKeywords + ", contributor=" + contributor
				+ ", contributeDate=" + contributeDate + ", contentUrl=" + contentUrl + ", statusId=" + statusId
				+ ", isContribute=" + isContribute + ", reference=" + reference + ", finishDate=" + finishDate
				+ ", fundList=" + fundList + ", lMessage=" + lMessage + ", essayStyle=" + essayStyle + ", cEssay="
				+ cEssay + ", eCommentList=" + eCommentList + ", status=" + status + ", user=" + user + ", paper="
				+ paper + "]";
	}
	

}