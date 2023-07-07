package com.semi.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.semi.db.ConnectionPoolMgr;

public class UserDAO {
	ConnectionPoolMgr pool;
	
	public UserDAO() {
		pool = new ConnectionPoolMgr();
	}

	/**
	 * 회원 가입 메서드
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int insertUser(UserVO vo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			
			con = pool.getConnection();
			
			String sql = "insert into userinfo (userid, name, pwd, gender, birth) values(?,?,?,?,?)";
			
			ps = con.prepareStatement(sql);
			
			ps.setString(1, vo.getUserId());
			ps.setString(2, vo.getName());
			ps.setString(3, vo.getPwd());
			ps.setString(4, vo.getGender());
			ps.setString(5, vo.getBirth());
			
			int cnt = ps.executeUpdate();
			
			System.out.println("User 등록 결과 cnt = " + cnt + " , 매개변수 vo = " + vo );
			
			return cnt;
		} finally {
			pool.dbClose(ps, con);
			
		} 
		
	}
}
