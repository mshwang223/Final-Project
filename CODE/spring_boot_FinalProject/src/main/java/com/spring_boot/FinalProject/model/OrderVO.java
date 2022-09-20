package com.spring_boot.FinalProject.model;

import java.time.LocalDate;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class OrderVO {
	private String ordNo;
	private int ordQty;
	private int payment;
	private int price;
	private int roomPrice;
	private int discount;
	
	private String address;

	@DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
	private Date payDate;
	
	private String ordPrdId;
	private String userId;
	private String userName;
	private String stayNo;

	private String regId;
	private String stayName;
	private int manCnt;
	private int petCnt;
	private String rcvPhone;
	private String rcvName;
	private String rcvEmail;
	
	private String userImg;
	
	private String period;
	private int periodDay;
	private String roomType;
	private LocalDate startDate;
	private LocalDate endDate;
	
	private int rowCnt;

	public void setDate() {
		int first = period.indexOf("(");
		int second = period.lastIndexOf("(");
		int tilt = period.lastIndexOf("~")+1;
		String start = period.substring(0, first).trim().replace(".","-");
		String end = period.substring(tilt, second).trim().replace(".","-");
		startDate= LocalDate.parse(start);
		endDate =LocalDate.parse(end);
	}

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

	public int getRoomPrice() {
		return roomPrice;
	}
	public void setRoomPrice(int roomPrice) {
		this.roomPrice = roomPrice;
	}

	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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

	public String getRegId() {
		return regId;
	}
	public void setRegId(String regId) {
		this.regId = regId;
	}

	public String getStayName() {
		return stayName;
	}
	public void setStayName(String stayName) {
		this.stayName = stayName;
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

	public String getRcvName() {
		return rcvName;
	}
	public void setRcvName(String rcvName) {
		this.rcvName = rcvName;
	}

	public String getRcvEmail() {
		return rcvEmail;
	}
	public void setRcvEmail(String rcvEmail) {
		this.rcvEmail = rcvEmail;
	}
	
	public String getUserImg() {
		return userImg;
	}
	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}
	
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	
	public int getPeriodDay() {
		return periodDay;
	}
	public void setPeriodDay(int periodDay) {
		this.periodDay = periodDay;
	}
	
	public String getRoomType() {
		return roomType;
	}
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}

	public int getRowCnt() {
		return rowCnt;
	}
	public void setRowCnt(int rowCnt) {
		this.rowCnt = rowCnt;
	}

	@Override
	public String toString() {
		return "OrderVO{" +
				"ordNo='" + ordNo + '\'' +
				", ordQty=" + ordQty +
				", payment=" + payment +
				", price=" + price +
				", roomPrice=" + roomPrice +
				", discount=" + discount +
				", payDate=" + payDate +
				", ordPrdId='" + ordPrdId + '\'' +
				", userId='" + userId + '\'' +
				", stayNo='" + stayNo + '\'' +
				", manCnt=" + manCnt +
				", petCnt=" + petCnt +
				", rcvPhone='" + rcvPhone + '\'' +
				", rcvName='" + rcvName + '\'' +
				", rcvEmail='" + rcvEmail + '\'' +
				", period='" + period + '\'' +
				", periodDay='" + periodDay + '\'' +
				", roomType='" + roomType + '\'' +
				'}';
	}
}
