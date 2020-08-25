<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>Mensajes Recibidos</title>

<jsp:include page="../../partial/${armarHeader}2.jsp" />

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

		</div>
		<h6 class="mb-5">Vea en detalle los mensajes recibidos</h6>

		<div class="class="table-responsive"">

			<table id="myTable"
				class="table table-bordered table-hover responsive nowrap text-center">
				<tr class="text-center align-middle">

					<th style="vertical-align: middle; width: 16%"
						class="border border-secondary"
						onmouseover="this.style.backgroundColor='#dee2e6 ';"
						onmouseout="this.style.backgroundColor='white';">DE<img
						style="margin-top: 0.40rem;"
						class="bi bi-arrow-down-up float-right" alt="" src="img/sort.svg"
						width="10px" height="">

					</th>

					<th style="vertical-align: middle; width: 16%"
						class="border border-secondary"
						onmouseover="this.style.backgroundColor='#dee2e6 ';"
						onmouseout="this.style.backgroundColor='white';">ASUNTO<img
						style="margin-top: 0.40rem;"
						class="bi bi-arrow-down-up float-right" alt="" src="img/sort.svg"
						width="10px" height="">

					</th>

					<th style="vertical-align: middle; width: 12%"
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
						onmouseout="this.style.backgroundColor='white';">FECHA Y HORA
						<img style="margin-top: 0.40rem;"
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
								Mensaje</a> <a class="btn btn-primary" href="" role="button">Responder</a></td>





						</form>
		</div>
		
		</td>
		
		</c:forEach>
		
		</table>
		
</div>

</c:if>

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

<%@ include file="../../partial/footer.jsp"%>

</body>


</html>
