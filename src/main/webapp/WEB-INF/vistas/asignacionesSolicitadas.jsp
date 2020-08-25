<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>Asignaciones solicitadas</title>

<link href="css/bootstrap.css" rel="stylesheet">

<jsp:include page="../../partial/${armarHeader}2.jsp" />

<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">

<div class="container">

	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h2 class="">Asignaciones Solicitadas</h2>
		<a href="listaPacientesInternados" class="btn btn-outline-success">
			Ver Pacientes Internados</a>
	</div>
	<h6 class="mb-5">Vea en detalle todas las asignaciones solicitadas
		por la central de operación</h6>

	<c:if test="${asignaciones.size() == 0}">
	No tiene asignaciones solicitadas
	</c:if>

	<c:if test="${asignaciones.size() != 0}">

		<div
			class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom w-50">
			<h5 class="">Opiciones de filtrado</h5>

				<a
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
						</c:if>>
					<button type="button" class="btn btn-outline-primary">
						Volver a panel</button>
				</a>
			</div>
			<p class="mb-3">Realice el filtrado de la tabla para ver la
				información que necesita con mayor comodidad</p>

			<div class="my-3">
				<span class="text-success h6">Completado</span><input class="mr-4"
					" type="radio" name="estado" id="autorizado"> <span
					class="text-warning h6">En curso </span><input class="mr-4"
					" type="radio" name="estado" id="espera"> <span
					class="text-danger h6">Rechazado </span><input class="mr-4"
					" type="radio" name="estado" id="denegado"> <span
					class="h6">Todos </span><input class="mr-4" " type="radio"
					name="estado" id="restaurar">
			</div>

			<div class="table-responsive">

				<table id="myTable"
					class="table table-bordered table-hover responsive nowrap text-center">

					<tr class="una bg-white">

						<th style="vertical-align: middle; width: 14%"
							class="border border-secondary"
							onmouseover="this.style.backgroundColor='#dee2e6 ';"
							onmouseout="this.style.backgroundColor='white';">PACIENTE A
							INTERNAR<img style="margin-top: 0.40rem;"
							class="bi bi-arrow-down-up float-right" alt="" src="img/sort.svg"
							width="10px" height="">

						</th>

						<th style="vertical-align: middle; width: 13%"
							class="border border-secondary"
							onmouseover="this.style.backgroundColor='#dee2e6 ';"
							onmouseout="this.style.backgroundColor='white';">FECHA DE
							RESERVA<img style="margin-top: 0.40rem;"
							class="bi bi-arrow-down-up float-right" alt="" src="img/sort.svg"
							width="10px" height="">

						</th>

						<th style="vertical-align: middle; width: 14%"
							class="border border-secondary"
							onmouseover="this.style.backgroundColor='#dee2e6';"
							onmouseout="this.style.backgroundColor='white';">INSTITUCIÓN
							DESTINO <img style="margin-top: 0.40rem;"
							class="bi bi-arrow-down-up float-right" alt="" src="img/sort.svg"
							width="10px" height="">

						</th>

						<th style="vertical-align: middle; width: 11%"
							class="border border-secondary"
							onmouseover="this.style.backgroundColor='#dee2e6';"
							onmouseout="this.style.backgroundColor='white';">DISTANCIA<img
							style="margin-top: 0.40rem;"
							class="bi bi-arrow-down-up float-right" alt="" src="img/sort.svg"
							width="10px" height="">

						</th>

						<th style="vertical-align: middle; width: 11%"
							class="border border-secondary"
							onmouseover="this.style.backgroundColor='#dee2e6';"
							onmouseout="this.style.backgroundColor='white';">URGENCIA <img
							style="margin-top: 0.40rem;"
							class="bi bi-arrow-down-up float-right" alt="" src="img/sort.svg"
							width="10px" height="">

						</th>

						<th style="vertical-align: middle; width: 11%"
							class="border border-secondary"
							onmouseover="this.style.backgroundColor='#dee2e6';"
							onmouseout="this.style.backgroundColor='white';">ESTADO <img
							style="margin-top: 0.40rem;"
							class="bi bi-arrow-down-up float-right" alt="" src="img/sort.svg"
							width="10px" height="">

						</th>

						<th style="vertical-align: middle; width: 20%"
							class="border border-secondary"
							onmouseover="this.style.backgroundColor='#dee2e6';"
							onmouseout="this.style.backgroundColor='white';">ACCIÓN</th>
					</tr>

					<c:forEach items="${asignaciones}" var="asignacion">

						<tr
							<c:if test="${asignacion.getAsignacion().getHoraIngreso() != null}">
		            		class="table-success autorizado"
		               	</c:if>
							<c:if test="${asignacion.getAsignacion().getAutorizada() == false}">
		            		class="table-danger denegado"
		               	</c:if>
							<c:if test="${asignacion.getAsignacion().getHoraIngreso() == null &&
					 asignacion.getAsignacion().getAutorizada() == true}">
		            		class="espera"
		               	</c:if>>

							<form action="procesarAsignacion" method="GET">

								<td style="vertical-align: middle;"><c:out
										value="${asignacion.getAsignacion().getPaciente().getApellido()}, 
								${asignacion.getAsignacion().getPaciente().getNombre()}" /></td>

								<td style="vertical-align: middle;"><fmt:parseDate
										value="${ asignacion.getAsignacion().getHoraReserva() }"
										pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
									<fmt:formatDate pattern="dd/MM/yyyy 'a las' HH:mm 'horas.'"
										value="${ parsedDateTime }" /></td>

								<td style="vertical-align: middle;"><c:out
										value="${asignacion.getAsignacion().getCama()
						.getSala().getSector().getPiso().getInstitucion().getNombre()}" /></td>

								<td style="vertical-align: middle;"><c:out
										value="${Math.round(asignacion.getDistancia())} Km" /></td>

								<td style="vertical-align: middle;">${asignacion.getAsignacion().getUrgencia()}</td>

								<td style="vertical-align: middle;"><c:if
										test="${asignacion.getAsignacion().getHoraIngreso() != null}">
		            		Completado
		               	</c:if> <c:if
										test="${asignacion.getAsignacion().getAutorizada() == false}">
		            		Rechazado
		               	</c:if> <c:if
										test="${asignacion.getAsignacion().getHoraIngreso() == null &&
					 asignacion.getAsignacion().getAutorizada() == true}">
		            		En curso
		               	</c:if></td>

								<td style="vertical-align: middle;">
									<!-- Button trigger modal --> <c:if
										test="${asignacion.getAsignacion().getAutorizada() == false}">

										<div class="d-flex justify-content-between flex-wrap">
											<button type="button"
												class="btn btn-outline-primary mb-lg-2 mb-xl-0"
												style="width: 103px" data-toggle="modal"
												data-target="#modalDetalle${asignacion.getAsignacion().getId()}">
												Ver Detalle</button>

											<button type="button" class="btn btn-outline-danger"
												style="width: 103px" data-toggle="modal"
												data-target="#modalRechazar${asignacion.getAsignacion().getId()}">
												Rechazar</button>
										</div>
									</c:if> <c:if
										test="${asignacion.getAsignacion().getAutorizada() != false}">

										<div class="d-flex justify-content-between flex-wrap">

											<button type="button" data-toggle="modal"
												style="width: 103px"
												data-target="#modalAsignar${asignacion.getAsignacion().getId()}"
												<c:if test="${asignacion.getAsignacion().getAutorizada() == true}">
		            		 class="btn btn-outline-success mb-lg-2 mb-xl-0"
		              		 	</c:if>
												<c:if test="${asignacion.getAsignacion().getAutorizada() != true}">
		            		 class="btn btn-outline-secondary mb-lg-2 mb-xl-0" disabled
		              		 	</c:if>>Internar</button>

											<button type="button" class="btn btn-outline-primary"
												style="width: 103px" data-toggle="modal"
												data-target="#modalDetalle${asignacion.getAsignacion().getId()}">
												Ver Detalle</button>
										</div>
										<div>
											<button type="button" class="btn btn-outline-danger mt-2"
												style="width: 103px" data-toggle="modal"
												data-target="#modalRechazar${asignacion.getAsignacion().getId()}">
												Rechazar</button>
										</div>

									</c:if>

								</td>

							</form>

						</tr>

						<!-- Start Modal -->
						<div class="modal fade"
							id="modalTrasladar${asignacion.getAsignacion().getId()}"
							tabindex="-1" role="dialog"
							aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered modal-lg"
								role="document">
								<div class="modal-content  px-3">
									<div class="modal-header pb-2">
										<h5 class="modal-title" id="exampleModalLongTitleUno">Realizar
											asignación</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span class="bg-white" aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body text-left">

										<p class="p mt-2 mb-4">
											Realizar internación del paciente <strong>
												${asignacion.getAsignacion().getPaciente().getNombre()}
												${asignacion.getAsignacion().getPaciente().getApellido()} </strong>
											de numero de documento <strong>
												${asignacion.getAsignacion().getPaciente().getNumeroDocumento()}
												(${asignacion.getAsignacion().getPaciente().getTipoDocumento().getDescripcion()})
											</strong> en la <strong> cama
												${asignacion.getAsignacion().getCama().getDescripcion()}
												(${asignacion.getAsignacion().getCama().getTipoCama().getDescripcion()})
											</strong> en la <strong> sala
												${asignacion.getAsignacion().getCama().getSala().getDescripcion()}
												(${asignacion.getAsignacion().getCama().getSala().getTipoSala().getDescripcion()})</strong>
											de su institución.
										</p>

										<p class="mb-0 font-weight-lighter">Al apretar "Internar"
											se hará efectiva la internación y se enviará una notificación
											a la operadora central.</p>
									</div>

									<div class="modal-footer">
										<button type="button" class="btn btn-outline-primary"
											data-dismiss="modal">Volver</button>
										<form action="procesarAsignacion" method="post">

											<input name="idAsignacion"
												value="${asignacion.getAsignacion().getId()}" hidden>
											<input name="distancia" value="${asignacion.getDistancia()}"
												hidden>
											<button type="submit" class="btn btn-outline-success">Internar</button>
										</form>
									</div>
								</div>
							</div>
						</div>
						<!-- End Modal -->


						<!-- Start Modal -->
						<div class="modal fade"
							id="modalDetalle${asignacion.getAsignacion().getId()}"
							tabindex="-1" role="dialog"
							aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered modal-lg"
								role="document">
								<div class="modal-content  px-3">
									<div class="modal-header pb-2">
										<h5 class="modal-title" id="exampleModalLongTitleUno">Detalle
											de la asignación</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span class="bg-white" aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body text-left">

										<p class="p mt-2 mb-4">
											Reserva de asignación realizada el día <strong> <fmt:parseDate
													value="${ asignacion.getAsignacion().getHoraReserva() }"
													pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime"
													type="both" /> <fmt:formatDate
													pattern="dd 'de' MMMM 'a las' HH:mm 'horas'"
													value="${ parsedDateTime }" />
											</strong> para internar al paciente <strong>
												${asignacion.getAsignacion().getPaciente().getNombre()}
												${asignacion.getAsignacion().getPaciente().getApellido()} </strong>
											de numero de documento <strong>
												${asignacion.getAsignacion().getPaciente().getNumeroDocumento()}
												(${asignacion.getAsignacion().getPaciente().getTipoDocumento().getDescripcion()})
											</strong> en la <strong> cama
												${asignacion.getAsignacion().getCama().getDescripcion()}
												(${asignacion.getAsignacion().getCama().getTipoCama().getDescripcion()})
											</strong> en la <strong> sala
												${asignacion.getAsignacion().getCama().getSala().getDescripcion()}
												(${asignacion.getAsignacion().getCama().getSala().getTipoSala().getDescripcion()})</strong>
											de su institución.
										</p>

										<p class="mb-0 font-weight-lighter">Aprete el botón
											"Volver" para regresar a la lista de traslados</p>
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
							id="modalEliminar${asignacion.getAsignacion().getId()}"
							tabindex="-1" role="dialog"
							aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content  px-3">
									<div class="modal-header pb-2">
										<h5 class="modal-title" id="exampleModalLongTitleUno">Rechazar
											solicitud de traslado</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span class="bg-white" aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body text-left">

										<p class="p mt-2 mb-4">¿Está seguro/a que desea rechazar
											el traslado solicitado?</p>

										<p class="mb-0 font-weight-lighter text-danger">Usted
											asume la responsabilidad del siguiente rechazo de
											internación.</p>
									</div>

									<div class="modal-footer">
										<button type="button" class="btn btn-outline-primary"
											data-dismiss="modal">Volver</button>

										<form action="eliminarAsignacion" method="post">
											<input name="idAsignacion"
												value="${asignacion.getAsignacion().getId()}" hidden>
											<button type="submit" class="btn btn-outline-danger">Rechzar
												internación</button>
										</form>

									</div>
								</div>
							</div>
						</div>
						<!-- End Modal -->

					</c:forEach>


				</table>
			</div>
	</c:if>

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
</script>
<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/funciones.js"></script>
<script src="js/sort.js"></script>
<script src="js/bootstrap.bundle.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/dashboard.js"></script>
</body>
</html>