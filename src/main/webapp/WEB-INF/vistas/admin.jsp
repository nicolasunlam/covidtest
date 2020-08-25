<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../../partial/adminHeaderParte1.jsp" />

<title>Bienvenido</title>

<jsp:include page="../../partial/adminHeaderParte2.jsp" />


<script>
window.onload = function () {
	
	 var total = ${cantidadCamasOcupadas} + ${cantidadCamasDisponibles} + ${cantidadCamasReservadas};
     
     var porcentaje1 = Math.round((${cantidadCamasOcupadas} * 100 / total));
     
     var porcentaje2 = Math.round((${cantidadCamasDisponibles} * 100 /  total));
     
     var porcentaje3 = Math.round((${cantidadCamasReservadas} * 100 / total));
     
var chart = new CanvasJS.Chart("chartContainer", {
	exportEnabled: true,
	animationEnabled: true,
	 backgroundColor: "#e9ecef",
	title:{
		text: "Disponiblidad de camas",
			fontFamily: "calibri light"
	},
	legend:{
		cursor: "pointer",
		itemclick: explodePie
	},
	data: [{
		type: "pie",                startAngle: 25,
        toolTipContent: "<b>{label}</b>: {y}%",
        showInLegend: "true",
        legendText: "{label}",
        indexLabelFontSize: 16,
        indexLabel: "{label} - {y}%",
		dataPoints: [
            {y: porcentaje1, label: "Ocupadas", color:"#dc3545"},
            {y: porcentaje2, label: "Disponibles", color: "#28a745", exploded: true},
            {y: porcentaje3, label: "Reservadas", color: "#ffc107"}
		]
	}]
});
chart.render();


function explodePie (e) {
	if(typeof (e.dataSeries.dataPoints[e.dataPointIndex].exploded) === "undefined" || !e.dataSeries.dataPoints[e.dataPointIndex].exploded) {
		e.dataSeries.dataPoints[e.dataPointIndex].exploded = true;
	} else {
		e.dataSeries.dataPoints[e.dataPointIndex].exploded = false;
	}
	e.chart.render();

}


//Grafico de barras - Cantidad de camas ocupadas
 var chart = new CanvasJS.Chart("chartContainerBarras", {
     animationEnabled: true,
     theme: "light4", //, "light2", "dark1", "dark2",
     title: {
         text: "Cantidad total de camas ocupadas, disponibles y reservadas",
         fontFamily: "calibri light",
     },
     axisY: {
         title: "Cantidad total de camas"
     },
     data: [{
         type: "column",
         indexLabelFontSize: 16,
         dataPoints: [
             {y: ${cantidadCamasOcupadas}, label: "Ocupadas", color:"#FE2E2E"},
             {y: ${cantidadCamasDisponibles}, label: "Disponibles", color: "#2E9AFE"},
             {y: ${cantidadCamasReservadas}, label: "Reservadas", color: "#F4FA58"}
         ]
     }]
 });

 chart.render();



 var chart = new CanvasJS.Chart("chartContainer2", {
 	animationEnabled: true,
 	title:{
 		text: "Crude Oil Reserves vs Production, 2016"
 	},	
 	axisY: {
 		title: "Billions of Barrels",
 		titleFontColor: "#4F81BC",
 		lineColor: "#4F81BC",
 		labelFontColor: "#4F81BC",
 		tickColor: "#4F81BC"
 	},
 	axisY2: {
 		title: "Millions of Barrels/day",
 		titleFontColor: "#C0504E",
 		lineColor: "#C0504E",
 		labelFontColor: "#C0504E",
 		tickColor: "#C0504E"
 	},	
 	toolTip: {
 		shared: true
 	},
 	legend: {
 		cursor:"pointer",
 		itemclick: toggleDataSeries
 	},
 	data: [{
 		type: "column",
 		name: "Proven Oil Reserves (bn)",
 		legendText: "Proven Oil Reserves",
 		showInLegend: true, 
 		dataPoints:[
 			{ label: "Saudi", y: 266.21 },
 			{ label: "Venezuela", y: 302.25 },
 			{ label: "Iran", y: 157.20 },
 			{ label: "Iraq", y: 148.77 },
 			{ label: "Kuwait", y: 101.50 },
 			{ label: "UAE", y: 97.8 }
 		]
 	},
 	{
 		type: "column",	
 		name: "Oil Production (million/day)",
 		legendText: "Oil Production",
 		axisYType: "secondary",
 		showInLegend: true,
 		dataPoints:[
 			{ label: "Saudi", y: 10.46 },
 			{ label: "Venezuela", y: 2.27 },
 			{ label: "Iran", y: 3.99 },
 			{ label: "Iraq", y: 4.45 },
 			{ label: "Kuwait", y: 2.92 },
 			{ label: "UAE", y: 3.1 }
 		]
 	}]
 });
 chart.render();

 function toggleDataSeries(e) {
 	if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
 		e.dataSeries.visible = false;
 	}
 	else {
 		e.dataSeries.visible = true;
 	}
 	chart.render();
 }

    }

</script>

<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">

<div class="jumbotron mt-4">

	<article class="row">

		<div class="col-lg col-md-12">
			<h1 class="display-4">Bienvenido/a</h1>
			<p class="my-4 lead">Desde aquí acceda a las opciones principales
				de: ADMINISTRADOR</p>
			<a class="btn btn-outline-primary" href="verMensajesRecibidos"
				role="button">Ver Mensajes Recibidos</a> <a
				class="btn btn-outline-primary" href="verMensajesEnviados"
				role="button">Ver Mensajes Enviados</a>
			<hr class="my-4">
			<p class="lead">
				<a class="btn btn-primary btn-lg" href="listaPacientesInternados"
					role="submit"> Panel de Control</a>
			</p>
		</div>
		<div class="col">

			<div class="mt-4">
				<div class="container-chart">
					<div id="chartContainer" style="width: 100%; height: 20em;"></div>
				</div>
			</div>
		</div>
	</article>

</div>

<!-- 
<div class="row">
	<div class="col-lg col-md-6">
		<div  id="chartContainerBarras"
			style="height: 370px; width: 100%;"></div>
	</div>
	<div class="col-lg col-md-6">
		<div id="chartContainer2"
			style="height: 370px; width: 100%;"></div>
	</div>
</div> --> <script
	src="https://canvasjs.com/assets/script/canvasjs.min.js"></script> <script
	src="js/dashboard.js"></script> <script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap.js"></script> <script
	src="js/bootstrap.blunde.js"></script> <script
	src="js/jquery-3.5.1.min.js"></script> </main>

</body>

</html>