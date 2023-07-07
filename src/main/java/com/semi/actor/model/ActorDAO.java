package com.semi.actor.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.semi.db.ConnectionPoolMgr;

public class ActorDAO {
	private ConnectionPoolMgr pool;

	public ActorDAO() {
		pool = new ConnectionPoolMgr();
	}
	
	/**
	 * 배우 등록 메서드
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int insertActor(ActorVO vo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			//1,2
			con = pool.getConnection();
			//3
			 String sql ="insert into actor(actorNo, actorName, actorImg)"
			 		+ " values(director_seq.nextval, '?','?')";
			 ps = con.prepareStatement(sql);
			 ps.setString(1, vo.getActorName());
			 ps.setString(2, vo.getActorImg());
			 
			//4
			int cnt = ps.executeUpdate();
			System.out.println("배우 저장 결과 cnt="+cnt+", 매개변수  vo="+vo);
			return cnt;
		}finally {
			//5
			pool.dbClose(ps, con);	
		}
	}//insertActor
	
	
	/**
	 * 배우 전체 조회 메서드
	 * @return
	 * @throws SQLException
	 */
	public List<ActorVO> selectActorAll() throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<ActorVO> list = new ArrayList<ActorVO>();
		ActorVO vo = null;
		try {
			//1.2 드라이버 로딩 및 db견열
			con = pool.getConnection();
	
			//3 sql 처리를 위한 prepareStatement 객체 생성
			String sql ="select * from actor order by actorNo desc";
			ps = con.prepareStatement(sql);
			
			//4. 쿼리 실행
			rs =ps.executeQuery();
			while(rs.next()) {
				int actorNo = rs.getInt("actorNo");
				String actorName = rs.getString("actorName");
				String actorImg = rs.getString("actorImg");
				
				vo = new ActorVO(actorNo, actorName, actorImg);
				list.add(vo);					
			}
			System.out.println("배우 전체 조회 결과 list="+list.size());
			return list;
			
		}finally {
			//5. 자원해제
			pool.dbClose(rs, ps, con);
		}
	}//selectActorAll
	
	
}
