<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<% 
  request.setCharacterEncoding("UTF-8");
  %>
<title>Insert title here</title>
<jsp:useBean id="member" class="tastymirim.Member"/>
<jsp:setProperty name="member" property="*"/>
<jsp:useBean id="memberDb" class="tastymirim.MemberDb"/>
</head>
<% String id= request.getParameter("id");
	String name = request.getParameter("name");
	String profile = request.getParameter("profile");
	String email = request.getParameter("email");
	%>
	<%
   int result = memberDb.selectId(id);

   	if(result ==1){
	   session.setAttribute("id", id);

	   %>
	    <script>
	   location.href='./index.jsp';
	   </script>
	   <% 
   }	else if(result == 2){
	   	memberDb.insertMember(member);
	   session.setAttribute("id", id);
	   
	   %>
	   <script>
	   location.href='./index.jsp';
	   </script>
	   <%
   }
%>
<body>
		<form name="memberForm" method="post">
			<div align="center">
				<table border="1" width="600">
					
					<tr>
						<td colspan="2" align=center><jsp:getProperty name="member" property="id"/>님 &nbsp;
						 회원가입을 축하드립니다. </td>
					</tr>
					
					<tr>
						<td width="20%">아이디</td>
						<td width="50%"><jsp:getProperty name="member" property="id"/></td>
					</tr>	
					
					<tr>
						<td>이름</td>
						<td><jsp:getProperty name="member" property="name"/></td>
					</tr>
					
					<tr>
						<td>Email</td>
						<td><jsp:getProperty name="member" property="email"/></td>								
					</tr>
					
					
					
					<tr>
						<td>직업</td>
						<td><jsp:getProperty name="member" property="profile"/></td>
					
					<input type="hidden" name="id" value = "<jsp:getProperty property="id" name="member" />">
					
				</table>
			</div>	
		</form>
  
</body>
</html>