<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

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
<c:url value="/j_spring_security_logout" var="logoutUrl" />
<script>
	function formSubmit() {
		document.getElementById("logoutForm").submit();
	}
</script>

</head>

<form action="${logoutUrl}" method="post" id="logoutForm">
	<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" />
</form>


<body>

	<div class="container">
		<div class="row">
			<div class="col-md-10">
				<h1>Title: ${title}</h1>

				<div class="col-md-4"></div>
				<div class="col-md-4">
					<h1>Message: ${message}</h1>

					<c:if test="${pageContext.request.userPrincipal.name != null}">

					</c:if>

					<div class="col-md-4"></div>
				</div>
				
				</div>
				<div class="col-md-2">
					<h2>

						<a href="javascript:formSubmit()"> Logout</a> ${pageContext.request.userPrincipal.name}
					</h2>
				
			</div>
		</div>
	</div>










</body>
</html>