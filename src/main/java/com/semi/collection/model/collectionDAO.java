package com.semi.collection.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.semi.db.ConnectionPoolMgr;

public class collectionDAO {
	private ConnectionPoolMgr pool;

	public collectionDAO() {
		pool = new ConnectionPoolMgr();
	}
	
	
	/**
	 * 컬렉션 등록
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int insertCollection(collectionVO vo) throws SQLException {
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
	
	public List<collectionVO> selectCollectionAll() throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = pool.getConnection();
			String sql ="";
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	

	

}
