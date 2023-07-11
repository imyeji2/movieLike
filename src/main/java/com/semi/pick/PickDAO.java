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
	
	public List<PickVO> selectPick(String userid) throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<PickVO> list = new ArrayList<>();
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
				
				PickVO vo = new PickVO(pickNo,movieNo,userId,pickRegdate);
				
				list.add(vo);
			}
			System.out.println("찜 목록 조회 결과 map = " + list + "매개변수 userid = " + userid);
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int insertPick(int movieNo,String userid ) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = pool.getConnection();
			String sql = "insert into pick"
					+ " values(pick_seq.nextval,?,?,sysdate)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, movieNo);
			ps.setString(2, userid);
			
			int cnt = ps.executeUpdate();
			
			System.out.println("찜하기 결과 cnt = " + cnt + "매개변수 movieNo = " + movieNo + ", userid = " + userid);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	
	public int deletePick(int movieNo,String userid) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = pool.getConnection();
			String sql = "delete pick"
					+ " where userid = ? and movieno = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, userid);
			ps.setInt(2, movieNo);
			
			int cnt = ps.executeUpdate();
			
			System.out.println("찜해제 결과 cnt = " + cnt + "매개변수 movieNo = " + movieNo + ", userid = " + userid);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}

}












