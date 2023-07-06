package com.semi.board.model;

import java.sql.Timestamp;

public class BoardVO {
	private int boardNo;
	private String adminID;
	private String boardTitle;
	private String boardContent;
	private int boardView;
	private Timestamp boardRegdate;
	private String boardCategory;
	private String boardStatus;
	
	public BoardVO() {
		super();
	}

	public BoardVO(int boardNo, String adminID, String boardTitle, String boardContent, int boardView,
			Timestamp boardRegdate, String boardCategory, String boardStatus) {
		super();
		this.boardNo = boardNo;
		this.adminID = adminID;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardView = boardView;
		this.boardRegdate = boardRegdate;
		this.boardCategory = boardCategory;
		this.boardStatus = boardStatus;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getAdminID() {
		return adminID;
	}

	public void setAdminID(String adminID) {
		this.adminID = adminID;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public int getBoardView() {
		return boardView;
	}

	public void setBoardView(int boardView) {
		this.boardView = boardView;
	}

	public Timestamp getBoardRegdate() {
		return boardRegdate;
	}

	public void setBoardRegdate(Timestamp boardRegdate) {
		this.boardRegdate = boardRegdate;
	}

	public String getBoardCategory() {
		return boardCategory;
	}

	public void setBoardCategory(String boardCategory) {
		this.boardCategory = boardCategory;
	}

	public String getBoardStatus() {
		return boardStatus;
	}

	public void setBoardStatus(String boardStatus) {
		this.boardStatus = boardStatus;
	}

	@Override
	public String toString() {
		return "BoardVO [boardNo=" + boardNo + ", adminID=" + adminID + ", boardTitle=" + boardTitle + ", boardContent="
				+ boardContent + ", boardView=" + boardView + ", boardRegdate=" + boardRegdate + ", boardCategory="
				+ boardCategory + ", boardStatus=" + boardStatus + "]";
	}
	
	
}
