package com.semi.director.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.semi.db.ConnectionPoolMgr;

public class DirectorDAO {
	private ConnectionPoolMgr pool;

	public DirectorDAO() {
		pool = new ConnectionPoolMgr();
	}
	
	/**
	 * 감독 등록 메서드
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int insertDirector(DirectorVO vo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			//1,2
			con = pool.getConnection();
			//3
			 String sql ="insert into director(directorNo, directorName, directorImg)"
			 		+ " values(director_seq.nextval, '?','?')";
			 ps = con.prepareStatement(sql);
			 ps.setString(1, vo.getDriectorName());
			 ps.setString(2, vo.getDirectorImg());
			 
			//4
			int cnt = ps.executeUpdate();
			System.out.println("감독 저장 결과 cnt="+cnt+", 매개변수  vo="+vo);
			return cnt;
		}finally {
			//5
			pool.dbClose(ps, con);	
		}
	}//insertDirector
	
	
	/**
	 * 감독 전체 조회 메서드
	 * @return
	 * @throws SQLException
	 */
	public List<DirectorVO> selectDirectorAll() throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<DirectorVO> list = new ArrayList<DirectorVO>();
		DirectorVO vo = null;
		try {
			//1.2 드라이버 로딩 및 db견열
			con = pool.getConnection();
	
			//3 sql 처리를 위한 prepareStatement 객체 생성
			String sql ="select * from director order by directorNo desc";
			ps = con.prepareStatement(sql);
			
			//4. 쿼리 실행
			rs =ps.executeQuery();
			while(rs.next()) {
				int directorNo = rs.getInt("directorNo");
				String driectorName = rs.getString("driectorName");
				String directorImg = rs.getString("directorImg");
				
				vo = new DirectorVO(directorNo, driectorName, directorImg);
				list.add(vo);					
			}
			System.out.println("감독 전체 조회 결과 list="+list.size());
			return list;
			
		}finally {
			//5. 자원해제
			pool.dbClose(rs, ps, con);
		}
	}//selectDirectorAll
}
