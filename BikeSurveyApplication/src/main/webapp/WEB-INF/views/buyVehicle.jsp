<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
					 s+='<option>select Model</option>';  
					for(var i=0;i<result.length;i++){
						s+='<option value="'+result[i].modelId+'">'+result[i].modelName+'</option>';
					}
					console.log(companyId)
					$('#comboModels').html(s);
				}
			})
		});
		
			$('#comboModels').click(function()
					{
				var modelId=$(this).val();
				$.ajax({
					type:'GET',
					url:window.location.origin+'/rest/getBikePrice/'+modelId,
					success:function(result)
					{
						
						console.log(modelId)
						$('#modelPrice').val(result);
					}
					
				})
			});
			
			$("#quantities").keyup(function()
					{
				var quantities=$(this).val();
				var modelPrice=$('#modelPrice').val();
				console.log(quantities)
				console.log(modelPrice)
				$('#totalPrice').val(quantities * modelPrice);
			});
			
			$('#button1').click(function(e){
				var dDate=$('#confirmDate').val();
				console.log(dDate);
				var CurrenDate=new Date();
				GivenDate=new Date(dDate);
				if(GivenDate<CurrentDate)
				{
					alert('Invalid Date');
					e.preventDefault();
				}
			});
			
	});
</script>
</head>
<body>
	<form action="/buyABike" method="post">
		<table>
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
				<td>Bike Price </td>
				<td><input id="modelPrice" name="modelPriceStatus" ></td>
			</tr>
			<tr>
				<td>Enter Quantities</td>
				<td><input id="quantities" name="quantities"></td>
			</tr>
			<tr>
				<td>Enter totalPrice</td>
				<td><input id="totalPrice" name="totalPrice"></td>
			</tr>
			<tr>
				<td>Enter orderDate</td>
				<td><input type="date" id="orderDate" name="orderDate"></td>
			</tr>
			<tr>
				<td>Enter confirmDate</td>
				<td><input type="date" id="confirmDate" name="confirmDate"></td>
			</tr>
			
			<tr>
					<td><input type="submit" value="Submit"></td>
		</tr>
		</table>
		</form>
		<a href="/form2">Back To Home</a>
</body>
</html>