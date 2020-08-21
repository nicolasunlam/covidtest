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


		Piso ${pisoConSectores.getPiso().getId()}

		<div class="container my-3">
			<form action="crearSector" method=get class="mt-4 mb-0">
				<input class="invisible" type="hidden" id="id" name="idPiso"
					value="${pisoConSectores.getPiso().getId()}"> <input
					class="btn btn-outline-success ml-3" type="submit"
					value="Agregar Sector">
			</form>
		</div>

		<br>

		<c:if test="${pisoConSectores.getListaDeSectores().size() == 0}">
										Este piso se encuentra vacio.
		</c:if>

		<br>

		<c:forEach items="${pisoConSectores.getListaDeSectores()}"
			var="sector">

			Sector ${sector.getSector().getDescripcion()}
			
					<div class="container my-3">
				<form action="crearSala" method=get class="mt-4 mb-0">
					<input class="invisible" type="hidden" id="id" name="idSector"
						value="${sector.getSector().getId()}"> <input
						class="btn btn-outline-success ml-3" type="submit"
						value="Agregar Sala">
				</form>
			</div>

			<br>

			<c:forEach items="${sector.getListaDeSalas()}" var="sala">

				Sala ${sala.getSala().getDescripcion()} (${sala.getSala().getTipoSala().getDescripcion()})
				
				<div class="container my-3">
					<form action="crearCamas" method=get class="mt-4 mb-0">
						<input class="invisible" type="hidden" id="id" name="idSala"
							value="${sala.getSala().getId()}"> <input
							class="btn btn-outline-success ml-3" type="submit"
							value="Agregar Camas">
					</form>
				</div>



				<c:if test="${sala.getListaDeCamasConAsignacion().size() == 0}">
									Camas:		No tiene camas.
			</c:if>

				<br>

				<c:if test="${sala.getListaDeCamasConAsignacion().size() != 0}">
					<c:forEach items="${sala.getListaDeCamasConAsignacion()}"
						var="camaConAsignacion">

						<p>
							Camas: ${camaConAsignacion.getCama().getId()} -

							<c:if test="${camaConAsignacion.getAsignacion() == null}">
						Disponible
					</c:if>

							<c:if test="${camaConAsignacion.getAsignacion() != null}">
								<c:if
									test="${camaConAsignacion.getAsignacion().getHoraIngreso() != null}">
							Ocupada por ${camaConAsignacion.getAsignacion().getPaciente().getNombre()}
						</c:if>
								<c:if
									test="${camaConAsignacion.getAsignacion().getHoraIngreso() == null}">
							Reservada para ${camaConAsignacion.getAsignacion().getPaciente().getNombre()}
						</c:if>
							</c:if>
						</p>

					</c:forEach>
				</c:if>

			</c:forEach>

			<br>

		</c:forEach>

		<%-- 

	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h2 class="">Pisos</h2>
		<a type="button" class="btn btn-outline-success" href="crearPiso">
			Agregar piso</a>
	</div>
	<h6 class="mb-5">Vea en detalle todos los pisos de su institución</h6>

	<div class=" my-5 px-0">
		<c:forEach items="${listaPisosConSectoresSalasYCamas}"
			var="pisoConSector">

			<div class="callout callout-primary py-4">

				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center mx-3">

					<div class="col">

						<div class="row">

							<div class="col">
								<h4 class="mb-4">Piso
									${pisoConSector.getPiso().getNumeroPiso()}</h4>
								<p class="my-2">Cantidad de sectores:
									${pisoConSector.getListaDeSectores().size()}</p>
								<p class="my-2">Cantidad de salas:</p>
								<p>Cantidad de camas: 27</p>
							</div>
						</div>

						<div class="pl-3 row">
							<form action="" method=get class="mt-4 mb-0">
								<input class="invisible" type="hidden" id="id" name="idPiso"
									value="${pisoConSector.getPiso().getId()}"> <input
									class="btn btn-outline-primary" type="submit"
									value="Ver detalle piso">
							</form>

							<form action="" method=get class="mt-4 mb-0">
								<input class="invisible" type="hidden" id="id" name="idPiso"
									value="${piso.getId()}"> <input
									class="btn btn-outline-success ml-3" type="submit"
									value="Personalizar">
							</form>

						</div>

					</div>




					<div class="d-flex align-items-end flex-column col mr-3">

						<div class="row">

							<div class="col">

								<div class="row" style="display: block">
									<p class="text-right mb-2">${sala.getListaDeCamasConAsignacion().size()}
										camas disponibles</p>
								</div>

								<div class="row">

									<c:if test="${listaCamasDisponibles.size() > 8}">
										<span class="text-success" style="margin-left: 4px;">
											<p class="h5 mb-0">+
												${sala.getListaDeCamasConAsignacion().size() - 8}</p>
										</span>
									</c:if>
									<c:forEach items="${sala.getListaDeCamasConAsignacion()}"
										var="cama" end="7">
										<span style="margin-left: 4px;"> <img alt=""
											src="img/cama-ver.png" style="width: 35px">
										</span>
									</c:forEach>

								</div>

							</div>

						</div>

						<div class="row">

							<div class="col my-2">

								<div class="row" style="display: block">
									<p class="text-right my-2">4 camas ocupadas</p>
								</div>

								<div class="row">
									<c:forEach items="${listaPisos}" var="piso">
										<span style="margin-left: 4px;"> <img alt=""
											src="img/cama-ro.png" style="width: 35px">
										</span>
									</c:forEach>
								</div>

							</div>

						</div>

						<div class="row">

							<div class="col">

								<div class="row" style="display: block">
									<p class="text-right my-2">4 camas reservadas</p>
								</div>

								<div class="row">
									<c:forEach items="${listaPisos}" var="piso">
										<span style="margin-left: 4px;"> <img alt=""
											src="img/cama-am.png" style="width: 35px">
										</span>
									</c:forEach>
								</div>

							</div>

						</div>

					</div>

	</c:forEach>
</div>
</div> --%>

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

</body>
</html>
