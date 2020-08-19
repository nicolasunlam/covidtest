<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>Inserte titulo aquí</title>

<jsp:include page="../../partial/${armarHeader}2.jsp" />

<div class="jumbotron">
	<h1 class="display-4">Bienvenido/a</h1>
	<p class="my-4 lead">Desde aquí acceda a las opciones principales de:
		ADMINISTRADOR</p>
	<a class="btn btn-outline-primary" href="verMensajes" role="button">Ver
		Mensajes Recibidos</a> <a class="btn btn-outline-primary"
		href="verMensajesEnviados" role="button">Ver Mensajes Enviados</a>
	<hr class="my-4">
	<p class="lead">
		<a class="btn btn-primary btn-lg" href="listaPacientesInternados"
			role="submit"> Panel de Control</a>
	</p>
</div>

<%@ include file="../../partial/footer.jsp" %>

</body>

</html>