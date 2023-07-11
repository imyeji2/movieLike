package com.semi.admin.model;

public class AdminVO {
	private String adminId;
	private String adminName;
	private String adminPwd;
	
	public AdminVO() {
		super();
	}
	
	public AdminVO(String adminId, String adminName, String adminPwd) {
		super();
		this.adminId = adminId;
		this.adminName = adminName;
		this.adminPwd = adminPwd;
	}
	
	public String getAdminId() {
		return adminId;
	}
	
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	
	public String getAdminName() {
		return adminName;
	}
	
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	
	public String getAdminPwd() {
		return adminPwd;
	}
	
	public void setAdminPwd(String adminPwd) {
		this.adminPwd = adminPwd;
	}
	
	@Override
	public String toString() {
		return "AdminVO [adminId=" + adminId + ", adminName=" + adminName + ", adminPwd=" + adminPwd + "]";
	}

	
}
