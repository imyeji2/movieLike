package com.semi.faq.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.semi.db.ConnectionPoolMgr;

public class FaqDAO {
	private ConnectionPoolMgr pool;
	
	public FaqDAO() {
		pool = new ConnectionPoolMgr();
	}
	
	
	/**
	 * 게시글 작성 메서드
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int insertBoard(FaqVO vo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = pool.getConnection();
			
			String sql = "insert into board(boardno, adminid, boardtitle, boardcontent, boardcategory, boardstatus)"
					+ " values(board_seq.nextval, ?, ?, ?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getAdminID());
			ps.setString(2, vo.getBoardTitle());
			ps.setString(3, vo.getBoardContent());
			ps.setString(4, vo.getBoardCategory());
			ps.setString(5, vo.getBoardStatus());
			
			int cnt = ps.executeUpdate();
			System.out.println("게시글 작성 성공, cnt = " + cnt + ", 매개변수 vo = " + vo);
			
			return cnt;
		} finally {
			pool.dbClose(ps, con);
		}
	}
	
	
	/**
	 * 게시글 제목으로 검색 메서드
	 * @param keyword
	 * @param condition
	 * @return
	 * @throws SQLException
	 */
	public List<FaqVO> selectAll(String keyword) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		List<FaqVO> list = new ArrayList<>();
		try {
			con=pool.getConnection();

			String sql="select * from board"
				+ " where boardTitle like '%' || ? || '%'"
				+ " order by boardNo desc";
			ps=con.prepareStatement(sql);
				ps.setString(1, keyword);
			
			
			rs=ps.executeQuery();
			while(rs.next()) {
				int boardNo=rs.getInt("boardNo");
				String adminID=rs.getString("adminID");
				String boardTitle=rs.getString("boardTitle");
				String boardContent=rs.getString("boardContent");
				int boardView=rs.getInt("boardView");
				Timestamp boardRegdate=rs.getTimestamp("boardRegdate");
				String boardCategory=rs.getString("boardCategory");
				String boardStatus=rs.getString("boardStatus");

				FaqVO vo
				=new FaqVO(boardNo, adminID, boardTitle, boardContent, boardView, boardRegdate, boardCategory, boardStatus);

				list.add(vo);
			}
			System.out.println("게시글 전체 조회 결과, list.size="+list.size()
				+", 매개변수 keyword="+keyword);

			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	
	
	/**
	 * 게시글 상세보기 메서드
	 * @param boardNo
	 * @return
	 * @throws SQLException
	 */
	public FaqVO selectByNo(int boardNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		FaqVO vo = new FaqVO();
		try {
			con=pool.getConnection();

			String sql="select * from board where boardNo=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, boardNo);

			rs=ps.executeQuery();
			if(rs.next()) {
				String adminID=rs.getString("adminID");
				String boardTitle=rs.getString("boardTitle");
				String boardContent=rs.getString("boardContent");
				int boardView=rs.getInt("boardView");
				Timestamp boardRegdate=rs.getTimestamp("boardRegdate");
				String boardCategory=rs.getString("boardCategory");
				String boardStatus=rs.getString("boardStatus");

				vo.setAdminID(adminID);
				vo.setBoardTitle(boardTitle);
				vo.setBoardContent(boardContent);
				vo.setBoardView(boardView);
				vo.setBoardRegdate(boardRegdate);
				vo.setBoardCategory(boardCategory);
				vo.setBoardStatus(boardStatus);
				vo.setBoardNo(boardNo);
			}

			System.out.println("게시글 상세보기 결과, vo="+vo+", 매개변수 boardNo=" + boardNo);
			return vo;	
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	
	
	/**
	 * 게시글 수정 메서드
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int updateBoard(FaqVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		try {
			con=pool.getConnection();

			String sql = "update board"
					+ " set boardTitle= ?, adminID =?, boardContent= ?,boardCategory = ?, boardstatus=?"
					+ " where boardNo= ?";
			ps = con.prepareStatement(sql);

			ps.setString(1, vo.getBoardTitle());
			ps.setString(2, vo.getAdminID());
			ps.setString(3, vo.getBoardContent());
			ps.setString(4, vo.getBoardContent());
			ps.setString(5, vo.getBoardCategory());
			ps.setString(6, vo.getBoardStatus());

			int cnt = ps.executeUpdate();
			System.out.println("게시글 수정 결과 cnt = " + cnt + ", 매개변수 vo = " + vo);

			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	
	
	/**
	 * 게시글 삭제 메서드
	 * @param no
	 * @param pwd
	 * @return
	 * @throws SQLException
	 */
	public int deleteBoard(int boardNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = pool.getConnection();

			String sql = "delete from board"
					+ " where boardNo = ?";
			ps = con.prepareStatement(sql);

			ps.setInt(1, boardNo);

			int cnt = ps.executeUpdate();
			System.out.println("삭제 처리 결과 : " + cnt +", 매개변수 boardNo="+boardNo);
			
			return cnt;
		} finally {
			pool.dbClose(ps, con);
		}
	}
	
	
	
	/**
	 * 조회수 증가 메서드
	 * @param boardNo
	 * @return
	 * @throws SQLException
	 */
	public int updateBoardView(int boardNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql="update board"
					+ " set boardView = boardView+1"
					+ " where boardNo = ?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, boardNo);
			
			//4
			int cnt=ps.executeUpdate();
			System.out.println("조회수 증가 결과, cnt="+cnt+", 매개변수 boardNo="+boardNo);
			
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	

}
