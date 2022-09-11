package com.spring_boot.FinalProject.model;

public class FacilityVO {
	private String facilityId;
	private String facilitySort;
	private String facilityName;
	private String facilityImg;
	
	private String frId;
	private String stayNo;
	
	private int rowCnt;

	public String getFacilityId() {
		return facilityId;
	}
	public void setFacilityId(String facilityId) {
		this.facilityId = facilityId;
	}

	public String getFacilitySort() {
		return facilitySort;
	}
	public void setFacilitySort(String facilitySort) {
		this.facilitySort = facilitySort;
	}

	public String getFacilityName() {
		return facilityName;
	}
	public void setFacilityName(String facilityName) {
		this.facilityName = facilityName;
	}

	public String getFacilityImg() {
		return facilityImg;
	}
	public void setFacilityImg(String facilityImg) {
		this.facilityImg = facilityImg;
	}

	public String getFrId() {
		return frId;
	}
	public void setFrId(String frId) {
		this.frId = frId;
	}

	public String getStayNo() {
		return stayNo;
	}
	public void setStayNo(String stayNo) {
		this.stayNo = stayNo;
	}
	
	public int getRowCnt() {
		return rowCnt;
	}
	public void setRowCnt(int rowCnt) {
		this.rowCnt = rowCnt;
	}
}
