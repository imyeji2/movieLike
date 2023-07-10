package com.semi.casting.model;

import java.sql.SQLException;

public class CastingService {
	private CastingDAO dao;

	public CastingService() {
		dao = new CastingDAO();
	}
	
	public CastingVO selectCastingByMovieNo(int movieNo) throws SQLException {
		return dao.selectCastingByMovieNo(movieNo);
	}
	
	
}
