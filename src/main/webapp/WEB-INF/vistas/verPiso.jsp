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

	<div class="container px-5">

		<div
			class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
			<h2 class="">
				<c:if test="${pisoDetallado.getPiso().getNumeroPiso() == 0}">Planta Baja
                                    </c:if>

				<c:if test="${pisoDetallado.getPiso().getNumeroPiso() != 0}">
                                        Piso ${pisoDetallado.getPiso().getNumeroPiso()}
                                    </c:if>
			</h2>
			<a type="button" class="btn btn-outline-success"
				href="crearSector?idPiso=${pisoConSectores.getPiso().getId()}">
				Agregar Sector</a>
		</div>
		<h6 class="mb-5">Vea en detalle un las salas y camas del piso de
			su institución</h6>

		<c:forEach items="${pisoConSectores.getListaDeSectores()}"
			var="sector">

			<div
				class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
				<h4 class="text-left mt-4">

					<c:if test="${pisoConSectores.getListaDeSectores().size() == 0}">
						<div class="card shadow my-5 mx-2">
							<div class="card-header bg-danger text-white text-center">
								<h3 class="text-center">No hay sectores registrados en este
									piso</h3>
								<img src="img/no-stopping.png" style="width: 100px;"
									class="mt-4"></img>
							</div>
						</div>
					</c:if>

					<c:if test="${pisoDetallado.getPiso().getNumeroPiso() != 0}">
                                        Sector de
				${sector.getSector().getDescripcion()}
                                    </c:if>
				</h4>
				<a type="button" class="btn btn-outline-success"
					href="crearSala?idSector=${sector.getSector().getId()}">
					Agregar Sala</a>
			</div>

			<c:forEach items="${sector.getListaDeSalas()}" var="sala">

				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<h5 class="">Sala ${sala.getSala().getDescripcion()}
						(${sala.getSala().getTipoSala().getDescripcion()})</h5>



					<a type="button" class="btn btn-outline-success"
						href="crearCamas?idSala=${sala.getSala().getId()}"> Agregar
						Camas</a>
				</div>

				<c:if test="${sala.getListaDeCamasConAsignacion().size() == 0}">
					<div class="card shadow my-5 mx-2">
						<div class="card-header bg-danger text-white text-center">
							<h4 class="text-center">No hay camas registradas en esta
								sala</h4>
							<img src="img/no-stopping.png" style="width: 100px;" class="mt-4"></img>
						</div>
					</div>
				</c:if>



				<div class=" d-flex flex-row flex-wrap my-3">

					<c:if test="${sala.getListaDeCamasConAsignacion().size() != 0}">
						<c:forEach items="${sala.getListaDeCamasConAsignacion()}"
							var="camaConAsignacion">

							<a class="btn btn-outline-dark m-2"
								onclick="javascript:mostrarInfo(this, 'informacionCama${camaConAsignacion.getCama().getId()}', 'imagenCama${camaConAsignacion.getCama().getId()}')">

								<div class="mt-1 p-4">

									<h5 class="text-center mb-4 " style="font-weight: bold;">Cama
										${camaConAsignacion.getCama().getDescripcion()}</h5>


									<c:if test="${camaConAsignacion.getAsignacion() == null}">


										<img id="imagenCama${camaConAsignacion.getCama().getId()}"
											src="img/cama-ver.png" style="width: 115px;" class=""></img>

										<div style="width: 115px;"
											id="informacionCama${camaConAsignacion.getCama().getId()}"
											hidden>
											<p>Tipo Cama:
												${camaConAsignacion.getCama().getTipoCama().getDescripcion()}</p>
											<img src="img/cama-ver.png" style="width: 30px;" class=""></img>
										</div>

									</c:if>

									<c:if test="${camaConAsignacion.getAsignacion() != null}">
										<c:if
											test="${camaConAsignacion.getAsignacion().getHoraIngreso() != null}">

											<%-- <h6 class="">Ocupada por
												${camaConAsignacion.getAsignacion().getPaciente().getNombre()}</h6> --%>
											<img id="imagenCama${camaConAsignacion.getCama().getId()}"
												src="img/cama-ro.png" style="width: 115px;" class=""></img>

											<div style="width: 115px;"
												id="informacionCama${camaConAsignacion.getCama().getId()}"
												hidden>
												<p>Tipo Cama:
													${camaConAsignacion.getCama().getTipoCama().getDescripcion()}</p>
												<p>Ocupada por:
													${camaConAsignacion.getAsignacion().getPaciente().getNombre()}
													${camaConAsignacion.getAsignacion().getPaciente().getApellido()}</p>
												<img src="img/cama-ro.png" style="width: 30px;" class=""></img>
											</div>


										</c:if>
										<c:if
											test="${camaConAsignacion.getAsignacion().getHoraIngreso() == null}">

											<%-- <h6 class="">Reservada para
												${camaConAsignacion.getAsignacion().getPaciente().getNombre()}</h6> --%>
											<img id="imagenCama${camaConAsignacion.getCama().getId()}"
												src="img/cama-am.png" style="width: 115px;" class=""></img>

											<div style="width: 115px;"
												id="informacionCama${camaConAsignacion.getCama().getId()}"
												hidden>
												<p>Tipo Cama:
													${camaConAsignacion.getCama().getTipoCama().getDescripcion()}</p>
												<p>Reservado para:
													${camaConAsignacion.getAsignacion().getPaciente().getNombre()}
													${camaConAsignacion.getAsignacion().getPaciente().getApellido()}</p>
												<img src="img/cama-am.png" style="width: 30px;" class=""></img>
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
