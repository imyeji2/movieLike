package com.semi.review.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.semi.db.ConnectionPoolMgr;
import com.semi.movie.model.MovieService;

public class ReviewDAO {
	private ConnectionPoolMgr pool;

	public ReviewDAO() {
		pool = new ConnectionPoolMgr();
	}
	
	public Map<ReviewVO,String> selectByUserId(String userid) throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs= null;
		Map<ReviewVO,String> map = new LinkedHashMap<ReviewVO, String>();
		MovieService movieService = new MovieService();
		try {
			con = pool.getConnection();
			String sql = "select * from review where userid = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, userid);
			
			rs=ps.executeQuery();
			
			while(rs.next()) {
				ReviewVO vo = new ReviewVO();
				vo.setReviewNo(rs.getInt("reviewno"));
				vo.setMovieNo(rs.getInt("movieno"));
				vo.setUserId(rs.getString("userid"));
				vo.setComments(rs.getString("comments"));
				vo.setLickCount(rs.getInt("likeCount"));
				vo.setGroupNo(rs.getInt("groupno"));
				vo.setStep(rs.getInt("step"));
				vo.setSortNo(rs.getInt("sortno"));
				vo.setViews(rs.getInt("views"));
				vo.setScore(rs.getInt("score"));
				vo.setReviewStatus(rs.getString("reviewstatus"));
				
				String movieName = movieService.selectByMovieNo(vo.getMovieNo()).getTitle();
				map.put(vo,movieName);
				
			}
			System.out.println("리뷰 조회 결과 map = " + map + "매개변수 userid = " + userid);
			return map;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	public List<ReviewVO> selectByMovieNo(int movieNo) throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<ReviewVO> list = new ArrayList<>();
		try {
			con = pool.getConnection();
			String sql = "select * from review where movieno = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, movieNo);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				ReviewVO vo = new ReviewVO();
				vo.setReviewNo(rs.getInt("reviewno"));
				vo.setMovieNo(rs.getInt("movieno"));
				vo.setUserId(rs.getString("userid"));
				vo.setComments(rs.getString("comments"));
				vo.setLickCount(rs.getInt("likeCount"));
				vo.setGroupNo(rs.getInt("groupno"));
				vo.setStep(rs.getInt("step"));
				vo.setSortNo(rs.getInt("sortno"));
				vo.setViews(rs.getInt("views"));
				vo.setScore(rs.getInt("score"));
				vo.setReviewStatus(rs.getString("reviewstatus"));
				
				list.add(vo);
			}
			System.out.println("영화번호로 리뷰조회 결과 list.size = " + list.size() + "매개변수 movieNo = " + movieNo);
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	/**
	 * 리뷰를 작성했는지 검사하는 메서드
	 * @return
	 * @throws SQLException 
	 */
	public boolean isReview(int movieno, String userid) throws SQLException {	
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = pool.getConnection();
			String sql = "select count(reviewno) from review where movieno = ? and userid = ?";
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, movieno);
			ps.setString(2, userid);
			rs = ps.executeQuery();
			if(!rs.next()) {
				System.out.println("리뷰 없음");
				return false;
			}else {
				System.out.println("리뷰 존재함");
				return true;
			}
		}finally {
			pool.dbClose(rs, ps, con);
		}
		
		
	}
}










