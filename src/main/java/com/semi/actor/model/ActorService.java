package com.semi.actor.model;

import java.sql.SQLException;
import java.util.List;

public class ActorService {
	private ActorDAO actorDao;
	
	public ActorService() {
		actorDao = new ActorDAO();
	}
	
	public int insertActor(ActorVO vo) throws SQLException {
		return actorDao.insertActor(vo);
	}
	
	public List<ActorVO> selectActorAll() throws SQLException{
		return actorDao.selectActorAll();
	}
	
	public int chekByActorName(String name) throws SQLException {
		return actorDao.chekByActorName(name);
	}
	
	public ActorVO selectByActorNo(int no) throws SQLException {
		return actorDao.selectByActorNo(no);
	}
	
	public int deleteActor(int actorNo) throws SQLException {
		return actorDao.deleteActor(actorNo);
	}
	
	public int updateActor(ActorVO vo) throws SQLException {
		return actorDao.updateActor(vo);
	}
}
