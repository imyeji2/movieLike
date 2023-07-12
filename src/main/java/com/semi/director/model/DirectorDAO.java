package com.semi.director.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.semi.actor.model.ActorVO;
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
			 		+ " values(director_seq.nextval, ?,?)";
			 ps = con.prepareStatement(sql);
			 ps.setString(1, vo.getDirectorName());
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
				String directorName = rs.getString("directorName");
				String directorImg = rs.getString("directorImg");
				
				vo = new DirectorVO(directorNo, directorName, directorImg);
				list.add(vo);					
			}
			System.out.println("감독 전체 조회 결과 list="+list.size());
			return list;
			
		}finally {
			//5. 자원해제
			pool.dbClose(rs, ps, con);
		}
	}//selectDirectorAll
	
	
	/**
	 * 감독 번호로 감독 찾기
	 * @param no
	 * @return
	 * @throws SQLException
	 */
	public DirectorVO selectByDirectorNo(int no) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		DirectorVO vo=null;
		
		try {
			con = pool.getConnection();
			
			String sql = "select * from director where directorNo =?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				int directorNo = rs.getInt("directorNo");
				String directorName = rs.getString("directorName");
				String directorImg = rs.getString("directorImg");
				
				vo = new DirectorVO(directorNo, directorName, directorImg);
			}
			System.out.println("검색 결과 vo = "+vo+", 매개변수 no="+no);
			return vo;
			
		}finally {
			pool.dbClose(rs, ps, con);
		
		}
	}//selectByDirectorNo
	
	
	
	
	/**
	 * 감독 업데이트 
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int updateDirector(DirectorVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps = null;
		
		try {
			con = pool.getConnection();
			
			String sql = "update director set directorName=?";
			//파일이 새로 등록된 경우만 파일 주소 업로드
			if(vo.getDirectorImg()!=null&&!vo.getDirectorImg().isEmpty()) {
				sql+= " ,directorImg =? ";
			}
			sql+=" where directorNo=?";
			
			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getDirectorName());
			
			if(vo.getDirectorImg()!=null&&!vo.getDirectorImg().isEmpty()) {
				ps.setString(2, vo.getDirectorImg());
				ps.setInt(3, vo.getDirectorNo());
			}else {
			
				ps.setInt(2, vo.getDirectorNo());
			}
			
			int cnt = ps.executeUpdate();
			System.out.println("업데이트 결과 cnt="+cnt+", 매개변수 vo="+vo);
			return cnt;
						
		}finally {
			pool.dbClose(ps, con);
		}
	}//updateDirector
	
	
	
	
	/**
	 * 감독 선택 삭제
	 * @param arrNo
	 * @return
	 * @throws SQLException
	 */
	public int deleteDirector(int dirctorNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		
		try {
			con = pool.getConnection();
			String sql ="delete from director where directorNo=?";
			ps= con.prepareStatement(sql);
			ps.setInt(1, dirctorNo);
			int cnt=ps.executeUpdate();
			System.out.println("삭제 결과 cnt="+cnt+", 매개변수=arrNo");
			return cnt;
			
		}finally {
			pool.dbClose(ps, con);
		}
	}//deleteDirector
	
	/**
	 * 감독 중복 검사
	 * @param name
	 * @return
	 * @throws SQLException
	 */
	public int chekByDirectorName(String name) throws SQLException {
		Connection con =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = pool.getConnection();
			String sql = "select count(*) "
					+ " from (select REPLACE (directorName,' ') name from director)"
					+ " where name=REPLACE(?,' ')";
			
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			
			rs = ps.executeQuery();
			int cnt =0;
			if(rs.next()) {
				 cnt = rs.getInt(1);
			
			}
			
			System.out.println("감독이름 중복 확인 결과 cnt="+cnt+", 매개변수 name="+name);
			return cnt;
		}finally {
			pool.dbClose(rs, ps, con);
		}
		
	}//chekByDirectorName
	
	
	
}
