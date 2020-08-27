<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>AsignAR</title>



<!-- Load Leaflet from CDN -->
<link rel="stylesheet"
	href="https://unpkg.com/leaflet@1.6.0/dist/leaflet.css"
	integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ=="
	crossorigin="" />
<script src="https://unpkg.com/leaflet@1.6.0/dist/leaflet.js"
	integrity="sha512-gZwIG9x3wUXg2hdXF6+rVkLF/0Vi9U8D2Ntg4Ga5I5BZpVkVxlJWbSQtXPSiUTtC0TjtGOmxa1AJPuV0CPthew=="
	crossorigin=""></script>

<!-- Load Esri Leaflet from CDN -->
<script src="https://unpkg.com/esri-leaflet@2.4.1/dist/esri-leaflet.js"
	integrity="sha512-xY2smLIHKirD03vHKDJ2u4pqeHA7OQZZ27EjtqmuhDguxiUvdsOuXMwkg16PQrm9cgTmXtoxA6kwr8KBy3cdcw=="
	crossorigin=""></script>

<!-- Load Esri Leaflet Geocoder from CDN -->
<link rel="stylesheet"
	href="https://unpkg.com/esri-leaflet-geocoder@2.3.3/dist/esri-leaflet-geocoder.css"
	integrity="sha512-IM3Hs+feyi40yZhDH6kV8vQMg4Fh20s9OzInIIAc4nx7aMYMfo+IenRUekoYsHZqGkREUgx0VvlEsgm7nCDW9g=="
	crossorigin="">
<script
	src="https://unpkg.com/esri-leaflet-geocoder@2.3.3/dist/esri-leaflet-geocoder.js"
	integrity="sha512-HrFUyCEtIpxZloTgEKKMq4RFYhxjJkCiF5sDxuAokklOeZ68U2NPfh4MFtyIVWlsKtVbK5GD2/JzFyAfvT5ejA=="
	crossorigin=""></script>

<style>
#map {
	height: 20em;
	width: 100%;
}
</style>

<jsp:include page="../../partial/${armarHeader}2.jsp" />


<script
	src="http://cdn-geoweb.s3.amazonaws.com/esri-leaflet-geocoder/0.0.1-beta.5/esri-leaflet-geocoder.js"></script>
<link rel="stylesheet" type="text/css"
	href="http://cdn-geoweb.s3.amazonaws.com/esri-leaflet-geocoder/0.0.1-beta.5/esri-leaflet-geocoder.css">

<c:if test='${rol != "PACIENTE"}'>
	<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
</c:if>

<div class="container">

	<div class="container-fluid my-5 text-center">
		<div class="row">
			<div class="col-4"></div>
			<div class="col-4">
				<img src="img/hospital.png" class="rounded" alt="icono hospital"
					width="250" height="250">
				<h1 class="font-weight-bolder my-4">${nombre}</h1>
			</div>
			<div class="col-4"></div>
		</div>
	</div>

	<div class="container-fluid pl-3 my-5 text-left border-top">
		<div class="row my-4">
			<div class="col-3">
				<h2 class="font-weight-bolder">DATOS DE CONTACTO</h2>
			</div>
			<div class="col-2"></div>
			<div class="col-5">
				<h2 class="font-weight-bolder text-center">UBICACIÓN</h2>
			</div>
		</div>
	</div>

	<div class="container-fluid pl-3 my-5 text-left">
		<div class="row my-4">
			<div class="col-4">
				<h3 class="font-weight-bolder">Correo electrónico</h3>
				<h4>${email}</h4>
				<h3 class="font-weight-bolder mt-5">Dirección</h3>
				<h4>${calle} ${numero}, ${localidad}</h4>
			</div>
			<div class="col-1"></div>
			<div class="col-5" id="map"></div>
		</div>
	</div>

	<div class="container-fluid pl-3 my-5 text-left border-top">
		<div class="row my-4">
			<div class="col-3">
				<h2 class="font-weight-bolder">DISPONIBILIDAD DE CAMAS</h2>
			</div>
			<div class="col-2"></div>

			<c:if test='${rol == "PACIENTE"}'>

				<div class="col-5">
					<h2 class="font-weight-bolder">DISTANCIA</h2>
				</div>

			</c:if>


		</div>
	</div>

	<div class="container-fluid pl-3 my-5 text-left">
		<div class="row my-4">
			<div class="col-3">
				<c:if test="${camasDisponibles > 0}">
					<h4 class="d-inline mr-1">Hay disponibilidad</h4>
					<img class ="d-inline" src="img/right.png" width="35" height="35"
						alt="Generic placeholder image" class="d-inline">
				</c:if>
				<c:if test="${camasDisponibles <= 0}">
					<h4 class="d-inline mr-3">No hay disponibilidad</h4>
					<img src="img/right.png" width="35" height="35"
						alt="Generic placeholder image" class="d-inline">
				</c:if>

			</div>
			<div class="col-2"></div>
			<div class="col-5">
				<h4>
					<c:if test='${rol == "PACIENTE"}'>

						<c:if test="${Math.round(distancia) < 9 }">
							
								${fn:substring(distancia, 0, 3)}
							
						</c:if>
						<c:if test="${Math.round(distancia) > 9}">
							${Math.round(distancia)} 
						</c:if>
					kms.
										
				</c:if>
				</h4>

				<p id="latitudInstitucion" style="display: none;">${latitudInstitucion}</p>
				<p id="longitudInstitucion" style="display: none;">${longitudInstitucion}</p>
				<c:if test='${rol == "PACIENTE"}'>
					<p id="latitudPaciente" style="display: none;">${latitudPaciente}</p>
					<p id="longitudPaciente" style="display: none;">${longitudPaciente}</p>
				</c:if>
				<p id="nombreInstitucion" style="display: none;">${nombre}</p>
			</div>

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
						</c:if>
				class="btn btn-primary h-25">Volver atrás</a>

		</div>
	</div>
