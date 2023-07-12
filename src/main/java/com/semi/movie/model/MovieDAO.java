package com.semi.movie.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.semi.db.ConnectionPoolMgr;
import com.semi.genre.model.GenreService;

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
	
	
	
	/**
	 * 영화 등록 
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int insertMovie(MovieVO vo) throws SQLException {
		Connection con =null;
		PreparedStatement ps = null;
		
		try {
			con = pool.getConnection();
			System.out.println(vo.getDirectorNo1());
			System.out.println(vo.getDirectorNo2());
	
			
			//감독이 1명일때
			if(vo.getDirectorNo2()==0) {
				String sql="insert into movie(movieNo, genreNo, title, runningTime, synop, poster, stilCut,"
						+ " URL, price,openDate, ageRate, directorNo1)"
						+ " values(movie_seq.nextval,?,?,?,?,?,?,?,?,?,?,?)";
				ps = con.prepareStatement(sql);
				ps.setInt(1, vo.getGenreNo());
				ps.setString(2, vo.getTitle());
				ps.setString(3, vo.getRunningTime());
				ps.setString(4, vo.getSynop());
				ps.setString(5, vo.getPoster());
				ps.setString(6, vo.getStilcut());
				ps.setString(7, vo.getUrl());
				ps.setInt(8, vo.getPrice());
				ps.setTimestamp(9, vo.getOpendate());
				ps.setInt(10, vo.getAgeRate());
				ps.setInt(11, vo.getDirectorNo1());
				
			}else {//감독이 2명일때
				String sql="insert into movie(movieNo, genreNo, title, runningTime, synop, poster, stilCut,"
						+ " URL, price,openDate, ageRate, directorNo1, directorNo2)"
						+ " values(movie_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?)";
				ps = con.prepareStatement(sql);
				ps.setInt(1, vo.getGenreNo());
				ps.setString(2, vo.getTitle());
				ps.setString(3, vo.getRunningTime());
				ps.setString(4, vo.getSynop());
				ps.setString(5, vo.getPoster());
				ps.setString(6, vo.getStilcut());
				ps.setString(7, vo.getUrl());
				ps.setInt(8, vo.getPrice());
				ps.setTimestamp(9, vo.getOpendate());
				ps.setInt(10, vo.getAgeRate());
				ps.setInt(11, vo.getDirectorNo1());
				ps.setInt(12, vo.getDirectorNo2());
			}
			
			int cnt = ps.executeUpdate();
			System.out.println("영화 저장 결과 cnt="+cnt+",매개변수 vo="+vo);
			return cnt;
			
		}finally {
			pool.dbClose(ps, con);;
		}
	}//insertMovie
	
	
	/**
	 * 영화 검색
	 * @param no
	 * @return
	 * @throws SQLException 
	 */
	public MovieVO selectMovieByNo(String title) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
			con = pool.getConnection();
			String sql = "select * from movie where title=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, title);
			
			rs=ps.executeQuery();
			MovieVO vo = null;
			
			if(rs.next()) {
				int movieNo = rs.getInt("movieNo");
				int genreNo = rs.getInt("genreNo");
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
			System.out.println("영화 단건 검색결과 vo="+vo+",매개변수 title="+title);
			return vo;
			
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	/**
	 * 관리자 통계탭에서 뿌려줄 카테고리별 매출
	 * @return
	 * @throws SQLException
	 */
	public Map<String, Integer> getRankByCategory() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Map<String, Integer> map = new HashMap();
		try {
			con = pool.getConnection();
			String sql = "select count(p.movieno),g.genreName"
					+ " from payHistory p,"
					+ "     movie m,"
					+ "     genre g"
					+ " where p.movieno=m.movieno"
					+ "      and m.genreno = g.genreno"
					+ "      group by g.genrename";
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			
			if(rs.next()) {
				map.put(rs.getString("genreName"), rs.getInt("count(p.movieno)"));
			}
			
			System.out.println("장르별 매출 조회 결과 map : " + map);
			return map;
			
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	
}
