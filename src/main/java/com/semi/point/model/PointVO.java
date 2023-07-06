package com.semi.point.model;

import java.sql.Timestamp;

public class PointVO {
	private int pointno;
	private int paymentTypeNo;
	private String userId;
	private int pointPrice;
	private Timestamp pointRegdate;
	private String pointKind;
	public PointVO() {
		super();
	}
	public PointVO(int pointno, int paymentTypeNo, String userId, int pointPrice, Timestamp pointRegdate,
			String pointKind) {
		super();
		this.pointno = pointno;
		this.paymentTypeNo = paymentTypeNo;
		this.userId = userId;
		this.pointPrice = pointPrice;
		this.pointRegdate = pointRegdate;
		this.pointKind = pointKind;
	}
	public int getPointno() {
		return pointno;
	}
	public void setPointno(int pointno) {
		this.pointno = pointno;
	}
	public int getPaymentTypeNo() {
		return paymentTypeNo;
	}
	public void setPaymentTypeNo(int paymentTypeNo) {
		this.paymentTypeNo = paymentTypeNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getPointPrice() {
		return pointPrice;
	}
	public void setPointPrice(int pointPrice) {
		this.pointPrice = pointPrice;
	}
	public Timestamp getPointRegdate() {
		return pointRegdate;
	}
	public void setPointRegdate(Timestamp pointRegdate) {
		this.pointRegdate = pointRegdate;
	}
	public String getPointKind() {
		return pointKind;
	}
	public void setPointKind(String pointKind) {
		this.pointKind = pointKind;
	}
	@Override
	public String toString() {
		return "PointVO [pointno=" + pointno + ", paymentTypeNo=" + paymentTypeNo + ", userId=" + userId
				+ ", pointPrice=" + pointPrice + ", pointRegdate=" + pointRegdate + ", pointKind=" + pointKind + "]";
	}
	
	
}
