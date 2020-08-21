<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>Trasladar Paciente</title>

<link href="css/bootstrap.css" rel="stylesheet">

<jsp:include page="../../partial/${armarHeader}2.jsp" />

<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">

<div class="container">

	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h2 class="">Traslados Solicitados</h2>

	</div>
	<h6 class="mb-5">Vea en detalle todos los traslados solicitadas
		por su institución</h6>

	<p class="mt-2 mb-4">opciones para camabiar a reservas para
		autorizar o para filtrar tabla...</p>

	<div class="table-responsive">

		<table id="myTable"
			class="table table-bordered table-hover responsive nowrap text-center">

			<tr class="una bg-white">

				<th style="vertical-align: middle; width: 16%"
					class="border border-secondary"
					onmouseover="this.style.backgroundColor='#dee2e6 ';"
					onmouseout="this.style.backgroundColor='white';">DESTINO <img
					alt="" src="img/sort.svg" width="1em" height="1em">

				</th>

				<th style="vertical-align: middle;" class="border border-secondary"
					onmouseover="this.style.backgroundColor='#dee2e6 ';"
					onmouseout="this.style.backgroundColor='white';">DISTANCIA <img
					alt="" src="img/sort.svg" width="1em" height="1em">

				</th>

				<th style="vertical-align: middle;" class="border border-secondary"
					onmouseover="this.style.backgroundColor='#dee2e6';"
					onmouseout="this.style.backgroundColor='white';">PACIENTE <img
					alt="" src="img/sort.svg" width="1em" height="1em">

				</th>

				<th style="vertical-align: middle;" class="border border-secondary"
					onmouseover="this.style.backgroundColor='#dee2e6';"
					onmouseout="this.style.backgroundColor='white';">FECHA<img
					alt="" src="img/sort.svg" width="1em" height="1em">

				</th>

				<th style="vertical-align: middle;" class="border border-secondary"
					onmouseover="this.style.backgroundColor='#dee2e6';"
					onmouseout="this.style.backgroundColor='white';">URGENCIA 
					<img alt="" src="img/sort.svg" width="1em" height="1em">

				</th>

				<th style="vertical-align: middle; width: 20%"
					class="border border-secondary"
					onmouseover="this.style.backgroundColor='#dee2e6';"
					onmouseout="this.style.backgroundColor='white';">ACCIÓN</th>
			</tr>

			<c:forEach items="${traslados}" var="traslado">

				<tr
					<c:if test="${traslado.getAutorizada() == true}">
		            		class="table-success"
		               	</c:if>>

					<form action="procesarTraslado" method="GET">

						<td style="vertical-align: middle;"><c:out value="${traslado.getAsignacionActual().getCama()
						.getSala().getSector().getPiso().getInstitucion().getNombre()}" /></td>
						
						<td style="vertical-align: middle;"><c:out value="${traslado.getDistancia()} Km" /></td>
						<td style="vertical-align: middle;"><c:out value="${traslado.getAsignacionActual().getPaciente().getNombre}" /></td>
						<td style="vertical-align: middle;"><c:out value="${traslado.getAsignacionReservada().getHoraReserva()}" /></td>

						<td style="vertical-align: middle; text-align: left; width: 25%;"
							class="mx-auto">

							<div class="d-flex justify-content-center">

								<div>

								</div>

							</div>

						</td>

						<td style="vertical-align: middle;"><c:if
								test="${institucion.getCamaRequerida() == true && 
	               		institucion.getSalaRequerida() == true }">

								<!-- Button trigger modal -->
								<button type="button" class="btn btn-outline-success"
									data-toggle="modal"
									data-target="#modalSolicitud${institucion.getInstitucion().getId()}">
									Ver detalle</button>

								<button type="button" class="btn btn-outline-primary mt-3"
									data-toggle="modal"
									data-target="#modalDetalle${institucion.getInstitucion().getId()}">
									Realizar traslado</button>

							</c:if> <c:if
								test="${institucion.getCamaRequerida() != true || 
	               		institucion.getSalaRequerida() != true }">

								<button
									id="botonAccionUno${institucion.getInstitucion().getId()}"
									class="btn btn-outline-secondary" type="button"
									data-toggle="modal"
									data-target="#modalSolicitud${institucion.getInstitucion().getId()}"
									disabled>Solicitar Traslado</button>

								<button
									id="botonAccionDos${institucion.getInstitucion().getId()}"
									class="btn btn-outline-primary mt-3" type="button"
									data-toggle="modal"
									data-target="#modalDetalle${institucion.getInstitucion().getId()}">
									Ver Detalle Institución</button>

							</c:if> <!-- Start Modal -->
							<div class="modal fade"
								id="modalSolicitud${institucion.getInstitucion().getId()}"
								tabindex="-1" role="dialog"
								aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered modal-lg"
									role="document">
									<div class="modal-content  px-3">
										<div class="modal-header pb-2">
											<h5 class="modal-title" id="exampleModalLongTitleUno">Solicitud
												de traslado</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span class="bg-white" aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body text-left">

											<p class="p mt-2 mb-4">
												Se enviará la solicitud de traslado del paciente <span
													class="font-weight-bold"> ${paciente.getNombre()}
													${paciente.getApellido()}
													(${paciente.getTipoDocumento().getDescripcion()}:
													${paciente.getNumeroDocumento()}) </span> en una cama <span
													id="tipoCamaModal${institucion.getInstitucion().getId()}"
													class="font-weight-bold text-lowercase">${tipoCama.getDescripcion()}</span>
												en una sala de <span
													id="tipoSalaModal${institucion.getInstitucion().getId()}"
													class="font-weight-bold text-lowercase">${tipoSala.getDescripcion()}</span>
												de la institución <span class="font-weight-bold">"${institucion.getInstitucion().getNombre()}"</span>
												ubicada en la localidad de
												${institucion.getInstitucion().getDomicilio().getLocalidad().getNombreLocalidad()}
												a ${Math.round(institucion.getDistancia())} km de distancia.
											</p>

											<p class="mb-0 font-weight-lighter">Una vez autorizada la
												solicitud enviada, podrá realizar el traslado.</p>
										</div>

										<div class="modal-footer">
											<button type="button" class="btn btn-outline-primary"
												data-dismiss="modal">Volver</button>
											<button type="submit" class="btn btn-outline-success">Enviar
												Solicitud</button>
										</div>
									</div>
								</div>
							</div> <!-- End Modal --> <!-- Start Modal -->
							<div class="modal fade"
								id="modalDetalle${institucion.getInstitucion().getId()}"
								tabindex="-1" role="dialog"
								aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered modal-lg"
									role="document">
									<div class="modal-content  px-3">
										<div class="modal-header pb-2">
											<h5 class="modal-title" id="exampleModalLongTitleUno">${institucion.getInstitucion().getNombre()}</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span class="bg-white" aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body text-left">

											<p class="p mt-2">Nombre de la institución:
												${institucion.getInstitucion().getNombre()}.</p>
											<p class="p mt-2">Tipo de institución:
												${institucion.getInstitucion().getTipo().getDescripcion()}.
											</p>
											<p class="p mt-2">Dirección:
												${institucion.getInstitucion().getDomicilio().getCalle()}
												${institucion.getInstitucion().getDomicilio().getNumero()},
												${institucion.getInstitucion().getDomicilio().getLocalidad().getNombreLocalidad()}
												(${institucion.getInstitucion().getDomicilio().getLocalidad().getPartido().getNombrePartido()}),
												provincia de
												${institucion.getInstitucion().getDomicilio().getLocalidad().getPartido().getProvincia().getNombreProvincia().getValor()}.
											</p>

											<p class="mb-0 font-weight-lighter"></p>
										</div>


										<!-- Load Leaflet from CDN-->
										<link rel="stylesheet"
											href="http://cdn.leafletjs.com/leaflet-0.7.3/leaflet.css" />
										<script
											src="http://cdn.leafletjs.com/leaflet-0.7.3/leaflet.js"></script>
										<style>
