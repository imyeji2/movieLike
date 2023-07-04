package com.semi.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.semi.db.ConnectionPoolMgr;

public class UserDAO {
	ConnectionPoolMgr pool;
	
	public UserDAO() {
		pool = new ConnectionPoolMgr();
	}

	
}
