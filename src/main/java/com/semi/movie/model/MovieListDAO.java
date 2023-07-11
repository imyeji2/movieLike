package com.semi.movie.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.semi.db.ConnectionPoolMgr;

public class MovieListDAO {
	private ConnectionPoolMgr pool;

	public MovieListDAO() {
		pool = new ConnectionPoolMgr();
	}
	
	/**
	 *  
	 * @return
	 * @throws SQLException
	 */
	public List<MovieListVO> selectMovieAll() throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = pool.getConnection();
			String sql = "select * "
					+ " from movie m "
					+ " left join genre g"
					+ " on m.genreNo = g.genreNo"
					+ " order by m.regdate desc";
			
			ps=con.prepareStatement(sql);
			
			List<MovieListVO> list = new ArrayList<MovieListVO>();
			MovieListVO vo = null;
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				int movieNo = rs.getInt("movieNo");
				int genreNo = rs.getInt("genreNo");
				String title = rs.getString("title");
				String runningTime = rs.getString("runningTime");
				String synop = rs.getString("synop");
				String poster = rs.getString("poster");
				String url = rs.getString("url");
				int price = rs.getInt("price");
				Timestamp opendate = rs.getTimestamp("opendate");
				int ageRate = rs.getInt("ageRate");
				Timestamp regdate = rs.getTimestamp("regdate");
				int directorNo1 = rs.getInt("directorNo1");
				int directorNo2 = rs.getInt("directorNo2");
				String movieStatus = rs.getString("movieStatus");
				String stilcut = rs.getString("stilcut");
				String genreName =rs.getString("genreName");
				
				vo = new MovieListVO(movieNo, genreNo, title, runningTime, synop, poster, url, price, opendate, ageRate, regdate, directorNo1, directorNo2, movieStatus, stilcut, genreName);
				list.add(vo);
			}
			
			System.out.println("검색 결과 list.size()"+list.size());
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	
	
	/*
	 * 사용자 영화 디테일 페이지 영화 정보
	 * @param genreNo
	 * @return
	 * @throws SQLException
	 */
	public List<MovieListVO> selectMovieByGenre(int genreNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = pool.getConnection();
			String sql = "select * from movie m"
					+ " left join genre g"
					+ " on m.genreNo = g.genreNo"
					+ " where m.genreNo=?"
					+ " order by m.regdate desc";
			
			ps=con.prepareStatement(sql);
			ps.setInt(1, genreNo);
			
			List<MovieListVO> list = new ArrayList<MovieListVO>();
			MovieListVO vo = null;
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				int movieNo = rs.getInt("movieNo");
				String title = rs.getString("title");
				String runningTime = rs.getString("runningTime");
				String synop = rs.getString("synop");
				String poster = rs.getString("poster");
				String url = rs.getString("url");
				int price = rs.getInt("price");
				Timestamp opendate = rs.getTimestamp("opendate");
				int ageRate = rs.getInt("ageRate");
				Timestamp regdate = rs.getTimestamp("regdate");
				int directorNo1 = rs.getInt("directorNo1");
				int directorNo2 = rs.getInt("directorNo2");
				String movieStatus = rs.getString("movieStatus");
				String stilcut = rs.getString("stilcut");
				String genreName =rs.getString("genreName");
				vo = new MovieListVO(movieNo, genreNo, title, runningTime, synop, poster, url, price, opendate, ageRate, regdate, directorNo1, directorNo2, movieStatus, stilcut, genreName);
				list.add(vo);
			}
			
			System.out.println("검색 결과 list.size()"+list.size());
			return list;
			
		}finally {
			pool.dbClose(rs, ps, con);
		}		
	}//selectByGenreMovie
	
	
	/*
	 * 영화 이름으로 검색
	 * @param genreNo
	 * @return
	 * @throws SQLException
	 */
	public List<MovieListVO> selectMovieByTitle(String serch) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = pool.getConnection();
			String sql = "select * from movie m"
					+ " left join genre g"
					+ " on m.genreNo = g.genreNo"
					+ " where m.title like '%'||?||'%'"
					+ " order by m.regdate desc";
			
			ps=con.prepareStatement(sql);
			ps.setString(1, serch);
			
			List<MovieListVO> list = new ArrayList<MovieListVO>();
			MovieListVO vo = null;
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				int movieNo = rs.getInt("movieNo");
				int genreNo = rs.getInt("genreNo");
				String title = rs.getString("title");
				String runningTime = rs.getString("runningTime");
				String synop = rs.getString("synop");
				String poster = rs.getString("poster");
				String url = rs.getString("url");
				int price = rs.getInt("price");
				Timestamp opendate = rs.getTimestamp("opendate");
				int ageRate = rs.getInt("ageRate");
				Timestamp regdate = rs.getTimestamp("regdate");
				int directorNo1 = rs.getInt("directorNo1");
				int directorNo2 = rs.getInt("directorNo2");
				String movieStatus = rs.getString("movieStatus");
				String stilcut = rs.getString("stilcut");
				String genreName =rs.getString("genreName");
				vo = new MovieListVO(movieNo, genreNo, title, runningTime, synop, poster, url, price, opendate, ageRate, regdate, directorNo1, directorNo2, movieStatus, stilcut, genreName);
				list.add(vo);
			}
			
			System.out.println("검색 결과 list.size()"+list.size());
			return list;
			
		}finally {
			pool.dbClose(rs, ps, con);
		}		
	}//selectByGenreMovie	
	

}
