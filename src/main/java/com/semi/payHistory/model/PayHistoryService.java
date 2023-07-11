package com.semi.payHistory.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class PayHistoryService {

	private PayHistoryDAO pointHistoryDao;
	
	public PayHistoryService() {
		pointHistoryDao = new PayHistoryDAO();
	}
	public Map<PayHistoryVO, String> selectHistoryByUserid(String userid) throws SQLException{
		return pointHistoryDao.selectHistoryByUserid(userid);
	}
	public Map<Integer, Integer> chartValue(String userid) throws SQLException{
		return pointHistoryDao.chartValue(userid);
	}
	public int insertPayHistory(int movieNo, String userid) throws SQLException {
		return pointHistoryDao.insertPayHistory(movieNo, userid);
	}
}
