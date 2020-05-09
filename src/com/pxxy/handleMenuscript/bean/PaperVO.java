package com.pxxy.handleMenuscript.bean;

import java.io.Serializable;

public class PaperVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String year;
	private String issue;
	private String columns;
	private String essayId;
	private Integer styleId;
	private String author;
	private String workUnit;
	private String title;
	private String abstracts;
	private String keywords;
	private Paper paper;
	public PaperVO() {
	}
	public PaperVO(String year, String issue, String columns, String essayId, Integer styleId, String author,
			String workUnit, String title, String abstracts, String keywords, Paper paper) {
		super();
		this.year = year;
		this.issue = issue;
		this.columns = columns;
		this.essayId = essayId;
		this.styleId = styleId;
		this.author = author;
		this.workUnit = workUnit;
		this.title = title;
		this.abstracts = abstracts;
		this.keywords = keywords;
		this.paper = paper;
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
	public Integer getStyleId() {
		return styleId;
	}
	public void setStyleId(Integer styleId) {
		this.styleId = styleId;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getWorkUnit() {
		return workUnit;
	}
	public void setWorkUnit(String workUnit) {
		this.workUnit = workUnit;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAbstracts() {
		return abstracts;
	}
	public void setAbstracts(String abstracts) {
		this.abstracts = abstracts;
	}
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public Paper getPaper() {
		return paper;
	}
	public void setPaper(Paper paper) {
		this.paper = paper;
	}
	@Override
	public String toString() {
		return "PaperVO [year=" + year + ", issue=" + issue + ", columns=" + columns + ", essayId=" + essayId
				+ ", styleId=" + styleId + ", author=" + author + ", workUnit=" + workUnit + ", title=" + title
				+ ", abstracts=" + abstracts + ", keywords=" + keywords + ", paper=" + paper + "]";
	}
	
	
}