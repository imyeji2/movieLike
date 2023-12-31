package com.semi.payHistory.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.semi.db.ConnectionPoolMgr;
import com.semi.movie.model.MovieDAO;
import com.semi.point.model.PointVO;

public class PayHistoryDAO {

	private ConnectionPoolMgr pool;



	public PayHistoryDAO() {
		pool = new ConnectionPoolMgr();
	}



	public Map<PayHistoryVO, String> selectHistoryByUserid(String userid) throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = pool.getConnection();
			String sql = "select * from payhistory where userid = ? order by hisno";

			ps = con.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery();
			Map<PayHistoryVO, String> map = new LinkedHashMap<PayHistoryVO, String>();
			MovieDAO dao = new MovieDAO(); 
			while(rs.next()) {
				PayHistoryVO vo = new PayHistoryVO();
				vo.setHisNo(rs.getInt("hisNo"));
				vo.setMovieNo(rs.getInt("movieNo"));
				vo.setUserId(rs.getString("userid"));
				vo.setHisRegdate(rs.getTimestamp("hisRegdate"));

				String title = dao.selectByMovieNo(vo.getMovieNo()).getTitle();
				map.put(vo, title);
			}
			System.out.println("영화 구매 이력 조회 결과 list = " + map + "매개변수 userid = " + userid );
			return map;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}

	public Map<String, Integer> chartValue(String userid) throws SQLException{	//마이페이지 > 통계 > 차트 값 불러오는 메서드
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Map<String, Integer> map = new HashMap();
		MovieDAO dao = new MovieDAO(); 
		try {
			con = pool.getConnection();
			String sql = "select count(p.movieno),g.genreName"
					+ " from payHistory p,"
					+ " movie m,"
					+ " genre g"
					+ " where p.movieno=m.movieno"
					+ "	and m.genreno = g.genreno"
					+ " and p.userid = ?"
					+ " group by g.genrename";
					
			ps = con.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery();

			while(rs.next()) {
				String title =  rs.getString("genreName");
				int value = rs.getInt("count(p.movieno)");
				
				map.put(title, value);
			}
			System.out.println("통계그래프 값 조회 결과 map = " + map + "매개변수 userid = " + userid);
			return map;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	/**
	 * 영화 구입 메서드
	 * @return
	 * @throws SQLException 
	 */
	public int insertPayHistory(int movieNo, String userid) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = pool.getConnection();
			String sql = "insert into payhistory(hisno,movieno,userid)"
					+ " values(payhistory_seq.nextval,?,?)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, movieNo);
			ps.setString(2, userid);
			
			int cnt = ps.executeUpdate();
			
			System.out.println("영화 구매 결과 cnt = " + cnt + "매개변수 movieNo, userid = " + movieNo +", "+ userid);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public Map<String, Integer> getRankByTitle() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Map<String, Integer> map = new HashMap();
		try {
			con = pool.getConnection();
			String sql = "select title, count(p.movieno)"
					+ " from payHistory p,"
					+ " movie m"
					+ " where p.movieno = m.movieno"
					+ " group by title";
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			
			while(rs.next()) {
				map.put(rs.getString("title"), rs.getInt("count(p.movieno)"));
			}
			System.out.println("작품별 매출 조회 결과 map : " + map);
			return map;
			
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int totalMovieIncome() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = pool.getConnection();
			String sql = "select sum(price)"
					+ " from payHistory p,"
					+ " movie m"
					+ " where p.movieno = m.movieno";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			int sum = 0;
			if(rs.next()) {
				sum = rs.getInt("sum(price)");
			}
			
			System.out.println("누적 판매금액 조회 결과 sum = " + sum);
			return sum;
		}finally {
			pool.dbClose(rs, ps, con);;
		}		
	}
	
	
	
	
}



















