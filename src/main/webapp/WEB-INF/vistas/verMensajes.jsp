<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>Mensajes Recibidos</title>

<jsp:include page="../../partial/${armarHeader}2.jsp" />

<c:if test='${rol != "PACIENTE"}'>
	<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
</c:if>

<div class="container">

	<c:if test="${list.size() <= 0}">
		<div class="container my-5 text-center">
			<h1 class="my-5">Usted no tiene mensajes</h1>
			<img src="img/remove.png" width="200" height="200"
				alt="Generic placeholder image">
		</div>
	</c:if>

	<c:if test="${list.size() > 0}">

		<div
			class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
			<h2 class="">Mensajes Recibidos</h2>
			<a href="verMensajesEnviados" class="btn btn-outline-success">
				Ver Mensajes Enviados</a>

		</div>
		<h6 class="mb-5">Vea en detalle los mensajes recibidos</h6>

		<div
			class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
			<h5 class="">Opiciones de filtrado</h5>
			<div class="">
				<a
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
					<button type="button" class="btn btn-outline-primary">
						Volver atrás</button>
				</a>
			</div>

		</div>
		<p class="mb-3">Realice el filtrado de la tabla para ver la
			información que necesita con mayor comodidad</p>


		<div class="my-3">
			<span class=" h6">Paciente </span><input class="mr-4" " type="radio"
				name="estado" id="paciente"> <span class=" h6">Institucion
			</span><input class="mr-4" " type="radio" name="estado" id="institucion">
			<span class="h6">Todos </span><input class="mr-4" " type="radio"
				name="estado" id="restaurar">
		</div>

		<div class="class="table-responsive">

			<table id="myTable"
				class="table table-bordered table-hover responsive nowrap text-center">
				<tr class="text-center align-middle">

					<th style="vertical-align: middle; width: 12%"
						class="border border-secondary"
						onmouseover="this.style.backgroundColor='#dee2e6 ';"
						onmouseout="this.style.backgroundColor='white';">DE<img
						style="margin-top: 0.40rem;"
						class="bi bi-arrow-down-up float-right" alt="" src="img/sort.svg"
						width="10px" height="">

					</th>

					<th style="vertical-align: middle; width: 15%"
						class="border border-secondary"
						onmouseover="this.style.backgroundColor='#dee2e6';"
						onmouseout="this.style.backgroundColor='white';">FECHA Y HORA
						<img style="margin-top: 0.40rem;"
						class="bi bi-arrow-down-up float-right" alt="" src="img/sort.svg"
						width="10px" height="">

					</th>

					<th style="vertical-align: middle; width: 15%"
						class="border border-secondary"
						onmouseover="this.style.backgroundColor='#dee2e6 ';"
						onmouseout="this.style.backgroundColor='white';">ASUNTO<img
						style="margin-top: 0.40rem;"
						class="bi bi-arrow-down-up float-right" alt="" src="img/sort.svg"
						width="10px" height="">

					</th>

					<th style="vertical-align: middle; width: 20%"
						class="border border-secondary"
						onmouseover="this.style.backgroundColor='#dee2e6';"
						onmouseout="this.style.backgroundColor='white';">MENSAJE<img
						style="margin-top: 0.40rem;"
						class="bi bi-arrow-down-up float-right" alt="" src="img/sort.svg"
						width="10px" height="">

					</th>

					<th style="vertical-align: middle; width: 12%"
						class="border border-secondary"
						onmouseover="this.style.backgroundColor='#dee2e6';"
						onmouseout="this.style.backgroundColor='white';">ROL <img
						style="margin-top: 0.40rem;"
						class="bi bi-arrow-down-up float-right" alt="" src="img/sort.svg"
						width="10px" height="">

					</th>

					<th style="vertical-align: middle; width: 14%"
						class="border border-secondary"
						onmouseover="this.style.backgroundColor='#dee2e6';"
						onmouseout="this.style.backgroundColor='white';">ACCIÓN</th>
				</tr>

				</tr>
				<c:forEach items="${list}" var="notificacion">
					<tr
						<c:if test="${notificacion.getDestinatario().getRol() == 'PACIENTE'}">
		            		class="paciente"
		               	</c:if>
						<c:if test="${notificacion.getDestinatario().getRol() == 'INSTITUCION'}">
		            		class="institucion"
		               	</c:if>>

						<td class="align-middle"><c:if
								test='${notificacion.getRemitente().getRol() == "PACIENTE"}'>
						${notificacion.getRemitente().getApellido()}, 
						</c:if> ${notificacion.getRemitente().getNombre()}</td>

						<td class="align-middle"><fmt:parseDate
								value="${notificacion.getFechaHora()}"
								pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
							<fmt:formatDate pattern="dd/MM/yyyy ' - ' HH:mm 'h.'"
								value="${ parsedDateTime }" /></td>

						<td class="align-middle"><c:out
								value="${notificacion.getAsunto()}" /></td>

						<td class="align-middle">
							${fn:substring(notificacion.getMsg(), 0, 25)} <c:if
								test="${fn:length(notificacion.getMsg()) > 25}">... 
						</c:if>

						</td>

						<td class="align-middle"><c:out
								value="${notificacion.getRemitente().getRol().name()}" /></td>


						<td><a class="btn btn-outline-primary mb-2"
							href="verDetalleMensaje?id=${notificacion.getId()}" role="button">Ver
								Mensaje</a> <a class="btn btn-outline-success" href="" role="button">Responder</a></td>

						</form>
						</div>

						</td>
				</c:forEach>

			</table>
		</div>

	</c:if>

	<div class="mt-5 mr-4">

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

</div>


<c:if test='${rol != "PACIENTE"}'>
	</main>
</c:if>

<script>
	$('#restaurar').click(function() {
		$('.institucion').slideDown();
		$('.paciente').slideDown();
	});
	$('#institucion').click(function() {
		$('.institucion').slideUp();
		$('.paciente').slideDown();
	});
	$('#paciente').click(function() {
		$('.paciente').slideUp();
		$('.institucion').slideDown();
	});
</script>

<script>
	window.jQuery
			|| document
					.write('<script src="../assets/js/vendor/jquery.slim.min.js"><\/script>')
</script>

<script src="js/sort.js"></script>
<script src="js/bootstrap.bundle.js"></script>
<script src="js/feather.min.js"></script>
<script src="js/Chart.min.js"></script>
<script src="js/dashboard.js"></script>

</body>


</html>
