package tastymirim;

import java.sql.*;
import java.util.Vector;

public class SearchDBBean {
	Connection conn;
	PreparedStatement pstmt;
	String sql;
	ResultSet rs;
	
	public SearchDBBean() {}
	
	public Connection getConn() {
		try {
			conn = DBConnection.getConnection();	
		} catch(Exception e){
			e.printStackTrace();
			System.out.println("드라이버 로딩 및 connection 오류");
		}
		
		return conn;
	}
	
	public int getBoardCount() {
		int total = 0;
		try {
			sql = "select count(num) from tblboard";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				total = rs.getInt(1);
			}
		} catch(Exception e){
			e.printStackTrace();
		}
		return total;
	}
	
	public Vector<BoardBean> selectBoard() {
		Vector<BoardBean> vlist = new Vector<BoardBean>();
		sql = "select num, subject, writer, regdate, readcnt, re_level from tblboard order by ref desc, ref_step";
		BoardBean board = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				board = new BoardBean();
				board.setNum(rs.getInt(1));
				board.setSubject(rs.getString(2));
				board.setWriter(rs.getString(3));
				board.setRegdate(rs.getString(4));
				board.setReadcnt(rs.getInt(5));
				board.setRe_level(rs.getInt(6));
				vlist.add(board);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return vlist;
	}
	
	public BoardBean readBoard(int num) {
		BoardBean board = new BoardBean();
		sql = "select * from tblboard where num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				board.setNum(rs.getInt(1));
				board.setWriter(rs.getString(2));
				board.setPass(rs.getString(3));
				board.setRegdate(rs.getString(4));
				board.setEmail(rs.getString(5));
				board.setSubject(rs.getString(6));
				board.setContent(rs.getString(7));
				board.setReadcnt(rs.getInt(8));
				board.setRef(rs.getInt(9));
				board.setRef_step(rs.getInt(10));
				board.setRe_level(rs.getInt(11));
				board.setIp(rs.getString(12));
			}
		
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("안들감");
		}
		return board;
	}
	
	public int updateReadcnt(int num) {
		int result=0;
		sql = "update tblboard set readcnt = readcnt+1 where num=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,num);
			pstmt.executeUpdate();	
			result=1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int insertBoard(BoardBean board) {
		int result = 0;
		try {
			sql = "select max(ref) from tblboard group by ref";
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				int ref=rs.getInt(1);
				board.setRef(ref+1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		try {
			
			sql = "insert into tblboard values(?,?,?,date_format(NOW(), '%Y%m%d%H%i%s'),?,?,?,0,?,0,0,?)";//readcn ref_step re_level = 0
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,0);
			pstmt.setString(2, board.getWriter());
			pstmt.setString(3, board.getPass());
			pstmt.setString(4, board.getEmail());
			pstmt.setString(5, board.getSubject());
			pstmt.setString(6, board.getContent());
			pstmt.setInt(7, board.getRef());
			pstmt.setString(8, board.getIp());
			pstmt.executeUpdate();
			result = 1;
			
		}catch(Exception e) {
			e.printStackTrace();
		}//조회수 0 
	return result;
	}
	
	public int upReply(int ref, int ref_step) {
		int result = 0;
		try {
			sql="UPDATE tblboard SET ref_step = ref_step+1 WHERE ref=? AND ref_step > ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ref );
			pstmt.setInt(2, ref_step);
			pstmt.executeUpdate();
			
			result = 1;
		}catch(Exception e) {
			e.printStackTrace();
		}
	return result;	
	}
	
	public int replyBoard(BoardBean board) {
		int result = 0;
		int ref_step = board.getRef_step()+1;
		int re_level = board.getRe_level()+1;
		try {
			sql = "insert into tblboard values(?,?,?,date_format(NOW(), '%Y%m%d%H%i%s'),?, ?,?,?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, 0);
			pstmt.setString(2, board.getWriter());
			pstmt.setString(3, board.getPass());
			pstmt.setString(4, board.getEmail());
			pstmt.setString(5, board.getSubject());
			pstmt.setString(6, board.getContent());
			pstmt.setInt(7, board.getReadcnt());
			pstmt.setInt(8, board.getRef());
			pstmt.setInt(9, ref_step);
			pstmt.setInt(10, re_level);
			pstmt.setString(11, board.getIp());
			pstmt.executeUpdate();
			
			result = 1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int CheckPass(int num, String pass) {
		int result = 0;
		sql = "select pass from tblboard where num = ?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(pass.equals(rs.getString(1))) {
					result = 1;
				}
				else result = 2;
			}
			else result = 3;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int updateBoard(BoardBean board) {
		int result = 0;
		sql = "update tblboard set pass = ?, email=?, content=?, ip=? where num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getPass());
			pstmt.setString(2, board.getEmail());
			pstmt.setString(3, board.getContent());
			pstmt.setString(4, board.getIp());
			pstmt.setInt(5, board.getNum());
			pstmt.executeUpdate();
			result = 1;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int deleteBoard(int num) {
		int result = 0;
		int ref =0;
		int re_level=0;
		sql = "select ref, re_level from tblboard where num = ?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ref = rs.getInt(1);
				re_level = rs.getInt(2);

				if(re_level == 0) {
					sql = "delete from tblboard where ref=?";
					pstmt=conn.prepareStatement(sql);
					pstmt.setInt(1, ref);
					pstmt.executeUpdate();
					result = 1;
				}
				else {
					sql = "delete from tblboard where num=?";
					pstmt=conn.prepareStatement(sql);
					pstmt.setInt(1, num);
					pstmt.executeUpdate();
					result=1;
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
