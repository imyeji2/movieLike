package com.semi.movie.model;

import java.sql.SQLException;
import java.util.List;

public class MovieListService {
	private MovieListDAO dao;

	public MovieListService() {
		dao = new MovieListDAO();
		
	}
	
	public List<MovieListVO> selectMovieAll() throws SQLException{
		return dao.selectMovieAll();
	}
	
	public List<MovieListVO> selectMovieByGenre(int genreNo) throws SQLException {
		return dao.selectMovieByGenre(genreNo);
	}
	
	public List<MovieListVO> selectMovieByTitle(String serch) throws SQLException {
		return dao.selectMovieByTitle(serch);
	}
	
	
	public MovieListVO selectMovie(int movieNo) throws SQLException{
		return dao.selectMovie(movieNo);
	}
}
