package com.spring_boot.FinalProject.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class OutuserVO {
	private String levId;
	private String userId;
	private String userName;
	private int userAuthor;	// 0:일반유저, 1:관리자
	
	@DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
	private Date levDate;
	
	private int rowCnt;
	
	public String getLevId() {
		return levId;
	}
	public void setLevId(String levId) {
		this.levId = levId;
	}

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getUserAuthor() {
		return userAuthor;
	}
	public void setUserAuthor(int userAuthor) {
		this.userAuthor = userAuthor;
	}

	public Date getLevDate() {
		return levDate;
	}
	public void setLevDate(Date levDate) {
		this.levDate = levDate;
	}
	
	public int getRowCnt() {
		return rowCnt;
	}
	public void setRowCnt(int rowCnt) {
		this.rowCnt = rowCnt;
	}
}
