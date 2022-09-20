package com.spring_boot.FinalProject.model;


import java.time.LocalDate;

public class OrderInfoVO {

    private Integer stayNo;
    private Integer regId;
    private String name;
    private String userId;
    private String period;


    public Integer getStayNo() {
        return stayNo;
    }

    public void setStayNo(Integer stayNo) {
        this.stayNo = stayNo;
    }

    public Integer getRegId() {
        return regId;
    }

    public void setRegId(Integer regId) {
        this.regId = regId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPeriod() {
        return period;
    }

    public void setPeriod(String period) {
        this.period = period;
    }
}
