package com.pxxy.handleMenuscript.bean;

import java.io.Serializable;
import java.util.Date;

public class AddressList implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String aListId;
	private String  userId;
	private String  tureName;
	private String  email;
	private String  phone;
	private String  profession;
	private String  research;
	private Integer  postId;
	private String  workUnit;
	private String  address;
	private String  postcode;
	private Date createData;
	
	private UserInfo userInfo;  //user多 n----1 一addressList

	public AddressList() {
	}
	public AddressList(String aListId, String userId, String tureName, String email, String phone, String profession,
			String research, Integer postId, String workUnit, String address, String postcode, Date createData,
			UserInfo userInfo) {
		super();
		this.aListId = aListId;
		this.userId = userId;
		this.tureName = tureName;
		this.email = email;
		this.phone = phone;
		this.profession = profession;
		this.research = research;
		this.postId = postId;
		this.workUnit = workUnit;
		this.address = address;
		this.postcode = postcode;
		this.createData = createData;
		this.userInfo = userInfo;
	}

	public String getaListId() {
		return aListId;
	}

	public void setaListId(String aListId) {
		this.aListId = aListId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getTureName() {
		return tureName;
	}

	public void setTureName(String tureName) {
		this.tureName = tureName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getProfession() {
		return profession;
	}

	public void setProfession(String profession) {
		this.profession = profession;
	}

	public String getResearch() {
		return research;
	}

	public void setResearch(String research) {
		this.research = research;
	}

	public Integer getPostId() {
		return postId;
	}

	public void setPostId(Integer postId) {
		this.postId = postId;
	}

	public String getWorkUnit() {
		return workUnit;
	}

	public void setWorkUnit(String workUnit) {
		this.workUnit = workUnit;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public Date getCreateData() {
		return createData;
	}

	public void setCreateData(Date createData) {
		this.createData = createData;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	@Override
	public String toString() {
		return "AddressList [aListId=" + aListId + ", userId=" + userId + ", tureName=" + tureName + ", email=" + email
				+ ", phone=" + phone + ", profession=" + profession + ", research=" + research + ", postId=" + postId
				+ ", workUnit=" + workUnit + ", address=" + address + ", postcode=" + postcode + ", createData="
				+ createData + ", userInfo=" + userInfo + "]";
	}
	
}
