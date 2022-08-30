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
	private Date createdDate;
	private String comment;
	
	
	public int getRegId() {
		return regId;
	}
	public void setRegId(int regId) {
		this.regId = regId;
	}
	public int getPrdId() {
		return prdId;
	}
	public void setPrdId(int prdId) {
		this.prdId = prdId;
	}
	public int getFacilityId() {
		return facilityId;
	}
	public void setFacilityId(int facilityId) {
		this.facilityId = facilityId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getTelNumber() {
		return telNumber;
	}
	public void setTelNumber(String telNumber) {
		this.telNumber = telNumber;
	}
	public int getMaxManCnt() {
		return maxManCnt;
	}
	public void setMaxManCnt(int maxManCnt) {
		this.maxManCnt = maxManCnt;
	}
	public int getMaxPetCnt() {
		return maxPetCnt;
	}
	public void setMaxPetCnt(int maxPetCnt) {
		this.maxPetCnt = maxPetCnt;
	}
	public String getFacility1() {
		return facility1;
	}
	public void setFacility1(String facility1) {
		this.facility1 = facility1;
	}
	public String getFacility2() {
		return facility2;
	}
	public void setFacility2(String facility2) {
		this.facility2 = facility2;
	}
	public String getFacility3() {
		return facility3;
	}
	public void setFacility3(String facility3) {
		this.facility3 = facility3;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getServiceImg() {
		return serviceImg;
	}
	public void setServiceImg(String serviceImg) {
		this.serviceImg = serviceImg;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}

}
