package com.pxxy.handleMenuscript.bean;

import java.io.Serializable;
import java.util.Date;

public class LeaveMessage implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String leaveMessageId;
	private String essayId;
	private String username;
	private String toUsername;
	private String lMessageContent;
	private Date lMessageTime;
	private Integer lMessageState;
	
	
	private EssayInfo essayInfo;

	public LeaveMessage() {

	}

	public LeaveMessage(String leaveMessageId, String essayId, String username, String toUsername,
			String lMessageContent, Date lMessageTime, Integer lMessageState, EssayInfo essayInfo) {
		super();
		this.leaveMessageId = leaveMessageId;
		this.essayId = essayId;
		this.username = username;
		this.toUsername = toUsername;
		this.lMessageContent = lMessageContent;
		this.lMessageTime = lMessageTime;
		this.lMessageState = lMessageState;
		this.essayInfo = essayInfo;
	}

	public String getLeaveMessageId() {
		return leaveMessageId;
	}

	public void setLeaveMessageId(String leaveMessageId) {
		this.leaveMessageId = leaveMessageId;
	}

	public String getEssayId() {
		return essayId;
	}

	public void setEssayId(String essayId) {
		this.essayId = essayId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getToUsername() {
		return toUsername;
	}

	public void setToUsername(String toUsername) {
		this.toUsername = toUsername;
	}

	public String getlMessageContent() {
		return lMessageContent;
	}

	public void setlMessageContent(String lMessageContent) {
		this.lMessageContent = lMessageContent;
	}

	public Date getlMessageTime() {
		return lMessageTime;
	}

	public void setlMessageTime(Date lMessageTime) {
		this.lMessageTime = lMessageTime;
	}

	public Integer getlMessageState() {
		return lMessageState;
	}

	public void setlMessageState(Integer lMessageState) {
		this.lMessageState = lMessageState;
	}

	public EssayInfo getEssayInfo() {
		return essayInfo;
	}

	public void setEssayInfo(EssayInfo essayInfo) {
		this.essayInfo = essayInfo;
	}

	@Override
	public String toString() {
		return "LeaveMessage [leaveMessageId=" + leaveMessageId + ", essayId=" + essayId + ", username=" + username
				+ ", toUsername=" + toUsername + ", lMessageContent=" + lMessageContent + ", lMessageTime="
				+ lMessageTime + ", lMessageState=" + lMessageState + ", essayInfo=" + essayInfo + "]";
	}

}