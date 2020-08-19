<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<title>Iniciar sesión</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.5/examples/floating-labels/">

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.css" rel="stylesheet">

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
<!-- Custom styles for this template -->
<link href="css/floating-labels.css" rel="stylesheet">
</head>
<body class="bg-white">

	<form:form class="form-signin" action="validar-login" method="post"
		modelAttribute="usuario">
		
		<a href="home">
		<div class="text-center mb-2">
			<img class="" src="img/iso-azul.svg" alt="asignar" width="72"
				height="">
		</div>
		<div class="text-center mb-2">		
			<img class="mb-2" src="img/logo-azul.svg" alt="asignar" width="172"
				height="">
		</div>
		</a>
		<div class="text-center mb-4">
			<p>
				Iniciá sesión con tu cuenta
			</p>
		</div>

		<div class="form-label-group">
		<form:input path="email" id="inputEmail" type="email"
						class="form-control" placeholder="Correo eléctronico" required="required"/>
			<label for="inputEmail">Correo eléctronico</label>
		</div>

		<div class="form-label-group">
		<form:input path="password" type="password" id="inputPassword"
						class="form-control" placeholder="Contraseña" required="required"/>
		
			<label for="inputPassword">Contraseña</label>
		</div>

		<div class="checkbox mb-2">
			<label> <input path="recordar" type="checkbox"
					value="remember-me" /> Recordar usuario y contraseña
			</label>
		</div>
		
				
					
		<%--Bloque que es visible si el elemento error no estÃ¡ vacÃ­o	--%>
				<c:if test="${not empty error}">
					<p>
						<span class="text-danger">${error}</span>
					</p>
				</c:if>
		
		<button class="btn btn-lg btn-primary btn-block" type="submit">Iniciar
			sesión</button>

					
		<p class="mt-5 mb-3 text-muted text-center">&copy; asignar 2020</p>
	</form:form>

</body>
</html>		