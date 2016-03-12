<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<title>Login</title>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="col-md-4"></div>
				<div class="col-md-4">
					<h2>Login</h2>


					<form action="<c:url value='j_spring_security_check' />"
						method="post" role="form" id="loginForm">
						<div class="form-group ">
							<label for="user">User Name:</label> <input type="text"
								class="form-control" name="username" id="username"
								placeholder="Enter user name" required>
						</div>
						<div class="form-group">
							<label for="pwd">Password:</label> <input type="password"
								name="password" class="form-control" id="password"
								placeholder="Enter password" required>
						</div>
						<div class="checkbox">
							<label><input type="checkbox"> Remember me</label>
						</div>
						
						<c:if test="${not empty error}">
							<div class="alert alert-danger">
								<strong>Login Failed!</strong>${error}
							</div>
						</c:if>

						<c:if test="${not empty msg}">
							<div class="alert alert-info">
								<strong>Message</strong>${msg}
							</div>
						</c:if>


						<button type="submit" class="btn btn-default">Submit</button>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />

					</form>



					<div class="col-md-4"></div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
