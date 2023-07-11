package com.semi.admin.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.semi.db.ConnectionPoolMgr;

public class AdminDAO {
	private ConnectionPoolMgr pool;
	
	public AdminDAO() {
		pool = new ConnectionPoolMgr();
	}
	
	public int checkLogin(String adminId, String adminPwd) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = pool.getConnection();
			
			String sql = "select adminpwd from admin where adminid = ? ";
			ps = con.prepareStatement(sql);
			ps.setString(1, adminId);
			
			int rst = 0;
			rs = ps.executeQuery();
			
			if(rs.next()) {
				String dbAdPwd = rs.getString(1);
				
				if(dbAdPwd.equals(adminPwd)) {
					rst = AdminService.LOGIN_OK; //성공
				}else{
					rst = AdminService.DISAGREE_PWD; //비번불일치
				}
			}else {
				rst = AdminService.NONE_ID; //아이디없음
			}
			System.out.println("로그인 처리 결과 ="+rst+", 매개변수 adminId="+ adminId+", adminPwd="+adminPwd);

			return rst;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
}
