package com.semi.member.model;

import java.sql.SQLException;

public class UserService {
	private UserDAO dao;
	
	//아이디 중복 체크 관련 상수
	public static final int USABLE_ID = 1; //사용가능
	public static final int UNUSABLE_ID = 2; //이미 존재 사용불가
	
	
	//로그인 처리 상수
	public static final int LOGIN_OK = 1; //성공
	public static final int DISAGREE_PWD = 2; // 비번불일치
	public static final int NONE_ID = 3; // 아이디 없음
	
	
	public UserService() {
		dao = new UserDAO();
	}
	public int insertUser(UserVO vo) throws SQLException {
		return dao.insertUser(vo);
	}
	public int duplicatedId(String userId) throws SQLException {
		return dao.duplicatedId(userId);
	}
}
