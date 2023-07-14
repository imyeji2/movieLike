package com.semi.collection.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import com.semi.db.ConnectionPoolMgr;

import oracle.sql.TIMESTAMP;

public class CollectionDAO {
	private ConnectionPoolMgr pool;

	public CollectionDAO() {
		pool = new ConnectionPoolMgr();
	}
	
	
	/**
	 * 컬렉션 등록
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int insertCollection(CollectionVO vo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = pool.getConnection();
			
			String sql = "insert into collection(collectionNo, movieNo, collectionTitle, content)"
					+ "	values(collection_seq.nextvaL, ?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, vo.getMovieNo());
			ps.setString(2,  vo.getCollectionTitle());
			ps.setString(3, vo.getContent());
			
			int cnt = ps.executeUpdate();
			System.out.println("컬렉션 저장 결과 cnt="+cnt);
			return cnt;
			
		}finally {
			pool.dbClose(ps, con);
		}
	}//insertCollection
	
	/**
	 * 제목으로 컬렉션 검색
	 * @return
	 * @throws SQLException
	 */
	public List<CollectionVO> selectCollectionTitle(String title) throws SQLException { 
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = pool.getConnection();
			
			String sql = "select * from collection where collectiontitle= ?";
			ps = con.prepareStatement(sql);
			
			ps.setString(1, title);
			
			rs = ps.executeQuery();
			List<CollectionVO> list = new ArrayList<CollectionVO>();
			CollectionVO vo = null;
		
			
			while(rs.next()) {
				int collectionNo = rs.getInt("collectionNo");
				int movieNo = rs.getInt("movieNo");
				String collectionTitle = rs.getString("collectionTitle");
				String content = rs.getString("content");
				Timestamp regdate = rs.getTimestamp("regdate");
				String status = rs.getString("status");
				vo = new CollectionVO(collectionNo, movieNo, collectionTitle, content, regdate, status);
				list.add(vo);
				
			}
			
			System.out.println("제목로 컬렉션 전부 찾기 결과 list="+list.size()+", 매개변수="+title);
			return list;
			
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	

}
