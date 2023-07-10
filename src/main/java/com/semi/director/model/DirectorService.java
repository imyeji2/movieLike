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
	
	public DirectorVO selectByDirectorNo(int no) throws SQLException {
		return directorDao.selectByDirectorNo(no);
	}
	
	public int chekByDirectorName(String name) throws SQLException {
		return directorDao.chekByDirectorName(name);
	}
	
	
	public int updateDirector(DirectorVO vo) throws SQLException {
		return directorDao.updateDirector(vo);
	}
	
	public int deleteDirector(int dirctorNo) throws SQLException {
		return directorDao.deleteDirector(dirctorNo);
	}
}
