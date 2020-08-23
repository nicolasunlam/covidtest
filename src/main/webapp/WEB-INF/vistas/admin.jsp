<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>Home Admin</title>

<jsp:include page="../../partial/${armarHeader}2.jsp" />

<script>
	window.onload = function() {
		alert(${cantidadTotalCamas});		
		alert(${cantidadCamasDisponibles});
		alert(${cantidadCamasOcupadas});
		alert(${cantidadCamasReservadas});
		

		//Grafico de barras - Cantidad de camas ocupadas
 		var chart = new CanvasJS.Chart(
				"chartContainerBarras",
				{
					animationEnabled : true,
					theme : "dark2", // "light1", "light2", "dark1", "dark2",
					title : {
						text : "Cantidad total de camas ocupadas, disponibles y reservadas",
						fontFamily : "calibri light",
					},
					axisY : {
						title : "Cantidad total de camas"
					},
					data : [ {
						type : "column",
						dataPoints : [ 
						{y: ${cantidadCamasOcupadas}, label: "Ocupadas", color:"#FE2E2E"},
						{y: ${cantidadCamasDisponibles}, label: "Disponibles", color: "#2E9AFE"},
						{y: ${cantidadCamasReservadas}, label: "Reservadas", color: "#F4FA58"}
						]
					} ]
				});

		chart.render();	  
		 

	}
</script>

<div class="jumbotron">
	<h1 class="display-4">Bienvenido/a</h1>
	<p class="my-4 lead">Desde aquí acceda a las opciones principales
		de: ADMINISTRADOR</p>
	<a class="btn btn-outline-primary" href="verMensajes" role="button">Ver
		Mensajes Recibidos</a> <a class="btn btn-outline-primary"
		href="verMensajesEnviados" role="button">Ver Mensajes Enviados</a>
	<hr class="my-4">
	<p class="lead">
		<a class="btn btn-primary btn-lg" href="listaPacientesInternados"
			role="submit"> Panel de Control</a>
	</p>

	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-5 pb-2 mb-2 border-bottom">
		<h1 class="display-4">Reportes de camas</h1>

	</div>
	<div class="mt-4">
		<div class="row container-chart">
			<div class="col-2"></div>
			<div class="col-8">
				<div id="chartContainerBarras" style="height: 30em; width: 100%;"></div>
			</div>
			<div class="col-2"></div>
		</div>
	</div>

</div>

<%@ include file="../../partial/footer.jsp"%>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>

</html>