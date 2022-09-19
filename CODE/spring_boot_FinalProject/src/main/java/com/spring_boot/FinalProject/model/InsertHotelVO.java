package com.spring_boot.FinalProject.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class InsertHotelVO {
	private int regId;
	private int prdId;
	private int facilityId;
	private String userId;
	private String name;
	private String zipcode;
	private String address1;
	private String address2;
	private String telNumber;
	private int maxManCnt;
	private int maxPetCnt;
	private String facility1;
	private String facility2;
	private String facility3;
	private int price;
	private String period;
	private String serviceImg;
	@DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
	private Date createDate;
	private String comment;
	private String approve;
	private String roomType;
	
	private int rowCnt;
	
	public String getRoomType() {
		return roomType;
	}
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}
	public String getApprove() {
		return approve;
	}
	public void setApprove(String approve) {
		this.approve = approve;
	}
	public int getRegId() {
		return regId;
	}
	public int getPrdId() {
		return prdId;
	}
	public int getFacilityId() {
		return facilityId;
	}
	public String getUserId() {
		return userId;
	}
	public String getName() {
		return name;
	}
	public String getZipcode() {
		return zipcode;
	}
	public String getAddress1() {
		return address1;
	}
	public String getAddress2() {
		return address2;
	}
	public String getTelNumber() {
		return telNumber;
	}
	public int getMaxManCnt() {
		return maxManCnt;
	}
	public int getMaxPetCnt() {
		return maxPetCnt;
	}
	public String getFacility1() {
		return facility1;
	}
	public String getFacility2() {
		return facility2;
	}
	public String getFacility3() {
		return facility3;
	}
	public int getPrice() {
		return price;
	}
	public String getPeriod() {
		return period;
	}
	public String getServiceImg() {
		return serviceImg;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public String getComment() {
		return comment;
	}
	public void setRegId(int regId) {
		this.regId = regId;
	}
	public void setPrdId(int prdId) {
		this.prdId = prdId;
	}
	public void setFacilityId(int facilityId) {
		this.facilityId = facilityId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public void setTelNumber(String telNumber) {
		this.telNumber = telNumber;
	}
	public void setMaxManCnt(int maxManCnt) {
		this.maxManCnt = maxManCnt;
	}
	public void setMaxPetCnt(int maxPetCnt) {
		this.maxPetCnt = maxPetCnt;
	}
	public void setFacility1(String facility1) {
		this.facility1 = facility1;
	}
	public void setFacility2(String facility2) {
		this.facility2 = facility2;
	}
	public void setFacility3(String facility3) {
		this.facility3 = facility3;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public void setServiceImg(String serviceImg) {
		this.serviceImg = serviceImg;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getRowCnt() {
		return rowCnt;
	}
	public void setRowCnt(int rowCnt) {
		this.rowCnt = rowCnt;
	}
	
	


}
