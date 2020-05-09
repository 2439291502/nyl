package com.pxxy.handleMenuscript.bean;

import java.io.Serializable;
/**
 * 用户类型
 * @author ASUS
 *
 */
public class Type implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer typeId;
	private String typeLevel;
	public Type() {
		
	}
	public Type(Integer typeId, String typeLevel) {
		super();
		this.typeId = typeId;
		this.typeLevel = typeLevel;
	}
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
	@Override
	public String toString() {
		return "Type [typeId=" + typeId + ", typeLevel=" + typeLevel + "]";
	}
	
}
