package com.semi.movie.model;

import java.sql.SQLException;
import java.util.List;

public class MovieService {
	private MovieDAO movieDao;

	public MovieService() {
		movieDao = new MovieDAO();
	}

	public MovieVO selectByMovieNo(int movieNo) throws SQLException {
		return movieDao.selectByMovieNo(movieNo);
	}
	
	public List<MovieVO> selectMovieAll() throws SQLException{
		return movieDao.selectMovieAll();
	}
}
