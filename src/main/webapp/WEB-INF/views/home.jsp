<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType = "text/html;charset=utf-8" %>

<html>
<head>
	<title>Home</title>
	<style>
		body {
			font-family:"돋움", Dotum, Verdana;
			font-size:14px;
			color:#000;
			margin:5;
			padding:5;
			word-wrap:break-word;
			word-break:break-all;
		}
		th {
			height: 50px;
			background-color:#A7C942;
			
		}
		td {
			text-align:center;
		}
	</style>
</head>
<body>
	<h1>
		Assignment - 4    
	</h1>
	<h2 align="center">
		2009135085 이경민
	</h2>
	<table table width="500" border="1" cellspacing="5" cellpadding="3" bordercolor="#999999">
		<tr>
			<th>No</th>
			<th>Id</th>
			<th>Name</th>
			<th>e-mail</th>
		</tr>
		<c:forEach var="user" items="${users}" varStatus="status">
			<tr>
				<td class="listtd"><c:out value="${status.count}"/></td>
				<td class="listtd">${user.id}</td>
				<td class="listtd"><c:out value="${user.name}"/> </td>
				<td class="listtd"><c:out value="${user.email}"/> </td>
			</tr>
		</c:forEach>
	</table>
	<br></br>
	<table width="900" border="1" cellspacing="0" cellpadding="3" bordercolor="#999999" style="border-collapse:collapse;" rules="none">
		<tr>
			<th>No</th>
			<th>Id</th>
			<th>Summary</th>
			<th>Description</th>
			<th>Description</th>
			<th>Owner</th>
			<th>NumLikes</th>
			<th>EventLevel</th>
		</tr>
		<c:forEach var="events" items="${events}" varStatus="status">
			<tr>
				<td class="listtd"><c:out value="${status.count}"/></td>
				<td class="listtd">${events.id}</td>
				<td class="listtd">${events.when.time}</td>
				<td class="listtd">${events.summary}</td>
				<td class="listtd">${events.description}</td>
				<td class="listtd">${events.owner.id}</td>
				<td class="listtd">${events.numLikes}</td>
				<td class="listtd">${events.eventLevel}</td>
			</tr>
		</c:forEach>
	</table>
	<br></br>
	<table width="500" border="2" cellspacing="0" cellpadding="3" bordercolor="#999999" style="border-collapse:collapse;" rules="rows" frame="hsides">
		<tr>
			<th>No</th>
			<th>Id</th>
			<th>Event</th>
			<th>Attendee</th>
		</tr>
		<c:forEach var="attendees" items="${attendees}" varStatus="status">
			<tr>
				<td class="listtd"><c:out value="${status.count}"/></td>
				<td class="listtd">${attendees.id}</td> <!-- Integer id -->
				<td class="listtd">${attendees.event.id}</td> <!-- Event event -->
				<td class="listtd">${attendees.attendee.id}</td> <!-- CalendarUser attendee -->
			</tr>
		</c:forEach>
	</table>
</body>
</html>
