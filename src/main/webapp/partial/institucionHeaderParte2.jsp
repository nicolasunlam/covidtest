<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.*,java.util.*"%>


<link rel="icon" href="img/iso-azul-blanco.svg">

<link href="css/bootstrap.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/dashboard.css" rel="stylesheet">


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.9.0/feather.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
<script src="js/dashboard.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/bootstrap.blunde.js"></script>

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
					role="button" href="listaPacientesInternados">Pacientes
						internados</a></li>

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


					<%
						String usuario = (String) request.getSession().getAttribute("MAIL").toString();

							String paramName = (String) usuario;
							out.print("<tr><td>" + paramName + "</td>\n");
					%>

					<img src="img/avatar.svg" width="35" height="35"
						class="d-inline-block align-middle" alt="cuenta">
				</button>
				<div class="dropdown-menu dropdown-menu-lg-right">
					<a href="MisDatos" class="dropdown-item" role="button"
						aria-disabled="true">Mi cuenta</a> <a href="logout"
						class="dropdown-item" role="button" aria-disabled="true">Cerrar
						sesión</a>

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


						<li class="nav-item mt-3 mb-3 d-flex mx-3">
							<div class="py-1 text-primary">
								<span data-feather="home"></span>
							</div>
							<div id="accordion">
								<div class="">
									<div class="" id="headingOne">
										<h5 class="mb-0">
											<button class="btn text-primary py-0" data-toggle="collapse"
												data-target="#collapseOne" aria-expanded="true"
												aria-controls="collapseOne" style="box-shadow: none">
												Mi Institución</button>
										</h5>
									</div>

									<div id="collapseOne" class="collapse"
										aria-labelledby="headingOne" data-parent="#accordion">
										<div class="card-body px-0">
											<a class="nav-link px-0 text-dark" href="pisosInstitucion">
												<span data-feather="users"></span> Pisos
											</a>
										</div>
										<div class="card-body px-0">
											<a class="nav-link px-0 text-dark" href="sectoresInstitucion">
												<span data-feather="users"></span> Sectores
											</a>
										</div>
										<div class="card-body px-0">
											<a class="nav-link px-0 text-dark" href="salasInstitucion">
												<span data-feather="search"></span> Salas
											</a>
										</div>


									</div>
								</div>
						</li>

						<li class="nav-item mt-3 mb-3 d-flex mx-3">
							<div class="py-1 text-primary">
								<span data-feather="home"></span>
							</div>

							<div id="accordion2">
								<div class="">
									<div class="" id="headingTwo">
										<h5 class="mb-0">
											<button class="btn text-primary py-0" data-toggle="collapse"
												data-target="#collapseTwo" aria-expanded="true"
												aria-controls="collapseTwo" style="box-shadow: none">
												Pacientes</button>
										</h5>
									</div>

									<div id="collapseTwo" class="collapse "
										aria-labelledby="headingOne" data-parent="#accordion2">
										<div class="card-body px-0">
											<a class="nav-link px-0 text-dark"
												href="listaPacientesInternados"> <span
												data-feather="users"></span> Pacientes Internados
											</a>
										</div>
										<div class="card-body px-0">
											<a class="nav-link px-0 text-dark" href="posiblesinfectados">
												<span data-feather="users"></span> Lista de Espera
											</a>
										</div>
										<div class="card-body px-0">
											<a class="nav-link px-0 text-dark" href="consultarPaciente">
												<span data-feather="search"></span> Consultar paciente
											</a>
										</div>
										<div class="card-body px-0">
											<a class="nav-link px-0 text-dark" href="internarPaciente">
												<span data-feather="user-plus"></span> Internar paciente
											</a>
										</div>
										<div class="card-body px-0">
											<a class="nav-link px-0 text-dark" href="egresarPaciente">
												<span data-feather="user-minus"></span> Egresar paciente
											</a>
										</div>
										<div class="card-body px-0">
											<a class="nav-link px-0 text-dark"
												href="listaPacientesInfectados"> <span
												data-feather="users"></span> Pacientes Infectados
											</a>
										</div>


									</div>
								</div>
							</div>
						</li>

						<li class="nav-item mt-3 mb-3 d-flex mx-3">
							<div class="py-1 text-primary">
								<span data-feather="home"></span>
							</div>

							<div id="accordion3">
								<div class="">
									<div class="" id="headingThree">
										<h5 class="mb-0">
											<button class="btn text-primary py-0" data-toggle="collapse"
												data-target="#collapseThree" aria-expanded="true"
												aria-controls="collapseThree" style="box-shadow: none">
												Pacientes</button>
										</h5>
									</div>

									<div id="collapseThree" class="collapse "
										aria-labelledby="headingThree" data-parent="#accordion3">
										<div class="card-body px-0">
											<a class="nav-link px-0 text-dark"
												href="listaPacientesInternados"> <span
												data-feather="users"></span> Pacientes Internados
											</a>
										</div>
										<div class="card-body px-0">
											<a class="nav-link px-0 text-dark" href="posiblesinfectados">
												<span data-feather="users"></span> Lista de Espera
											</a>
										</div>
										<div class="card-body px-0">
											<a class="nav-link px-0 text-dark" href="consultarPaciente">
												<span data-feather="search"></span> Consultar paciente
											</a>
										</div>
										<div class="card-body px-0">
											<a class="nav-link px-0 text-dark" href="internarPaciente">
												<span data-feather="user-plus"></span> Internar paciente
											</a>
										</div>
										<div class="card-body px-0">
											<a class="nav-link px-0 text-dark" href="egresarPaciente">
												<span data-feather="user-minus"></span> Egresar paciente
											</a>
										</div>
										<div class="card-body px-0">
											<a class="nav-link" href="consultarAsignacion"> <span
												data-feather="search"></span> Consultar Asignación
											</a>
										</div>


									</div>
								</div>
							</div>
						</li>


						<li class="nav-item mt-3 mb-3 d-flex mx-3">
							<div class="py-1 text-primary">
								<span data-feather="home"></span>
							</div>

							<div id="accordion4">
								<div class="">
									<div class="" id="headingFour">
										<h5 class="mb-0">
											<button class="btn text-primary py-0" data-toggle="collapse"
												data-target="#collapseFour" aria-expanded="true"
												aria-controls="collapseFour" style="box-shadow: none">
												Pacientes</button>
										</h5>
									</div>

									<div id="collapseFour" class="collapse "
										aria-labelledby="headingFour" data-parent="#accordion4">
										<div class="card-body px-0">
											<a class="nav-link px-0 text-dark"
												href="listaPacientesInternados"> <span
												data-feather="users"></span> Pacientes Internados
											</a>
										</div>
										<div class="card-body px-0">
											<a class="nav-link px-0 text-dark" href="posiblesinfectados">
												<span data-feather="users"></span> Lista de Espera
											</a>
										</div>
										<div class="card-body px-0">
											<a class="nav-link px-0 text-dark" href="consultarPaciente">
												<span data-feather="search"></span> Consultar paciente
											</a>
										</div>
										<div class="card-body px-0">
											<a class="nav-link px-0 text-dark" href="internarPaciente">
												<span data-feather="user-plus"></span> Internar paciente
											</a>
										</div>
										<div class="card-body px-0">
											<a class="nav-link px-0 text-dark" href="egresarPaciente">
												<span data-feather="user-minus"></span> Egresar paciente
											</a>
										</div>
										<div class="card-body px-0">
											<a class="nav-link" href="grafico-pacientes"> <span
												data-feather="bar-chart-2"></span> Reportes
											</a>
										</div>


									</div>
								</div>
							</div>
						</li>

						<li class="nav-item mt-3 mb-3 d-flex mx-3">
							<div class="py-1 text-primary">
								<span data-feather="home"></span>
							</div>

							<div id="accordion4">
								<div class="">
									<div class="" id="headingFive">
										<h5 class="mb-0">
											<button class="btn text-primary py-0" data-toggle="collapse"
												data-target="#collapseFive" aria-expanded="true"
												aria-controls="collapseFive" style="box-shadow: none">
												Pacientes</button>
										</h5>
									</div>

									<div id="collapseFive" class="collapse "
										aria-labelledby="headingFive" data-parent="#accordion4">
										<div class="card-body px-0">
											<a class="nav-link px-0 text-dark"
												href="listaPacientesInternados"> <span
												data-feather="users"></span> Pacientes Internados
											</a>
										</div>
										<div class="card-body px-0">
											<a class="nav-link px-0 text-dark" href="posiblesinfectados">
												<span data-feather="users"></span> Lista de Espera
											</a>
										</div>
										<div class="card-body px-0">
											<a class="nav-link px-0 text-dark" href="consultarPaciente">
												<span data-feather="search"></span> Consultar paciente
											</a>
										</div>
										<div class="card-body px-0">
											<a class="nav-link px-0 text-dark" href="internarPaciente">
												<span data-feather="user-plus"></span> Internar paciente
											</a>
										</div>
										<div class="card-body px-0">
											<a class="nav-link px-0 text-dark" href="egresarPaciente">
												<span data-feather="user-minus"></span> Egresar paciente
											</a>
										</div>
										<div class="card-body px-0">
											<a class="nav-link" href="grafico-pacientes"> <span
												data-feather="bar-chart-2"></span> Reportes
											</a>
										</div>


									</div>
								</div>
							</div>
						</li>

					</ul>
				</div>
			</nav>