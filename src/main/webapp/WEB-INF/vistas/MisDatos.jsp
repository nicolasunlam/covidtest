<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>Mis Datos</title>

<jsp:include page="../../partial/${armarHeader}2.jsp" />

<style>
.display-5 {
	font-size: 2.5rem;
	font-weight: 300;
	line-height: 1.2;
}

p.lead {
	font-size: 1.05rem;
}
</style>

<c:if test='${rol != "PACIENTE"}'>
	<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
</c:if>

<div class="container">

	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h2 class="">Mis Datos</h2>
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
						</c:if>>
			<button type="button" class="btn btn-outline-success">
				Volver atrás</button>
		</a>

	</div>
	<h6 class="mb-5">Vea sus datos en detalle y realice alguna
		actualización de los mismos si es necesario</h6>


	<form action="guardarCambios" method="POST">

		<div
			class="form-row d-flex justify-content-between flex-md-nowrap align-items-center pt-3 pb-2 mb-3">

			<div class="col-lg-1 col-md-2 col-sm-4">

				<label for="" class=""> <img alt="" src="img/avatar.svg"
					width="100%" height="85px" style="min-width:">
				</label>
			</div>

			<div class="col">

				<div class="">
					<label for="" class="h5"><c:if test='${rol == "PACIENTE"}'>
					${usuario.getApellido()},
					</c:if> ${usuario.getNombre()}</label>
				</div>
				<div class="">
					<label for="" class="h6 ">${usuario.getTipoDocumento().name()}:
						${usuario.getNumeroDocumento()}</label>
				</div>
				<div class="">
					<label for="" class="h6 ">${usuario.getEmail()}</label>
				</div>

			</div>
		</div>

		<div
			class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
			<h5 class="">Actualizar mis datos</h5>


		</div>
		<p class="mb-5">Renueve sus datos como su mail o contraseña</p>

		<div class="form-group">
			<div class="col-md-12 col-lg-6 pl-0">
				<label for="exampleInputEmail1">Correo electrónico</label> <input
					type="email" name="mail" class="form-control" id="email"
					aria-describedby="email" placeholder="${usuario.getEmail()}"
					disabled>
			</div>
			
			<div class="custom-control custom-checkbox mt-4 mb-5">

				<input type="checkbox" class="custom-control-input"
					onclick="javascript:cambiarMail()" id="customControlValidation1">
				<label class="custom-control-label font-weight-lighter"
					for="customControlValidation1">Deseo cambiar mi correo
					electrónico.</label>
			</div>
			
			
		</div>
		<div class="form-group">

			
			<script type="text/javascript">
			function cambiarMail() {
				
				var activar = document.getElementById("email");
				
				var checkActivador = document.getElementById("customControlValidation1");
				
				if (checkActivador.checked == true) {
					activar.disabled = false;
					
					activar.required = true;
					
				} else {
					activar.disabled = true;
					
					activar.required = false;
				}
			}
			
			function cambiarContraseña() {
				
				var activar = document.getElementById("contraseña");
				var activar2 = document.getElementById("contraseñaNueva");
				var activar3 = document.getElementById("contraseñaNuevaRepetida");
				
				var checkActivador = document.getElementById("customControlValidation2");
				
				if (checkActivador.checked == true) {
					activar.disabled = false;
					activar2.disabled = false;
					activar3.disabled = false;
					
					activar.required = true;
					activar2.required = true;
					activar3.required = true;
					
				} else {
					activar.disabled = true;
					activar2.disabled = true;
					activar3.disabled = true;
					
					activar.required = false;
					activar2.required = false;
					activar3.required = false;
				}
			}
			</script>

			<div class="col-md-12 col-lg-6 pl-0 ">

				<h6>Contraseña de la cuenta</h6>

				<input type="password" name="contraseña"
					class="form-control br-radius-zero contraseñas" id="contraseña"
					placeholder="Ingrese su actual contraseña" data-rule="minlen:1"
					data-msg="Ingrese una contraseña valida" disabled />
				<div class="validation"></div>
			</div>
		</div>

		<div class="row mb-4">


			<div class="col-6">
				<h6 class="">Nueva contraseña</h6>

				<input type="password" name="contraseñaNueva"
					class="form-control br-radius-zero contraseñas"
					id="contraseñaNueva" placeholder="Ingrese su nueva contraseña"
					data-rule="minlen:1" data-msg="Ingrese una contraseña valida"
					disabled />
				<div class="validation"></div>
			</div>
			<div class="col-6">
				<h6 class="">Repita la nueva contraseña</h6>

				<input type="password" name="contraseñaNuevaRepetida"
					class="form-control br-radius-zero contraseñas"
					id="contraseñaNuevaRepetida"
					placeholder="Repita la nueva contraseña" data-rule="minlen:1"
					data-msg="Ingrese una contraseña valida" disabled />
				<div class="validation"></div>
			</div>
		</div>

		<div class="custom-control custom-checkbox mb-5">

			<input type="checkbox" class="custom-control-input"
				onclick="javascript:cambiarContraseña()"
				id="customControlValidation2"> <label
				class="custom-control-label font-weight-lighter"
				for="customControlValidation2">Deseo cambiar mi contraseña.</label>
		</div>

		<c:if test='${rol == "PACIENTE"}'>


			<!-- Load Leaflet from CDN-->
			<link rel="stylesheet"
				href="http://cdn.leafletjs.com/leaflet-0.7.3/leaflet.css" />
			<script src="http://cdn.leafletjs.com/leaflet-0.7.3/leaflet.js"></script>
			<style>
