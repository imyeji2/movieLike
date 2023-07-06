package com.semi.payHistory.model;

import java.sql.Timestamp;

public class PayHistoryVO {
	private int hisNo;
	private int movieNo;
	private String userId;
	private Timestamp hisRegdate;
	
	public PayHistoryVO() {
		super();
	}
	public PayHistoryVO(int hisNo, int movieNo, String userId, Timestamp hisRegdate) {
		super();
		this.hisNo = hisNo;
		this.movieNo = movieNo;
		this.userId = userId;
		this.hisRegdate = hisRegdate;
	}
	public int getHisNo() {
		return hisNo;
	}
	public void setHisNo(int hisNo) {
		this.hisNo = hisNo;
	}
	public int getMovieNo() {
		return movieNo;
	}
	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Timestamp getHisRegdate() {
		return hisRegdate;
	}
	public void setHisRegdate(Timestamp hisRegdate) {
		this.hisRegdate = hisRegdate;
	}
	@Override
	public String toString() {
		return "PointHistoryVO [hisNo=" + hisNo + ", movieNo=" + movieNo + ", userId=" + userId + ", hisRegdate="
				+ hisRegdate + "]";
	}
	
	
}
