<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page pageEncoding="UTF-8"%>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>Instituciones</title>

<jsp:include page="../../partial/${armarHeader}2.jsp" />

<div class="container">

	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h2 class="">Instituciones más cercanas</h2>
		<a href="verMensajesRecibidos" class="btn btn-outline-success">
			Ver Mensajes Recibidos</a>

	</div>
	<h6 class="mb-5">Vea las instituciones más cercanas a su domicilio
		y la distancia hasta las mismas</h6>

	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h5 class="">Opiciones de filtrado</h5>
		<div class="">
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
				<button type="button" class="btn btn-outline-primary">
					Volver atrás</button>
			</a>
		</div>

	</div>
	<p class="mb-3">Realice el filtrado de la tabla para ver la
		información que necesita con mayor comodidad</p>


	<div class="my-3">
		<span class=" h6">Hasta 2 km </span><input class="mr-4" " type="radio"
			name="estado" id="dos"> <span class=" h6">Hasta 5 km </span><input
			class="mr-4" " type="radio" name="estado" id="cinco"> <span
			class="h6">Restaurar </span><input class="mr-4" " type="radio"
			name="estado" id="restaurar">
	</div>

	<div class="table-responsive">

		<table id="myTable"
			class="table table-bordered table-hover responsive nowrap text-center">
			<tr class="text-center align-middle">

				<th style="vertical-align: middle; width: 12%"
					class="border border-secondary"
					onmouseover="this.style.backgroundColor='#dee2e6 ';"
					onmouseout="this.style.backgroundColor='white';">NOMBRE
					INSTITUCIÓN<img style="margin-top: 0.40rem;"
					class="bi bi-arrow-down-up float-right" alt="" src="img/sort.svg"
					width="10px" height="">

				</th>

				<th style="vertical-align: middle; width: 15%"
					class="border border-secondary"
					onmouseover="this.style.backgroundColor='#dee2e6';"
					onmouseout="this.style.backgroundColor='white';">UBICACIÓN <img
					style="margin-top: 0.40rem;"
					class="bi bi-arrow-down-up float-right" alt="" src="img/sort.svg"
					width="10px" height="">

				</th>

				<th style="vertical-align: middle; width: 15%"
					class="border border-secondary"
					onmouseover="this.style.backgroundColor='#dee2e6 ';"
					onmouseout="this.style.backgroundColor='white';">DISTANCIA<img
					style="margin-top: 0.40rem;"
					class="bi bi-arrow-down-up float-right" alt="" src="img/sort.svg"
					width="10px" height="">

				</th>

				<th style="vertical-align: middle; width: 20%"
					class="border border-secondary"
					onmouseover="this.style.backgroundColor='#dee2e6';"
					onmouseout="this.style.backgroundColor='white';">MAIL DE
					CONTACTO<img style="margin-top: 0.40rem;"
					class="bi bi-arrow-down-up float-right" alt="" src="img/sort.svg"
					width="10px" height="">

				</th>

				<th style="vertical-align: middle; width: 14%"
					class="border border-secondary"
					onmouseover="this.style.backgroundColor='#dee2e6';"
					onmouseout="this.style.backgroundColor='white';">ACCIÓN</th>
			</tr>

			<c:forEach items="${listaInstituciones}" var="institucion">

				<tr
					<c:if test="${Math.round(institucion.getDistancia()) <= 2}">
		            		class="dos table-info"
		               	</c:if>
					<c:if test="${Math.round(institucion.getDistancia()) >2 && 
					Math.round(institucion.getDistancia()) <= 5 }">
		            		class="cinco"
		               	</c:if>>


					<td class="align-middle"><c:out
							value="${institucion.getUsuario().getNombre()}" /></td>

					<td class="align-middle"><c:out
							value="${institucion.getUsuario().getDomicilio().getCalle()} ${institucion.getUsuario().getDomicilio().getNumero()}, 
							${institucion.getUsuario().getDomicilio().getLocalidad().getNombreLocalidad()}" /></td>

					<td class="align-middle"><c:if
							test="${Math.round(institucion.getDistancia()) < 9 }">
							
								${fn:substring(institucion.getDistancia(), 0, 3)}
							km
						</c:if> <c:if test="${Math.round(institucion.getDistancia()) > 9}">
							${Math.round(institucion.getDistancia())} km
						</c:if></td>

					<td class="align-middle"><c:out
							value="${institucion.getUsuario().getNombre()} km" /></td>


					<td><a class="btn btn-outline-primary mb-2"
						href="detalleInstitucion?idInstitucion=${institucion.getUsuario().getId()}"
						role="button">Ver detalle</a> 
			</c:forEach>

		</table>
	</div>
</div>

<script>
	$('#restaurar').click(function() {
		$('.dos').slideDown();
		$('.cinco').slideDown();
	});
	$('#dos').click(function() {
		$('.dos').slideUp();
		$('.cinco').slideDown();
	});
	$('#cinco').click(function() {
		$('.cinco').slideUp();
		$('.dos').slideDown();
	});
</script>

<script src="js/sort.js"></script>
<script src="js/bootstrap.bundle.js"></script>
<script src="js/feather.min.js"></script>
<script src="js/Chart.min.js"></script>
<script src="js/dashboard.js"></script>


</body>
</html>