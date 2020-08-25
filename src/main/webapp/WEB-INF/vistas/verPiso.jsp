<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>AsignAR</title>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">

<jsp:include page="../../partial/${armarHeader}2.jsp" />



<style>
#inputTipoInstitucion, #inputNombre, #inputCUIT {
	background-image: url('/css/searchicon.png');
	/* Add a search icon to input */
	background-position: 10px 12px; /* Position the search icon */
	background-repeat: no-repeat; /* Do not repeat the icon image */
	width: 100%; /* Full-width */
	font-size: 16px; /* Increase font-size */
	padding: 12px 20px 12px 40px; /* Add some padding */
	border: 1px solid #ddd; /* Add a grey border */
	margin-bottom: 12px; /* Add some space below the input */
}

#myTable {
	border-collapse: collapse; /* Collapse borders */
	width: 100%; /* Full-width */
	border: 1px solid #ddd; /* Add a grey border */
	font-size: 18px; /* Increase font-size */
}

#myTable th, #myTable td {
	text-align: left; /* Left-align text */
	padding: 12px; /* Add padding */
}

#myTable tr {
	/* Add a bottom border to all table rows */
	border-bottom: 1px solid #ddd;
}

#myTable tr.header, #myTable tr:hover {
	/* Add a grey background color to the table header and on hover */
	background-color: #f1f1f1;
}

.callout {
	padding: 20px;
	margin: 20px 0;
	border: 1px solid #eee;
	border-left-width: 5px;
	border-radius: 3px;
	border-left-color: #428bca; h4 { margin-top : 0;
	margin-bottom: 5px;
}

p:last-child {
	margin-bottom: 0;
}

code {
	border-radius: 3px;
}

&
+
.bs-callout {
	margin-top: -5px;
}
}
</style>

<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">

<c:if test="${registro == true}">
	<div class="alert alert-success alert-dismissible fade show"
		role="alert">
		<h5 class="text-center">
			¡Camas agregadas <strong>satisfactoriamente</strong>!
		</h5>
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
</c:if>


