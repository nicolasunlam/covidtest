<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>Inserte titulo aquí</title>

<jsp:include page="../../partial/${armarHeader}2.jsp" />

<style>
.span1 {
	display: inline-block;
	width: 15px;
	height: 15px;
	margin-left: 6px;
	background-color: #555;
}
</style>

<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">

<div class="container">

	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h2 class="">Pacientes Internados</h2>

		<a href="asignacionesParaRecibir" class="btn btn-outline-success">
			Ver Pacientes para Recibir</a>

	</div>
	<h6 class="mb-5">Vea la lista de pacientes internados en su
		institución</h6>

	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h5 class="">Opiciones de filtrado</h5>
		<div class="">
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
				<button type="button" class="btn btn-outline-primary">
					Volver atrás</button>
			</a>
		</div>

	</div>
	<p class="mb-3">Realice el filtrado de la tabla para ver la
		información que necesita con mayor comodidad</p>

	<div class="my-3">
		<span class=" h6 text-danger">Alta </span><input class="mr-4"
			" type="radio" name="estado" id="alta"> <span
			class="text-warning h6">Media </span><input class="mr-4"
			" type="radio" name="estado" id="media"> <span
			class="text-success h6">Baja </span> <input class="mr-4"
			" type="radio" name="estado" id="baja"> <span
			class="text-success h6">Restablecer </span> <input class="mr-4"
			" type="radio" name="estado" id="restaurar">
	</div>

	<c:if test="${listaPacientesInternados.size() != 0}">

		<div class="table-responsive">
			<table
				class="table table-bordered table-hover responsive nowrap text-center">
				<tr>
					<th class="bg-light">NOMBRE</th>
					<th class="bg-light">DNI</th>
					<th class="bg-light">EDAD</th>
					<th class="bg-light">PRIORIDAD</th>
					<th class="bg-light">ACCIÓN</th>
				</tr>
				<c:forEach items="${listaPacientesInternados}" var="paciente">
					<tr
						<c:if test="${paciente.getPrioridad() >= 4}">
		            		class="baja "
		               	</c:if>
						<c:if test="${paciente.getPrioridad() == 3}">
		            		class="media table-warning"
		               	</c:if>
						<c:if test="${paciente.getPrioridad() <= 2}">
		            		class="alta table-danger"
		               	</c:if>>

						<td style="width: 16%" class="align-middle"><c:out
								value="${paciente.getApellido()}, ${paciente.getNombre()}" /></td>


						<td style="width: 16%" class="align-middle"><c:out
								value="${paciente.getNumeroDocumento()} (${paciente.getTipoDocumento().name()})" /></td>

						<td style="width: 16%" class="align-middle"><c:out
								value="${paciente.getEdad()} años" /></td>

						<td  class="align-middle"><c:if
								test="${paciente.getPrioridad() >= 4}">
								<c:out value="Baja " />
								<span class="span1 rounded-circle bg-success"></span>
							</c:if> <c:if test="${paciente.getPrioridad() == 3}">
								<c:out value="Media" />
								<span class="span1 rounded-circle bg-warning"></span>
							</c:if> <c:if test="${paciente.getPrioridad() <= 2}">
								<c:out value="Alta " />
								<span class="span1 rounded-circle bg-danger"></span>
							</c:if></td>

						<td style="width: 300px; min-width: 300px" class="align-middle px-4 ">
							<a
							href="egresarPacienteMotivo?idPaciente=${paciente.getId()}"
							type="button" class="btn btn-outline-primary ">Egresar</a> 
							
							<a
							href="trasladar?idPaciente=${paciente.getId()}" type="button"
							class="btn btn-outline-info">Trasladar</a>
							<a
							href="trasladar?idPaciente=${paciente.getId()}" type="button"
							class="btn btn-outline-success">Ver detalle</a>
							
							</td>

					</tr>
				</c:forEach>
			</table>
		</div>


	</c:if>

	<c:if test="${listaPacientesInternados.size() == 0}">
		<h5 class="">No hay pacientes Internados</h5>
	</c:if>

</div>
</div>



</main>


<script>
	$('#restaurar').click(function() {
		$('.alta').slideDown();
		$('.media').slideDown();
		$('.baja').slideDown();
	});
	$('#alta').click(function() {
		$('.alta').slideDown();
		$('.media').slideUp();
		$('.baja').slideUp();
	});
	$('#media').click(function() {
		$('.alta').slideUp();
		$('.media').slideDown();
		$('.baja').slideUp();
	});
	$('#baja').click(function() {
		$('.alta').slideUp();
		$('.media').slideUp();
		$('.baja').slideDown();
	});
</script>
<script src="js/sort.js"></script>
<script src="js/bootstrap.bundle.js"></script>
<script src="js/feather.min.js"></script>
<script src="js/Chart.min.js"></script>
<script src="js/dashboard.js"></script>
</body>
</html>