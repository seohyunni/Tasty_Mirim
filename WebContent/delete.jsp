<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "tastymirim.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.io.PrintWriter" %>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id");
%>
</head>
<body>
<% 
int history = Integer.parseInt(request.getParameter("history"));
int review_num = Integer.parseInt(request.getParameter("review_num"));
System.out.println("delete.jsp"+review_num);
review_DAO reviewdb = new review_DAO();
int result = reviewdb.review_delete(review_num);
String msg="";
if(result == 1){
	msg="삭제 되었습니다.";
}else{

	msg ="삭제 실패하였습니다.";
}
%>
<%if(history==1){ 
int res_num = Integer.parseInt(request.getParameter("res_num"));%>
<script>
alert("<%=msg%>");
location.href='./detail.jsp?res_num=<%=res_num%>';
</script>
<%}else if(history == 2){ %>
<script>
   alert("<%=msg%>");
   window.location=document.referrer;
</script>
<%} %>
</body>
<script>
<% session.setAttribute("id", id); %>
</script>
</html>