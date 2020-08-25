<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>Mis Datos</title>

<jsp:include page="../../partial/${armarHeader}2.jsp" />

<style>
.display-5 {
	font-size: 2.5rem;
	font-weight: 300;
	line-height: 1.2;
}

p.lead {
	font-size: 1.05rem;
}
</style>

<c:if test='${rol != "PACIENTE"}'>
	<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
</c:if>

<div class="container">

	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h2 class="">Mis Datos</h2>
		<a href=<c:if test='${rol == "ADMIN"}'>
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
						</c:if>>
			<button type="button" class="btn btn-outline-success">
				Volver atrás</button>
		</a>

	</div>
	<h6 class="mb-5">Vea sus datos en detalle y realice alguna
		actualización de los mismos si es necesario</h6>


	<form action="guardarCambios" method="POST">

		<input name="idUsuario" type="hidden" value="${usuario.getId()}">

		<div
			class="form-row d-flex justify-content-between flex-md-nowrap align-items-center pt-3 pb-2 mb-3">

			<div class="col-lg-1 col-md-2 col-sm-4">

				<label for="" class=""> <img alt="" src="img/avatar.svg"
					width="100%" height="85px" style="min-width:">
				</label>
			</div>

			<div class="col">

				<div class="">
					<label for="" class="h5">${usuario.getApellido()},
						${usuario.getNombre()}</label>
				</div>
				<div class="">
					<label for="" class="h6 ">${usuario.getTipoDocumento().name()}:
						${usuario.getNumeroDocumento()}</label>
				</div>
				<div class="">
					<label for="" class="h6 ">${usuario.getEmail()}</label>
				</div>

			</div>
		</div>

		<div class="form-group">

			<input type="hidden" name="id" class="form-control" id="id"
				aria-describedby="id" path="id" placeholder="${usuario.getId()}">
		</div>
		<div class="form-group">
			<label for="nombre">Nombre</label> <input type="text" name="nombre"
				class="form-control" id="nombre" path="nombre"
				aria-describedby="nombre" placeholder="${usuario.getNombre()}">

		</div>

		<c:if test='${rol == "PACIENTE"}'>
			<div class="form-group">
				<label for="apellido">Apellido</label> <input type="text"
					name="apellido" class="form-control" id="apellido" path="apellido"
					placeholder="${usuario.getApellido()}">
			</div>
		</c:if>
		<div class="form-group">
			<label for="exampleInputEmail1">Correo electrónico</label> <input
				type="email" name="email" path="email" class="form-control"
				id="email" aria-describedby="email"
				placeholder="${usuario.getEmail()}">
		</div>

		<div class="form-group">

			<h6>Contraseña de la cuenta</h6>

			<input type="text" name="password"
				class="form-control br-radius-zero" id="password"
				placeholder="Ingrese una contraseña" data-rule="minlen:1"
				data-msg="Ingrese una contraseña valida" required />
			<div class="validation"></div>

			<h6 class="mt-4">Nueva contraseña</h6>

			<input type="text" name="password"
				class="form-control br-radius-zero" id="password"
				placeholder="Ingrese una contraseña" data-rule="minlen:1"
				data-msg="Ingrese una contraseña valida" required />
			<div class="validation"></div>

			<h6 class="mt-4">Repita la nueva contraseña</h6>

			<input type="text" name="password"
				class="form-control br-radius-zero" id="password"
				placeholder="Ingrese una contraseña" data-rule="minlen:1"
				data-msg="Ingrese una contraseña valida" required />
			<div class="validation"></div>

		</div>

		<div class="form-group">
			<label for="exampleInputCalle">Dirección</label> <input type="calle"
				name="calle" path="calle" class="form-control" id="email"
				aria-describedby="email" placeholder="${usuario.getEmail()}">

			<label for="exampleInputNumero">Localidad</label> <input type="email"
				name="email" path="email" class="form-control" id="email"
				aria-describedby="email" placeholder="${usuario.getEmail()}">
		</div>
		<button type="submit" class="btn btn-primary">Guardar cambios</button>
	</form>

</div>

<c:if test='${rol != "PACIENTE"}'>
	</main>
</c:if>


<script src="js/jquery-3.5.1.min.js"></script>
<script src="../assets/dist/js/bootstrap.bundle.js"></script>

</body>

</html>