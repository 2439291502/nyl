package com.pxxy.handleMenuscript.bean;

import java.io.Serializable;

/**
 * 职称Post
 * @author ASUS
 *
 */
public class UserPost implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer postId;// 职称编号
	private String postName;// 职称名称
	public Integer getPostId() {
		return postId;
	}
	public void setPostId(Integer postId) {
		this.postId = postId;
	}
	public String getPostName() {
		return postName;
	}
	public void setPostName(String postName) {
		this.postName = postName;
	}
	public UserPost() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UserPost(Integer postId, String postName) {
		super();
		this.postId = postId;
		this.postName = postName;
	}
	
}
