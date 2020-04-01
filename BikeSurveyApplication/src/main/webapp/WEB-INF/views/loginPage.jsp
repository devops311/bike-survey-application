<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
.simple-form {
	margin-top: 5px;
	margin-right: 20px;
	margin-left: 5px;
	max-width: 100px;
	padding-top: 50px;
	padding-right: 30px;
	padding-bottom: 50px;
	padding-left: 10px;
	border-radius: 10px;
	box-shadow: 4px 4px 15px rgba(0, 0, 0, 0.2);
	background-color: black;
	max-width: 1000px;
}

h3 {
	color: blue;
}

heading {
	background-color: black;
	color: white;
	font-size: 35px;
	padding: 20px;
}

.tooltip-arrow, .form-control+.tooltip>.tooltip-inner {
	background-color: #f00;
	font-size: 18px;
}
@media screen and (min-width: 580px) {
	body {
		background: url('/resources/bg1.jpg');
		background-repeat: no-repeat;
		background-attachment: fixed;
		background-size: cover;
	}
}
</style>
</head>
<body>
	<div class="navbar fixed-top">
		<p id="heading">login page</p>
	</div>
	<div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<div class="simple-form">
				<form action="/validate" method="post" onsubmit="return validate()">
					<div class="input-group">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-user"></i></span>
						<!-- <label for="email">UserName</label> -->
						<input type="email" title="Enter the customer email"
							data-toggle="tooltip" class="form-control" name="email"
							id="email" placeholder="Enter the Email">
					</div>
					<br> <br>
					<div class="input-group">
						<!-- <label for="password">Password</label>  -->
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-lock"></i></span> <input type="password"
							title="Enter the password" data-toggle="tooltip"
							class="form-control" name="password" id="password"
							placeholder="Password">
					</div>
					<br> <br>
					<div>
						<button type="submit" class="btn-success create-button"
							title="login">Login</button>
						&emsp;&emsp;
						<button type="submit" class="btn-success create-button"
							onclick="form.action='/form1'">Register</button>
					</div>

				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$('[data-toggle="tooltip"]').tooltip();
		});
	</script>
</body>
</html>