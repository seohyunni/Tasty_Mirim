package tastymirim;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import tastymirim.DBConnection;

public class resDB {
	final private String JDBC_DRIVER ="com.mysql.jdbc.Driver";
	final private String JDBC_URL = "jdbc:mysql://localhost:3306/tastymirim?useUnicode=true&characterEncoding=UTF-8";
	final private String USER ="tastymirim";
	final private String PASS = "h4HX6ASpP2SeOrmw";
	private java.sql.Connection conn;
	private java.sql.PreparedStatement pstmt;
	private String sql;
	private ResultSet rs;
	
	public resDB() {
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
	
	

	
	public resBean selectRes(int res_num) {
		resBean res= new resBean();
		try {
			sql = "select * from res where resnum = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, res_num);		
			rs = pstmt.executeQuery();
			if(rs.next()) {
			res.setResnum(rs.getInt("resnum"));
			res.setResname(rs.getString("resname"));
			res.setImage(rs.getString("image"));
			res.setLocation(rs.getString("location"));
			System.out.println("Location : "+ rs.getString("location"));
			res.setRescontent(rs.getString("rescontent"));
			System.out.println("Location : "+ rs.getString("rescontent"));
			res.setMenu(rs.getString("menu"));
			res.setAvg_grade(rs.getDouble("avg_grade"));
			res.setMap(rs.getString("map"));
			res.setPhone(rs.getString("phone"));
			System.out.println("Location : "+ rs.getString("phone"));
			res.setRep_menu(rs.getString("rep_menu"));
			res.setPrice(rs.getString("price"));
			res.setPhoto(rs.getString("photo"));
			res.setOpening_time(rs.getString("opening_time"));
			res.setWalk_time(rs.getString("walk_time"));
			
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	public ArrayList<resBean> res_get() {
		// Arraylist 생성
		// 빈객체를 담을 arraylist
		ArrayList<resBean> list = new ArrayList<resBean>();
		try {

			// SQL
			// 리뷰게시판에 모든 데이터를 불러온다.
			String sql =  "select distinct menu FROM res ";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();

			// rs.next() 값이 있으면 투루를 반환.
			while (rs.next()) {

				String menu = rs.getString("menu");

				// 빈객체 생성
				resBean bean = new resBean();

				bean.setMenu(menu);

				list.add(bean);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}
	
	//review_star 불러오기
		public ArrayList<review_Bean> star_get(int res_num2) {
			ArrayList<review_Bean> list = new ArrayList<review_Bean>();
			try {
				// SQL
				String sql =  "select review_star FROM review where res_num ="+res_num2;

				//Statement stmt = conn.createStatement();
				PreparedStatement pstmt = conn.prepareStatement(sql);

				// SQL 실행
				ResultSet rs = pstmt.executeQuery();


				// rs.next() 값이 있으면 투루를 반환.
				while (rs.next()) {

					
					int review_star = rs.getInt("review_star"); // 별점

					// 빈객체 생성
					review_Bean bean = new review_Bean();
					bean.setReview_star(review_star);

					list.add(bean);
				}

			} catch (Exception e) {
				e.printStackTrace();
			}

			return list;

		}
	
	public void updateStar(int res_num) {
		int result=0;

		review_Bean review2 = new review_Bean();

		ArrayList<review_Bean> vlist2 = star_get(res_num);
		double avg_star = 0;
		int star = 0;
		for(int i=0; i<vlist2.size(); i++) {
			review2 = vlist2.get(i);
			star = star + (int) review2.getReview_star();
		}
		avg_star = (double)star/(double)vlist2.size();
		sql = "update res set avg_grade = round("+avg_star+",1) where resnum=?";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,res_num);
			pstmt.executeUpdate();	

		}catch(Exception e) {
			e.printStackTrace();
		}
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
