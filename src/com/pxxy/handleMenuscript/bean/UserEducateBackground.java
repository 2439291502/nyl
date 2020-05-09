package com.pxxy.handleMenuscript.bean;

import java.io.Serializable;

/**
 * 用户学历EducateBackground
 * 
 * @author ASUS
 *
 */
public class UserEducateBackground implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer eBackgroundId;// 用户学历编号

	private String eBackgroundName;// 用户学历名称

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

	public UserEducateBackground() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UserEducateBackground(Integer eBackgroundId, String eBackgroundName) {
		super();
		this.eBackgroundId = eBackgroundId;
		this.eBackgroundName = eBackgroundName;
	}

}
