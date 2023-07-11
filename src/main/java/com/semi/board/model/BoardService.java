package com.semi.board.model;

import java.sql.SQLException;
import java.util.List;

import com.semi.actor.model.ActorVO;

public class BoardService {
	private BoardDAO boardDao;

	public BoardService(){
		boardDao = new BoardDAO();
	}
	
	public BoardVO selectByNo(int boardNo) throws SQLException {
		return boardDao.selectByNo(boardNo);
	}
	
	public int deleteBoard(int boardNo) throws SQLException {
		return boardDao.deleteBoard(boardNo);
	}
}
