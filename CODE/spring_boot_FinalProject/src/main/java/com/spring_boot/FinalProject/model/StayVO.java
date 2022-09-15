package com.spring_boot.FinalProject.model;

public class StayVO {
	private String stayNo;
	private String serviceId;
	private String stateId;
	private String facilityId;
	private String stayName;
	private String star;
	
	private String stayAddress;
	private String serviceImg;
	private String telNumber;
	
	private String checkIn;
	private String checkOut;
	
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

	public String getCheckIn() {
		return checkIn;
	}
	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}

	public String getCheckOut() {
		return checkOut;
	}
	public void setCheckOut(String checkOut) {
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
