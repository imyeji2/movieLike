package com.semi.casting.model;

import java.sql.SQLException;

public class CastingService {
	private CastingDAO dao;

	public CastingService() {
		dao = new CastingDAO();
	}
	
	public int insertCasting(CastingVO vo) throws SQLException {
		return dao.insertCasting(vo);
	}
}
