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
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="/getAllData" method="get">
		<table class="table">
			<tr>
				<td>Select The Customer</td>
				<td><select name="customerId">
						<c:forEach var="list" items="${customer}">
							<option value="${list.customerId}">${list.customerName}</option>
						</c:forEach>
				</select></td>
				<td><input type="submit" value="View Details"></td>
			</tr>
		</table>
	</form>
	<c:if test="${customerList!=null}">
		<table class="table tale-stripped">
			<tr>
				<th>Customer Name</th>
				<th>Price</th>
				<th>Quantity</th>
				<th>Number Of Days</th>
				<th>Model Name</th>

			</tr>
			<c:forEach var="list" items="${customerList}">
						<tr class="success">
							<td>${list.customerName}</td>
							<td>${list.totalPrice}</td>
							<td>${list.quantities}</td>
							<td>${list.noOfDays}</td>
							<td>${list.getModels().modelName}</td>
							<td>
						</tr>
			</c:forEach>
		</table>
	</c:if>
	<a href="/">Back To Home</a>
	<br>
	<a href="/excel">Export To Excel</a>
</body>
</html>