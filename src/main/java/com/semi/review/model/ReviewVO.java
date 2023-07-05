package com.semi.review.model;

public class ReviewVO {
	private int reviewNo;
	private int	movieNo;
	private String userId;
	private String comments;
	private int lickCount;
	private int groupNo;
	private int step;
	private int sortNo;
	private int views;
	private int score;
	private String reviewStatus;
	
	public ReviewVO() {
		super();
	}

	public ReviewVO(int reviewNo, int movieNo, String userId, String comments, int lickCount, int groupNo, int step,
			int sortNo, int views, int score, String reviewStatus) {
		super();
		this.reviewNo = reviewNo;
		this.movieNo = movieNo;
		this.userId = userId;
		this.comments = comments;
		this.lickCount = lickCount;
		this.groupNo = groupNo;
		this.step = step;
		this.sortNo = sortNo;
		this.views = views;
		this.score = score;
		this.reviewStatus = reviewStatus;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getMovieNo() {
		return movieNo;
	}

	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public int getLickCount() {
		return lickCount;
	}

	public void setLickCount(int lickCount) {
		this.lickCount = lickCount;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getSortNo() {
		return sortNo;
	}

	public void setSortNo(int sortNo) {
		this.sortNo = sortNo;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getReviewStatus() {
		return reviewStatus;
	}

	public void setReviewStatus(String reviewStatus) {
		this.reviewStatus = reviewStatus;
	}

	@Override
	public String toString() {
		return "ReviewVO [reviewNo=" + reviewNo + ", movieNo=" + movieNo + ", userId=" + userId + ", comments="
				+ comments + ", lickCount=" + lickCount + ", groupNo=" + groupNo + ", step=" + step + ", sortNo="
				+ sortNo + ", views=" + views + ", score=" + score + ", reviewStatus=" + reviewStatus + "]";
	}

	
	
	
}
