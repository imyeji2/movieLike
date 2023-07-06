package com.semi.pick;

import java.sql.Timestamp;

public class PickVO {
	private int pickNo;
	private int movieNo;
	private String userId;
	private Timestamp pickRegdate;
	
	public PickVO() {
		super();
	}
	public PickVO(int pickNo, int movieNo, String userId, Timestamp pickRegdate) {
		super();
		this.pickNo = pickNo;
		this.movieNo = movieNo;
		this.userId = userId;
		this.pickRegdate = pickRegdate;
	}
	public int getPickNo() {
		return pickNo;
	}
	public void setPickNo(int pickNo) {
		this.pickNo = pickNo;
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
	public Timestamp getPickRegdate() {
		return pickRegdate;
	}
	public void setPickRegdate(Timestamp pickRegdate) {
		this.pickRegdate = pickRegdate;
	}
	@Override
	public String toString() {
		return "PickVO [pickNo=" + pickNo + ", movieNo=" + movieNo + ", userId=" + userId + ", pickRegdate="
				+ pickRegdate + "]";
	}
	
}
