package com.spring_boot.FinalProject.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class OrderVO {
	private String ordNo;
	private int ordQty;
	private int payment;
	private int price;

	@DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
	private Date payDate;
	
	private String ordPrdId;
	private String userId;
	private String userName;
	private String stayNo;
	private int manCnt;
	private int petCnt;
	private String rcvPhone;
	
	private int rowCnt;

	public String getOrdNo() {
		return ordNo;
	}
	public void setOrdNo(String ordNo) {
		this.ordNo = ordNo;
	}

	public int getOrdQty() {
		return ordQty;
	}
	public void setOrdQty(int ordQty) {
		this.ordQty = ordQty;
	}

	public int getPayment() {
		return payment;
	}
	public void setPayment(int payment) {
		this.payment = payment;
	}

	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}

	public Date getPayDate() {
		return payDate;
	}
	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	public String getOrdPrdId() {
		return ordPrdId;
	}
	public void setOrdPrdId(String ordPrdId) {
		this.ordPrdId = ordPrdId;
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

	public String getStayNo() {
		return stayNo;
	}
	public void setStayNo(String stayNo) {
		this.stayNo = stayNo;
	}

	public int getManCnt() {
		return manCnt;
	}
	public void setManCnt(int manCnt) {
		this.manCnt = manCnt;
	}

	public int getPetCnt() {
		return petCnt;
	}
	public void setPetCnt(int petCnt) {
		this.petCnt = petCnt;
	}

	public String getRcvPhone() {
		return rcvPhone;
	}
	public void setRcvPhone(String rcvPhone) {
		this.rcvPhone = rcvPhone;
	}
	
	public int getRowCnt() {
		return rowCnt;
	}
	public void setRowCnt(int rowCnt) {
		this.rowCnt = rowCnt;
	}
}
