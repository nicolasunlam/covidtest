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
			" type="radio" name="estado" id="denegado"> <span class="h6">Todos
		</span><input class="mr-4" " type="radio" name="estado" id="restaurar">
	</div>

	<div class="table-responsive">

		<table id="myTable"
			class="table table-bordered table-hover responsive nowrap text-center">

			<tr class="una bg-white">

				<th style="vertical-align: middle; width: 16%"
					class="border border-secondary"
					onmouseover="this.style.backgroundColor='#dee2e6 ';"
					onmouseout="this.style.backgroundColor='white';">PACIENTE
					<img style="margin-top: 0.40rem;"
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

				<th style="vertical-align: middle; width: 16%"
					class="border border-secondary"
					onmouseover="this.style.backgroundColor='#dee2e6';"
					onmouseout="this.style.backgroundColor='white';">INSTITUCIÓN
					ORIGEN <img style="margin-top: 0.40rem;"
					class="bi bi-arrow-down-up float-right" alt="" src="img/sort.svg"
					width="10px" height="">

				</th>

				<th style="vertical-align: middle; width: 12%"
					class="border border-secondary"
					onmouseover="this.style.backgroundColor='#dee2e6';"
					onmouseout="this.style.backgroundColor='white';">DISTANCIA<img
					style="margin-top: 0.40rem;"
					class="bi bi-arrow-down-up float-right" alt="" src="img/sort.svg"
					width="10px" height="">

				</th>

				<th style="vertical-align: middle; width: 12%"
					class="border border-secondary"
					onmouseover="this.style.backgroundColor='#dee2e6';"
					onmouseout="this.style.backgroundColor='white';">URGENCIA <img
					style="margin-top: 0.40rem;"
					class="bi bi-arrow-down-up float-right" alt="" src="img/sort.svg"
					width="10px" height="">

				</th>

				<th style="vertical-align: middle; width: 12%"
					class="border border-secondary"
					onmouseover="this.style.backgroundColor='#dee2e6';"
					onmouseout="this.style.backgroundColor='white';">ESTADO <img
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

				<tr
					<c:if
								test="${traslado.getAsignacionReservada().getAutorizada() == true}"> 
		            		class="table-success autorizado"
		               	</c:if>
					<c:if test="${traslado.getAsignacionReservada().getAutorizada() == false}">
					class="table-danger denegado"
					</c:if>
					<c:if test="${traslado.getAsignacionReservada().getAutorizada() == null}">
		            		class=" espera"
		               	</c:if>>

					<form action="procesarTraslado" method="GET">

						<td style="vertical-align: middle;"><c:out
								value="${traslado.getAsignacionActual().getPaciente().getApellido()}, 
								${traslado.getAsignacionActual().getPaciente().getNombre()}" /></td>

						<td style="vertical-align: middle;"><fmt:parseDate
								value="${ traslado.getAsignacionActual().getHoraIngreso() }"
								pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
							<fmt:formatDate pattern="dd/MM/yyyy 'a las' HH:mm 'horas.'"
								value="${ parsedDateTime }" /></td>

						<td style="vertical-align: middle;"><c:out
								value="${traslado.getAsignacionActual().getCama()
						.getSala().getSector().getPiso().getInstitucion().getNombre()}" /></td>

						<td style="vertical-align: middle;"><c:out value="Km" /></td>

						<td style="vertical-align: middle;">${traslado.getAsignacionReservada().getUrgencia()}</td>

						<td style="vertical-align: middle;"><c:if
								test="${traslado.getAsignacionReservada().getAutorizada() == true && 
									traslado.getAsignacionActual().getHoraEgreso() == null}">
		            		 Aceptado (Esperando traslado)
		              		 	</c:if> <c:if
								test="${traslado.getAsignacionReservada().getAutorizada() == true && 
									traslado.getAsignacionActual().getHoraEgreso() != null}">
		            		 Aceptado (Traslado en curso)
		              		 	</c:if> <c:if
								test="${traslado.getAsignacionReservada().getAutorizada() == false}">
		            		 Denegado
		              		 	</c:if> <c:if
								test="${traslado.getAsignacionReservada().getAutorizada() == null}">
		            		 En espera de autorización
		              		 	</c:if></td>

						<td style="vertical-align: middle;">
							<!-- Button trigger modal -->

							<div class="d-flex justify-content-center flex-wrap">

								<c:if
									test="${traslado.getAsignacionReservada().getAutorizada() != true}">
									<button class="btn btn-outline-success mx-1  my-1"
										type="button" data-toggle="modal" style="width: 103px"
										data-target="#modalTrasladar${traslado.getAsignacionReservada().getId()}">Aceptar
										traslado</button>

								</c:if>

								<c:if
									test="${traslado.getAsignacionReservada().getAutorizada() == true && 
									traslado.getAsignacionActual().getHoraEgreso() == null}">

									<button class="btn btn-outline-secondary mx-1  my-1"
										type="button" data-toggle="modal" style="width: 103px"
										data-target="#modalTrasladar${traslado.getAsignacionReservada().getId()}"
										disabled>Internar Paciente</button>

								</c:if>
								<c:if
									test="${traslado.getAsignacionReservada().getAutorizada() == true && 
									traslado.getAsignacionActual().getHoraEgreso() != null}">

									<button class="btn btn-outline-success mx-1  my-1"
										type="button" data-toggle="modal" style="width: 103px"
										data-target="#modalTrasladar${traslado.getAsignacionReservada().getId()}">Internar
										Paciente</button>

								</c:if>

								<button type="button" class="btn btn-outline-primary mx-1 my-1"
									style="width: 103px" data-toggle="modal"
									data-target="#modalDetalle${traslado.getAsignacionReservada().getId()}">
									Ver Detalle</button>

								<c:if
									test="${traslado.getAsignacionReservada().getAutorizada() == null}">

									<button type="button" class="btn btn-outline-danger mx-1  my-1"
										style="width: 103px" data-toggle="modal"
										data-target="#modalDenegar${traslado.getAsignacionReservada().getId()}">
										Denegar</button>
								</c:if>
							</div>

						</td>

					</form>

				</tr>

				<!-- Start Modal -->
				<div class="modal fade"
					id="modalTrasladar${traslado.getAsignacionReservada().getId()}"
					tabindex="-1" role="dialog"
					aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered modal-lg"
						role="document">
						<div class="modal-content  px-3">
							<div class="modal-header pb-2">
								<h5 class="modal-title" id="exampleModalLongTitleUno">Recibir
									traslado</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span class="bg-white" aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body text-left">

								<p class="p mt-2 mb-4">
									Recibir el traslado del paciente <strong>
										${traslado.getAsignacionReservada().getPaciente().getNombre()}
										${traslado.getAsignacionReservada().getPaciente().getApellido()}
									</strong> de numero de documento <strong>
										${traslado.getAsignacionReservada().getPaciente().getNumeroDocumento()}
										(${traslado.getAsignacionReservada().getPaciente().getTipoDocumento().getDescripcion()})
									</strong> con origen de internación en la institución <strong>
										"${traslado.getAsignacionActual().getCama().getSala().getSector().getPiso().getInstitucion().getNombre()}"
									</strong>ubicada en
									${traslado.getAsignacionReservada().getCama().getSala().getSector().getPiso().getInstitucion().getDomicilio().getLocalidad().getNombreLocalidad()},
									${traslado.getAsignacionReservada().getCama().getSala().getSector().getPiso().getInstitucion().getDomicilio().getLocalidad().getPartido().getProvincia().getNombreProvincia().getValor()},
									a . de distancia. La internación está prevista para ser
									realizada en la <strong>cama
										${traslado.getAsignacionReservada().getCama().getDescripcion()}
										(${traslado.getAsignacionReservada().getCama().getTipoCama().getDescripcion()})
									</strong> de la sala <strong>
										${traslado.getAsignacionReservada().getCama().getSala().getDescripcion()}
										(${traslado.getAsignacionReservada().getCama().getSala().getTipoSala().getDescripcion()})</strong>
									de su intitución.
								</p>

								<p class="mb-0 font-weight-lighter">Al apretar "Recibir
									paciente" se enviará una notificación a la institución para
									avisarle de sobre la autorización del traslado.</p>
							</div>

							<div class="modal-footer">
								<button type="button" class="btn btn-outline-primary"
									data-dismiss="modal">Volver</button>

								<c:if
									test="${traslado.getAsignacionReservada().getAutorizada() != true}">

									<form action="decidirTraslado" method="post">

										<input name="idAsignacionActual"
											value="${traslado.getAsignacionActual().getId()}" hidden>
										<input name="idAsignacionReservada"
											value="${traslado.getAsignacionReservada().getId()}" hidden>
										<input name="distancia" value="${traslado.getDistancia()}"
											hidden> <input name="decision" value="aceptado"
											hidden>
										<button type="submit" class="btn btn-outline-success">Aceptar
											traslado</button>
									</form>

								</c:if>

								<c:if
									test="${traslado.getAsignacionReservada().getAutorizada() == true && 
									traslado.getAsignacionActual().getHoraEgreso() != null}">

									<form action="internarPorTraslado" method="post">

										<input name="idAsignacionActual"
											value="${traslado.getAsignacionActual().getId()}" hidden>
										<input name="idAsignacionReservada"
											value="${traslado.getAsignacionReservada().getId()}" hidden>
										<input name="distancia" value="${traslado.getDistancia()}"
											hidden> <input name="decision" value="aceptado"
											hidden>
										<button type="submit" class="btn btn-outline-success">Internar
											paciente</button>
									</form>

								</c:if>

							</div>
						</div>
					</div>
				</div>
				<!-- End Modal -->


				<!-- Start Modal -->
				<div class="modal fade"
					id="modalDetalle${traslado.getAsignacionReservada().getId()}"
					tabindex="-1" role="dialog"
					aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered modal-lg"
						role="document">
						<div class="modal-content  px-3">
							<div class="modal-header pb-2">
								<h5 class="modal-title" id="exampleModalLongTitleUno">Detalle
									del traslado</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span class="bg-white" aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body text-left">

								<p class="p mt-2 mb-4">

									<c:if
										test="${traslado.getAsignacionReservada().getAutorizada() == null}">
									Recibir
									</c:if>
									<c:if
										test="${traslado.getAsignacionReservada().getAutorizada() == true}">
									Ha aceptado
									</c:if>
									<c:if
										test="${traslado.getAsignacionReservada().getAutorizada() == false}">
									Ha rechazado
									</c:if>
									el traslado del paciente <strong>
										${traslado.getAsignacionReservada().getPaciente().getNombre()}
										${traslado.getAsignacionReservada().getPaciente().getApellido()}
									</strong> de numero de documento <strong>
										${traslado.getAsignacionReservada().getPaciente().getNumeroDocumento()}
										(${traslado.getAsignacionReservada().getPaciente().getTipoDocumento().getDescripcion()})
									</strong> con origen de internación en la institución <strong>
										"${traslado.getAsignacionActual().getCama().getSala().getSector().getPiso().getInstitucion().getNombre()}"
									</strong>ubicada en
									${traslado.getAsignacionReservada().getCama().getSala().getSector().getPiso().getInstitucion().getDomicilio().getLocalidad().getNombreLocalidad()},
									${traslado.getAsignacionReservada().getCama().getSala().getSector().getPiso().getInstitucion().getDomicilio().getLocalidad().getPartido().getProvincia().getNombreProvincia().getValor()},
									. de distancia. La internación
									<c:if
										test="${traslado.getAsignacionReservada().getAutorizada() == null}">
									está prevista para ser realizada 
									</c:if>
									<c:if
										test="${traslado.getAsignacionReservada().getAutorizada() == false}">
									estaba prevista para ser realizada 
									</c:if>
									<c:if
										test="${traslado.getAsignacionReservada().getAutorizada() == true}">
									fue realizada
									</c:if>
									en la <strong>cama
										${traslado.getAsignacionReservada().getCama().getDescripcion()}
										(${traslado.getAsignacionReservada().getCama().getTipoCama().getDescripcion()})
									</strong> de la sala <strong>
										${traslado.getAsignacionReservada().getCama().getSala().getDescripcion()}
										(${traslado.getAsignacionReservada().getCama().getSala().getTipoSala().getDescripcion()})</strong>
									de su intitución.
								</p>

								<p class="mb-0 font-weight-lighter">Aprete el botón "Volver"
									para regresar a la lista de traslados</p>
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
					id="modalDenegar${traslado.getAsignacionReservada().getId()}"
					tabindex="-1" role="dialog"
					aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content  px-3">
							<div class="modal-header pb-2">
								<h5 class="modal-title" id="exampleModalLongTitleUno">Denegar
									solicitud de traslado</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span class="bg-white" aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body text-left">

								<p class="p mt-2 mb-4">¿Está seguro/a que desea denegar el
									traslado solicitado?</p>

								<p class="mb-0 font-weight-lighter text-danger">Una vez
									eliminado el traslado no podrá revertir la acción.</p>
							</div>

							<div class="modal-footer">
								<button type="button" class="btn btn-outline-primary"
									data-dismiss="modal">Volver</button>

								<form action="decidirTraslado" method="post">
									<input name="idAsignacionReservada"
										value="${traslado.getAsignacionReservada().getId()}" hidden>
									<input name="decision" value="denegado" hidden><input
										name="distancia" value="${traslado.getDistancia()}" hidden>
									<button type="submit" class="btn btn-outline-danger">Denegar
										traslado</button>
								</form>

							</div>
						</div>
					</div>
				</div>
				<!-- End Modal -->

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
</script>

<script src="js/funciones.js"></script>
<script src="js/sort.js"></script>
<script src="js/bootstrap.bundle.js"></script>
<script src="js/dashboard.js"></script>
</body>
</html>