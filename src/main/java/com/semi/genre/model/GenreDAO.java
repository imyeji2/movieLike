package com.semi.genre.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.semi.db.ConnectionPoolMgr;

public class GenreDAO {
	private ConnectionPoolMgr pool;

	public GenreDAO() {
		pool = new ConnectionPoolMgr();
	}
	
	/**
	 * 장르 등록
	 * @return
	 * @throws SQLException 
	 */
	public int insertGenre(GenreVO vo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = pool.getConnection();
			String sql = "insert into genre(genreNo, genreName)"
					+ " values(genre_seq.nextval,?)";
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getGenreName());
			
			int cnt = ps.executeUpdate();
			System.out.println("장르 등록 결과 cnt="+cnt+",매개변수 vo");
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
		
	}//insertGenre
	 
	
	public List<GenreVO> selectGenreAll() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = pool.getConnection();
			String sql = "select * from genre order by genreNo";
			ps=con.prepareStatement(sql);
			
			List<GenreVO> list = new ArrayList<GenreVO>();
			GenreVO vo = null;
			rs=ps.executeQuery();
			
			while(rs.next()) {
				int genreNo = rs.getInt("genreNo");
				String genreName = rs.getString("genreName");
				vo = new GenreVO(genreNo, genreName);
				list.add(vo);
			}
	
			System.out.println("장르 검색 결과 list.size()="+list.size());
			return list;
		}finally {
			pool.dbClose(ps, con);
		}
		
	}//insertGenre	
}
