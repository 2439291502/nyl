package com.pxxy.handleMenuscript.bean;

import java.io.Serializable;

public class Fund implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String fundId;
	private String essayId;
	private String fundLevel;
	private String fundCName;
	private String fundEName;
	private String fundNumber;
	private String fundPs;
	
	private EssayInfo essayInfo;
	public String getFundId() {
		return fundId;
	}
	public void setFundId(String fundId) {
		this.fundId = fundId;
	}
	
	public String getEssayId() {
		return essayId;
	}
	public void setEssayId(String essayId) {
		this.essayId = essayId;
	}
	public String getFundLevel() {
		return fundLevel;
	}
	public void setFundLevel(String fundLevel) {
		this.fundLevel = fundLevel;
	}
	public String getFundCName() {
		return fundCName;
	}
	public void setFundCName(String fundCName) {
		this.fundCName = fundCName;
	}
	public String getFundEName() {
		return fundEName;
	}
	public void setFundEName(String fundEName) {
		this.fundEName = fundEName;
	}
	public String getFundNumber() {
		return fundNumber;
	}
	public void setFundNumber(String fundNumber) {
		this.fundNumber = fundNumber;
	}
	public String getFundPs() {
		return fundPs;
	}
	public void setFundPs(String fundPs) {
		this.fundPs = fundPs;
	}
	
	public EssayInfo getEssayInfo() {
		return essayInfo;
	}
	public void setEssayInfo(EssayInfo essayInfo) {
		this.essayInfo = essayInfo;
	}
	public Fund() {
		
	}
	public Fund(String fundId, String fundLevel, String fundCName, String fundEName, String fundNumber, String fundPs) {
		super();
		this.fundId = fundId;
		this.fundLevel = fundLevel;
		this.fundCName = fundCName;
		this.fundEName = fundEName;
		this.fundNumber = fundNumber;
		this.fundPs = fundPs;
	}
	@Override
	public String toString() {
		return "Fund [fundId=" + fundId + ", fundLevel=" + fundLevel + ", fundCName=" + fundCName + ", fundEName="
				+ fundEName + ", fundNumber=" + fundNumber + ", fundPs=" + fundPs + "]";
	}
	
}
