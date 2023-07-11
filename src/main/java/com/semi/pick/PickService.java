package com.semi.pick;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.semi.movie.model.MovieVO;

public class PickService {
	private PickDAO pickDao;

	public PickService() {
		pickDao = new PickDAO();
	}

	public Map<PickVO, MovieVO> selectPickByUserId(String userid) throws SQLException{
		return pickDao.selectPickByUserId(userid);
	}
	public List<PickVO> selectPick(String userid) throws SQLException{
		return pickDao.selectPick(userid);
	}
}
