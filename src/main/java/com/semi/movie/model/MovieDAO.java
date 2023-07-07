package com.semi.movie.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.semi.db.ConnectionPoolMgr;

public class MovieDAO {
	private ConnectionPoolMgr pool;

	public MovieDAO() {
		pool = new ConnectionPoolMgr();
	}
	
	/**
	 * 영화 전체 검색 메서드
	 * @param movieNo
	 * @return
	 * @throws SQLException
	 */
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
			MovieVO vo = null;
			while(rs.next()) {
				int genreNo = rs.getInt("genreNo");
				String title = rs.getString("title");
				String runningTime = rs.getString("runningTime");
				String synop = rs.getString("synop");
				String poster = rs.getString("poster");
				String stilcut = rs.getString("stilcut");
				String url = rs.getString("url");
				int price = rs.getInt("price");
				Timestamp opendate = rs.getTimestamp("opendate");
				int ageRate = rs.getInt("ageRate");
				Timestamp regdate  = rs.getTimestamp("regdate");
				int directorNo1 = rs.getInt("directorNo1");
				int directorNo2 = rs.getInt("directorNo2");
				String movieStatus = rs.getString("movieStatus");
				
				vo = new MovieVO(movieNo, genreNo, title, runningTime, synop, poster, url, 
						price, opendate, ageRate, regdate, directorNo1, directorNo2, movieStatus, stilcut);
			
			}
			System.out.println("영화 조회 결과 vo = " + vo + "매개변수 movieNo = " + movieNo);
			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}//selectByMovieNo
	}
	
	
	
	
	
	/**
	 * 영화 전체 조회 메서드
	 * @return
	 * @throws SQLException
	 */
	public List<MovieVO> selectMovieAll() throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<MovieVO> list = new ArrayList<MovieVO>();
		MovieVO vo = null;
		
		try {
			//1.2
			con = pool.getConnection();
			//3
			String sql="select * from movie order by regdate desc";
			ps=con.prepareStatement(sql);
		
			//4
			rs = ps.executeQuery();
			while(rs.next()) {
				int movieNo = rs.getInt("movieNo");
				int genreNo = rs.getInt("genreNo");
				String title = rs.getString("title");
				String runningTime = rs.getString("runningTime");
				String synop = rs.getString("synop");
				String poster = rs.getString("poster");
				String stilcut = rs.getString("stilcut");
				String url = rs.getString("url");
				int price = rs.getInt("price");
				Timestamp opendate = rs.getTimestamp("opendate");
				int ageRate = rs.getInt("ageRate");
				Timestamp regdate  = rs.getTimestamp("regdate");
				int directorNo1 = rs.getInt("directorNo1");
				int directorNo2 = rs.getInt("directorNo2");
				String movieStatus = rs.getString("movieStatus");				
				
				vo = new MovieVO(movieNo, genreNo, title, runningTime, synop, poster, url, 
						price, opendate, ageRate, regdate, directorNo1, directorNo2, movieStatus, stilcut);
				list.add(vo);
			}
			
			System.out.println("영화 전체 조회 결과 list="+list.size());
			return list;
			
		}finally {
			//5
			pool.dbClose(rs, ps, con);
		}
	}//selectDirector
	
	
	
}
