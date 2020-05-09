package com.pxxy.handleMenuscript.bean;

import java.io.Serializable;

public class Post implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer postId;
	private String postName;
	public Post() {
		
	}
	public Post(Integer postId, String postName) {
		super();
		this.postId = postId;
		this.postName = postName;
	}
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
	@Override
	public String toString() {
		return "Post [postId=" + postId + ", postName=" + postName + "]";
	}
	
}
