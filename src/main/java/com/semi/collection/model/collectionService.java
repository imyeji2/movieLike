package com.semi.collection.model;

import java.sql.SQLException;

public class collectionService {
	private collectionDAO dao;

	public collectionService() {
		dao = new collectionDAO();
	}
	
	public int insertCollection(collectionVO vo) throws SQLException {
		return dao.insertCollection(vo);
	}
	
}
