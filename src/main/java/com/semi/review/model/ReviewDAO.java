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

public class ReviewDAO {
	private ConnectionPoolMgr pool;

	public ReviewDAO() {
		pool = new ConnectionPoolMgr();
	}

	public Map<ReviewVO,String> selectByUserId(String userid) throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs= null;
		Map<ReviewVO,String> map = new LinkedHashMap<ReviewVO, String>();
		MovieService movieService = new MovieService();
		try {
			con = pool.getConnection();
			String sql = "select * from review where userid = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, userid);

			rs=ps.executeQuery();

			while(rs.next()) {
				ReviewVO vo = new ReviewVO();
				vo.setReviewNo(rs.getInt("reviewno"));
				vo.setMovieNo(rs.getInt("movieno"));
				vo.setUserId(rs.getString("userid"));
				vo.setComments(rs.getString("comments"));
				vo.setLickCount(rs.getInt("likeCount"));
				vo.setGroupNo(rs.getInt("groupno"));
				vo.setStep(rs.getInt("step"));
				vo.setSortNo(rs.getInt("sortno"));
				vo.setViews(rs.getInt("views"));
				vo.setScore(rs.getInt("score"));
				vo.setReviewStatus(rs.getString("reviewstatus"));

				String movieName = movieService.selectByMovieNo(vo.getMovieNo()).getTitle();
				map.put(vo,movieName);

			}
			System.out.println("리뷰 조회 결과 map = " + map + "매개변수 userid = " + userid);
			return map;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	
	public List<ReviewVO> selectByMovieNo(int movieNo) throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<ReviewVO> list = new ArrayList<>();
		try {
			con = pool.getConnection();
			String sql = "select * from review where movieno = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, movieNo);

			rs = ps.executeQuery();
			while(rs.next()) {
				ReviewVO vo = new ReviewVO();
				vo.setReviewNo(rs.getInt("reviewno"));
				vo.setMovieNo(rs.getInt("movieno"));
				vo.setUserId(rs.getString("userid"));
				vo.setComments(rs.getString("comments"));
				vo.setLickCount(rs.getInt("likeCount"));
				vo.setGroupNo(rs.getInt("groupno"));
				vo.setStep(rs.getInt("step"));
				vo.setSortNo(rs.getInt("sortno"));
				vo.setViews(rs.getInt("views"));
				vo.setScore(rs.getInt("score"));
				vo.setReviewStatus(rs.getString("reviewstatus"));

				list.add(vo);
			}
			System.out.println("영화번호로 리뷰조회 결과 list.size = " + list.size() + "매개변수 movieNo = " + movieNo);
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	
	/**
	 * 리뷰를 작성했는지 검사하는 메서드
	 * @return
	 * @throws SQLException 
	 */
	public boolean isReview(int movieno, String userid) throws SQLException {	
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		boolean bool = false;
		try {
			con = pool.getConnection();
			String sql = "select count(reviewno) from review where movieno = ? and userid = ?";
			ps = con.prepareStatement(sql);

			ps.setInt(1, movieno);
			ps.setString(2, userid);
			rs = ps.executeQuery();
			if(rs.next()) {
				if(rs.getInt("count(reviewno)") > 0) {
					System.out.println(movieno + "번 영화는 리뷰 있음");
					bool = true;
				}
			}
			return bool;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	
	/**
	 * 관리자페이지 - 리뷰 전체 보기
	 * @param keyword
	 * @param condition
	 * @return
	 * @throws SQLException
	 */
	public List<ReviewVO> selectAll(String keyword, String condition) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		List<ReviewVO> list = new ArrayList<>();
		try {
			//1,2
			con=pool.getConnection();

			String sql="select * from review ";
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
				
				ReviewVO vo
				=new ReviewVO(reviewNo, movieNo, userid, comments, likeCount, groupno, step, sortno, views, score, reviewstatus);

				list.add(vo);
			}
			System.out.println("글 전체 조회 결과, list.size="+list.size()
				+", 매개변수 keyword="+keyword+", condition="+condition);

			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	public int insertReview(ReviewVO vo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = pool.getConnection();
			String sql = "insert into review(reviewno,movieno,userid,comments)"
					+ " values(review_seq.nextval,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, vo.getMovieNo());
			ps.setString(2, vo.getUserId());
			ps.setString(3, vo.getComments());

			int cnt = ps.executeUpdate();

			System.out.println("리뷰 등록 결과 cnt = " + cnt + "매개변수 vo = " + vo);
			return cnt;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	public int deleteReview(int reviewNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = pool.getConnection();
			String sql = "delete review where reviewno = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, reviewNo);
			int cnt = ps.executeUpdate();
			
			System.out.println("리뷰 삭제 결과 cnt = " + cnt + "매개변수 reviewNo = " + reviewNo);
			return cnt;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}

}










