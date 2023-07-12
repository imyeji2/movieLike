package com.semi.point.model;

import java.sql.SQLException;
import java.util.List;

public class PointService {
	
	private PointDAO pointDao;

	public PointService() {
		pointDao = new PointDAO();
	}
	
	public List<PointVO> selectPointByUserid(String userid) throws SQLException {
		return pointDao.selectPointByUserid(userid);
	}
	public int refundPoint(int pointNo, int pointPrice, String userid) throws SQLException {
		return pointDao.refundPoint(pointNo, pointPrice, userid);
	}
	public int insertPoint(PointVO vo) throws SQLException {
		return pointDao.insertPoint(vo);
	}
	public int totalPrice() throws SQLException {
		return pointDao.totalPrice();
	}
	
}