<div class="container px-5">

	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h2 class="">
			<c:if test="${pisoConSectores.getPiso().getNumeroPiso() == 0}">Planta Baja
                                    </c:if>

			<c:if test="${pisoConSectores.getPiso().getNumeroPiso() != 0}">
                                        Piso ${pisoConSectores.getPiso().getNumeroPiso()}
                                    </c:if>
		</h2>
		<a type="button" class="btn btn-outline-success"
			href="crearSector?idPiso=${pisoConSectores.getPiso().getNumeroPiso()}"
			style="width: 134px"> Agregar Sector</a>
	</div>
	<h6 class="mb-5">Vea en detalle un las salas y camas del piso de
		su institución</h6>

	<c:if test="${pisoConSectores.getListaDeSectores().size() == 0}">
		<div class="card shadow my-5 mx-2">
			<div class="card-header text-center">
				<h4 class="text-center">No hay Sectores registrados en esta sala</h4>
				<img src="img/no-stopping.png" style="width: 100px;" class="mt-4"></img>
			</div>
		</div>
	</c:if>

	<c:forEach items="${pisoConSectores.getListaDeSectores()}" var="sector">

		<div
			class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
			<h4 class="text-left mt-2">

				<c:if test="${pisoConSectores.getListaDeSectores().size() == 0}">
					<div class="card shadow my-5 mx-2">
						<div class="card-header text-white text-center">
							<h3 class="text-center">No hay sectores registrados en este
								piso</h3>
							<img src="img/no-stopping.png" style="width: 100px;" class="mt-4"></img>
						</div>
					</div>
				</c:if>

				<c:if test="${pisoDetallado.getPiso().getNumeroPiso() != 0}">
                                        Sector de
				${sector.getSector().getDescripcion()}
                                    </c:if>
			</h4>
			<a type="button" class="btn btn-outline-success"
				href="crearSala?idSector=${sector.getSector().getId()}"
				style="width: 134px"> Agregar Sala</a>
		</div>
		<h6 class="mb-5">Vea el detalle del sector
			${sector.getSector().getDescripcion()}</h6>

		<c:forEach items="${sector.getListaDeSalas()}" var="sala">

			<div
				class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center py-2 mb-3 border-bottom">
				<h5 class="">Sala ${sala.getSala().getDescripcion()}
					(${sala.getSala().getTipoSala().getDescripcion()})</h5>



				<a type="button" class="btn btn-outline-success"
					href="crearCamas?idSala=${sala.getSala().getId()}"
					style="width: 134px"> Agregar Camas</a>
			</div>
			<h6 class="mb-5">
				Vea el detalle de la sala ${sala.getSala().getDescripcion()} de <span
					class="text-lowercase">${sala.getSala().getTipoSala().getDescripcion()}</span>
			</h6>

			<c:if test="${sala.getListaDeCamasConAsignacion().size() == 0}">
				<div class="card shadow my-5 mx-2">
					<div class="card-header text-center">
						<h4 class="text-center">No hay camas registradas en esta sala</h4>
						<img src="img/no-stopping.png" style="width: 100px;" class="mt-4"></img>
					</div>
				</div>
			</c:if>



			<div class=" d-flex flex-row flex-wrap my-3"
				style="margin-left: -6px; margin-right: -6px">

				<c:if test="${sala.getListaDeCamasConAsignacion().size() != 0}">
					<c:forEach items="${sala.getListaDeCamasConAsignacion()}"
						var="camaConAsignacion">

						<a class="btn btn-outline-light m-2 p-0"
							style="border-color: #dee2e6; width: 195px"
							onclick="javascript:mostrarInfo(this, 'informacionCama${camaConAsignacion.getCama().getId()}', 'imagenCama${camaConAsignacion.getCama().getId()}')">

							<div class="bg-light py-2 px-2">



								<h5 class="text-center m-3">Cama
									${camaConAsignacion.getCama().getDescripcion()}</h5>

							</div>

							<div class="my-4 px-3 text-center">

								<c:if test="${camaConAsignacion.getAsignacion() == null}">


									<img id="imagenCama${camaConAsignacion.getCama().getId()}"
										src="img/cama-ver-grande.svg" style="width: 120px;" class=""></img>

									<div class="text-right"
										id="informacionCama${camaConAsignacion.getCama().getId()}"
										hidden>
										<p class="text-left">Tipo Cama:
											${camaConAsignacion.getCama().getTipoCama().getDescripcion()}</p>
										<img src="img/cama-ver-grande.svg" style="width: 60px;"
											class=""></img>
									</div>

								</c:if>

								<c:if test="${camaConAsignacion.getAsignacion() != null}">
									<c:if
										test="${camaConAsignacion.getAsignacion().getHoraIngreso() != null}">

										<img id="imagenCama${camaConAsignacion.getCama().getId()}"
											src="img/cama-ro-grande.svg" style="width: 120px;" class=""></img>

										<div class="text-right" style="font-size: 0.8rem;"
											id="informacionCama${camaConAsignacion.getCama().getId()}"
											hidden>
											<p class="text-left">Tipo Cama:
												${camaConAsignacion.getCama().getTipoCama().getDescripcion()}</p>
											<p class="text-left mb-0">Ocupada por:
												${camaConAsignacion.getAsignacion().getPaciente().getNombre()}
												${camaConAsignacion.getAsignacion().getPaciente().getApellido()}</p>

											<p class="text-left">${camaConAsignacion.getAsignacion().getPaciente().getNumeroDocumento()}
												(${camaConAsignacion.getAsignacion().getPaciente().getTipoDocumento().getDescripcion()}).</p>

											<div class="d-flex justify-content-between">
												<form action="detalleAsignacion?idAsignacion=${camaConAsignacion.getAsignacion().getId()}">
												<button type="submit" class="btn btn-outline-danger btn-sm">Ver
													detalle</button>
													</form>
												<div class="mt-1">
													<img src="img/cama-ro.png" style="width: 30px;"></img>
												</div>
											</div>
										</div>


									</c:if>
									<c:if
										test="${camaConAsignacion.getAsignacion().getHoraIngreso() == null}">

										<img id="imagenCama${camaConAsignacion.getCama().getId()}"
											src="img/cama-am-grande.svg" style="width: 120px;" class=""></img>

										<div class="text-right" style="font-size: 0.8rem;"
											id="informacionCama${camaConAsignacion.getCama().getId()}"
											hidden>
											<p class="text-left">Tipo Cama:
												${camaConAsignacion.getCama().getTipoCama().getDescripcion()}</p>
											<p class="text-left mb-0">Reservada para:
												${camaConAsignacion.getAsignacion().getPaciente().getNombre()}
												${camaConAsignacion.getAsignacion().getPaciente().getApellido()}</p>

											<p class="text-left">${camaConAsignacion.getAsignacion().getPaciente().getNumeroDocumento()}
												(${camaConAsignacion.getAsignacion().getPaciente().getTipoDocumento().getDescripcion()}).</p>

											<div class="d-flex justify-content-between">
												<button class="btn btn-outline-warning btn-sm">Ver
													detalle</button>
												<div class="mt-1">
													<img src="img/cama-am.png" style="width: 30px;"></img>
												</div>
											</div>
										</div>


									</c:if>

								</c:if>
							</div>

						</a>

					</c:forEach>
				</c:if>

			</div>




		</c:forEach>

	</c:forEach>

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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>

<script src="js/sort.js"></script>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js">
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous">
</script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>

</script>
<script>
	var estado = true;

	function mostrarInfo(boton, idInformacionCama, idImagenCama) {

		var imagenCama = document.getElementById(idImagenCama);
		var informacionCama = document.getElementById(idInformacionCama);

		if (informacionCama.hidden) {
			informacionCama.hidden = false;
			imagenCama.hidden = true;
			estado = false;

		} else {
			informacionCama.hidden = true;
			imagenCama.hidden = false;
			estado = true;
		}
	}
</script>

</body>
</html>
