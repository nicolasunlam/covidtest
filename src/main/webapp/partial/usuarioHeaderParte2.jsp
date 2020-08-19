<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="icon" href="img/iso-azul-blanco.svg"> 
	
<link href="css/bootstrap.css" rel="stylesheet">

<script src="js/popper.min.js"></script>
<script src="js/jquery-3.5.1.min.js"></script>

<style>
#navbar-top:hover {
	text-decoration: none;
}
.bg-primary{
	background-color: #0099ff;
}
</style>

</head>

<body>

	<nav
		class="navbar bg-primary text-white justify-content-center align-items-center">
		<a class="text-center text-white" href="https://www.argentina.gob.ar/salud/coronavirus-COVID-19" id="navbar-top">
			<img src="img/info.svg" width="14" height="" class="d-inline-block align-middle" alt="logo" style="margin-bottom: 0.10rem">
			<span style="font-size:15px;">
				Coronavirus COVID-19: conocé información y recomendaciones del
				Ministerio de Salud
			</span>
		</a>
	</nav>

	<nav class="navbar sticky-top navbar-expand-lg navbar-dark bg-white border-bottom">

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarTogglerDemo02"
			aria-controls="navbarTogglerDemo02" aria-expanded="false"
			aria-label="Toggle navigation">
		<img src="img/toggler.svg" width="35" height="35" class="d-inline-block align-middle" alt="logo">
			
		</button>

		<a class="navbar-brand text-primary d-flex mr-0"
		href=<c:if test='${rol == "ADMIN"}'>
						"admin"
						</c:if>
					<c:if test='${rol == "INSTITUCION"}'>
						"bienvenido"
						</c:if>
					<c:if test='${rol == "PACIENTE"}'>
						"bienvenidoPaciente"
						</c:if>
					<c:if test='${rol == null}'>
						"home"
						</c:if>
		> 
			<img src="img/iso-azul.svg" width="50" height="50" class="d-inline-block align-top" alt="iso">
			<img src="img/logo-azul.svg" width="85" height="50" class="d-inline-block align-top" alt="asignar">
		</a>

		<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
			<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
				<li class="nav-item ml-4 active">
				
					<a class="nav-link text-primary"
					href=<c:if test='${rol == "ADMIN"}'>
						"admin"
						</c:if>
					<c:if test='${rol == "INSTITUCION"}'>
						"bienvenido"
						</c:if>
					<c:if test='${rol == "PACIENTE"}'>
						"bienvenidoPaciente"
						</c:if>
					<c:if test='${rol == null}'>
						"home"
						</c:if>>Inicio
						<span class="sr-only">(current)</span>
					</a>
					
				<li class="nav-item ml-3"><a class="btn btn-outline-success" role="button" href="autoTest">Realizar
						test</a></li>
				<c:if test="${permiso == true}">
					<li class="nav-item ml-3" id="botonPermiso"><a
						class="nav-link btn btn-outline-success active" href="generarPermiso">Generar Permiso </a></li>
				</c:if>
				</li>
				<c:if test='${rol == "PACIENTE"}'>
					<li class="nav-item ml-4"><a class="btn btn-outline-info"
					role="button"	href="verMensajes">Ver mis Mensajes </a></li>
				</c:if>
			</ul>
		</div>
		
		
			<c:if test="${rol == null}">
				<a href="login" class="btn btn-outline-primary ml-3 mt-2" role="button"
					aria-disabled="true">Iniciar Sesión</a>
			</c:if>
			<c:if test="${rol != null}">
				<a href="logout" class="btn btn-outline-primary ml-3 my-2" role="button"
					aria-disabled="true">Salir</a>
			</c:if>
	</nav>

	<c:if test="${permiso == true}">
		<div
			class="alert alert-warning alert-dismissible fade show text-center"
			role="alert">
			<h5>Usted tiene la posibilidad de generar un <strong>permiso de
				circulación</strong> haciendo click en el botón ubicado arriba de este
				mensaje</h5>
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
	</c:if>