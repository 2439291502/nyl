package com.pxxy.handleMenuscript.bean;

import java.io.Serializable;
/**
 * 教育背景（学历）
 * @author ASUS
 *
 */
public class EBackground implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer eBackgroundId;
	private String eBackgroundName;
	public EBackground() {
		
	}
	public EBackground(Integer eBackgroundId, String eBackgroundName) {
		super();
		this.eBackgroundId = eBackgroundId;
		this.eBackgroundName = eBackgroundName;
	}
	public Integer geteBackgroundId() {
		return eBackgroundId;
	}
	public void seteBackgroundId(Integer eBackgroundId) {
		this.eBackgroundId = eBackgroundId;
	}
	public String geteBackgroundName() {
		return eBackgroundName;
	}
	public void seteBackgroundName(String eBackgroundName) {
		this.eBackgroundName = eBackgroundName;
	}
	@Override
	public String toString() {
		return "EBackground [eBackgroundId=" + eBackgroundId + ", eBackgroundName=" + eBackgroundName + "]";
	}
	
}
