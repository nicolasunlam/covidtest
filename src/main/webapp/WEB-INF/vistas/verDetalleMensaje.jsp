<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>Mensaje</title>

<jsp:include page="../../partial/${armarHeader}2.jsp" />

<c:if test='${rol != "PACIENTE"}'>
	<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
</c:if>

<div class="container" class="col-md-9 ml-sm-auto col-lg-10 px-md-4"
	style="margin-top: 75px;">

	<div class="card">
		<h5 class="card-header">Asunto: "${notificacion.getAsunto()}"</h5>
		<div class="card-body">
			<p class="card-text">De:
				"${notificacion.getRemitente().getNombre()}"</p>
			<h5 class="card-title"></h5>
			<p class="card-text">Mensaje:</p>
			<blockquote class="blockquote mb-0">
				<p>${notificacion.getMsg()}</p>
				<footer class="blockquote-footer">
					Enviado el:
					<fmt:parseDate value="${notificacion.getFechaHora()}"
						pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
					<fmt:formatDate
						pattern="dd 'de' MMMM 'de' yyyy 'a las' HH:mm 'horas'"
						value="${ parsedDateTime }" />
				</footer>
			</blockquote>

			<a href="#" class="btn btn-primary" style="margin-top: 25px;">Responder</a>
		</div>
	</div>
</div>


<%-- <fmt:parseDate value="${notificacion.getFechaHora()}"
pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
<fmt:formatDate pattern="dd 'de' MMMM 'de' yyyy 'a las' HH:mm 'horas'" 
value="${ parsedDateTime }" /> --%>

<c:if test='${rol != "PACIENTE"}'>
	</main>
</c:if>

<script src="js/dashboard.js"></script>
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
</body>