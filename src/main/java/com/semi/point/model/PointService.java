package com.semi.point.model;

import java.sql.SQLException;
import java.util.List;

public class PointService {
	
	private PointDAO pointDao;

	public PointService(PointDAO pointDao) {
		pointDao = new PointDAO();
	}
	
	public List<PointVO> selectPointByUserid(String userid) throws SQLException {
		return pointDao.selectPointByUserid(userid);
	}
	
	
}
