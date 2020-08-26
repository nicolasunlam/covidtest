<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>Reportes</title>

<jsp:include page="../../partial/${armarHeader}2.jsp" />


<style>
.canvasjs-chart-toolbar button {
	cursor: pointer;
	box-shadow: 0 0 0 0.2rem rgba(40, 167, 69, 0.5);
	color: #fff;
	background-color: #212529;
	border-color: #28a745;
}

.canvasjs-chart-toolbar button {
	color: #212529;
	text-decoration: none;
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

<div class="container">

	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h2 class="">Reportes</h2>
		<a class="btn btn-outline-success"
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
						</c:if>> Volver
			al inicio</a>

	</div>
	<h6 class="mb-5">Vea en detalle las estadísticas más relevantes</h6>

	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h5 class="">Casos de contagiados y recuperados</h5>

	</div>
	<p class="mb-3">Vea la cantidad de casos de contagiados y
		recuperados</p>


	<div class="callout callout-primary py-4">
		<div class="row container-chart">
			<div class="col"></div>
			<div class="col-6">
				<div id="chartContainerTorta" style="height: 20em; width: 100%;"></div>
			</div>
			<div class="col"></div>
		</div>
	</div>

	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h5 class="">Camas ocupadas y disponibles</h5>

	</div>


	<p class="mb-3">Vea la cantidad de camas ocupadas y disponibles</p>


	<div class="callout callout-primary py-4">
		<div class="row container-chart">
			<div class="col"></div>
			<div class="col-6">
				<div id="chartContainerBarras2" style="height: 20em; width: 100%;"></div>
			</div>
			<div class="col"></div>
		</div>
	</div>

	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h5 class="">Casos de contagiados y recuperados</h5>

	</div>
	<p class="mb-3">Vea la cantidad de casos de contagiados y
		recuperados</p>

	<div class="callout callout-primary py-4">
		<div class="row container-chart">
			<div class="col"></div>
			<div class="col-6">
				<div id="chartContainerBarras" style="height: 20em; width: 100%;"></div>
			</div>
			<div class="col"></div>
		</div>
	</div>

</div>

</main>


<script>
    window.onload = function () {

        //Grafico de barras
        var chart = new CanvasJS.Chart("chartContainerBarras", {
            animationEnabled: true,
            exportEnabled: true,
            theme: "light1", // "light1", "light2", "dark1", "dark2",
            title: {
                text: "Contagiados y recuperados",
                    fontFamily: "calibri light",
            },
            axisY: {
                title: "Cantidad de personas"
            },
            legend:{
        		cursor: "pointer",
        		itemclick: explodePie
        	},
            data: [{
                type: "column",
                showInLegend: true,
                legendMarkerColor: "grey",
                legendText: "Estado",
                dataPoints: [
                    {y: ${cantidadPacientesInfectados}, label: "Infectados", color:"#dc3545"},
                    {y: ${cantidadPacientesNoInfectados}, label: "Recuperados", color: "#28a745", exploded: true}
                ]
            }]
        });

        chart.render();
        
        $('.canvasjs-chart-toolbar button>img').replaceWith('<img src="img/download.svg" alt="imagen cambiada" width="25px" height="25px">');
        $('.canvasjs-chart-toolbar button').css('width', '50px');
        $('.canvasjs-chart-toolbar button').css('height', '50px');
        
        function explodePie (e) {
        	if(typeof (e.dataSeries.dataPoints[e.dataPointIndex].exploded) === "undefined" || !e.dataSeries.dataPoints[e.dataPointIndex].exploded) {
        		e.dataSeries.dataPoints[e.dataPointIndex].exploded = true;
        	} else {
        		e.dataSeries.dataPoints[e.dataPointIndex].exploded = false;
        	}
        	e.chart.render();

        }

        //Grafico de barras 2
        var chart = new CanvasJS.Chart("chartContainerBarras2", {
            animationEnabled: true,
            exportEnabled: true,
            theme: "light1", // "light1", "light2", "dark1", "dark2",
            title: {
                text: "Camas ocupadas y disponibles",
                fontFamily: "calibri light",
            },
            axisY: {
                title: "Cantidad total de camas"
            },
            data: [{
                type: "column",
                showInLegend: true,
                legendMarkerColor: "grey",
                legendText: "Estado",
                dataPoints: [
                    {y: ${cantidadCamasOcupadas}, label: "Ocupadas", color:"#dc3545"},
                    {y: ${cantidadCamasDisponibles}, label: "Disponibles", color: "#28a745", exploded: true}
                ]
            }]
        });

        chart.render();

        $('.canvasjs-chart-toolbar button>img').replaceWith('<img src="img/download.svg" alt="imagen cambiada" width="25px" height="25px">');
        $('.canvasjs-chart-toolbar button').css('width', '50px');
        $('.canvasjs-chart-toolbar button').css('height', '50px');
        
        //Grafico de torta
        var porcentaje1 = Math.round((${cantidadPacientesInfectados} * 100 /
        ${cantidadPacientes}))
        ;
        var porcentaje2 = Math.round((${cantidadPacientesNoInfectados} * 100 /
        ${cantidadPacientes}))
        ;
        
        

        var chart = new CanvasJS.Chart("chartContainerTorta", {
            theme: "light1", // "light1", "light2", "dark1", "dark2"
            exportEnabled: true,
            title: {
                text: "Contagiados y recuperados",
                	fontFamily: "calibri light"
            },
            data: [{
                type: "pie",
                startAngle: 25,
                toolTipContent: "<b>{label}</b>: {y}%",
                showInLegend: "true",
                legendText: "{label}",
                indexLabelFontSize: 16,
                indexLabel: "{label} - {y}%",
                dataPoints: [
                    {y: porcentaje1, label: "Infectados", color:"#dc3545"},
                    {y: porcentaje2, label: "Recuperados", color:"#28a745", exploded: true}

                ]
            }]
        });
        chart.render();
        
        $('.canvasjs-chart-toolbar button>img').replaceWith('<img src="img/download.svg" alt="imagen cambiada" width="25px" height="25px">');
        $('.canvasjs-chart-toolbar button').css('width', '50px');
        $('.canvasjs-chart-toolbar button').css('height', '50px');

    }

</script>

<script src="js/bootstrap.bundle.js"></script>
<script src="js/dashboard.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.9.0/feather.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>

<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>
