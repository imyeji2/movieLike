package com.semi.casting.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.semi.db.ConnectionPoolMgr;

public class CastingListDAO {
	private ConnectionPoolMgr pool;

	public CastingListDAO() {
		pool = new ConnectionPoolMgr();
	}
	
	public List<CastingListVO> selectCastingMovie(int movieNo) throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = pool.getConnection();
			
			String sql = "select c.castingNo,c.actorNo,c.movieNo, a.actorName, a.actorImg "
					+ " from casting c left join actor a"
					+ " on c.actorNo = a.actorNo"
					+ " where c.movieNo=?;";
			ps=con.prepareStatement(sql);
			ps.setInt(1, movieNo);
			
			rs = ps.executeQuery();
			
			List<CastingListVO> list = new ArrayList<CastingListVO>();
			CastingListVO vo = null;
			
			while(rs.next()) {
				int castingNo = rs.getInt("castingNo");
				int actorNo = rs.getInt("actorNo");
				String actorName = rs.getString("actorName");
				String actorImg = rs.getString("actorImg");
				
				vo = new CastingListVO(castingNo, actorNo, movieNo, actorName, actorImg);
				list.add(vo);
			}
			
			System.out.println("캐스팅 결과 list.size()"+list.size()+", 매개변수 no="+movieNo);
			return list;

		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	
	
	
}
