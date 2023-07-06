package com.semi.director.model;

import java.sql.SQLException;
import java.util.List;

public class DirectorService {
	private DirectorDAO directorDao;

	public DirectorService() {
		directorDao = new DirectorDAO();
	}
	
	
	public int insertDirector(DirectorVO vo) throws SQLException {
		return directorDao.insertDirector(vo);
	}
	
	public List<DirectorVO> selectDirectorAll() throws SQLException{
		return directorDao.selectDirectorAll();
	}
	
}
