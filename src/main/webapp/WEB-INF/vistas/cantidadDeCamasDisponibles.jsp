<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>Inserte titulo aquí</title>

<jsp:include page="../../partial/${armarHeader}2.jsp" />

<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">

<div class="container m-5">

	<h2 class="pb-2 mb-3 border-bottom">Diponibilidad de Camas Por
		Institución</h2>
	<br>
	<div>

		<h6 class="">PASO 1: Elegir el hospital en donde realizar la
			internación</h6>

	</div>
	<br>

	<div class="table-responsive">
		<table
			class="table table-bordered table-hover responsive nowrap text-center">
			<tr>
				<th class="bg-light">INSTITUCIÓN</th>
				<th class="bg-light">CAMAS DISPONIBLES</th>
				<th class="bg-light">TIPO</th>
				<th class="bg-light">ACCIÓN</th>
			</tr>

			<c:if test="${rol == 'INSTITUCION'}">
				<tr>
					<td><c:out value="${camas.get(0).getSala().getSector().getPiso().getInstitucion().getNombre()}" /></td>
					<td><c:out value="${camas.size()}" /></td>

					<td><c:out value="" /></td>
					<td class="align-middle"><a href="" type="button"
						class="btn btn-primary">Internar</a></td>
				</tr>
			</c:if>

			<c:if test="${rol == 'ADMIN'}">
				<c:forEach items="${camas}" var="cama">
					<tr>

						<td><c:out
								value="${cama.getCama().getSala().getSector().getPiso().getInstitucion().getNombre()}" /></td>
						<td><c:out value="${cama.getCount()}" /></td>

						<td><c:out value="${camas.size() }" /></td>
						<td class="align-middle"><a href="" type="button"
							class="btn btn-primary">Internar</a></td>
					</tr>
				</c:forEach>
			</c:if>

		</table>
	</div>

</div>

</main>

</div>
</div>

</main>

</div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script>
	window.jQuery
			|| document
					.write('<script src="../assets/js/vendor/jquery.slim.min.js"><\/script>')
</script>
<script src="../assets/dist/js/bootstrap.bundle.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.9.0/feather.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
<script src="js/dashboard.js"></script>
</body>
</html>
