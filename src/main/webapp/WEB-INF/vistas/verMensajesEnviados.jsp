<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>Inserte Título Aquí</title>

<jsp:include page="../../partial/${armarHeader}2.jsp" />

<main role="main" class="col-md-9 ml-sm-auto col-lg-12 px-md-4">


<div class="container">

	<c:if test="${list.size() <= 0}">
		<div class="container my-5 text-center">
			<h1 class="my-5">Usted no tiene mensajes</h1>
			<img src="img/remove.png" width="200" height="200"
				alt="Generic placeholder image">
		</div>
	</c:if>

	<c:if test="${list.size() > 0}">

		<br>
		<h2>Mensajes</h2>

		<br>

		<table
			class="table table-bordered table-hover responsive nowrap text-center align-middle">
			<tr class="text-center align-middle">
				<th scope="col">De:</th>
				<th scope="col">Asunto</th>
				<th scope="col">Mensaje</th>
				<th scope="col">Fecha y Hora</th>
				<th scope="col">Rol</th>
				<th scope="col">Acciones</th>
			</tr>
			<c:forEach items="${list}" var="notificacion">
				<tr>
					<td class="align-middle"><c:out
							value="${notificacion.getRemitente().getNombre()}" /></td>
					<td class="align-middle"><c:out
							value="${notificacion.getAsunto()}" /></td>
					<td class="align-middle"><c:out
							value="${notificacion.getMsg()}" /></td>
					<td class="align-middle"><c:out
							value="${notificacion.getFechaHora()}" /></td>
					<td class="align-middle"><c:out
							value="${notificacion.getRemitente().getRol().name()}" /></td>


					<td><a class="btn btn-primary"
						href="verDetalleMensaje/${notificacion.getId()}" role="button">Ver
							Mensaje</a></td>

					<td><a class="btn btn-primary" href="" role="button">Responder</a></td>



					</form>
					</div>
					</td>
			</c:forEach>
		</table>

	</c:if>


</div>
</main>
</div>
</div>

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
