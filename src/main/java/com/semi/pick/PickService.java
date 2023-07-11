package com.semi.pick;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.semi.movie.model.MovieVO;
import com.semi.review.model.ReviewVO;

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
	public int insertPick(int movieNo,String userid ) throws SQLException {
		return pickDao.insertPick(movieNo, userid);
	}
	public int deletePick(int movieNo,String userid) throws SQLException {
		return pickDao.deletePick(movieNo, userid);
	}
}
