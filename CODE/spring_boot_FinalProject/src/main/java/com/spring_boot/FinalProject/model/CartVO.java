package com.spring_boot.FinalProject.model;

import java.time.LocalDate;

public class CartVO {

    private String userId;
    private int cartId;
    private String stayName;
    private String period;
    private int price;
    private int stayNo;

    public CartVO(String period, int price, int stayNo,String userId) {
        this.period = period;
        this.price = price;
        this.stayNo = stayNo;
        this.userId = userId;
    }

    
    public CartVO() {
    }

    public int getCartId() {
        return cartId;
    }


    public int getStayNo() {
        return stayNo;
    }



    public void setStayNo(int stayNo) {
        this.stayNo = stayNo;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public String getStayName() {
        return stayName;
    }

    public void setStayName(String stayName) {
        this.stayName = stayName;
    }

    public String getPeriod() {
        return period;
    }

    public void setPeriod(String period) {
        this.period = period;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "CartVO{" +
                "cartId=" + cartId +
                ", stayName='" + stayName + '\'' +
                ", period='" + period + '\'' +
                ", price=" + price +
                '}';
    }
}
