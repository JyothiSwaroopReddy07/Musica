<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.musica.db.dao.*, com.musica.web.model.*, java.util.* " %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Musica-Payment SuccessFul</title>
</head>
<body>
<%
	Cartdbdao cart= new Cartdbdao();
	User user= (User)session.getAttribute("user-data");
	boolean r=cart.removeCartItems(user.getEmail());
%>
	<p style="text-align:center;">
		<img width="800px" height="500px" src="../images/check02.gif">
	</p>
	<h1 style="text-align:center;">Payment SuccessFully Done</h1>
	<script>
		setTimeout(()=>{
				window.location.href="./cart.jsp";
		},7000);
	</script>
</body>
</html>