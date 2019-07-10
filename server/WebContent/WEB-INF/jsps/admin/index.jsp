<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Welcome to first page</h1>
<c:forEach var="s" items="${list }">
<c:out value="${s.getId() }"></c:out><br>
<c:out value="${s.getApplicationId() }"></c:out><br>
<c:out value="${s.getFname() }"></c:out><br>
<c:out value="${s.getMname() }"></c:out><br>
<c:out value="${s.getLname() }"></c:out><br>
<c:out value="${s.getEmail() }"></c:out><br>
<c:out value="${s.getPassword() }"></c:out><br>
<c:out value="${s.getMobileNo() }"></c:out><br>
<c:out value="${s.getGender() }"></c:out><br>
<c:out value="${s.getDob() }"></c:out><br>
<c:out value="${s.getAddress() }"></c:out><br>
<c:out value="${s.getCity() }"></c:out><br>
<c:out value="${s.getState() }"></c:out><br>
<c:out value="${s.getActiveStatus() }"></c:out><br>
<c:out value="${s.getUserType() }"></c:out><hr>
</c:forEach>
</body>
</html>