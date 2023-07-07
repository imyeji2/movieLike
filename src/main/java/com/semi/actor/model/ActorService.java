package com.semi.actor.model;

import java.sql.SQLException;
import java.util.List;

public class ActorService {
	ActorDAO actorDao = new ActorDAO();
	
	public int insertActor(ActorVO vo) throws SQLException {
		return actorDao.insertActor(vo);
	}
	
	public List<ActorVO> selectActorAll() throws SQLException{
		return actorDao.selectActorAll();
	}
}
