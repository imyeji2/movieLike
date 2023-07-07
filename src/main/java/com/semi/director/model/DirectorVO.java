package com.semi.director.model;

public class DirectorVO {
	private int directorNo;
	private String driectorName;
	private String directorImg;
	
	public DirectorVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DirectorVO(int directorNo, String driectorName, String directorImg) {
		super();
		this.directorNo = directorNo;
		this.driectorName = driectorName;
		this.directorImg = directorImg;
	}

	public int getDirectorNo() {
		return directorNo;
	}

	public void setDirectorNo(int directorNo) {
		this.directorNo = directorNo;
	}

	public String getDriectorName() {
		return driectorName;
	}

	public void setDriectorName(String driectorName) {
		this.driectorName = driectorName;
	}

	public String getDirectorImg() {
		return directorImg;
	}

	public void setDirectorImg(String directorImg) {
		this.directorImg = directorImg;
	}

	@Override
	public String toString() {
		return "DirectorVO [directorNo=" + directorNo + ", driectorName=" + driectorName + ", directorImg="
				+ directorImg + "]";
	}
	
	
	
	
}
