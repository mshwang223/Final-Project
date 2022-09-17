package com.spring_boot.FinalProject.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
import java.util.Date;

public class ReviewVO {
	private String userId;

	private int ordNo;
	private int reviewId;
	private String contents;
	private int point;
	private int stayNo;
	private String stayName;

	private LocalDate createDate;




	public LocalDate getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDate createDate) {
		this.createDate = createDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getStayNo() {
		return stayNo;
	}

	public void setStayNo(int stayNo) {
		this.stayNo = stayNo;
	}

	public String getStayName() {
		return stayName;
	}

	public void setStayName(String stayName) {
		this.stayName = stayName;
	}

	public int getOrdNo() {
		return ordNo;
	}

	public void setOrdNo(int ordNo) {
		this.ordNo = ordNo;
	}

	public int getReviewId() {
		return reviewId;
	}

	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}


	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}


	@Override
	public String toString() {
		return "ReviewVO{" +
				"userId='" + userId + '\'' +
				", ordNo=" + ordNo +
				", reviewId=" + reviewId +
				", contents='" + contents + '\'' +
				", point=" + point +
				", stayNo=" + stayNo +
				", stayName='" + stayName + '\'' +
				", createDate=" + createDate +
				'}';
	}
}
