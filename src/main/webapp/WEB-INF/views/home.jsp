<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType = "text/html;charset=utf-8" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Assignment - 4    
</h1>
<h2>
	2009135085 이경민
</h2>

<table border = 1>
<c:forEach var="user" items="${users}" varStatus="status">
<tr>
	<td align="center" class="listtd"><c:out value="${status.count}"/></td>
	<td align="center" class="listtd">${user.id}</td>
	<td align="left" class="listtd"><c:out value="${user.name}"/> </td>
	<td align="center" class="listtd"><c:out value="${user.email}"/> </td>
</tr>
</c:forEach>
</table>


</body>
</html>
