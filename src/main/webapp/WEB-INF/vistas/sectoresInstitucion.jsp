<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>AsignAR</title>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">

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
				<h5 class="mt-5 mb-3">Registrar Sector</h5>
				<div class="mt-3">

					<input class="invisible" type="hidden" id="id" name="id"
						value="${sector.getId()}"> <a href="crearSector"
						class="btn btn-outline-success rounded  w-50" type="submit"><i
						class="fa fa-plus fa-2x" aria-hidden="true"></i></a>

				</div>


			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-3"></div>
				<div class="col-6"></div>
				<div class="col-3"></div>
			</div>

			<table id="myTable"
				class="table table-bordered responsive nowrap align-middle">
				<tr class="text-center align-middle" style="cursor: pointer;">
					<th scope="col"
						onmouseover="this.style.backgroundColor='DeepSkyBlue';"
						onmouseout="this.style.backgroundColor='white';" id="nombreTabla">Descripción
						<i class="fa fa-sort"></i>
					</th>

					<th scope="col"
						onmouseover="this.style.backgroundColor='DeepSkyBlue';"
						onmouseout="this.style.backgroundColor='white';">Acciones</th>

				</tr>
				<c:forEach items="${listaSectoresPorPiso}" var="sector">

					<tr onmouseover="this.style.backgroundColor='AliceBlue';"
						onmouseout="this.style.backgroundColor='white';">
						<td class="align-middle"><c:out
								value="${sector.getDescripcion()}" /></td>

						<td class="text-center">
							<div class="mt-3">


								<form action="listarSalasPorSector" method=get>


									<input class="invisible" type="hidden" id="idSector" name="idSector"
										value="${sector.getId()}"> <input
										class="btn btn-primary" type="submit" value="Detalle Sector">

								</form>
							</div>
						</td>
				</c:forEach>
			</table>

		</div>

		<%-- 		<div class="container justify-content-md-center bg-primary my-5 w-25">
			<div class="row">
				<div class="col-3 bg-white"></div>
				<div class="col-6 text-center">
					<i class="fa fa-h-square fa-3x mt-2 mb-2" aria-hidden="true"></i>
				</div>
				<div class="col-3 bg-white"></div>
			</div>

			<c:forEach items="${listaPisos}" var="piso">
				<div class="bg-light my-2">
					<h3 class="text-center">${piso.getId()}</h3>
				</div>
			</c:forEach>
			<div class="bg-primary text-center" style="height: 5px;"></div>
		</div> --%>
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
