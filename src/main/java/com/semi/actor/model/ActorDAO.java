package com.semi.actor.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.semi.db.ConnectionPoolMgr;

import oracle.jdbc.proxy.annotation.Pre;

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
		System.out.println(vo.getActorName());
		System.out.println(vo.getActorImg());
		try {
			//1,2
			con = pool.getConnection();
			//3
			 String sql ="insert into actor(actorNo, actorName, actorImg)"
			 		+ " values(director_seq.nextval, ?,?)";
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
	
	
	/**
	 * 배우 중복 검사
	 * @param name
	 * @return
	 * @throws SQLException
	 */
	public int chekByActorName(String name) throws SQLException {
		Connection con =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = pool.getConnection();
			String sql = "select count(*) "
					+ " from (select REPLACE (actorName,' ') name from actor)"
					+ " where name=REPLACE(?,' ')";
			/*
			 * String sql = "select count(*)" +
			 * " from (select REPLACE (actorName,' ') name from actor)" +
			 * " where name like REPLACE('%'||?||'%',' ')";
			 */
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			
			rs = ps.executeQuery();
			int cnt =0;
			if(rs.next()) {
				 cnt = rs.getInt(1);
			
			}
			
			System.out.println("배우이름 중복 확인 결과 cnt="+cnt+", 매개변수 name="+name);
			return cnt;
		}finally {
			pool.dbClose(rs, ps, con);
		}
		
	}//selectByActor
	
	
	/**
	 * 배우 번호로 배우 찾기
	 * @param no
	 * @return
	 * @throws SQLException
	 */
	public ActorVO selectByActorNo(int no) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ActorVO vo=null;
		
		try {
			con = pool.getConnection();
			
			String sql = "select * from actor where actorNo =?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				int actorNo = rs.getInt("actorNo");
				String actorName = rs.getString("actorName");
				String actorImg = rs.getString("actorImg");
				
				vo = new ActorVO(actorNo, actorName, actorImg);
			}
			System.out.println("검색 결과 vo = "+vo+", 매개변수 no="+no);
			return vo;
			
		}finally {
			pool.dbClose(rs, ps, con);
		
		}
	}//selectByActorNo
	
	/**
	 * 배우 선택 삭제
	 * @param arrNo
	 * @return
	 * @throws SQLException
	 */
	public int deleteActor(int actorNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		
		try {
			con = pool.getConnection();
			String sql ="delete from actor where actorNo=?";
			ps= con.prepareStatement(sql);
			ps.setInt(1, actorNo);
			int cnt=ps.executeUpdate();
			System.out.println("삭제 결과 cnt="+cnt+", 매개변수=arrNo");
			return cnt;
			
		}finally {
			pool.dbClose(ps, con);
		}
	}//deleteActor
	
	
	/**
	 * 배우 업데이트 
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int updateActor(ActorVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps = null;
		
		try {
			con = pool.getConnection();
			
			String sql = "update actor set actorName=?";
			//파일이 새로 등록된 경우만 파일 주소 업로드
			if(vo.getActorImg()!=null&&!vo.getActorImg().isEmpty()) {
				sql+= " ,actorImg =? ";
			}
			sql+=" where actorNo=?";
			
			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getActorName());
			
			if(vo.getActorImg()!=null&&!vo.getActorImg().isEmpty()) {
				ps.setString(2, vo.getActorImg());
				ps.setInt(3, vo.getActorNo());
			}else {
			
				ps.setInt(2, vo.getActorNo());
			}
			
			int cnt = ps.executeUpdate();
			System.out.println("업데이트 결과 cnt="+cnt+", 매개변수 vo="+vo);
			return cnt;
						
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
}
