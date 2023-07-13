package com.semi.casting.model;

import java.sql.SQLException;
import java.util.List;

public class CastingListService {
	private CastingListDAO dao;

	public CastingListService() {
		dao = new CastingListDAO();
	}
	
	
	public List<CastingListVO> selectCastingMovie(int movieNo) throws SQLException{
		return dao.selectCastingMovie(movieNo);
	}
	
	
	
	
}
