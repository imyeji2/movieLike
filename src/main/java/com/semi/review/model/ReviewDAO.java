package com.semi.review.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
}










