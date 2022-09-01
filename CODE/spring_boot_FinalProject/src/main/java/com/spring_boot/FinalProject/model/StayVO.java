package com.spring_boot.FinalProject.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class StayVO {
	private String stayNo;
	private String serviceId;
	private String stateId;
	private String facilityId;
	private String stayName;
	private String star;
	
	@DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
	private Date startDate;
	@DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
	private Date endDate;	
	
	private String stayAddress;
	private String serviceImg;
	private String telNumber;
	
	@DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
	private Date checkIn;
	@DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
	private Date checkOut;
	
	private int maxManCnt;
	private int maxPetCnt;
	
	private int rowCnt;
	private int price;

	public String getStayNo() {
		return stayNo;
	}
	public void setStayNo(String stayNo) {
		this.stayNo = stayNo;
	}

	public String getServiceId() {
		return serviceId;
	}
	public void setServiceId(String serviceId) {
		this.serviceId = serviceId;
	}

	public String getStateId() {
		return stateId;
	}
	public void setStateId(String stateId) {
		this.stateId = stateId;
	}

	public String getFacilityId() {
		return facilityId;
	}
	public void setFacilityId(String facilityId) {
		this.facilityId = facilityId;
	}

	public String getStayName() {
		return stayName;
	}
	public void setStayName(String stayName) {
		this.stayName = stayName;
	}

	public String getStar() {
		return star;
	}
	public void setStar(String star) {
		this.star = star;
	}

	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getStayAddress() {
		return stayAddress;
	}
	public void setStayAddress(String stayAddress) {
		this.stayAddress = stayAddress;
	}

	public String getServiceImg() {
		return serviceImg;
	}
	public void setServiceImg(String serviceImg) {
		this.serviceImg = serviceImg;
	}

	public String getTelNumber() {
		return telNumber;
	}
	public void setTelNumber(String telNumber) {
		this.telNumber = telNumber;
	}

	public Date getCheckIn() {
		return checkIn;
	}
	public void setCheckIn(Date checkIn) {
		this.checkIn = checkIn;
	}

	public Date getCheckOut() {
		return checkOut;
	}
	public void setCheckOut(Date checkOut) {
		this.checkOut = checkOut;
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

	public int getRowCnt() {
		return rowCnt;
	}
	public void setRowCnt(int rowCnt) {
		this.rowCnt = rowCnt;
	}

	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
}
