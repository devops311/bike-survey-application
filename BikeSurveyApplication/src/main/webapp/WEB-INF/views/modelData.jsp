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
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js">
</script>
<script
    src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script>
	$(document).ready(function()
			{
		$('#comboCompany').click(function(){
			var companyId=$(this).val();
			console.log(companyId);
			$.ajax({
				type:'GET',
				url:window.location.origin+'/rest/modelByCompany/'+companyId,
				success:function(result){
					var s='';
					/* s+='<option>select Model</option>';  */
					for(var i=0;i<result.length;i++){
						s+='<option value="'+result[i].modelId+'">'+result[i].modelName+'</option>';
					}
					console.log(companyId)
					$('#comboModels').html(s);
				}
			})
		});
	});
</script>
</head>
<body>
   <form action="/getModelData" method="get">
		<table  class="table">
		<tr>
				<td>Company :</td>
				<td><select name="company" id="comboCompany">
						<option>Select Company</option>
						<c:forEach var="company" items="${company}">
							<option id="test" value="${company.companyId}">${company.companyName}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td>Models :</td>
				<td><select  name="modelId" id="comboModels" style="width: 200px">
						<option>Select Model</option>
				</select>
			</tr>	
			<tr>
					<td><input type="submit" value="Submit"></td>
		</tr>
		</table>
		</form>
		<c:if test="${customer!=null}">
		<table class="table tale-stripped">
			<tr>
				<th>Customer Name</th>
				<th>Price</th>
				<th>Quantity</th>
				<th>Number Of Days</th>
				<th>Model Name</th>

			</tr>
			<c:forEach var="list" items="${customer}">
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
</body>
</html>