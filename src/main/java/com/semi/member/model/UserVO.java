package com.semi.member.model;

import java.sql.Timestamp;

public class UserVO {
	private String userId;
	private String name;
	private String pwd;
	private String gender;
	private String birth;
	private String profileImg;
	private int point;
	private Timestamp outDate;

	public UserVO() {
		super();
	}

	public UserVO(String userId, String name, String pwd, String gender, String birth, String profileImg, int point,
			Timestamp outDate) {
		super();
		this.userId = userId;
		this.name = name;
		this.pwd = pwd;
		this.gender = gender;
		this.birth = birth;
		this.profileImg = profileImg;
		this.point = point;
		this.outDate = outDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public Timestamp getOutDate() {
		return outDate;
	}

	public void setOutDate(Timestamp outDate) {
		this.outDate = outDate;
	}

	@Override
	public String toString() {
		return "UserVO [userId=" + userId + ", name=" + name + ", pwd=" + pwd + ", gender=" + gender + ", birth="
				+ birth + ", profileImg=" + profileImg + ", point=" + point + ", outDate=" + outDate + "]";
	}
	
}
