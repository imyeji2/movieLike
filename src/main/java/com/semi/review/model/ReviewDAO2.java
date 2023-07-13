package com.semi.review.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.semi.db.ConnectionPoolMgr;
import com.semi.movie.model.MovieService;

public class ReviewDAO2 {
	private ConnectionPoolMgr pool;

	public ReviewDAO2() {
		pool = new ConnectionPoolMgr();
	}
	
	/**
	 * 관리자페이지 - 리뷰 전체 보기
	 * @param keyword
	 * @param condition
	 * @return
	 * @throws SQLException
	 */
	public List<ReviewVO2> selectAll(String keyword, String condition) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		List<ReviewVO2> list2 = new ArrayList<>();
		try {
			//1,2
			con=pool.getConnection();

			String sql="select m.title, r.*"
					+ " from movie m left join review r"
					+ " on m.movieno = r.movieno";
			
			//검색의 경우 where 조건절 추가
			if(keyword != null && !keyword.isEmpty()) {
				sql+=" where "+condition+" like '%' || ? || '%'";
			}
			sql += " order by reviewno desc";
			ps=con.prepareStatement(sql);

			if(keyword != null && !keyword.isEmpty()) {
				ps.setString(1, keyword);
			}
			
			//4
			rs=ps.executeQuery();
			while(rs.next()) {
				int reviewNo=rs.getInt("reviewno");
				int movieNo=rs.getInt("movieNo");
				String userid=rs.getString("userid");
				String comments=rs.getString("comments");
				int likeCount=rs.getInt("likeCount");
				int groupno=rs.getInt("groupno");
				int step=rs.getInt("step");
				int sortno=rs.getInt("sortno");
				int views=rs.getInt("views");
				int score=rs.getInt("score");
				String reviewstatus=rs.getString("reviewstatus");
				String title=rs.getString("title");
				
				ReviewVO2 vo2
				=new ReviewVO2(reviewNo, movieNo, userid, comments, likeCount, groupno, step, sortno, views, score, reviewstatus, title);

				list2.add(vo2);
			}
			System.out.println("글 전체 조회 결과, list2.size="+list2.size()
				+", 매개변수 keyword="+keyword+", condition="+condition);

			return list2;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	/**
	 * 관리자 페이지 - 리뷰 상세보기 메서드
	 * @param no
	 * @return
	 * @throws SQLException 
	 */
	public ReviewVO2 selectByNo(int reviewNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		ReviewVO2 vo2 = new ReviewVO2();
		try {
			//1,2
			con=pool.getConnection();

			//3
			String sql="select * from review where reviewNo=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, reviewNo);

			//4
			rs=ps.executeQuery();
			if(rs.next()) {
				String title=rs.getString("title");
				String comments=rs.getString("comments");
				String userid=rs.getString("userid");
				int score = rs.getInt("score");

				vo2.setTitle(title);
				vo2.setComments(comments);
				vo2.setUserId(userid);
				vo2.setScore(score);
			}//if

			System.out.println("글 상세보기 결과, vo2="+vo2+", 매개변수 reviewNo=" + reviewNo);
			return vo2;	
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	
	/**
	 * 관리자 페이지 - 리뷰 삭제 메서드
	 * @param no
	 * @return
	 * @throws SQLException
	 */
	public int deleteBoard(int reviewNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;

		try {
			//1,2
			con = pool.getConnection();

			//3
			String sql = "delete from review"
					+ " where reviewNo = ?";
			ps = con.prepareStatement(sql);

			ps.setInt(1, reviewNo);

			//4
			int cnt = ps.executeUpdate();
			System.out.println("삭제 처리 결과 : " + cnt
					+", 매개변수 reviewNo="+reviewNo);
			
			return cnt;
		} finally {
			pool.dbClose(ps, con);
		}
	}
	
	public int likeCountUpdate(String targetId, String pointId, int reviewNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = pool.getConnection();
			
			String sql = "select * from likecheck "
					+ " where targetid = ? and pointid = ? and reviewno = ?";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			ps.setString(1, targetId);
			ps.setString(2, pointId);
			ps.setInt(3, reviewNo);
			int cnt = 0;
			if(!rs.next()) {
				sql = " update review"
						+ " set likecount = +1"
						+ " where userid = ? and revieNo = ?";
				ps = con.prepareStatement(sql);
				ps.setString(1, targetId);
				ps.setInt(2, reviewNo);
				cnt = ps.executeUpdate();
				if(cnt > 0) {
					sql = "insert into likecheck"
							+ "	value(?,?,?)";
					ps.setInt(1, reviewNo);
					ps.setString(2, targetId);
					ps.setString(3, pointId);
					cnt = ps.executeUpdate();
					if(cnt > 0) {
						System.out.println("좋아요 반영 성공 targetid = " + targetId + ", pointId = " + pointId + ", reviewNo = " + reviewNo);
					}
				}
			}else {
				System.out.println("이미 좋아요를 눌렀어요");
			}
			return cnt;
		}finally {
			pool.dbClose(rs, ps, con);
		}
		
	}

	
}










