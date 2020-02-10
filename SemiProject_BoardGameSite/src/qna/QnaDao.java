package qna;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.QnaDto;

public class QnaDao {

	private static QnaDao dao = new QnaDao();
	
	private QnaDao() {
		
	}

	public static QnaDao getInstance() {
		return dao;
	}

	public List<QnaDto> getQnaList() {
		
		String sql = " SELECT SEQ, ID, TITLE, CONTENT, WDATE, READCOUNT, IS_SECRET, IS_ANSWER, DEL, BESTQNA "
				   + " FROM BG_QNA "
				   + " ORDER BY WDATE ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<QnaDto> list = new ArrayList<QnaDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getQnaList success");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getQnaList success");
			rs = psmt.executeQuery();
			System.out.println("3/6 getQnaList success");
			
			while (rs.next()) {
				int i = 1;
				QnaDto dto = new QnaDto( rs.getInt(i++),
										 rs.getString(i++),
										 rs.getString(i++),
										 rs.getString(i++),
										 rs.getString(i++),
										 rs.getInt(i++),
										 rs.getInt(i++),
										 rs.getInt(i++),
										 rs.getInt(i++),
										 rs.getInt(i++)	);
				list.add(dto);				
			}
			System.out.println("4/6 getQnaList success");
			
		} catch (SQLException e) {
			System.out.println("getQnaList fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);			
		}		
		return list;
	}

	public boolean setQnaWrite(QnaDto dto) {
		
		String sql = " INSERT INTO BG_QNA (SEQ, ID, TITLE, CONTENT, WDATE, READCOUNT, IS_SECRET, IS_ANSWER, DEL, BESTQNA )"
				   + " VALUES (SEQ_BG_QNA.NEXTVAL, ?, ?, ?, SYSDATE, 0, ?, 0, 0, 0) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
			
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 setQnaWrite Success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 setQnaWrite Success");
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setInt(4, dto.getIs_secret());
			
			count = psmt.executeUpdate();
			System.out.println("3/6 setQnaWrite Success");
			
		} catch (SQLException e) {
			System.out.println("setQnaWrite fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);			
		}
		return count>0?true:false;
	}
}