</div>

<c:if test='${rol != "PACIENTE"}'>
	</main>
</c:if>

<c:if test='${rol != "PACIENTE"}'>

	<script type="text/javascript">


var latitudInstitucion = document.getElementById('latitudInstitucion').innerHTML;
var longitudInstitucion = document.getElementById('longitudInstitucion').innerHTML;
var nombreInstitucion = document.getElementById('nombreInstitucion').innerHTML;

var map = L.map('map').setView([ latitudInstitucion, longitudInstitucion ],
		11);



L
		.tileLayer(
				'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
				{
					attribution : '&copy; <a href="https://osm.org/copyright">OpenStreetMap</a> contributors'
				}).addTo(map);

marker = new L.marker([ latitudInstitucion, longitudInstitucion ])
		.bindPopup(nombreInstitucion).addTo(map);



var circle = L.circle([ latitudInstitucion, longitudInstitucion ], {
	color : 'red',
	fillColor : '#f03',
	fillOpacity : 0.5,
	radius : 20
}).addTo(map);


	var polylinePoints = [ 	latitudInstitucion, longitudInstitucion  ];

var polyline = L.polyline(polylinePoints).addTo(map);



</script>

</c:if>

<c:if test='${rol == "PACIENTE"}'>
	<script>

	var latitudInstitucion = document.getElementById('latitudInstitucion').innerHTML;
	var longitudInstitucion = document.getElementById('longitudInstitucion').innerHTML;
	var nombreInstitucion = document.getElementById('nombreInstitucion').innerHTML;
	var latitudPaciente = document.getElementById('latitudPaciente').innerHTML;
	var longitudPaciente = document.getElementById('longitudPaciente').innerHTML;
	
	
	var map = L.map('map').setView([ latitudInstitucion, longitudInstitucion ],
			11);

	/*let iconMarker = L.icon({
	    iconUrl: 'img/red-cross.png',

	});*/

	L
			.tileLayer(
					'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
					{
						attribution : '&copy; <a href="https://osm.org/copyright">OpenStreetMap</a> contributors'
					}).addTo(map);

	marker = new L.marker([ latitudInstitucion, longitudInstitucion ])
			.bindPopup(nombreInstitucion).addTo(map);
	
	var markerPaciente = new L.marker([ latitudPaciente, longitudPaciente ])
		.bindPopup("Su ubicación").addTo(map);


	var circle = L.circle([ latitudInstitucion, longitudInstitucion ], {
		color : 'red',
		fillColor : '#f03',
		fillOpacity : 0.5,
		radius : 20
	}).addTo(map);

	var polylinePoints = [ [ latitudInstitucion, longitudInstitucion ],
			[ latitudPaciente, longitudPaciente ] ];

	var polyline = L.polyline(polylinePoints).addTo(map);
	


</script>

</c:if>

<%@ include file="../../partial/footer.jsp"%>

</body>

</html>