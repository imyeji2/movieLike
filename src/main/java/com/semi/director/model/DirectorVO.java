package com.semi.director.model;

public class DirectorVO {
	private int directorNo;
	private String directorName;
	private String directorImg;
	
	public DirectorVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DirectorVO(int directorNo, String directorName, String directorImg) {
		super();
		this.directorNo = directorNo;
		this.directorName = directorName;
		this.directorImg = directorImg;
	}

	public int getDirectorNo() {
		return directorNo;
	}

	public void setDirectorNo(int directorNo) {
		this.directorNo = directorNo;
	}

	public String getDirectorName() {
		return directorName;
	}

	public void setDirectorName(String directorName) {
		this.directorName = directorName;
	}

	public String getDirectorImg() {
		return directorImg;
	}

	public void setDirectorImg(String directorImg) {
		this.directorImg = directorImg;
	}

	@Override
	public String toString() {
		return "DirectorVO [directorNo=" + directorNo + ", directorName=" + directorName + ", directorImg="
				+ directorImg + "]";
	}


	
	
}
