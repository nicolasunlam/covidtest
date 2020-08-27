<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>Inserte titulo aquí</title>

<jsp:include page="../../partial/${armarHeader}2.jsp" />

<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">


<section class="container">

	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h4>Egresar Paciente</h4>		
	</div>

	<p>Realice un egreso de un paciente ingresando su documento y motivo del egreso</p>

	<form action="egresoValido" method="GET" role="form"
		class="contactForm">


		<div class="form-group">

			<label for="nombre" class="h6 my-3">Número de documento<span
				class="text-primary font-weight-bold">*</span></label> <input
				path="numeroDocumento" type="text" name="numeroDocumento"
				class="form-control br-radius-zero" id="numeroDocumento"
				placeholder="Ingrese número de documento" data-rule="minlen:1"
				data-msg="Ingrese número de documento valido" />
			<div class="validation"></div>
		</div>


		<div class="form-group">

			<label for="nombre" class="h6 my-3">Tipo de documento<span
				class="text-primary font-weight-bold">*</span></label> <select
				path="tipoDocumento" name="tipoDocumento" type="TipoDocumento"
				class="form-control br-radius-zero">
				<option path="tipoDocumento" id="tipoDocumento" type="TipoDocumento">DNI

				
				<option path="tipoDocumento" id="tipoDocumento" type="TipoDocumento">PASAPORTE

				
				<option path="tipoDocumento" id="tipoDocumento" type="TipoDocumento">LIBRETA
					CÍVICA
			</select>

			<div class="validation"></div>
		</div>

		<div class="form-group ">

			<label for="nombre" class="h6 my-3">Seleccione un motivo de
				egreso<span class="text-primary font-weight-bold">*</span>
			</label> <select name="motivoEgreso" type="MotivoEgreso"
				class="form-control br-radius-zero">
				<option type="MotivoEgreso">CURADO
				<option type="MotivoEgreso">FALLECIDO
			</select>
		</div>

		<div class="validation"></div>

<c:if test="${not empty error}">
			<div class="form-group text-danger">

				<h6>
					<span>${error}</span>
				</h6>
				<br>
			</div>
		</c:if>

		<div class="form-action mt-3">
			<button type="submit" class="btn btn-success mr-3">Egresar
				Paciente</button>
				
				<a href="listaPacientesInternados" class="btn btn-danger">Cancelar</a>
		</div>

		

	</form>

</section>

</main>

<script src="js/bootstrap.bundle.js"></script>
<script src="js/dashboard.js"></script>
</body>
</html>
