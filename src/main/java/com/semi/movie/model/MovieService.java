package com.semi.movie.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

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
	
	public int insertMovie(MovieVO vo) throws SQLException {
		return movieDao.insertMovie(vo);
	}
	
	public MovieVO selectMovieByNo(String title) throws SQLException {
		return movieDao.selectMovieByTitle(title);
	}
	
	public Map<String, Integer> getRankByCategory() throws SQLException {
		return movieDao.getRankByCategory();
	}
	
	public List<MovieVO> serchtMovie(String serch) throws SQLException{
		return movieDao.serchtMovie(serch);
	}
}
