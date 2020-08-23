<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>Bienvenido</title>

<jsp:include page="../../partial/${armarHeader}2.jsp" />

<script>
    window.onload = function () {

        //Grafico de barras
/*         var chart = new CanvasJS.Chart("chartContainerTorta2", {
            animationEnabled: true,
            theme: "dark2", // "light1", "light2", "dark1", "dark2", style="background-color: #e9ecef"
            title: {
                text: "Casos totales de contagiados y recuperados",
                    fontFamily: "calibri light",
            },
            axisY: {
                title: "Cantidad de personas"
            },
            data: [{
                type: "column",
                showInLegend: true,
                legendMarkerColor: "grey",
                legendText: "Estado",
                dataPoints: [
                    {y: ${cantidadPacientesInfectados}, label: "Infectados", color:"#FE2E2E"},
                    {y: ${cantidadPacientesNoInfectados}, label: "Recuperados", color: "#2E9AFE"}
                ]
            }]
        }); 

        chart.render();*/

        //Grafico de barras - Cantidad de camas ocupadas
        var chart = new CanvasJS.Chart("chartContainerBarras", {
            animationEnabled: true,
            theme: "dark2", // "light1", "light2", "dark1", "dark2",
            title: {
                text: "Cantidad total de camas ocupadas, disponibles y reservadas",
                fontFamily: "calibri light",
            },
            axisY: {
                title: "Cantidad total de camas"
            },
            data: [{
                type: "column",
                dataPoints: [
                    {y: ${cantidadCamasOcupadas}, label: "Ocupadas", color:"#FE2E2E"},
                    {y: ${cantidadCamasDisponibles}, label: "Disponibles", color: "#2E9AFE"},
                    {y: ${cantidadCamasReservadas}, label: "Reservadas", color: "#F4FA58"}
                ]
            }]
        });

        chart.render();

/*         //Grafico de torta 3
        var porcentaje1 = (${cantidadPacientesInfectados} * 100 /
        ${cantidadPacientes})
        ;
        var porcentaje2 = (${cantidadPacientesNoInfectados} * 100 /
        ${cantidadPacientes})
        ;

        var chart = new CanvasJS.Chart("chartContainerTorta", {
            theme: "dark2", // "light1", "light2", "dark1", "dark2"
            //exportEnabled: true,
            //animationEnabled: true,
            animationEnabled: true,
            title: {
                text: "Casos totales de contagiados y recuperados",
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
                    {y: porcentaje1, label: "Infectados", color:"#FE2E2E"},
                    {y: porcentaje2, label: "Recuperados", color:"#2E9AFE"}

                ]
            }]
        });
        chart.render(); */

    }

</script>

<div class="jumbotron">
	<h1 class="display-3">Bienvenido/a</h1>
	<p class="lead">Desde aquí acceda a las opciones principales de:
		${nombre}</p>
	<p class="lead">La institución ${nombre} posee ${camas} camas en
		total.</p>
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
		<h1 class="display-4">Reportes</h1>

	</div>
	<div class="mt-4">
		<div class="row container-chart">
			<div class="col-4"></div>
			<div class="col-4">
				<div id="chartContainerBarras" style="height: 30em; width: 100%;"></div>
			</div>
			<div class="col-4"></div>
		</div>
	</div>
</div>


</div>

</div>


</div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script>window.jQuery || document.write('<script src="../assets/js/vendor/jquery.slim.min.js"><\/script>')</script>
<script src="../assets/dist/js/bootstrap.bundle.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.9.0/feather.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
<script src="js/dashboard.js"></script>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>
