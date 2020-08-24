<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>Disponibilidad De Camas</title>

<!-- Load Leaflet from CDN-->
<link rel="stylesheet"
	href="http://cdn.leafletjs.com/leaflet-0.7.3/leaflet.css" />
<script src="http://cdn.leafletjs.com/leaflet-0.7.3/leaflet.js"></script>
<style>
#map {
	height: 50em;
	width: 100%;
}
</style>

<!-- Load Esri Leaflet from CDN -->
<script
	src="http://cdn-geoweb.s3.amazonaws.com/esri-leaflet/1.0.0-rc.2/esri-leaflet.js"></script>

<jsp:include page="../../partial/${armarHeader}2.jsp" />

<script
	src="http://cdn-geoweb.s3.amazonaws.com/esri-leaflet-geocoder/0.0.1-beta.5/esri-leaflet-geocoder.js"></script>
<link rel="stylesheet" type="text/css"
	href="http://cdn-geoweb.s3.amazonaws.com/esri-leaflet-geocoder/0.0.1-beta.5/esri-leaflet-geocoder.css">

<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4 my-5">

	<div class="container-fluid">

		<div class="card text-white bg-dark mb-3">
			<div class="card-header">
				<h1 class="text-center">Ingrese la dirección de la institución
					y luego confirme la misma</h1>
			</div>
			<div class="card-body m-0 p-0 text-dark">
				<div id="map" class="border border-dark"></div>
				<div class="container-fluid my-3">
					<div class="row">
						<div class="col-4"></div>
						<div class="col-4 text-center">
							<button type="button" class="btn btn-warning btn-lg"
								data-toggle="modal" data-target="#modalMapa">Confirmar
								dirección</button>
						</div>
						<div class="col-4"></div>
					</div>
				</div>
			</div>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="modalMapa" tabindex="-1" role="dialog"
			aria-labelledby="modalMapaLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header text-center">
						<h5 class="modal-title text-center" id="modalMapaLabel">¿Desea
							confirmar la dirección ingresada?</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<form action="validarMapaInstitucion" method="POST"
						modelAttribute="usuario">
						<div class="modal-body">

							<p class="text-center">Recuerde que la información consignada
								precedentemente reviste carácter de Declaración Jurada. Su
								omisión o falsedad procederá al rechazo de la inscripción en
								este sitio web, sin perjuicio de las sanciones que le pudiera
								corresponder.</p>

							<div class="form-group">
								<input type="hidden" class="form-control" id="latitud"
									name="latitud">
							</div>
							<div class="form-group">
								<input type="hidden" class="form-control" id="longitud"
									name="longitud">
							</div>
							<div class="form-group">
								<input type="hidden" class="form-control" id="calle"
									name="calle">
							</div>
							<div class="form-group">
								<input type="hidden" class="form-control" id="numero"
									name="numero">
							</div>
							<div class="form-group">
								<input type="hidden" class="form-control" id="nombreLocalidad"
									name="nombreLocalidad">
							</div>
							<div class="form-group">
								<input type="hidden" class="form-control" id="nombrePartido"
									name="nombrePartido">
							</div>

						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary">Confirmar</button>
							<button type="reset" class="btn btn-secondary"
								data-dismiss="modal">Cancelar</button>
						</div>

						<input type="hidden" name="idInstitucion"
							class="form-control br-radius-zero" id="idInstitucion"
							value="${idInstitucion}" />
					</form>
				</div>
			</div>
		</div>

	</div>


</main>


</div>
</div>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

<script>
	var map = L.map('map').setView([ -35.05789999999996, -59.04061999999993 ],
			9);

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

	searchControl
			.on(
					'results',
					function(data) {
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
</body>
</html>