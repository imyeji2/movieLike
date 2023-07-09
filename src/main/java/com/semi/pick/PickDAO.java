package com.semi.pick;

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
import com.semi.movie.model.MovieService;
import com.semi.movie.model.MovieVO;
import com.semi.review.model.ReviewVO;

public class PickDAO {

	private ConnectionPoolMgr pool;

	public PickDAO() {
		pool = new ConnectionPoolMgr();
	}



	public Map<PickVO, MovieVO> selectPickByUserId(String userid) throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Map<PickVO, MovieVO> map = new LinkedHashMap<PickVO, MovieVO>();
		MovieService movieService = new MovieService();
		try {
			con = pool.getConnection();
			String sql = "select * from pick where userid = ?";
			ps = con.prepareStatement(sql);

			ps.setString(1, userid);

			rs=ps.executeQuery();

			while(rs.next()) {
				int pickNo = rs.getInt("pickno");
				int movieNo = rs.getInt("movieno");
				String userId = rs.getString("movieno");
				Timestamp pickRegdate = rs.getTimestamp("pickregdate");

				MovieVO movieVo = new MovieVO();
				PickVO vo = new PickVO(pickNo,movieNo,userId,pickRegdate);
				movieVo = movieService.selectByMovieNo(movieNo);

				map.put(vo, movieVo);
			}
			System.out.println("찜 목록 조회 결과 map = " + map + "매개변수 userid = " + userid);
			return map;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	/*public Map<PickVO, MovieVO> selectPickByUserId(String userid) throws SQLException{
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs= null;

	HashMap<PickVO, MovieVO> map = new HashMap<>();
	MovieService movieService = new MovieService();
	try {
		con = pool.getConnection();
		String sql = "select * from pick where userid = ?";
		ps = con.prepareStatement(sql);
		ps.setString(1, userid);

		rs=ps.executeQuery();
		System.out.println("여기까지 도달함");
		while(rs.next()) {
			System.out.println("여기까지 도달함222222222222");
			PickVO vo = new PickVO();
			vo.setPickNo(rs.getInt("PickNo"));
			vo.setMovieNo(rs.getInt("MovieNo"));
			vo.setUserId(rs.getString("UserId"));
			vo.setPickRegdate(rs.getTimestamp("PickRegdate"));

			MovieVO movieVo = movieService.selectByMovieNo(vo.getMovieNo());
			map.put(vo,movieVo);
		}

		System.out.println("찜 목록 조회 결과 map = " + map + "매개변수 userid = " + userid);
		return map;
	}finally {
		pool.dbClose(rs, ps, con);
	}
}*/
}
