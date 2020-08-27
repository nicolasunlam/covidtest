<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>Inserte titulo aquí</title>
    
<jsp:include page="../../partial/${armarHeader}2.jsp" />


<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
	
	
	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h2 class="">Egresar Paciente</h2>

	</div>
	<p>A continuación se muestran los datos del paciente a egresar</p>

	<div class="my-4">

			<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h5 class="">Datos del Paciente</h5>

	</div>
	
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

		<%-- <div class="my-2">
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
 --%>
			
			<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h5 class="">Datos del Egreso</h5>

	</div>

			
			<p >Fecha y Hora de Egreso: ${horaEgreso}</p>
			
			<p>Motivo de Egreso: ${asignacion.getMotivoEgreso()}</p>
			
			<p>Sala liberada: sala ${asignacion.getCama().getSala().getDescripcion()} de ${asignacion.getCama().getSala().getTipoSala().getDescripcion()} del piso ${asignacion.getCama().getSala().getSector().getPiso().getNumeroPiso()}.
			</p>
			
			<p>Cama liberada: Cama ${asignacion.getCama().getDescripcion()} de ${asignacion.getCama().getTipoCama().getDescripcion()}.
			</p>
			
			<div
			class="pt-3 pb-2">
	
			<a href="listaPacientesInternados" class="btn btn-primary">Volver al inicio</a>
	
		</div>
	
	</div>
	<div class="form-group">
	
		<c:if test="${not empty error}">
			<h4>
				<span>${error}</span>
			</h4>
			<br>
		</c:if>
	</div>
	</div>

</main>


<jsp:include page="../../partial/footer.jsp" />