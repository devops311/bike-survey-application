<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
div {
	width: 200px;
	height: 100px;
	background-color: yellow;
	border: 1px solid black;
	margin: auto;
}

p:hover {
	background-color: red;
}

div#myDiv {
	transform: rotate(20deg);
}
</style>
</head>
<body>
	<form action="/getTheDataBy" method="get">
		<table class="table">
			<tr>
				<td><p>Select The Company</p></td>
				<td><select name="companyId">
						<c:forEach var="list" items="${company}">
							<option value="${list.companyId}">${list.companyName}</option>
						</c:forEach>
				</select></td>
				<td><input type="submit" value="View Details"></td>
			</tr>
		</table>
	</form>
	<div id="myDiv">Revenue=${customer}</div>

	<%-- <table class="table tale-stripped">
		<tr>
			<th>Revenue</th>
		</tr>
		<tr class="success">
			<td>${customer}</td>
					
				
			<td>
		</tr>
	</table> --%>
	<c:if test="${models!=null}">
		<table class="table tale-stripped">
			<tr>
				<th><p>Model Name</p></th>
				<th><p>Model Price</p></th>
			</tr>
			<c:forEach var="lists" items="${models}">

				<tr class="success">
					<td>${lists.modelName}</td>
					<td>${lists.modelPrice}</td>
					<td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	<a href="/">Back To Home</a>
</body>
</html>