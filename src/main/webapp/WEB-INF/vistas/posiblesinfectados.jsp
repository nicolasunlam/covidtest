<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>Disponibilidad De Camas</title>

<jsp:include page="../../partial/${armarHeader}2.jsp" />

<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">

<div class="container">

	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h2 class="">Posibles Infectados</h2>

	</div>
	<h6 class="mb-5">Vea en detalle todos los usuarios que realizaron
		el test online y dieron positivo</h6>

	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom w-50">
		<h5 class="">Opiciones de filtrado</h5>

	</div>
	<p class="mb-3">Realice el filtrado de la tabla para ver la
		información que necesita con mayor comodidad</p>

	<div class="my-3">
		<span class="text-success h6">Baja </span><input class="mr-4"
			" type="radio" name="estado" id="baja"> <span
			class="text-warning h6">Media </span><input class="mr-4"
			" type="radio" name="estado" id="prio-media"> <span
			class="text-danger h6">Alta </span><input class="mr-4" " type="radio"
			name="estado" id="alta"> <span class="h6">Todos </span><input
			class="mr-4" " type="radio" name="estado" id="restaurar">
	</div>

	<div class="form-row mb-3">
		<div class="col-md-12 col-lg-6">
			<label for="exampleInputEmail1">Nombre del paciente</label> <input
				type="text" name="" class="form-control" id="inputNombre"
				aria-describedby="email"
				placeholder="Ingrese el nombre del paciente a buscar..."
				onkeyup="filtrarPorNombre()">
		</div>

		<div class="col-md-12 col-lg-6 ">
			<label for="exampleInputEmail1">Numero de documento</label> <input
				type="text" name="" class="form-control" id="inputCUIT"
				aria-describedby="email"
				placeholder="Ingrese el numero de documento del paciente a buscar..."
				onkeyup="filtrarPorCUIT()">
		</div>

	</div>

	<div class="table-responsive">

		<table id="myTable"
			class="table table-bordered table-hover responsive nowrap text-center">

			<tr class="una bg-white">

				<th style="vertical-align: middle; width: 16%"
					class="border border-secondary"
					onmouseover="this.style.backgroundColor='#dee2e6 ';"
					onmouseout="this.style.backgroundColor='white';">PACIENTE <img
					style="margin-top: 0.40rem;"
					class="bi bi-arrow-down-up float-right" alt="" src="img/sort.svg"
					width="10px" height="">

				</th>

				<th style="vertical-align: middle; width: 12%"
					class="border border-secondary"
					onmouseover="this.style.backgroundColor='#dee2e6 ';"
					onmouseout="this.style.backgroundColor='white';">DOCUMENTO <img
					style="margin-top: 0.40rem;"
					class="bi bi-arrow-down-up float-right" alt="" src="img/sort.svg"
					width="10px" height="">

				</th>

				<th style="vertical-align: middle; width: 8%"
					class="border border-secondary"
					onmouseover="this.style.backgroundColor='#dee2e6';"
					onmouseout="this.style.backgroundColor='white';">EDAD<img
					style="margin-top: 0.40rem;"
					class="bi bi-arrow-down-up float-right" alt="" src="img/sort.svg"
					width="10px" height="">

				</th>

				<th style="vertical-align: middle; width: 16%"
					class="border border-secondary"
					onmouseover="this.style.backgroundColor='#dee2e6';"
					onmouseout="this.style.backgroundColor='white';">ENFERMEDADES
					<img style="margin-top: 0.40rem;"
					class="bi bi-arrow-down-up float-right" alt="" src="img/sort.svg"
					width="10px" height="">

				</th>

				<th style="vertical-align: middle; width: 12%"
					class="border border-secondary"
					onmouseover="this.style.backgroundColor='#dee2e6';"
					onmouseout="this.style.backgroundColor='white';">PRIORIDAD <img
					style="margin-top: 0.40rem;"
					class="bi bi-arrow-down-up float-right" alt="" src="img/sort.svg"
					width="10px" height="">

				</th>

				<th style="vertical-align: middle; width: 25%"
					class="border border-secondary"
					onmouseover="this.style.backgroundColor='#dee2e6';"
					onmouseout="this.style.backgroundColor='white';">RESERVA <img
					style="margin-top: 0.40rem;"
					class="bi bi-arrow-down-up float-right" alt="" src="img/sort.svg"
					width="10px" height="">

				</th>

				<th style="vertical-align: middle; width: 14%"
					class="border border-secondary"
					onmouseover="this.style.backgroundColor='#dee2e6';"
					onmouseout="this.style.backgroundColor='white';">ACCIÓN</th>
			</tr>

			</tr>
			<c:forEach items="${posiblesInfectados}" var="paciente">
				<tr
					<c:if
						test="${paciente.getPaciente().getPrioridad() == 5 || paciente.getPaciente().getPrioridad() == 4}">
						class="baja"
					</c:if>
					<c:if test="${paciente.getPaciente().getPrioridad() == 3}">
					class="prio-media"
					</c:if>
					<c:if
						test="${paciente.getPaciente().getPrioridad() == 2 || paciente.getPaciente().getPrioridad() == 1}">
						class="alta"
					</c:if>>
					<td class="align-middle"><c:out
							value="${paciente.getPaciente().getApellido()}, ${paciente.getPaciente().getNombre()}" /></td>
					<td class="align-middle"><c:out
							value="${paciente.getPaciente().getNumeroDocumento()}" /></td>

					<td class="align-middle"><c:out
							value="${paciente.getPaciente().getEdad()}" /></td>

					<td class="align-middle">

						<div class="text-left">
							<div>
								<label for="" class="h6"><c:if
										test="${paciente.getEnfermedades().size() == 0}">
										<p class="text-center mb-0">No tiene enfermedades.</p>
									</c:if> <c:if test="${paciente.getEnfermedades().size() != 0}">
										<span class="text-danger"> <c:forEach
												items="${paciente.getEnfermedades()}" var="enfermedad">
												<ul class="mb-3">
													<li>${enfermedad}.</li>
												</ul>
											</c:forEach>
										</span>
									</c:if> </label>
							</div>
						</div>

						<div class=" my-2">
							<c:if test="${paciente.getPaciente().getTieneEmbarazo() == true}">
								<label for="" class="h6">Embarazada </label>

							</c:if>
						</div>

						<div class="">

							<c:if test="${paciente.getPaciente().getEsFumador() == true}">
								<label for="" class="h6"> Fumador/a: </label>

							</c:if>

						</div>
					</td>

					<td class="align-middle"><span class=""> <c:if
								test="${paciente.getPaciente().getPrioridad() == 5 || paciente.getPaciente().getPrioridad() == 4}">
								<span>Baja</span>
								<svg width="1em" height="1em" viewBox="0 0 16 16"
									class="bi bi-heart-fill text-success" fill="currentColor"
									xmlns="http://www.w3.org/2000/svg">
							  		<path fill-rule="evenodd"
										d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
							</svg>
							</c:if> <c:if test="${paciente.getPaciente().getPrioridad() == 3}">
								<span>Media</span>
								<svg width="1em" height="1em" viewBox="0 0 16 16"
									class="bi bi-heart-fill text-warning" fill="currentColor"
									xmlns="http://www.w3.org/2000/svg">
							  		<path fill-rule="evenodd"
										d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
								</svg>
							</c:if> <c:if
								test="${paciente.getPaciente().getPrioridad() == 2 || paciente.getPaciente().getPrioridad() == 1}">
								<span>Alta</span>
								<svg width="1em" height="1em" viewBox="0 0 16 16"
									class="bi bi-heart-fill text-danger" fill="currentColor"
									xmlns="http://www.w3.org/2000/svg">
							  		<path fill-rule="evenodd"
										d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
								</svg>
							</c:if>
					</span></td>

					<td class="align-middle"><c:if
							test="${paciente.getAsignacion() == nul}">
						Este paciente no a sido asignado a ninguna cama.
							
						</c:if> <c:if test="${paciente.getAsignacion() != nul}">

							<p class="text-left mb-0">
								<strong>Institución:</strong>
								${paciente.getAsignacion().getCama().getSala().getSector().getPiso().getInstitucion().getNombre()}
							</p>
							<p class="text-left mb-0">
								<strong>Sala:</strong>
								${paciente.getAsignacion().getCama().getSala().getDescripcion()}
								(${paciente.getAsignacion().getCama().getSala().getTipoSala().getDescripcion()})
							</p>
							<p class="text-left mb-0">
								<strong>Cama:</strong>
								${paciente.getAsignacion().getCama().getDescripcion()}
								(${paciente.getAsignacion().getCama().getTipoCama().getDescripcion()})
							</p>
							<p class="text-left mb-0">
								<strong>Fecha de reserva:</strong>
								<fmt:parseDate
									value="${paciente.getAsignacion().getHoraReserva()}"
									pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
								<fmt:formatDate pattern="dd/MM/yyyy 'a las' HH:mm 'horas.'"
									value="${ parsedDateTime }" />
							</p>


						</c:if></td>

					<td class="align-middle">

						<div class="">
							<c:if test="${paciente.getAsignacion() != nul}">
								<form class="my-0"
									action="asignar">
									<input name="idPaciente" value="${paciente.getPaciente().getId()}" hidden>
									<button class="btn btn-outline-secondary" disabled>Asignar
										Cama</button>
								</form>
							</c:if>
							<c:if test="${paciente.getAsignacion() == nul}">
								<form class="my-0"
									action="asignar">
									<input name="idPaciente" value="${paciente.getPaciente().getId()}" hidden>
									<button class="btn btn-success">Asignar
										Cama</button>
								</form>
							</c:if>
							
							<form action="crearMensaje" class="mb-0" method=post>


								<input class="invisible" type="hidden" id="id" name="id"
									value="${paciente.getPaciente().getId()}"> <input
									class="btn btn-outline-primary mt-2" type="submit"
									value="Enviar Mensaje">


								<%-- <input type="hidden" id="id" name="id"
											value="${paciente.getId()}"> 
										<input type="submit"
											value="Enviar mensaje">  --%>

							</form>
						</div>
					</td>
			</c:forEach>
		</table>
	</div>
