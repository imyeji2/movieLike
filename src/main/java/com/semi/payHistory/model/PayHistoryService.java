package com.semi.payHistory.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class PayHistoryService {

	private PayHistoryDAO pointHistoryDao;
	
	public PayHistoryService() {
		pointHistoryDao = new PayHistoryDAO();
	}
	public Map<PayHistoryVO, Integer> selectHistoryByUserid(String userid) throws SQLException{
		return pointHistoryDao.selectHistoryByUserid(userid);
		
	}
}
