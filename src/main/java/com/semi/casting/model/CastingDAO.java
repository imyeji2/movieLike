package com.semi.casting.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.semi.db.ConnectionPoolMgr;

public class CastingDAO {
	private ConnectionPoolMgr pool;

	public CastingDAO() {
		pool = new ConnectionPoolMgr();
	}
	
	public List<CastingVO> selectCastingByMovieNo(int movieNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<CastingVO> list = new ArrayList<CastingVO>();
		try {
			con = pool.getConnection();
			String sql = "select * from casting where castingno = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, movieNo);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				CastingVO vo = new CastingVO();
				int castingNo = rs.getInt("castingno");
				int actorNo = rs.getInt("actorno");
				int rsMovieNo = rs.getInt("movieno");
				
				vo = new CastingVO(castingNo, actorNo, rsMovieNo);
				list.add(vo);
			}
			System.out.println("캐스팅 번호 조회 결과 vo = " + list + "매개변수 movieNo = " + movieNo);
			return list;
			
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	
}
