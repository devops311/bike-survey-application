<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/additional-methods.min.js"
	integrity="sha256-vb+6VObiUIaoRuSusdLRWtXs/ewuz62LgVXg2f1ZXGo="
	crossorigin="anonymous"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
	background-color: TEAL ;
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

body {
	background: url('/resources/bg1.jpg');
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
}
</style>
</head>
<body>
	<div class="navbar fixed-top">
		<p id="heading">Register page</p>
	</div>
	<div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<div class="simple-form">
				<form action="/customer" method="post">
					<div class="form-group">
						<label for="customerName">Customer Name:</label> <input
							type="text" class="form-control item" id="customerName"
							placeholder="Enter The Customer Name" name="customerName">
					</div>
					<h4>Hobbies:</h4>
					<div class="checkbox-inline">
						<label> <input type="checkbox" id="checkbox"
							name="hobbies" value="reading">Reading
						</label><br> <label> <input type="checkbox" name="hobbies"
							value="Watching TV">Watching Tv
						</label><br> <label> <input type="checkbox" name="hobbies"
							value="Cooking">Cooking
						</label>
					</div>

					<div class="form-group">
						<label for="password">Password</label> <input type="password"
							class="form-control item" name="password" id="password"
							placeholder="Password"> <label for=" Confirm Password">Confirm
							Password:</label> <input type="password" class="form-control item"
							name="ConfirmPassword" id="ConfirmPassword"
							placeholder="Confirm Password">
					</div>

					<h4>Gender:</h4>
					<div class="radio">
						<label> <input type="radio" name="gender" id="gender"
							value="male">Male
						</label><br> <label> <input type="radio" name="gender"
							id="gender" value="female">Female
						</label>
					</div>
					<div class="form-group">
						<label for="email">Email:</label> <input type="email"
							class="form-control item" id="email" name="email">
					</div>
					<div>
						<label for="phoneNumber">Phone Number:</label> <input type="text"
							class="form-control item" id="phoneNumber" name="phoneNumber">
					</div>
					<div class="form-group">
						<div>

							<button type="submit" class="btn-success create-button">Submit</button>
						</div>
					</div>
				</form>
			</div>

		</div>
		<div class="col-md-4"></div>
	</div>
	<script>
		$('form').validate({
			rules : {
				customerName : {
					required : true,
					lettersonly : true
				},
				password : {
					required : true,
					minlength : 7,
					maxlength : 15,
					alphanumeric : true,
				},
				ConfirmPassword : {
					equalTo : "#password"
				},
				gender : {
					required : true
				},
				email : {
					required : true
				},
				phoneNumber : {
					required : true
				}
			}
		});
	</script>

	<a href="/">Back To Login page</a>
</body>
</html>