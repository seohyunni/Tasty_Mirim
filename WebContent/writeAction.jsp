<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "tastymirim.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.io.PrintWriter" %>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
	<meta name="author" content="MBS(미림 방송국)">
    <meta name="description" content="생생 정보통">
    <meta name="keywords" content="고시촌 맛집, 미림 맛집, 도장깨기, 리뷰 및 평점">

    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>생생미림통</title>
    
</head>

<%
	String id = (String)session.getAttribute("id");
%>
<body>
<%
    // 파일이 저장되는 경로
    String path = request.getSession().getServletContext().getRealPath("./fileFolder");

    int size = 1024 * 1024 * 10; // 저장가능한 파일 크기
    String file = ""; // 업로드 한 파일의 이름(이름이 변경될수 있다)
    String originalFile = ""; // 이름이 변경되기 전 실제 파일 이름
	String user_id = "";
    int res_num = 0;
    
    String res_name = "";
    double avg_grade=0;
    String res_content="";
    String map = "";
    
    int review_star = 0;
    String content = "";
    
    

  	Connection conn = null;
  	Statement stmt = null;
  	
  	try{
  		Class.forName("com.mysql.jdbc.Driver");
  		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tastymirim?useUnicode=true&characterEncoding=UTF-8","tastymirim","h4HX6ASpP2SeOrmw");
  		
  		if(conn == null)
  			throw new Exception("db 연결 실패");
  			stmt = conn.createStatement();
  			
        MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());

        Enumeration files = multi.getFileNames();
        String str = (String)files.nextElement(); // 파일 이름을 받아와 string으로 저장
		
        res_name = multi.getParameter("res_name");
        avg_grade = Double.parseDouble(multi.getParameter("avg_grade"));
        res_content = multi.getParameter("res_content");
        map = multi.getParameter("map");
        
        
    	user_id = multi.getParameter("user_id");
    	res_num = Integer.parseInt(multi.getParameter("res_num"));
    	review_star = Integer.parseInt(multi.getParameter("review_star"));
    	content = multi.getParameter("review_content");
        
        file = multi.getFilesystemName(str); // 업로드 된 파일 이름 가져옴
        originalFile = multi.getOriginalFileName(str); // 원래의 파일이름 가져옴

        resDB resdb = new resDB();
        

    	review_DAO reviewdb = new review_DAO();
    	review_Bean review = new review_Bean();
    	
    	Member member2 = new Member();
    	MemberDb memberdb = new MemberDb();
    	
    	member2 = memberdb.selectMember(user_id);
    	String user_name = member2.getName();
    	
    	review.setUser_id(user_id);
    	review.setUser_name(user_name);
    	review.setRes_num(res_num);
    	review.setReview_content(content);
    	review.setReview_photo(file);	
    	review.setReview_star(review_star);
    	
    	reviewdb.review_write(review);
    	resdb.updateStar(res_num);
    	
    	
    } catch (Exception e) {
        e.printStackTrace();
        System.out.println("왜 안들어오냐");
    }
%>
<script>
   window.location=document.referrer;
</script>
<script>
<% session.setAttribute("id", id); %>
</script>
</html>