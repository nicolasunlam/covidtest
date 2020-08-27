<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>Pacientes Internados</title>

<link href="css/bootstrap.css" rel="stylesheet">

<jsp:include page="../../partial/${armarHeader}2.jsp" />

<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">

<div class="container">

	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h2 class="">Pacientes Internados</h2>

	</div>
	<h6 class="mb-5">Vea en detalle todos los pacientes internados en
		su institución</h6>

	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom w-50">
		<h5 class="">Opiciones de filtrado</h5>

	</div>
	<p class="mb-3">Realice el filtrado de la tabla para ver la
		información que necesita con mayor comodidad</p>

	<div class="my-3">
		<span class="text-success h6">Autorizado </span><input class="mr-4"
			" type="radio" name="estado" id="autorizado"> <span
			class="text-warning h6">En espera </span><input class="mr-4"
			" type="radio" name="estado" id="espera"> <span
			class="text-danger h6">Denegado </span><input class="mr-4"
			" type="radio" name="estado" id="denegado"> <span class="h6">Reestablecer
		</span><input class="mr-4" " type="radio" name="estado" id="restaurar">
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

				<th style="vertical-align: middle; width: 16%"
					class="border border-secondary"
					onmouseover="this.style.backgroundColor='#dee2e6 ';"
					onmouseout="this.style.backgroundColor='white';">FECHA DE
					INTERNACIÓN<img style="margin-top: 0.40rem;"
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
					PREVIAS<img style="margin-top: 0.40rem;"
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
					onmouseout="this.style.backgroundColor='white';">TRASLADO EN CURSO<img
					style="margin-top: 0.40rem;"
					class="bi bi-arrow-down-up float-right" alt="" src="img/sort.svg"
					width="10px" height="">

				</th>

				<th style="vertical-align: middle; width: 14%"
					class="border border-secondary"
					onmouseover="this.style.backgroundColor='#dee2e6';"
					onmouseout="this.style.backgroundColor='white';">ACCIÓN</th>
			</tr>

			<c:forEach items="${listaPacientesInternados}" var="traslado">

				<c:if test="${traslado.getAsignacionActual() != null}">

					<tr
						<c:if test="${traslado.getAsignacionReservada().getAutorizada() == true &&
								 traslado.getAsignacionActual().getHoraEgreso() == null}">
		            		class="table-success autorizado"
		               	</c:if>
						<c:if test="${traslado.getAsignacionReservada().getAutorizada() == false}">
		            		class="table-danger denegado"
		               	</c:if>
						<c:if test="${traslado.getAsignacionReservada().getAutorizada() == null}">
		            		class="espera"
		               	</c:if>>


						<%-- <form action="procesarTraslado" method="GET"> --%>

						<td style="vertical-align: middle;"><c:out
								value="${traslado.getAsignacionActual().getPaciente().getApellido()}, 
								${traslado.getAsignacionActual().getPaciente().getNombre()}" /></td>

						<td style="vertical-align: middle;"><fmt:parseDate
								value="${ traslado.getAsignacionActual().getHoraIngreso() }"
								pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
							<fmt:formatDate pattern="dd/MM/yyyy 'a las' HH:mm 'horas.'"
								value="${ parsedDateTime }" /></td>

						<td style="vertical-align: middle;"><c:out
								value="${traslado.getAsignacionActual().getPaciente().getEdad()}" /></td>

						<td style="vertical-align: middle;">
							<div class="text-left">
								<div>
									<label for="" class="h6"><c:if
											test="${traslado.getEnfermedades().size() == 0}">
											<p class="text-center mb-0">No tiene enfermedades.</p>
										</c:if> <c:if test="${traslado.getEnfermedades().size() != 0}">
											<span class="text-danger"> <c:forEach
													items="${traslado.getEnfermedades()}" var="enfermedad">
													<ul class="mb-3">
														<li>${enfermedad}.</li>
													</ul>
												</c:forEach>
											</span>
										</c:if> </label>
								</div>
							</div>

							<div class=" my-2">
								<c:if
									test="${traslado.getAsignacionActual().getPaciente().getTieneEmbarazo() == true}">
									<label for="" class="h6">Embarazada </label>

								</c:if>
							</div>

							<div class="">

								<c:if
									test="${traslado.getAsignacionActual().getPaciente().getEsFumador() == true}">
									<label for="" class="h6"> Fumador/a: </label>

								</c:if>

							</div>
						</td>

						<td class="align-middle"><span class=""> <c:if
									test="${traslado.getAsignacionActual().getPaciente().getPrioridad() == 5 || traslado.getAsignacionActual().getPaciente().getPrioridad() == 4}">
									<span>Baja</span>
									<svg width="1em" height="1em" viewBox="0 0 16 16"
										class="bi bi-heart-fill text-success" fill="currentColor"
										xmlns="http://www.w3.org/2000/svg">
							  		<path fill-rule="evenodd"
											d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
							</svg>
								</c:if> <c:if
									test="${traslado.getAsignacionActual().getPaciente().getPrioridad() == 3}">
									<span>Media</span>
									<svg width="1em" height="1em" viewBox="0 0 16 16"
										class="bi bi-heart-fill text-warning" fill="currentColor"
										xmlns="http://www.w3.org/2000/svg">
							  		<path fill-rule="evenodd"
											d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
								</svg>
								</c:if> <c:if
									test="${traslado.getAsignacionActual().getPaciente().getPrioridad() == 2 || traslado.getAsignacionActual().getPaciente().getPrioridad() == 1}">
									<span>Alta</span>
									<svg width="1em" height="1em" viewBox="0 0 16 16"
										class="bi bi-heart-fill text-danger" fill="currentColor"
										xmlns="http://www.w3.org/2000/svg">
							  		<path fill-rule="evenodd"
											d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
								</svg>
								</c:if>
						</span></td>
						<td style="vertical-align: middle;"><c:if
								test="${traslado.getAsignacionReservada() == null}">
		            		 Este paciente no se encuentra en ninguna reserva
		              		 	</c:if> <c:if
								test="${traslado.getAsignacionReservada() != nul}">

								<c:if
									test="${traslado.getAsignacionReservada().getAutorizada() == false}">

									<h6>
										<strong>TRASLADO RECHAZADO</strong>
									</h6>
								</c:if>

								<c:if
									test="${traslado.getAsignacionReservada().getAutorizada() == null}">

									<h6>
										<strong>ESPERANDO AUTORIZACIÓN</strong>
									</h6>
								</c:if>

								<c:if
									test="${traslado.getAsignacionReservada().getAutorizada() == true}">

									<h6>
										<strong>TRASLADO AUTORIZADO</strong>
									</h6>
								</c:if>

								<div
									id="mostrarInfo${traslado.getAsignacionReservada().getId()}"
									hidden>


									<p class="text-left mb-0">
										<strong>Institución:</strong>
										${traslado.getAsignacionReservada().getCama().getSala().getSector().getPiso().getInstitucion().getNombre()}
									</p>
									<p class="text-left mb-0">
										<strong>Sala:</strong>
										${traslado.getAsignacionReservada().getCama().getSala().getDescripcion()}
										(${traslado.getAsignacionReservada().getCama().getSala().getTipoSala().getDescripcion()})
									</p>
									<p class="text-left mb-0">
										<strong>Cama:</strong>
										${traslado.getAsignacionReservada().getCama().getDescripcion()}
										(${traslado.getAsignacionReservada().getCama().getTipoCama().getDescripcion()})
									</p>
									<p class="text-left mb-0">
										<strong>Fecha de reserva:</strong>
										<fmt:parseDate
											value="${traslado.getAsignacionReservada().getHoraReserva()}"
											pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
										<fmt:formatDate pattern="dd/MM/yyyy 'a las' HH:mm 'horas.'"
											value="${ parsedDateTime }" />
									</p>

								</div>

								<div class="d-flex justify-content-center">
									<div class="custom-control custom-switch mt-2">
										<input type="checkbox" class="custom-control-input"
											id="activarInfo${traslado.getAsignacionReservada().getId()}"
											onclick="javascript:mostrarInfo(this,'mostrarInfo${traslado.getAsignacionReservada().getId()}')">
										<label class="custom-control-label"
											for="activarInfo${traslado.getAsignacionReservada().getId()}">Mostrar
											información</label>
									</div>
								</div>

								<c:if
									test="${traslado.getAsignacionReservada().getAutorizada() == false}">



									<button type="button"
										class="btn btn-outline-danger	btn-sm mt-3" data-toggle="modal"
										data-target="#modalDenegar${traslado.getAsignacionActual().getId()}">
										Eliminar solicitud de traslado</button>
								</c:if>
							</c:if> <script type="text/javascript">
								function mostrarInfo(checkActivador,
										idContenedorOculto) {

									var contenedorOculto = document
											.getElementById(idContenedorOculto);

									if (checkActivador.checked == true) {
										contenedorOculto.hidden = false;
									} else {
										contenedorOculto.hidden = true;
									}
								}
							</script></td>
						<td style="vertical-align: middle;">
							<!-- Button trigger modal -->

							<div class="d-flex justify-content-center flex-wrap">

								<c:if test="${traslado.getAsignacionReservada() == nul}">
									<form class="my-0" action="trasladar">
										<input name="idPaciente"
											value="${traslado.getAsignacionActual().getPaciente().getId()}"
											hidden>
										<button style="width: 103px" class="btn btn-outline-info">Solicitar
											Traslado</button>
									</form>
								</c:if>

								<c:if test="${traslado.getAsignacionReservada() != nul}">
									<c:if
										test="${traslado.getAsignacionReservada().getAutorizada() == true &&
								 traslado.getAsignacionActual().getHoraEgreso() == null}">
										<form class="my-0" action="trasladoEnCurso" method="post">
											<input name="idAsignacionActual"
												value="${traslado.getAsignacionActual().getId()}" hidden>
											<input name="idAsignacionReservada"
												value="${traslado.getAsignacionReservada().getId()}" hidden>
											<button style="width: 103px" class="btn btn-success">Trasladar
												ahora</button>
										</form>
									</c:if>

									<c:if
										test="${traslado.getAsignacionReservada().getAutorizada() == null}">
										<form class="my-0" action="trasladar">
											<input name="idPaciente"
												value="${traslado.getAsignacionReservada().getPaciente().getId()}"
												hidden>
											<button style="width: 103px" class="btn btn-success" disabled>Trasladar
												ahora</button>
										</form>
									</c:if>
								</c:if>
								<a
									href="egresarPacienteMotivo?idPaciente=${traslado.getAsignacionActual().getPaciente().getId()}"
									class="btn btn-outline-success mx-1  my-1" type="button"
									style="width: 103px">Egresar</a> <a type="button"
									class="btn btn-outline-primary mx-1 my-1" style="width: 103px"
									href="detalle?id=${traslado.getAsignacionActual().getPaciente().getId()}">
									Ver detalle</a>


							</div>

						</td>

						<%-- </form> --%>

					</tr>

					<!-- Start Modal -->
					<div class="modal fade"
						id="modalDetalle${traslado.getAsignacionActual().getId()}"
						tabindex="-1" role="dialog"
						aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered modal-lg"
							role="document">
							<div class="modal-content  px-3">
								<div class="modal-header pb-2">
									<h5 class="modal-title" id="exampleModalLongTitleUno">Detalle
										del paciente</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span class="bg-white" aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body text-left">

									<p class="p mt-2 mb-4">

										El paciente <strong>
											${traslado.getAsignacionActual().getPaciente().getNombre()}
											${traslado.getAsignacionActual().getPaciente().getApellido()}
										</strong> de numero de documento <strong>
											${traslado.getAsignacionActual().getPaciente().getNumeroDocumento()}
											(${traslado.getAsignacionActual().getPaciente().getTipoDocumento().getDescripcion()})
										</strong> fue internado en la <strong>cama
											${traslado.getAsignacionActual().getCama().getDescripcion()}
											(${traslado.getAsignacionActual().getCama().getTipoCama().getDescripcion()})
										</strong> de la sala <strong>
											${traslado.getAsignacionActual().getCama().getSala().getDescripcion()}
											(${traslado.getAsignacionActual().getCama().getSala().getTipoSala().getDescripcion()})</strong>
										de su intitución.
									</p>

									<c:if test="${traslado.getAsignacionReservada() != null}">

										<p class="p mt-4 mb-4">
											El mismo
											<c:if
												test="${traslado.getAsignacionReservada().getAutorizada() != false}">
									se encuentra en
									</c:if>
											<c:if
												test="${traslado.getAsignacionReservada().getAutorizada() == false}">
									ha sido rechazado de
									</c:if>
											un traslado con destino de internación en la institución <strong>
												"${traslado.getAsignacionReservada().getCama().getSala().getSector().getPiso().getInstitucion().getNombre()}"
											</strong>ubicada en
											${traslado.getAsignacionReservada().getCama().getSala().getSector().getPiso().getInstitucion().getDomicilio().getLocalidad().getNombreLocalidad()},
											${traslado.getAsignacionReservada().getCama().getSala().getSector().getPiso().getInstitucion().getDomicilio().getLocalidad().getPartido().getProvincia().getNombreProvincia().getValor()},
											. de distancia. La internación
											<c:if
												test="${traslado.getAsignacionReservada().getAutorizada() != null}">
									está prevista para ser realizada 
									</c:if>
											<c:if
												test="${traslado.getAsignacionReservada().getAutorizada() == false}">
									estaba prevista para ser realizada 
									</c:if>
											en la <strong>cama
												${traslado.getAsignacionReservada().getCama().getDescripcion()}
												(${traslado.getAsignacionReservada().getCama().getTipoCama().getDescripcion()})
											</strong> de la sala <strong>
												${traslado.getAsignacionReservada().getCama().getSala().getDescripcion()}
												(${traslado.getAsignacionReservada().getCama().getSala().getTipoSala().getDescripcion()})</strong>
											en la intitución.
										</p>
									</c:if>

									<p class="mb-0 font-weight-lighter">Aprete el botón
										"Volver" para regresar a la lista de pacientes internados</p>
								</div>

								<div class="modal-footer">
									<button type="button" class="btn btn-outline-primary"
										data-dismiss="modal">Volver</button>

								</div>
							</div>
						</div>
					</div>
					<!-- End Modal -->

					<!-- Start Modal -->
					<div class="modal fade"
						id="modalDenegar${traslado.getAsignacionActual().getId()}"
						tabindex="-1" role="dialog"
						aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content  px-3">
								<div class="modal-header pb-2">
									<h5 class="modal-title" id="exampleModalLongTitleUno">Eliminar
										solicitud de traslado</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span class="bg-white" aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body text-left">

									<p class="p mt-2 mb-4">¿Está seguro/a que desea eliminar el
										traslado solicitado?</p>

									<p class="mb-0 font-weight-lighter text-danger">Una vez
										eliminado el traslado no podrá revertir la acción.</p>
								</div>

								<div class="modal-footer">
									<button type="button" class="btn btn-outline-primary"
										data-dismiss="modal">Volver</button>

									<form action="eliminarAsignacion" method="post">
										<input name="idAsignacion"
											value="${traslado.getAsignacionReservada().getId()}" hidden>
										<button type="submit" class="btn btn-outline-danger">Eliminar
											solicitud de traslado</button>
									</form>

								</div>
							</div>
						</div>
					</div>
					<!-- End Modal -->

				</c:if>

			</c:forEach>


		</table>
	</div>

	<div class="col-xl-3 col-lg-5 col-md-8 col-sm-12">

		<div
			class="row d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3">

			<div class="mr-4">

				<div class="">
					<a href="listaPacientesInternados">
						<button type="button" class="btn btn-outline-primary">
							Volver atrás</button>
					</a>
				</div>

			</div>

			<div class="">

				<a href="">
					<button type="button" class="btn btn-outline-danger">
						Cancelar</button>
				</a>

			</div>

		</div>
	</div>

	<div class="form-group my-2">
		<c:if test="${not empty error}">
			<h6>
				<span>${error}</span>
			</h6>
			<br>
	</div>
	</c:if>


</div>
</div>


</main>

</div>
</div>
<script>
	$('#restaurar').click(function() {
		$('.denegado').slideDown();
		$('.espera').slideDown();
		$('.autorizado').slideDown();
	});
	$('#autorizado').click(function() {
		$('.denegado').slideUp();
		$('.espera').slideUp();
		$('.autorizado').slideDown();
	});
	$('#denegado').click(function() {
		$('.espera').slideUp();
		$('.autorizado').slideUp();
		$('.denegado').slideDown();
	});
	$('#espera').click(function() {
		$('.autorizado').slideUp();
		$('.denegado').slideUp();
		$('.espera').slideDown();
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


<script src="js/sort.js"></script>
<script src="js/bootstrap.bundle.js"></script>
<script src="js/dashboard.js"></script>
</body>
</html>