#map {
	height: 30em;
	width: 100%;
}
</style>

			<!-- Load Esri Leaflet from CDN -->
			<script
				src="http://cdn-geoweb.s3.amazonaws.com/esri-leaflet/1.0.0-rc.2/esri-leaflet.js"></script>


			<script
				src="http://cdn-geoweb.s3.amazonaws.com/esri-leaflet-geocoder/0.0.1-beta.5/esri-leaflet-geocoder.js"></script>
			<link rel="stylesheet" type="text/css"
				href="http://cdn-geoweb.s3.amazonaws.com/esri-leaflet-geocoder/0.0.1-beta.5/esri-leaflet-geocoder.css">

			<div class=" mb-3">
				<div class="">
					<h6 class="">Domicilio</h6>
				</div>
				<div class=" m-0 p-0 ">
					<div id="map" class=""></div>

				</div>
			</div>

			<script>


	var map = L.map('map').setView([ ${usuario.getLatitud()}, ${usuario.getLongitud()}],
			16);

	L.tileLayer(
					'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
					{
						attribution : '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
					}).addTo(map);

	var greenIcon = L.icon({
	    iconUrl: 'img/iso-azul.svg',
	    shadowUrl: '',

	    iconSize:     [38, 95], // size of the icon
	    shadowSize:   [50, 64], // size of the shadow
	    iconAnchor:   [22, 94], // point of the icon which will correspond to marker's location
	    shadowAnchor: [8, 94],  // the same for the shadow
	    popupAnchor:  [-3, -76] // point from which the popup should open relative to the iconAnchor
	});
	
	L.marker([ ${usuario.getLatitud()}, ${usuario.getLongitud()}], {icon: greenIcon}).addTo(map)
	.bindPopup('${usuario.getDomicilio().getCalle()} ${usuario.getDomicilio().getNumero()}, ${usuario.getDomicilio().getLocalidad().getNombreLocalidad()}')
    .openPopup();
	
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


		</c:if>

		<div class="mt-4 mb-5">

			<button type="submit" class="btn btn-success mr-2">Guardar
				cambios</button>

			<a class="btn btn-danger"
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

				Cancelar</a>

		</div>
	</form>

</div>

<c:if test='${rol != "PACIENTE"}'>
	</main>
</c:if>


<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/bootstrap.bundle.js"></script>

</body>

</html>