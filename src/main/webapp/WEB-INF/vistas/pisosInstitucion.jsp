<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>AsignAR</title>

<jsp:include page="../../partial/${armarHeader}2.jsp" />

<style>
#inputTipoInstitucion, #inputNombre, #inputCUIT {
	background-image: url('/css/searchicon.png');
	/* Add a search icon to input */
	background-position: 10px 12px; /* Position the search icon */
	background-repeat: no-repeat; /* Do not repeat the icon image */
	width: 100%; /* Full-width */
	font-size: 16px; /* Increase font-size */
	padding: 12px 20px 12px 40px; /* Add some padding */
	border: 1px solid #ddd; /* Add a grey border */
	margin-bottom: 12px; /* Add some space below the input */
}

#myTable {
	border-collapse: collapse; /* Collapse borders */
	width: 100%; /* Full-width */
	border: 1px solid #ddd; /* Add a grey border */
	font-size: 18px; /* Increase font-size */
}

#myTable th, #myTable td {
	text-align: left; /* Left-align text */
	padding: 12px; /* Add padding */
}

#myTable tr {
	/* Add a bottom border to all table rows */
	border-bottom: 1px solid #ddd;
}

#myTable tr.header, #myTable tr:hover {
	/* Add a grey background color to the table header and on hover */
	background-color: #f1f1f1;
}
</style>

<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">

	<div class="container-fluid">

		<h2 class="my-5">Lista de Pisos</h2>

		<div class="row">

			<div class="col-3">
				<h5 class="mt-5 mb-3">Número</h5>
				<input type="text" id="inputNombre"
					class="mb-5 bg-light border border-secondary"
					onkeyup="filtrarPorNombre()" placeholder="Ingrese número a buscar">
			</div>
			<div class="col-3">
				<h5 class="mt-5 mb-3">Descripción</h5>
				<input type="text" id="inputTipoInstitucion"
					class="mb-5 bg-light border border-secondary"
					onkeyup="filtrarPorTipoInstitucion()"
					placeholder="Ingrese descripción a buscar">
			</div>
			<div class="col-3">
				<h5 class="mt-5 mb-3">Tipo</h5>
				<input type="text" id="inputCUIT"
					class="mb-5 bg-light border border-secondary"
					onkeyup="filtrarPorCUIT()" placeholder="Ingrese tipo a buscar">
			</div>

			<div class="col-3 text-center">
				<h5 class="mt-5 mb-3">Registrar Piso</h5>
				<div class="mt-3">
					<form action="crearMensajeParaInstitucion" method=post>
						<input class="invisible" type="hidden" id="id" name="id"
							value="${piso.getId()}"> <a
							href="registrarInstitucion" class="btn btn-success w-75 h-25"
							type="submit"><i class="fa fa-plus-square fa-2x"></i></a>
					</form>
				</div>


			</div>
		</div>
		<table id="myTable"
			class="table table-bordered responsive nowrap align-middle">
			<tr class="text-center align-middle" style="cursor: pointer;">
				<th scope="col"
					onmouseover="this.style.backgroundColor='DeepSkyBlue';"
					onmouseout="this.style.backgroundColor='white';" id="nombreTabla">Número
					<i class="fa fa-sort"></i>
				</th>

				<th scope="col"
					onmouseover="this.style.backgroundColor='DeepSkyBlue';"
					onmouseout="this.style.backgroundColor='white';">Descripción <i
					class="fa fa-sort"></i>
				</th>

				<th scope="col"
					onmouseover="this.style.backgroundColor='DeepSkyBlue';"
					onmouseout="this.style.backgroundColor='white';">Tipo <i
					class="fa fa-sort"></i></th>

				<th scope="col"
					onmouseover="this.style.backgroundColor='DeepSkyBlue';"
					onmouseout="this.style.backgroundColor='white';">Acciones</th>

			</tr>
			<c:forEach items="${listaPacientes}" var="paciente">

				<tr onmouseover="this.style.backgroundColor='AliceBlue';"
					onmouseout="this.style.backgroundColor='white';">
					<td class="align-middle"><c:out value="${paciente.getId()}" /></td>

					<td class="align-middle"><c:out
							value="${instituciones.getTipo().name()}" /></td>

					<td class="align-middle"><c:out
							value="${instituciones.getNumeroDocumento()}" /></td>

					<td class="text-center">
						<div class="mt-3">


							<form action="crearMensajeParaInstitucion" method=post>


								<input class="invisible" type="hidden" id="id" name="id"
									value="${instituciones.getId()}"> <input
									class="btn btn-primary" type="submit" value="Detalle Piso">

							</form>
						</div>
					</td>
			</c:forEach>
		</table>

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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>

<script src="js/sort.js"></script>

</body>
</html>
