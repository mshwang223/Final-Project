package com.spring_boot.FinalProject.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class PetVO {
	
	private String petId;
	private String userId;
	private String petImg;
	private String petName;
	private String petRace;
	private String petKind;
	private int petSize;
	private String comment;
	private String petCode;

	@DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
	private Date createdDate;

	public String getPetId() {
		return petId;
	}
	public void setPetId(String petId) {
		this.petId = petId;
	}

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPetImg() {
		return petImg;
	}
	public void setPetImg(String petImg) {
		this.petImg = petImg;
	}

	public String getPetName() {
		return petName;
	}
	public void setPetName(String petName) {
		this.petName = petName;
	}

	public String getPetRace() {
		return petRace;
	}
	public void setPetRace(String petRace) {
		this.petRace = petRace;
	}

	public String getPetKind() {
		return petKind;
	}
	public void setPetKind(String petKind) {
		this.petKind = petKind;
	}

	public int getPetSize() {
		return petSize;
	}
	public void setPetSize(int petSize) {
		this.petSize = petSize;
	}

	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getPetCode() {
		return petCode;
	}
	public void setPetCode(String petCode) {
		this.petCode = petCode;
	}

	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
}
