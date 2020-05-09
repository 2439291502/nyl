package com.pxxy.handleMenuscript.bean;

import java.io.Serializable;

public class EssayStatus implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer statusId;
	private String statusName;

	private EssayInfo essay;

	public EssayStatus() {
		// TODO Auto-generated constructor stub
	}

	public EssayStatus(Integer statusId, String statusName, EssayInfo essay) {
		super();
		this.statusId = statusId;
		this.statusName = statusName;
		this.essay = essay;
	}

	public Integer getStatusId() {
		return statusId;
	}

	public void setStatusId(Integer statusId) {
		this.statusId = statusId;
	}

	public String getStatusName() {
		return statusName;
	}

	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}

	public EssayInfo getEssay() {
		return essay;
	}

	public void setEssay(EssayInfo essay) {
		this.essay = essay;
	}

	@Override
	public String toString() {
		return "EssayStatus [statusId=" + statusId + ", statusName=" + statusName + ", essay=" + essay + "]";
	}

}
