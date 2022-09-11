package com.spring_boot.FinalProject.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class BoardVO {
	private String boardId;
	private String userId;
	private String userName;
	private int category;
	private String title;
	private String contents;

	private String chkEmail;
	private String chkFile;
	private int chkYN;
	
	@DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
	private Date createDate;
	@DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
	private Date modifyDate;
	
	private int rowCnt;
	
	private String prevTitle;
	private String nextTitle;

	public String getBoardId() {
		return boardId;
	}
	public void setBoardId(String boardId) {
		this.boardId = boardId;
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

	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getChkEmail() {
		return chkEmail;
	}
	public void setChkEmail(String chkEmail) {
		this.chkEmail = chkEmail;
	}

	public String getChkFile() {
		return chkFile;
	}
	public void setChkFile(String chkFile) {
		this.chkFile = chkFile;
	}

	public int getChkYN() {
		return chkYN;
	}
	public void setChkYN(int chkYN) {
		this.chkYN = chkYN;
	}

	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public int getRowCnt() {
		return rowCnt;
	}
	public void setRowCnt(int rowCnt) {
		this.rowCnt = rowCnt;
	}
	
	public String getPrevTitle() {
		return prevTitle;
	}
	public void setPrevTitle(String prevTitle) {
		this.prevTitle = prevTitle;
	}

	public String getNextTitle() {
		return nextTitle;
	}
	public void setNextTitle(String nextTitle) {
		this.nextTitle = nextTitle;
	}
}
