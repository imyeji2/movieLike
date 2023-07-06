package com.semi.movie.model;

import java.sql.Timestamp;

public class MovieVO {
	private int movieNo;            
	private int genreNo;            
	private String title;       
	private String runningTime;  
	private String synop;       
	private String poster;      
	private String url;         
	private int price;              
	private Timestamp opendate;     
	private int ageRate;            
	private Timestamp regdate;      
	private int directorNo1;         
	private int directorNo2;         
	private String movieStatus;
	
	public MovieVO() {
		super();
	}

	public MovieVO(int movieNo, int genreNo, String title, String runningTime, String synop, String poster, String url,
			int price, Timestamp opendate, int ageRate, Timestamp regdate, int directorNo1, int directorNo2,
			String movieStatus) {
		super();
		this.movieNo = movieNo;
		this.genreNo = genreNo;
		this.title = title;
		this.runningTime = runningTime;
		this.synop = synop;
		this.poster = poster;
		this.url = url;
		this.price = price;
		this.opendate = opendate;
		this.ageRate = ageRate;
		this.regdate = regdate;
		this.directorNo1 = directorNo1;
		this.directorNo2 = directorNo2;
		this.movieStatus = movieStatus;
	}

	public int getMovieNo() {
		return movieNo;
	}

	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}

	public int getGenreNo() {
		return genreNo;
	}

	public void setGenreNo(int genreNo) {
		this.genreNo = genreNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getRunningTime() {
		return runningTime;
	}

	public void setRunningTime(String runningTime) {
		this.runningTime = runningTime;
	}

	public String getSynop() {
		return synop;
	}

	public void setSynop(String synop) {
		this.synop = synop;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Timestamp getOpendate() {
		return opendate;
	}

	public void setOpendate(Timestamp opendate) {
		this.opendate = opendate;
	}

	public int getAgeRate() {
		return ageRate;
	}

	public void setAgeRate(int ageRate) {
		this.ageRate = ageRate;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public int getDirectorNo1() {
		return directorNo1;
	}

	public void setDirectorNo1(int directorNo1) {
		this.directorNo1 = directorNo1;
	}

	public int getDirectorNo2() {
		return directorNo2;
	}

	public void setDirectorNo2(int directorNo2) {
		this.directorNo2 = directorNo2;
	}

	public String getMovieStatus() {
		return movieStatus;
	}

	public void setMovieStatus(String movieStatus) {
		this.movieStatus = movieStatus;
	}

	@Override
	public String toString() {
		return "MovieVO [movieNo=" + movieNo + ", genreNo=" + genreNo + ", title=" + title + ", runningTime="
				+ runningTime + ", synop=" + synop + ", poster=" + poster + ", url=" + url + ", price=" + price
				+ ", opendate=" + opendate + ", ageRate=" + ageRate + ", regdate=" + regdate + ", directorNo1="
				+ directorNo1 + ", directorNo2=" + directorNo2 + ", movieStatus=" + movieStatus + "]";
	}
}
