package com.semi.actor.model;

public class ActorVO {
	private int actorNo;
	private String actorName;
	private String actorImg;
	
	public ActorVO() {
		super();
	}
	public ActorVO(int actorNo, String actorName, String actorImg) {
		super();
		this.actorNo = actorNo;
		this.actorName = actorName;
		this.actorImg = actorImg;
	}
	public int getActorNo() {
		return actorNo;
	}
	public void setActorNo(int actorNo) {
		this.actorNo = actorNo;
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
		return "ActorVO [actorNo=" + actorNo + ", actorName=" + actorName + ", actorImg=" + actorImg + "]";
	}
	
	
}
