package com.semi.collection.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.semi.db.ConnectionPoolMgr;

public class CollectionListDAO {
	private ConnectionPoolMgr pool;

	public CollectionListDAO() {
		pool = new ConnectionPoolMgr();
	}
	
	/**
	 * 컬렉션 리스트 전체 조회
	 * @return
	 * @throws SQLException
	 */
	public List<CollectionListVO> selectCollectionAll() throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = pool.getConnection();
			String sql ="SELECT c.collectionTitle, c.content, MAX(c.regdate) AS maxRegdate, c.status, b.count"
					+ " FROM collection c"
					+ " join ("
					+ "    SELECT collectionTitle, COUNT(movieNo) AS count"
					+ "    FROM collection"
					+ "    GROUP BY collectionTitle"
					+ ") b ON c.collectionTitle = b.collectionTitle"
					+ " GROUP BY c.collectionTitle, c.content, c.status, b.count";
			
			ps=con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			List<CollectionListVO> list = new ArrayList<CollectionListVO>();
			CollectionListVO vo = null;
			
			
			while(rs.next()) {
				String title = rs.getString(1);
				String content = rs.getString(2);
				Timestamp regdate = rs.getTimestamp(3);
				String status = rs.getString(4);
				int count = rs.getInt(5);
				
				vo = new CollectionListVO(title, content, regdate, status, count);
				list.add(vo);
			}
			System.out.println("컬렉션 리스트 조회 list.size()"+list.size());
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}//selectCollectionAll
	
	
	public List<CollectionListVO> selectCollectionTitle() throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = pool.getConnection();
			String sql ="SELECT c.collectionTitle, c.content, MAX(c.regdate) AS maxRegdate, c.status, b.count"
					+ " FROM collection c"
					+ " join ("
					+ "    SELECT collectionTitle, COUNT(movieNo) AS count"
					+ "    FROM collection"
					+ "    GROUP BY collectionTitle"
					+ ") b ON c.collectionTitle = b.collectionTitle"
					+ " GROUP BY c.collectionTitle, c.content, c.status, b.count";
			
			ps=con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			List<CollectionListVO> list = new ArrayList<CollectionListVO>();
			CollectionListVO vo = null;
			
			
			while(rs.next()) {
				String title = rs.getString(1);
				String content = rs.getString(2);
				Timestamp regdate = rs.getTimestamp(3);
				String status = rs.getString(4);
				int count = rs.getInt(5);
				
				vo = new CollectionListVO(title, content, regdate, status, count);
				list.add(vo);
			}
			System.out.println("컬렉션 리스트 조회 list.size()"+list.size());
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}//selectCollectionAll
	

	

}
