package com.semi.collection.model;

import java.sql.SQLException;

public class CollectionService {
	private CollectionDAO dao;

	public CollectionService() {
		dao = new CollectionDAO();
	}
	
	public int insertCollection(CollectionVO vo) throws SQLException {
		return dao.insertCollection(vo);
	}
	
}
