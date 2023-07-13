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
		pool=new ConnectionPoolMgr();
	}
	
	public List<CastingVO> selectCastingByMovieNo(int movieNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<CastingVO> list = new ArrayList<CastingVO>();
		try {
			con = pool.getConnection();
			String sql = "select * from casting where movieno = ?";
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
			pool.dbClose(ps, con);
		}
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
	}//insertCasting
	
	
	/**
	 * 캐스팅 삭제
	 * @throws SQLException 
	 */
	
	public int deleteCasting(int actorNo, int movieNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = pool.getConnection();
			String sql = " delete casting"
					+ " where actorNo =? and movieno=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, actorNo);
			ps.setInt(2, movieNo);
			
			int cnt = ps.executeUpdate();
			System.out.println("캐스팅 삭제 결과 cnt="+cnt);
			return cnt;
			
		}finally {
			pool.dbClose(ps, con);
		}
	}

}