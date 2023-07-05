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
}
