<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="icon" href="img/iso-azul-blanco.svg">

<link href="css/bootstrap.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/dashboard.css" rel="stylesheet">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.9.0/feather.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
<script src="js/dashboard.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/bootstrap.blunde.js"></script>
<script src="js/jquery-3.5.1.min.js"></script>

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

#navbar-top:hover {
	text-decoration: none;
}

.bg-primary {
	background-color: #0099ff;
}
</style>

</head>

<body>

	<nav
		class="navbar sticky-top navbar-expand-lg navbar-dark bg-white border-bottom">

		<button
			class="navbar-toggler position-absolute-left d-md-none collapsed"
			type="button" data-toggle="collapse" data-target="#sidebarMenu"
			aria-controls="sidebarMenu" aria-expanded="false"
			aria-label="Toggle navigation">

			<img src="img/toggler.svg" width="35" height="35"
				class="d-inline-block align-middle" alt="logo">

		</button>

		<a class="navbar-brand text-primary d-flex mr-0 bg-white"
			style="box-shadow: none;"
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
						</c:if>> <img
			src="img/iso-azul.svg" width="50" height="50"
			class="d-inline-block align-top" alt="iso"> <img
			src="img/logo-azul.svg" width="80" height="50"
			class="d-inline-block align-top" alt="asignar">
		</a>

		<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
			<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
				<li class="nav-item ml-4 active"><a
					class="nav-link text-primary"
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
				<li class="nav-item ml-3"><a class="btn btn-outline-success"
					role="button" href="posiblesInfectados">Posibles infectados</a></li>

				<li class="nav-item ml-4"><a class="btn btn-outline-info"
					role="button" href="verMensajesRecibidos">Ver mis Mensajes </a></li>

			</ul>
		</div>



		<c:if test="${rol == null}">

			<a href="login" class="dropdown-item" role="button"
				aria-disabled="true">Iniciar Sesión</a>
		</c:if>

		<c:if test="${rol != null}">
			<div class="btn-group">
				<button type="button" class="btn btn-outline-white dropdown-toggle"
					data-toggle="dropdown" data-display="static" aria-haspopup="true"
					aria-expanded="false">
					usuario.getEmail() <img src="img/avatar.svg" width="35" height="35"
						class="d-inline-block align-middle" alt="cuenta">
				</button>
				<div class="dropdown-menu dropdown-menu-lg-right">
					<button class="dropdown-item" type="button">Mi cuenta</button>

					<a href="logout" class="dropdown-item" role="button"
						aria-disabled="true">Cerrar sesión</a>

				</div>
			</div>
		</c:if>
	</nav>

	<div class="container-fluid">

		<div class="row">

			<nav id="sidebarMenu"
				class="col-md-3 col-lg-2 d-md-block sidebar collapse">
				<div class="sidebar-sticky pt-3">

					<ul class="nav flex-column">
						<li class="nav-item mt-3 mb-3"><a class="nav-link"
							href="admin"> <span data-feather="home"></span> Home Admin
						</a></li>

						<li class="nav-item mt-3 mb-3"><a class="nav-link"
							href="listaInstituciones"> <span data-feather="users"></span>
								Lista de Instituciones
						</a></li>

						<li class="nav-item mt-3 mb-3"><a class="nav-link"
							href="posiblesinfectados"> <span data-feather="users"></span>
								Lista de Espera
						</a></li>



						<li class="nav-item mt-3 mb-3"><a class="nav-link"
							href="grafico-pacientes"> <span data-feather="bar-chart-2"></span>
								Reportes
						</a></li>
					</ul>
				</div>

			</nav>