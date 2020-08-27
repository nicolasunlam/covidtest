<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>Inserte titulo aquí</title>

<jsp:include page="../../partial/${armarHeader}2.jsp" />


<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">

<div class="container">

	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h2 class="">Egresar Paciente</h2>

	</div>
	<p>A continuación se muestran los datos del paciente a egresar</p>

	<div class="my-4">

		<div
			class="form-row d-flex justify-content-between flex-md-nowrap align-items-center pt-3 pb-2 mb-3">

			<div class="col-lg-1 col-md-2 col-sm-4">

				<label for="" class=""> <img alt="" src="img/avatar.svg"
					width="100%" height="85px" style="min-width:">
				</label>
			</div>

			<div class="col">

				<div class="">
					<label for="" class="h5">${paciente.getApellido()},
						${paciente.getNombre()}</label>
				</div>
				<div class="">
					<label for="" class="h6 ">${paciente.getTipoDocumento().name()}:
						${paciente.getNumeroDocumento()}</label>
				</div>
				<div class="">
					<label for="" class="h6 ">${paciente.getEmail()}</label>
				</div>

				<input name="idPaciente" type="hidden" value="${paciente.getId()}">

			</div>
		</div>

		<div class="my-2">
			<label for="" class="h6">Edad: </label> <span class="">${paciente.getEdad()}
			</span>
		</div>

		<div class="my-2">

			<style>
.circulo {
	display: inline-block;
	width: 15px;
	height: 15px;
	margin-left: 6px;
	background-color: #555;
}
</style>

			<label for="" class="h6">Prioridad: </label> <span class=""> <c:if
					test="${paciente.getPrioridad() == 5 || paciente.getPrioridad() == 4}">
					<span>Baja</span>
					<svg width="1em" height="1em" viewBox="0 0 16 16"
						class="bi bi-heart-fill text-success" fill="currentColor"
						xmlns="http://www.w3.org/2000/svg">
							  		<path fill-rule="evenodd"
							d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
							</svg>
				</c:if> <c:if test="${paciente.getPrioridad() == 3}">
					<span>Media</span>
					<svg width="1em" height="1em" viewBox="0 0 16 16"
						class="bi bi-heart-fill text-warning" fill="currentColor"
						xmlns="http://www.w3.org/2000/svg">
							  		<path fill-rule="evenodd"
							d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
								</svg>
				</c:if> <c:if
					test="${paciente.getPrioridad() == 2 || paciente.getPrioridad() == 1}">
					<span>Alta</span>
					<svg width="1em" height="1em" viewBox="0 0 16 16"
						class="bi bi-heart-fill text-danger" fill="currentColor"
						xmlns="http://www.w3.org/2000/svg">
							  		<path fill-rule="evenodd"
							d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
								</svg>
				</c:if>
			</span>
		</div>

		<div class="my-2">
			<label for="" class="h6">Domicilio: </label> <span class="">
				${paciente.getDomicilio().getLocalidad().getNombreLocalidad()},
				${paciente.getDomicilio().getLocalidad().getPartido().getNombrePartido()},
				${paciente.getDomicilio().getLocalidad().getPartido().getProvincia().getNombreProvincia().getValor()}.
			</span>
		</div>

		<div class="my-2">
			<c:if test="${paciente.getTieneEmbarazo() == true}">
				<label for="" class="h6">Embarazo: </label>
				<span class=""> En curso. </span>
			</c:if>
		</div>

		<div class="">
			<div>
				<label for="" class="h6">Enfermedades: <c:if
						test="${enfermedades.size() == 0}">
				No tiene.
				</c:if> <c:if test="${enfermedades.size() != 0}">
						<span class="text-danger"> <c:forEach
								items="${enfermedades}" var="enfermedad">
								<ul class="mb-3">
									<li>${enfermedad}.</li>
								</ul>
							</c:forEach>
						</span>
					</c:if>
				</label>
			</div>
		</div>

		<div class="">

			<c:if test="${paciente.getEsFumador() == true}">
				<label for="" class="h6"> Fumador/a: </label>
				<span class="text-danger"> Activo/a. </span>
			</c:if>

		</div>

		<div
			class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
			<h4>Elegir motivo del egreso</h4>

		</div>

		<div>

			<form action="detalleEgreso" method="get">

				<div class="form-group mb-4">

					<h6>Motivo de Egreso</h6>
					<select name="motivoEgreso" type="MotivoEgreso"
						class="form-control br-radius-zero">
						<option type="MotivoEgreso">CURADO
						<option type="MotivoEgreso">FALLECIDO
					</select>
				</div>

				<input type="hidden" value="${paciente.getId()}" name="idPaciente">

				<button type="submit" class="btn btn-success mr-3">Egresar</button>

				<a href="bienvenido" class="btn btn-danger">Cancelar</a>

			</form>


		</div>



	</div>


	<div class="form-group">

		<c:if test="${not empty error}">
			<h4>
				<span>${error}</span>
			</h4>
			<br>
	</div>
	</c:if>

</div>
</div>

</main>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script>
	window.jQuery
			|| document
					.write('<script src="../assets/js/vendor/jquery.slim.min.js"><\/script>')
</script>
<script src="../assets/dist/js/bootstrap.bundle.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.9.0/feather.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
<script src="js/dashboard.js"></script>
</body>
</html>