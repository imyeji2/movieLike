package com.semi.casting.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.semi.db.ConnectionPoolMgr;

public class CastingDAO {
	private ConnectionPoolMgr pool;
	
	public CastingDAO() {
		pool=new ConnectionPoolMgr();
	}
	
	
	/**
	 * 캐스팅 등록
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int insertCasting(CastingVO vo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = pool.getConnection();
			String sql = "insert into casting(castingNo, actorNo, movieNo)"
					+  "values(casting_seq.nextval,?,?)";
			ps=con.prepareStatement(sql);
			ps.setInt(1, vo.getActorNo());
			ps.setInt(2,vo.getMovieNo());
			
			int cnt = ps.executeUpdate();
			System.out.println("캐스팅 등록 결과 cnt="+cnt+", 매개변수 vo="+vo);
			return cnt;
			
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
}
