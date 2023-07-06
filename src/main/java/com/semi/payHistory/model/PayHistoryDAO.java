package com.semi.payHistory.model;

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
import com.semi.movie.model.MovieDAO;
import com.semi.point.model.PointVO;

public class PayHistoryDAO {

	private ConnectionPoolMgr pool;



	public PayHistoryDAO() {
		pool = new ConnectionPoolMgr();
	}



	public Map<PayHistoryVO, Integer> selectHistoryByUserid(String userid) throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = pool.getConnection();
			String sql = "select * from payhistory where userid = ? order by hisregdate";
			
			ps = con.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery();
			Map<PayHistoryVO, Integer> map = new HashMap<>();
			MovieDAO dao = new MovieDAO(); 
			while(rs.next()) {
				PayHistoryVO vo = new PayHistoryVO();
				vo.setHisNo(rs.getInt("hisNo"));
				vo.setMovieNo(rs.getInt("movieNo"));
				vo.setUserId(rs.getString("userid"));
				vo.setHisRegdate(rs.getTimestamp("hisRegdate"));
				
				int price = dao.selectByMovieNo(vo.getMovieNo()).getPrice();
				map.put(vo, price);
			}
			System.out.println("영화 구매 이력 조회 결과 list = " + map + "매개변수 userid = " + userid );
			return map;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
}
