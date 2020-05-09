package com.pxxy.handleMenuscript.bean;

import java.io.Serializable;
import java.util.Date;

public class Paper implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer paperId;
	private String year;
	private String issue;
	private Integer styleId;
	private String columns;
	private String essayId;
	private Date date;
	private Integer downTime;
	private Integer readTime;
	//private List<EssayInfo> essayList;
	private EssayInfo essay;
	private EssayStyle essayStyle;

	public Paper() {

	}

	public Paper(Integer paperId, String year, String issue, Integer styleId, String columns, String essayId, Date date,
			Integer downTime, Integer readTime, EssayInfo essay, EssayStyle essayStyle) {
		super();
		this.paperId = paperId;
		this.year = year;
		this.issue = issue;
		this.styleId = styleId;
		this.columns = columns;
		this.essayId = essayId;
		this.date = date;
		this.downTime = downTime;
		this.readTime = readTime;
		this.essay = essay;
		this.essayStyle = essayStyle;
	}

	public Integer getPaperId() {
		return paperId;
	}

	public void setPaperId(Integer paperId) {
		this.paperId = paperId;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getIssue() {
		return issue;
	}

	public void setIssue(String issue) {
		this.issue = issue;
	}

	public Integer getStyleId() {
		return styleId;
	}

	public void setStyleId(Integer styleId) {
		this.styleId = styleId;
	}

	public String getColumns() {
		return columns;
	}

	public void setColumns(String columns) {
		this.columns = columns;
	}

	public String getEssayId() {
		return essayId;
	}

	public void setEssayId(String essayId) {
		this.essayId = essayId;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Integer getDownTime() {
		return downTime;
	}

	public void setDownTime(Integer downTime) {
		this.downTime = downTime;
	}

	public Integer getReadTime() {
		return readTime;
	}

	public void setReadTime(Integer readTime) {
		this.readTime = readTime;
	}

	public EssayInfo getEssay() {
		return essay;
	}

	public void setEssay(EssayInfo essay) {
		this.essay = essay;
	}

	public EssayStyle getEssayStyle() {
		return essayStyle;
	}

	public void setEssayStyle(EssayStyle essayStyle) {
		this.essayStyle = essayStyle;
	}

	@Override
	public String toString() {
		return "Paper [paperId=" + paperId + ", year=" + year + ", issue=" + issue + ", styleId=" + styleId
				+ ", columns=" + columns + ", essayId=" + essayId + ", date=" + date + ", downTime=" + downTime
				+ ", readTime=" + readTime + ", essay=" + essay + ", essayStyle=" + essayStyle + "]";
	}

}