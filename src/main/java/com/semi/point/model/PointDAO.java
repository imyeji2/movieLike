package com.semi.point.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.semi.db.ConnectionPoolMgr;
import com.semi.member.model.UserVO;

public class PointDAO {
	ConnectionPoolMgr pool;
	
	public PointDAO() {
		pool = new ConnectionPoolMgr();
	}
	
	public List<PointVO> selectPointByUserid(String userid) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = pool.getConnection();
			String sql = "select * from point where userid = ? order by pointregdate";
			ps = con.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery();
			List<PointVO> list = new ArrayList<>();
			while(rs.next()) {
				PointVO vo = new PointVO();
				vo.setPointno(rs.getInt("POINTNO"));
				vo.setPaymentTypeNo(rs.getInt("PAYMENTTYPENO"));
				vo.setUserId(rs.getString("USERID"));
				vo.setPointPrice(rs.getInt("POINTPRICE"));
				vo.setPointRegdate(rs.getTimestamp("POINTREGDATE"));
				vo.setPointKind(rs.getString("POINTKIND"));
				list.add(vo);
			}
			System.out.println("포인트 조회 결과 list = " + list + "매개변수 userid = " + userid);
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	public int refundPoint(int pointNo, int pointPrice,String userid) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
		con = pool.getConnection();
		String sql = "update point"
					+ " set pointkind = '환불', pointPrice = 0 "
					+ " where pointno = ? and userid = ?";
		ps = con.prepareStatement(sql);
		ps.setInt(1, pointNo);
		ps.setString(2, userid);
		
		int cnt = ps.executeUpdate();
		System.out.println("환불 처리 결과 cnt = " + cnt + "매개변수 pointNo = " + pointNo + ", pointPrice = " + -pointPrice + ", userid = " + userid);
		return cnt;
		
		}finally{
			pool.dbClose(ps, con);
		}
	}
	
	public int insertPoint(PointVO vo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = pool.getConnection();
			String sql = "insert into point"
					+ "	values(point_seq.nextval,?,?,?,sysdate,'충전')";
			ps = con.prepareStatement(sql);
			ps.setInt(1,vo.getPaymentTypeNo());
			ps.setString(2, vo.getUserId());
			ps.setInt(3, vo.getPointPrice());
			
			int cnt = ps.executeUpdate();
			
			System.out.println("팝콘 충전 결과 cnt = " + cnt + "매개변수 vo = " + vo);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
}








