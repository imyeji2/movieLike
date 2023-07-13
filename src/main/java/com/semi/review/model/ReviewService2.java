package com.semi.review.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class ReviewService2 {
	private ReviewDAO2 reviewDao2;
	
	public ReviewService2() {
		reviewDao2 = new ReviewDAO2();
	}

	public List<ReviewVO2> selectAll(String keyword, String condition) throws SQLException{
		return reviewDao2.selectAll(keyword, condition);
	}
	
	public int deleteReview(int reviewNo) throws SQLException {
		return reviewDao2.deleteReview(reviewNo);
	}
}
