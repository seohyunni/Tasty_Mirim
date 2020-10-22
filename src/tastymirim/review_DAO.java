package tastymirim;

import java.sql.*;
import java.util.ArrayList;

import tastymirim.DBConnection;
import tastymirim.*;

public class review_DAO {
	final private String JDBC_DRIVER ="com.mysql.jdbc.Driver";
	final private String JDBC_URL = "jdbc:mysql://localhost:3306/tastymirim?useUnicode=true&characterEncoding=UTF-8";
	final private String USER ="tastymirim";
	final private String PASS = "h4HX6ASpP2SeOrmw";
	private java.sql.Connection conn;
	private java.sql.PreparedStatement pstmt;
	private String sql;
	private ResultSet rs;
	
	public review_DAO() {
		try {
		  Class.forName(JDBC_DRIVER);
		  conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("드라이브 및 connection 오류");
		}
	}
	
	public Connection getConn() {
		try {
			conn = DBConnection.getConnection();	
		} catch(Exception e){
			e.printStackTrace();
			System.out.println("드라이버 로딩 및 connection 오류");
		}
		
		return conn;
	}
	
	// 빈객체를 매개변수로 받는다.
	// 리뷰작성
	public void review_write(review_Bean bean) {

		try {

			// SQL 문
			String sql = "INSERT INTO review VALUES(?, ?, ?, ?, ?, ?, ?, now())";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, 0);
			psmt.setString(2, bean.getUser_id());
			psmt.setString(3, bean.getUser_name());
			psmt.setInt(4, bean.getRes_num());
			psmt.setString(5, bean.getReview_content());
			psmt.setString(6, bean.getReview_photo());
			psmt.setInt(7, bean.getReview_star());
			// SQL 실행
			psmt.executeUpdate();


		} catch (Exception e) {
			e.printStackTrace();
		}

	} // review_write()

	// 모든 리뷰글들을 불러온다.
	public ArrayList<review_Bean> review_get(int res_num2) {
		System.out.println("어레이리스트 1");
		// Arraylist 생성
		// 빈객체를 담을 arraylist
		ArrayList<review_Bean> list = new ArrayList<review_Bean>();
		System.out.println("어레이리스트 2");
		try {

			// SQL
			// 리뷰게시판에 모든 데이터를 불러온다.
			String sql =  "select * FROM review where res_num ="+res_num2+" ORDER BY review_num DESC";

			System.out.println("어레이리스트3");
			System.out.println(res_num2);
			//Statement stmt = conn.createStatement();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			// SQL 실행
			ResultSet rs = pstmt.executeQuery();

			// rs.next() 값이 있으면 투루를 반환.
			while (rs.next()) {

				int review_num = rs.getInt("review_num"); // 글 번호
				String user_id = rs.getString("user_id"); // 작성자 ID
				String user_name = rs.getString("user_name"); // 작성자 이름
				int res_num = rs.getInt("res_num"); // 식당번호
				String review_content = rs.getString("review_content"); // 리뷰 내용
				String review_photo = rs.getString("review_photo"); // 조회수
				int review_star = rs.getInt("review_star"); // 별점
				Date review_regdate = rs.getDate("review_regdate"); // 리뷰 작성일

				System.out.println("어레이리스트5");
				// 빈객체 생성
				review_Bean bean = new review_Bean();

				bean.setReview_num(review_num);
				bean.setUser_id(user_id);
				bean.setUser_name(user_name);
				bean.setRes_num(res_num);
				bean.setReview_content(review_content);
				bean.setReview_photo(review_photo);
				bean.setReview_star(review_star);
				bean.setReview_regdate(review_regdate);

				list.add(bean);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}
	
	public ArrayList<review_Bean> review_get2(String user_id2) {
		// Arraylist 생성
		// 빈객체를 담을 arraylist
		ArrayList<review_Bean> list = new ArrayList<review_Bean>();
		try {

			// SQL
			// 리뷰게시판에 모든 데이터를 불러온다.
			String sql =  "select * FROM review where user_id ="+user_id2+" ORDER BY review_num DESC";
			//Statement stmt = conn.createStatement();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			// SQL 실행
			ResultSet rs = pstmt.executeQuery();

			// rs.next() 값이 있으면 투루를 반환.
			while (rs.next()) {

				int review_num = rs.getInt("review_num"); // 글 번호
				String user_id = rs.getString("user_id"); // 작성자 ID
				String user_name = rs.getString("user_name"); // 작성자 이름
				int res_num = rs.getInt("res_num"); // 식당번호
				String review_content = rs.getString("review_content"); // 리뷰 내용
				String review_photo = rs.getString("review_photo"); // 조회수
				int review_star = rs.getInt("review_star"); // 별점
				Date review_regdate = rs.getDate("review_regdate"); // 리뷰 작성일

				// 빈객체 생성
				review_Bean bean = new review_Bean();

				bean.setReview_num(review_num);
				bean.setUser_id(user_id);
				bean.setUser_name(user_name);
				bean.setRes_num(res_num);
				bean.setReview_content(review_content);
				bean.setReview_photo(review_photo);
				bean.setReview_star(review_star);
				bean.setReview_regdate(review_regdate);

				list.add(bean);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}
	

	// 페이지 수를 구하는 메서드
	// 총 레코드수(게시글 수)를 구함.
	public int review_getPageCount(int res_num) throws Exception {

		// 쿼리문
		String sql = "SELECT COUNT(*) FROM review where res_num ="+res_num;

		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();

		// 전체 글의 개수를 가져온다.
		int cnt = rs.getInt(1);


		// 총 페이지 개수 리턴
		return cnt;

	}

	// 리뷰글을 읽어오는 메서드
	public review_Bean review_read(int num) throws Exception {

		// 빈객체 생성
		review_Bean bean = new review_Bean();

		// SQL
		String sql = "SELECT * FROM rivew WHERE review_num=" + num;

		Statement stmt = conn.createStatement();

		ResultSet rs = stmt.executeQuery(sql);

		while (rs.next()) {

			int review_num = rs.getInt("review_num"); // 글 번호
			String user_id = rs.getString("user_id"); // 작성자 ID
			String user_name = rs.getString("user_name"); // 작성자 이름
			int res_num = rs.getInt("res_num"); // 식당번호
			String review_content = rs.getString("review_content"); // 리뷰 내용
			String review_photo = rs.getString("review_photo"); // 조회수
			int review_star = rs.getInt("review_star"); // 별점
			Date review_regdate = rs.getDate("review_regdate"); // 리뷰 작성일

			bean.setReview_num(review_num);
			bean.setUser_id(user_id);
			bean.setUser_name(user_name);
			bean.setRes_num(res_num);
			bean.setReview_content(review_content);
			bean.setReview_photo(review_photo);
			bean.setReview_star(review_star);
			bean.setReview_regdate(review_regdate);

		}


		return bean;

	}
	
	
	public int  review_delete(int num) throws Exception{
		int result=0;
		try {
		// SQL
			conn = DBConnection.getConnection();
		String sql = "DELETE FROM review WHERE review_num=" + num;

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();
		result =1;
	} catch (Exception e) {
		e.printStackTrace();
	}
		return result;
	}

	

}
