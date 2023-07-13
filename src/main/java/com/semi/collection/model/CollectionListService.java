package com.semi.collection.model;

import java.sql.SQLException;
import java.util.List;

public class CollectionListService {
	private CollectionListDAO dao;

	public CollectionListService() {
		dao = new CollectionListDAO();
	}
	
	public List<CollectionListVO> selectCollectionAll() throws SQLException{
		return dao.selectCollectionAll();
	}
	
	public List<CollectionListVO> serchCollectionAll(String serch) throws SQLException{
		return dao.serchCollectionAll(serch);
	}
	
}
