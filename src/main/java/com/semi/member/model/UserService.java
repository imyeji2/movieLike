package com.semi.member.model;

import java.sql.SQLException;

public class UserService {
	private UserDAO dao;
	
	public UserService() {
		dao = new UserDAO();
	}
	
	public int insertUser(UserVO vo) throws SQLException {
		return dao.insertUser(vo);
	}
}
