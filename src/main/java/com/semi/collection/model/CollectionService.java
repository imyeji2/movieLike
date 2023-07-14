package com.semi.collection.model;

import java.sql.SQLException;
import java.util.List;

public class CollectionService {
	private CollectionDAO dao;

	public CollectionService() {
		dao = new CollectionDAO();
	}
	
	public int insertCollection(CollectionVO vo) throws SQLException {
		return dao.insertCollection(vo);
	}
	
	public List<CollectionVO> selectCollectionTitle(String title) throws SQLException { 
		return dao.selectCollectionTitle(title);
	}
}
