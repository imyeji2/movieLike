package com.semi.movie.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.semi.db.ConnectionPoolMgr;

public class MovieDAO {
	private ConnectionPoolMgr pool;

	public MovieDAO() {
		pool = new ConnectionPoolMgr();
	}
	
	public MovieVO selectByMovieNo(int movieNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = pool.getConnection();
			String sql = "select * from movie where movieno = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, movieNo);
			
			rs= ps.executeQuery();
			MovieVO vo = new MovieVO(); 
			while(rs.next()) {
				vo.setMovieNo(rs.getInt("movieno"));
				vo.setGenreNo(rs.getInt("genreno"));
				vo.setTitle(rs.getString("title"));
				vo.setRunningTime(rs.getString("runningtime"));
				vo.setSynop(rs.getString("synop"));
				vo.setPoster(rs.getString("poster"));
				vo.setUrl(rs.getString("url"));
				vo.setPrice(rs.getInt("price"));
				vo.setOpendate(rs.getTimestamp("opendate"));
				vo.setAgeRate(rs.getInt("agerate"));
				vo.setRegdate(rs.getTimestamp("regdate"));
				vo.setDirectorNo1(rs.getInt("directorno1"));
				vo.setDirectorNo2(rs.getInt("directorno2"));
				vo.setMovieStatus(rs.getString("moviestatus"));

			}
			System.out.println("영화 조회 결과 vo = " + vo + "매개변수 movieNo = " + movieNo);
			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	
}
