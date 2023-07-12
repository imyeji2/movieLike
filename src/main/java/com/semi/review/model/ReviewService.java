package com.semi.review.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class ReviewService {
	private ReviewDAO reviewDao;
	
	public ReviewService() {
		reviewDao = new ReviewDAO();
	}

	public Map<ReviewVO,String> selectByUserId(String userid) throws SQLException{
		return reviewDao.selectByUserId(userid);
	}
	public List<ReviewVO> selectByMovieNo(int movieNo) throws SQLException{
		return reviewDao.selectByMovieNo(movieNo);
	}
	public boolean isReview(int movieno, String userid) throws SQLException {	
		return reviewDao.isReview(movieno, userid);
	}
	public int insertReview(ReviewVO vo) throws SQLException {
		return reviewDao.insertReview(vo);
	}
	public int deleteReview(int reviewNo) throws SQLException {
		return reviewDao.deleteReview(reviewNo);
	}
}
