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
			String sql = "select movieno,count(movieno)"
					+ " from payhistory"
					+ " where userid = ?"
					+ " group by movieno";
			ps = con.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery();

			while(rs.next()) {
				String title =  dao.selectByMovieNo(rs.getInt("movieno")).getTitle();
				int value = rs.getInt("count(movieno)");

				map.put(title, value);
			}
			System.out.println("통계그래프 값 조회 결과 map = " + map + "매개변수 userid = " + userid);
			return map;
		}finally {
			pool.dbClose(rs, ps, con);
		}


	}

}



















