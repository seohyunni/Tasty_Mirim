<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "tastymirim.ReviewBoard" %>
<%@ page import = "tastymirim.ReviewDBBoard" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.io.PrintWriter" %>

<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
	<meta name="author" content="MBS(미림 방송국)">
    <meta name="description" content="생생 정보통">
    <meta name="keywords" content="고시촌 맛집, 미림 맛집, 도장깨기, 리뷰 및 평점">

    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta http-equiv="Content-Type" content="text/html" charset="utf-8">
    <title>생생미림통</title>
    
</head>
<body>
<%
	ReviewBoard board = new ReviewBoard();
	ReviewDBBoard boardDB = new ReviewDBBoard();
	
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	int resnum = Integer.parseInt(request.getParameter("resnum"));
	int grade = Integer.parseInt(request.getParameter("grade"));
	String content = request.getParameter("content");
	String photo = request.getParameter("photo");
	String com_date = request.getParameter("com_date");
	
	board.setId(id);
	board.setName(name);
	board.setResnum(resnum);
	board.setGrade(grade);
	board.setContent(content);
	board.setPhoto(photo);
	board.setCom_date(com_date);
	
	int result = boardDB.write(board);
	
	PrintWriter script = response.getWriter();
	
	script.println("<script>");
	script.println("location.href = 'reviewScore.jsp'");
	script.println("</script>");
%>
</body>
</html>