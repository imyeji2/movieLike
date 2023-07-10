package com.semi.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.semi.board.model.BoardVO;
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
	
	public int duplicatedId(String userId) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = pool.getConnection();
			
			String sql = "select count(*) from userinfo where userid = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, userId);
			
			int result = 0;
			
			rs= ps.executeQuery();
			if(rs.next()) {
				int cnt = rs.getInt(1);
				
				if(cnt>0) {
					result = UserService.UNUSABLE_ID;//이미있음
				}else {
					result = UserService.USABLE_ID;// 없음 사용가능
				}
			}
			System.out.println("중복확인 결과 = " + result + ", 매개변수 id = " + userId);
			
			return result;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int checkLogin(String userId, String pwd) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = pool.getConnection();
			
			String sql = "select pwd from userinfo where userid =? and outdate is null";
			ps = con.prepareStatement(sql);
			ps.setString(1, userId);
			
			int result = 0;
			rs = ps.executeQuery();
			if(rs.next()) {
				String dbPwd = rs.getString(1);
				if(dbPwd.equals(pwd)) {
					result = UserService.LOGIN_OK; //성공
				}else {
					result = UserService.DISAGREE_PWD; //비번달라요
				}
			}else {
				result = UserService.NONE_ID;//아이디 없음
			}
			System.out.println("로그인 결과, result = " + result + ", userid = " + userId + ", pwd = " + pwd);
			return result;
		}finally {
			pool.dbClose(rs, ps, con);
			
		}
	}
	public List<UserVO> selectAll(String keyword, String condition) throws SQLException{
<<<<<<< HEAD
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<UserVO> list = new ArrayList<>();
		
		try {
			//1
			con = pool.getConnection();
			
			String sql = "select * from userinfo";
			
			if(keyword != null && !keyword.isEmpty()) {
				sql += " where " + condition + " like '%' || ? || '%'";
			}
			sql += " order by name";
			ps = con.prepareStatement(sql);
			
			if(keyword != null && !keyword.isEmpty()) {
				ps.setString(1, keyword);
			}
			
			//
			rs=ps.executeQuery();
			
			while(rs.next()) {
				String userId = rs.getString("userId");
				String name = rs.getString("name");
				String pwd = rs.getString("pwd");
				String gender = rs.getString("gender");
				String birth = rs.getString("birth");
				String profileimg = rs.getString("profileimg");
				int point = rs.getInt("point");
				Timestamp outdate = rs.getTimestamp("outdate");
				
				UserVO vo = new UserVO(userId, name, pwd, gender, birth, profileimg, 0, outdate);
				
				list.add(vo);
			}
			System.out.println("글 전체 조회 결과, list.size() = " + list.size() + 
					", 매개변수 keyword = " + keyword + ", condition = " + condition);
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	public UserVO selectUserByUserId(String userid) throws SQLException {
=======
>>>>>>> branch 'master' of https://github.com/JOSiroo/SemiProject
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<UserVO> list = new ArrayList<>();
		
		try {
			//1
			con = pool.getConnection();
			
			String sql = "select * from userinfo";
			
			if(keyword != null && !keyword.isEmpty()) {
				sql += " where " + condition + " like '%' || ? || '%'";
			}
			sql += " order by name";
			ps = con.prepareStatement(sql);
<<<<<<< HEAD
			ps.setString(1, userid);
			rs = ps.executeQuery();

=======
			
			if(keyword != null && !keyword.isEmpty()) {
				ps.setString(1, keyword);
			}
			
			//
			rs=ps.executeQuery();
			
>>>>>>> branch 'master' of https://github.com/JOSiroo/SemiProject
			while(rs.next()) {
				String userId = rs.getString("userId");
				String name = rs.getString("name");
				String pwd = rs.getString("pwd");
				String gender = rs.getString("gender");
				String birth = rs.getString("birth");
				String profileimg = rs.getString("profileimg");
				int point = rs.getInt("point");
				Timestamp outdate = rs.getTimestamp("outdate");
<<<<<<< HEAD

				vo = new UserVO(rsUserid, name, pwd, gender, birth, profileImg, point, outdate);
=======
				
				UserVO vo = new UserVO(userId, name, pwd, gender, birth, profileimg, 0, outdate);
				
				list.add(vo);
>>>>>>> branch 'master' of https://github.com/JOSiroo/SemiProject
			}
			System.out.println("글 전체 조회 결과, list.size() = " + list.size() + 
					", 매개변수 keyword = " + keyword + ", condition = " + condition);
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	
}

