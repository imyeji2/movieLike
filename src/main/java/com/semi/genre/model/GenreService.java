package com.semi.genre.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class GenreService {
	private GenreDAO dao;

	public GenreService() {
		dao= new GenreDAO();
	}
	
	public List<GenreVO> selectGenreAll() throws SQLException{
		return dao.selectGenreAll();
	}

	public int insertGenre(GenreVO vo) throws SQLException {
		return dao.insertGenre(vo);
	}
	
}