#map {
	height: 400px;
	width: calc(100% - 15px);
}
</style>

										<!-- Load Esri Leaflet from CDN -->
										<script
											src="http://cdn-geoweb.s3.amazonaws.com/esri-leaflet/1.0.0-rc.2/esri-leaflet.js"></script>

										<script
											src="http://cdn-geoweb.s3.amazonaws.com/esri-leaflet-geocoder/0.0.1-beta.5/esri-leaflet-geocoder.js"></script>
										<link rel="stylesheet" type="text/css"
											href="http://cdn-geoweb.s3.amazonaws.com/esri-leaflet-geocoder/0.0.1-beta.5/esri-leaflet-geocoder.css">

										<div id="map" class="mx-2 w-100"></div>


										<script>
	var hospitales = [
			{
				"nombre" : "HOSPITAL GENERAL DE AGUDOS D. VELEZ SARSFIELD",
				"lat" : -34.6253368,
				"lon" : -58.50761514
			}, {
				"nombre" : "HOSPITAL MATERNO INFANTIL R. SARDA",
				"lat" : -34.634856308414967,
				"lon" : -58.402750627537664
			}

	];

	var map = L.map('map').setView([ ${institucion.getInstitucion().getLatitud()}, ${institucion.getInstitucion().getLongitud()} ],
			12);

	L
			.tileLayer(
					'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
					{
						attribution : '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
					}).addTo(map);

	/*let iconMarker = L.icon({
		iconUrl : 'img/red-cross.png',

	});

	for (var i = 0; i < hospitales.length; i++) {
		marker = new L.marker([ hospitales[i].lat, hospitales[i].lon ], {
			icon : iconMarker
		}).bindPopup(hospitales[i].nombre).addTo(map);
	};*/

	var searchControl = new L.esri.Controls.Geosearch().addTo(map);

	var results = new L.LayerGroup().addTo(map);

	let posicion;

	searchControl.on('results', function(data) {
		results.clearLayers();
		for (var i = data.results.length - 1; i >= 0; i--) {
			results.addLayer(L.marker(data.results[i].latlng));

			posicion = data.results[i].latlng;
			console.log(posicion.lat);
			console.log(posicion.lng);
			console.log(data.results[0].city);
			console.log(data.results[0].subregion);
			console.log(data.results[0]);

			document.getElementById("latitud").value = posicion.lat;
			document.getElementById("longitud").value = posicion.lng;

			//Array con toda la información del domicilio (calle, altura, localidad, etc.)
			var domicilioArray = data.results[0].text;
			
			//Array del domicilioArray separando elementos por las comas (la calle con su altura);
			var calle = domicilioArray.split(",");
			
			//Separar por espacios;
			var calleArray = calle[0].split(" ");
			
			//Último elemento del array (la altura de la calle);
			var alturaCalle = calleArray[calleArray.length - 1];
			
			//Eliminar el último elemento del array (la altura de la calle);
			calleArray.splice((calleArray.length - 1), 1);
			
			//Unir todos los elementos del array separándolos con un espacio;
			var nombreCalle = calleArray.join(' ');
			
			console.log("Nombre de la calle: " + nombreCalle);
			console.log("Altura de la calle: " + alturaCalle);
			
			document.getElementById("calle").value = nombreCalle;
			document.getElementById("numero").value = alturaCalle;
			document.getElementById("nombreLocalidad").value = data.results[0].city;
			document.getElementById("nombrePartido").value = data.results[0].subregion;
		}

	});
</script>


										<div class="modal-footer">
											<button type="button" class="btn btn-outline-primary"
												data-dismiss="modal">Volver</button>
										</div>
									</div>
								</div>
							</div> <!-- End Modal --></td>

					</form>

				</tr>

			</c:forEach>


		</table>
	</div>

	<div class="col-xl-3 col-lg-5 col-md-8 col-sm-12">

		<div
			class="row d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3">

			<div class="mr-4">

				<div class="">
					<a href="trasladar?idPaciente=${paciente.getId()}">
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

<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/funciones.js"></script>
<script src="js/sort.js"></script>
<script src="js/bootstrap.bundle.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>