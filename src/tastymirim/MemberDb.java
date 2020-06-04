package tastymirim;

import java.sql.DriverManager;
import java.sql.ResultSet;

public class MemberDb {
	final private String JDBC_DRIVER ="org.gjt.mm.mysql.Driver";
	final private String JDBC_URL = "jdbc:mysql://localhost:3306/tastymirim";
	final private String USER ="root";
	final private String PASS = "mirim2";
	private java.sql.Connection conn;
	private java.sql.PreparedStatement pstmt;
	private String sql;
	private ResultSet rs;
	
	public MemberDb() {
		try {
		  Class.forName(JDBC_DRIVER);
		  conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("드라이브 및 connection 오류");
		}
	}
	
	public void insertMember(Member member) {
		//데이터가져서 db에 때ㅎ러넘
		try {
			sql = "insert into member values(?,?,?,null,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getProfile());
			pstmt.setString(4, member.getEmail());
			System.out.print("없으면 느라고");
			
		pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	

	
	public Member selectMember(String id) {
		Member member = new Member();
		try {
			sql = "select * from member where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,  id);		
			rs = pstmt.executeQuery();
			if(rs.next()) {
			member.setId(rs.getString("id"));
			member.setName(rs.getString("name"));
			member.setProfile(rs.getString("profile"));
			member.setTitle(rs.getString("title"));
			member.setEmail(rs.getString("email"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return member;
	}
	
	public int selectId(String inId) {
		int result=1;
		String id = "";
		
		try {
			sql = "select id from member where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,  inId);		
			rs = pstmt.executeQuery();
			if(rs.next()){
				id = rs.getString("id");
				result =1; //중복
			}else {
				result = 2; //없음@
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println(result);
		return result;		
	}
	
	public int deleteMember(String id) {
		int result=0;
		try {
			sql = "delete from member where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			result = 1;
		}catch(Exception e) {
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
