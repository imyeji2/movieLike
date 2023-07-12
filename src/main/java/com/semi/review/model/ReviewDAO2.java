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
}










