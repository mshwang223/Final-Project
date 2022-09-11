package com.spring_boot.FinalProject.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class UserVO {
	
	private String userId;
	private String userPw;
	private String userEmail;
	private String userImg;
	
	@DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
	private Date createDate;
	@DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
	private Date activeDate;
	
	private String userName;
	private int userAuthor;	// 0:일반유저, 1:관리자
	
	private String petCode;
	private int points;
	
	private int rowCnt;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	
	public String getUserImg() {
		return userImg;
	}
	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}
	
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	public Date getActiveDate() {
		return activeDate;
	}
	public void setActiveDate(Date activeDate) {
		this.activeDate = activeDate;
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
	
	public String getPetCode() {
		return petCode;
	}
	public void setPetCode(String petCode) {
		this.petCode = petCode;
	}
	
	public int getPoints() {
		return points;
	}
	public void setPoints(int points) {
		this.points = points;
	}
	
	public int getRowCnt() {
		return rowCnt;
	}
	public void setRowCnt(int rowCnt) {
		this.rowCnt = rowCnt;
	}
}
