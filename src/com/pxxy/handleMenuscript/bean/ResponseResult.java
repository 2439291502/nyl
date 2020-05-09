package com.pxxy.handleMenuscript.bean;

public class ResponseResult<T> {
	private Integer state;
	private String message;
	private T data;
	/**
	 * @param state
	 * @param message
	 * @param data
	 */
	public ResponseResult(Integer state, String message, T data) {
		super();
		this.state = state;
		this.message = message;
		this.data = data;
	}
	
	
	/**
	 * @param state
	 * @param message
	 */
	public ResponseResult(Integer state, String message) {
		super();
		this.state = state;
		this.message = message;
	}


	/**
	 * 
	 */
	public ResponseResult() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public T getData() {
		return data;
	}
	public void setData(T data) {
		this.data = data;
	}
	
}

