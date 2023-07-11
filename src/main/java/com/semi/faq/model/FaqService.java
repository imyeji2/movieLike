package com.semi.faq.model;

import java.sql.SQLException;
import java.util.List;

import com.semi.actor.model.ActorVO;

public class FaqService {
	private FaqDAO faqDao;

	public FaqService(){
		faqDao = new FaqDAO();
	}
	
	public FaqVO selectByNo(int boardNo) throws SQLException {
		return faqDao.selectByNo(boardNo);
	}
	
	public int deleteBoard(int boardNo) throws SQLException {
		return faqDao.deleteBoard(boardNo);
	}
}
