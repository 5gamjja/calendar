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
<h2 align="center">
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

<table border = 1>
<c:forEach var="events" items="${events}" varStatus="status">
<tr>
	<td align="center" class="listtd"><c:out value="${status.count}"/></td>
	<td align="center" class="listtd">${events.id}</td>
	<td align="center" class="listtd">${events.when.time}</td>
	<td align="center" class="listtd">${events.summary}</td>
	<td align="center" class="listtd">${events.description}</td>
	<td align="center" class="listtd">${events.owner.id}</td>
	<td align="center" class="listtd">${events.numLikes}</td>
	<td align="center" class="listtd">${events.eventLevel}</td>
</tr>
</c:forEach>
</table>

<table border = 1>
<c:forEach var="attendees" items="${attendees}" varStatus="status">
<tr>
	<td align="center" class="listtd"><c:out value="${status.count}"/></td>
	<td align="center" class="listtd">${attendees.id}</td> <!-- Integer id -->
	<td align="center" class="listtd">${attendees.event.id}</td> <!-- Event event -->
	<td align="center" class="listtd">${attendees.attendee.id}</td> <!-- CalendarUser attendee -->
</tr>
</c:forEach>
</table>


</body>
</html>
