package com.pxxy.handleMenuscript.bean;

import java.io.Serializable;

/**
 * 权限表
 * 
 * @author ASUS
 *
 */
public class UserType implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer typeId;// 权限编号

	private String typeLevel;// 权限级别

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	public String getTypeLevel() {
		return typeLevel;
	}

	public void setTypeLevel(String typeLevel) {
		this.typeLevel = typeLevel;
	}

	public UserType() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UserType(Integer typeId, String typeLevel) {
		super();
		this.typeId = typeId;
		this.typeLevel = typeLevel;
	}

}
