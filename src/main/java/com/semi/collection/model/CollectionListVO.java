package com.semi.collection.model;

import java.sql.Timestamp;

public class CollectionListVO {
	private String collectionTitle;
	private String content;
	private Timestamp regdate;
	private String status;
	private int count;
	
	public CollectionListVO() {

	}

	public CollectionListVO(String collectionTitle, String content, Timestamp regdate, String status, int count) {
		super();
		this.collectionTitle = collectionTitle;
		this.content = content;
		this.regdate = regdate;
		this.status = status;
		this.count = count;
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

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "CollectionListVO [collectionTitle=" + collectionTitle + ", content=" + content + ", regdate=" + regdate
				+ ", status=" + status + ", count=" + count + "]";
	}

	
	
	
}
