package com.semi.casting.model;

public class CastingListVO {
	private int castingNo;
	private int actorNo;
	private int movieNo;
	private String actorName;
	private String actorImg;
	
	
	public CastingListVO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public CastingListVO(int castingNo, int actorNo, int movieNo, String actorName, String actorImg) {
		super();
		this.castingNo = castingNo;
		this.actorNo = actorNo;
		this.movieNo = movieNo;
		this.actorName = actorName;
		this.actorImg = actorImg;
	}


	public int getCastingNo() {
		return castingNo;
	}


	public void setCastingNo(int castingNo) {
		this.castingNo = castingNo;
	}


	public int getActorNo() {
		return actorNo;
	}


	public void setActorNo(int actorNo) {
		this.actorNo = actorNo;
	}


	public int getMovieNo() {
		return movieNo;
	}


	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}


	public String getActorName() {
		return actorName;
	}


	public void setActorName(String actorName) {
		this.actorName = actorName;
	}


	public String getActorImg() {
		return actorImg;
	}


	public void setActorImg(String actorImg) {
		this.actorImg = actorImg;
	}


	@Override
	public String toString() {
		return "CastingListVO [castingNo=" + castingNo + ", actorNo=" + actorNo + ", movieNo=" + movieNo
				+ ", actorName=" + actorName + ", actorImg=" + actorImg + "]";
	}
	
	
}

