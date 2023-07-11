package com.semi.admin.model;

import java.sql.SQLException;

public class AdminService {
	//로그인
	public static final int LOGIN_OK = 1;
	public static final int DISAGREE_PWD = 2;
	public static final int NONE_ID = 3;
	
	private AdminDAO adDao;
	
	public AdminService() {
		adDao = new AdminDAO();
	}
	public int checkLogin(String adminId, String adminPwd) throws SQLException {
		return adDao.checkLogin(adminId, adminPwd);
	}
}
