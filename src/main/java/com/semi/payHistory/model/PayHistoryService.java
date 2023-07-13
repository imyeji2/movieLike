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
	public Map<String, Integer> chartValue(String userid) throws SQLException{
		return pointHistoryDao.chartValue(userid);
	}
	public int insertPayHistory(int movieNo, String userid) throws SQLException {
		return pointHistoryDao.insertPayHistory(movieNo, userid);
	}
	public Map<String, Integer> getRankByTitle() throws SQLException {
		return pointHistoryDao.getRankByTitle();
	}
	public int totalMovieIncome() throws SQLException {
		return pointHistoryDao.totalMovieIncome();
	}
}
