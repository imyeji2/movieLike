package com.semi.casting.model;

import java.sql.SQLException;
import java.util.List;

public class CastingService {
	private CastingDAO dao;

	public CastingService() {
		dao = new CastingDAO();
	}

	public List<CastingVO> selectCastingByMovieNo(int movieNo) throws SQLException {
		return dao.selectCastingByMovieNo(movieNo);

	}
	public int insertCasting(CastingVO vo) throws SQLException {
		return dao.insertCasting(vo);
	}
}