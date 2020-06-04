package tastymirim;

import java.sql.*;

public class ReviewDBBoard {
	private final String JDBC_DRIVER = "org.gjt.mm.mysql.Driver";
	private final String JDBC_URL = "jdbc:mysql://localhost:3306/tastymirim";
	private final String USER = "root";
	private final String PASS = "mirim2";
	
	Connection conn;
	PreparedStatement pstmt;
	String sql;
	ResultSet rs;
	
	public ReviewDBBoard() {
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDate() {
		sql = "SELECT NOW()";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "";	//데이터베이스 오류
	}
	
	public int getNext() {
		sql = "SELECT no FROM review ORDER BY no DESC";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			
			return 1;	//첫 번째 게시물인 경우
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -1;	//데이터베이스 오류
	}
	
	public int write(ReviewBoard board) {
		int result = 0;
		
		sql = "INSERT INTO review VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, 0);
			pstmt.setString(2, board.getId());
			pstmt.setString(3, board.getName());
			pstmt.setInt(4, board.getResnum());
			pstmt.setInt(5, board.getGrade());
			pstmt.setString(6, board.getContent());
			pstmt.setString(7, board.getPhoto());
			pstmt.setString(8, getDate());
			
			pstmt.executeUpdate();
			
			result = 1;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public void freeConn() {
		if(pstmt != null) {
			try {
				pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		if(conn != null) {
			try {
				conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
}