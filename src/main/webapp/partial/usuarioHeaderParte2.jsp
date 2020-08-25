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
		class="navbar bg-primary text-white justify-content-center align-items-center">
		<a class="text-center text-white"
			href="https://www.argentina.gob.ar/salud/coronavirus-COVID-19"
			id="navbar-top"> <img src="img/info.svg" width="14" height=""
			class="d-inline-block align-middle" alt="logo"
			style="margin-bottom: 0.10rem"> <span style="font-size: 15px;">
				Coronavirus COVID-19: conocé información y recomendaciones del
				Ministerio de Salud </span>
		</a>
	</nav>

	<nav
		class="navbar sticky-top navbar-expand-lg navbar-dark bg-white border-bottom">

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarTogglerDemo02"
			aria-controls="navbarTogglerDemo02" aria-expanded="false"
			aria-label="Toggle navigation">
			<img src="img/toggler.svg" width="35" height="35"
				class="d-inline-block align-middle" alt="logo">

		</button>

		<a class="navbar-brand text-primary bg-white d-flex mr-0" style="box-shadow: none"
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
					role="button" href="autoTest">Realizar test</a></li>
				<c:if test="${permiso == true}">
					<li class="nav-item ml-3" id="botonPermiso"><a
						class="nav-link btn btn-outline-success active"
						href="generarPermiso">Generar Permiso </a></li>
				</c:if>
				</li>

				<li class="nav-item ml-4"><a class="btn btn-outline-info"
					role="button" href="verMensajesRecibidos">Ver mis Mensajes </a></li>

			</ul>
		</div>


		<c:if test="${rol == null}">
			<a href="login" class="btn btn-outline-primary ml-3 mt-2"
				role="button" aria-disabled="true">Iniciar Sesión</a>
		</c:if>
		<c:if test="${rol != null}">
			<div class="btn-group">
				<button type="button"
					class="btn btn-outline-white dropdown-toggle"
					data-toggle="dropdown" data-display="static" aria-haspopup="true"
					aria-expanded="false">
					
	<%
               String usuario = (String) request.getSession().getAttribute("MAIL").toString();
               
                  String paramName = (String)usuario;
                  out.print("<tr><td>" + paramName + "</td>\n");
               
            %>

<img src="img/avatar.svg" width="35"
						height="35" class="d-inline-block align-middle" alt="cuenta">
				</button>
				<div class="dropdown-menu dropdown-menu-lg-right">
					<a href="MisDatos" class="dropdown-item" role="button"
						aria-disabled="true">Mi cuenta</a>

					<a href="logout" class="dropdown-item" role="button"
						aria-disabled="true">Cerrar sesión</a>

				</div>
			</div>
		</c:if>
	</nav>

	<c:if test="${permiso == true}">
		<div
			class="alert alert-warning alert-dismissible fade show text-center"
			role="alert">
			<h5>
				Usted tiene la posibilidad de generar un <strong>permiso de
					circulación</strong> haciendo click en el botón ubicado arriba de este
				mensaje
			</h5>
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
	</c:if>