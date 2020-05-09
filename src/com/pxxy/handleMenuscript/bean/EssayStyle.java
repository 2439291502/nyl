package com.pxxy.handleMenuscript.bean;

import java.io.Serializable;

/**
 * 稿件类型
 * @author ASUS
 *
 */
public class EssayStyle implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer styleId;
	private String styleName;
	private EssayInfo essayInfo;
	
	private Paper paper;

	public EssayStyle() {
		
	}

	public EssayStyle(Integer styleId, String styleName, EssayInfo essayInfo, Paper paper) {
		super();
		this.styleId = styleId;
		this.styleName = styleName;
		this.essayInfo = essayInfo;
		this.paper = paper;
	}

	public Integer getStyleId() {
		return styleId;
	}

	public void setStyleId(Integer styleId) {
		this.styleId = styleId;
	}

	public String getStyleName() {
		return styleName;
	}

	public void setStyleName(String styleName) {
		this.styleName = styleName;
	}

	public EssayInfo getEssayInfo() {
		return essayInfo;
	}

	public void setEssayInfo(EssayInfo essayInfo) {
		this.essayInfo = essayInfo;
	}

	public Paper getPaper() {
		return paper;
	}

	public void setPaper(Paper paper) {
		this.paper = paper;
	}

	@Override
	public String toString() {
		return "EssayStyle [styleId=" + styleId + ", styleName=" + styleName + ", essayInfo=" + essayInfo + ", paper="
				+ paper + "]";
	}
	
}