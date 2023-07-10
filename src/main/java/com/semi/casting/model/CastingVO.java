package com.semi.casting.model;

public class CastingVO {
	private int castingNo; 
	private int actorNo;
	private int movieNo;

	
	public CastingVO() {
		super();
	}
	public CastingVO(int castingNo, int actorNo, int movieNo) {
		super();
		this.castingNo = castingNo;
		this.actorNo = actorNo;
		this.movieNo = movieNo;
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
	@Override
	public String toString() {
		return "CastingVO [castingNo=" + castingNo + ", actorNo=" + actorNo + ", movieNo=" + movieNo + "]";
	} 
	
	

}
