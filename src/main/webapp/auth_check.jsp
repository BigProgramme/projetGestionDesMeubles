<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Insert title here</title>
</head>
<body>
	<%
		  if (session.getAttribute("username") == null) {
		      response.sendRedirect("login");
		      return;
		  }
%>
	
</body>
</html>