</div>
</main>

</div>
</div>

</main>

</div>
</div>
<script>
	$('#restaurar').click(function() {
		$('.alta').slideDown();
		$('.prio-media').slideDown();
		$('.baja').slideDown();
	});
	$('#alta').click(function() {
		$('.alta').slideDown();
		$('.prio-media').slideUp();
		$('.baja').slideUp();
	});
	$('#prio-media').click(function() {
		$('.prio-media').slideDown();
		$('.alta').slideUp();
		$('.baja').slideUp();
	});
	$('#baja').click(function() {
		$('.baja').slideDown();
		$('.prio-media').slideUp();
		$('.alta').slideUp();
	});

	function filtrarPorNombre() {
		// Declare variables
		var input, filter, table, tr, td, i, txtValue;
		input = document.getElementById("inputNombre");
		filter = input.value.toUpperCase();
		table = document.getElementById("myTable");
		tr = table.getElementsByTagName("tr");

		// Loop through all table rows, and hide those who don't match the search query
		for (i = 0; i < tr.length; i++) {
			td = tr[i].getElementsByTagName("td")[0];
			if (td) {
				txtValue = td.textContent || td.innerText;
				if (txtValue.toUpperCase().indexOf(filter) > -1) {
					tr[i].style.display = "";
				} else {
					tr[i].style.display = "none";
				}
			}
		}
	}

	function filtrarPorTipoInstitucion() {
		// Declare variables
		var input, filter, table, tr, td, i, txtValue;
		input = document.getElementById("inputTipoInstitucion");
		filter = input.value.toUpperCase();
		table = document.getElementById("myTable");
		tr = table.getElementsByTagName("tr");

		// Loop through all table rows, and hide those who don't match the search query
		for (i = 0; i < tr.length; i++) {
			td = tr[i].getElementsByTagName("td")[1];
			if (td) {
				txtValue = td.textContent || td.innerText;
				if (txtValue.toUpperCase().indexOf(filter) > -1) {
					tr[i].style.display = "";
				} else {
					tr[i].style.display = "none";
				}
			}
		}
	}

	function filtrarPorCUIT() {
		// Declare variables
		var input, filter, table, tr, td, i, txtValue;
		input = document.getElementById("inputCUIT");
		filter = input.value.toUpperCase();
		table = document.getElementById("myTable");
		tr = table.getElementsByTagName("tr");

		// Loop through all table rows, and hide those who don't match the search query
		for (i = 0; i < tr.length; i++) {
			td = tr[i].getElementsByTagName("td")[2];
			if (td) {
				txtValue = td.textContent || td.innerText;
				if (txtValue.toUpperCase().indexOf(filter) > -1) {
					tr[i].style.display = "";
				} else {
					tr[i].style.display = "none";
				}
			}
		}
	}
</script>

<script src="js/funciones.js"></script>
<script src="js/sort.js"></script>
<script src="js/bootstrap.bundle.js"></script>
<script src="js/dashboard.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.9.0/feather.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
<script src="js/dashboard.js"></script>
</body>
</html>
