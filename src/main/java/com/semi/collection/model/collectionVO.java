package com.semi.collection.model;

import java.sql.Timestamp;

public class collectionVO {
	private int collectionNo;
	private int movieNo;
	private String collectionTitle;
	private String content;
	private Timestamp regdate;
	private String status;
	
	public collectionVO() {

	}

	public collectionVO(int collectionNo, int movieNo, String collectionTitle, String content, Timestamp regdate,
			String status) {
		this.collectionNo = collectionNo;
		this.movieNo = movieNo;
		this.collectionTitle = collectionTitle;
		this.content = content;
		this.regdate = regdate;
		this.status = status;
	}

	public int getCollectionNo() {
		return collectionNo;
	}

	public void setCollectionNo(int collectionNo) {
		this.collectionNo = collectionNo;
	}

	public int getMovieNo() {
		return movieNo;
	}

	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}

	public String getCollectionTitle() {
		return collectionTitle;
	}

	public void setCollectionTitle(String collectionTitle) {
		this.collectionTitle = collectionTitle;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "collectionVO [collectionNo=" + collectionNo + ", movieNo=" + movieNo + ", collectionTitle="
				+ collectionTitle + ", content=" + content + ", regdate=" + regdate + ", status=" + status + "]";
	}


	
	
}
