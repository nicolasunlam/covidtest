<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>AsignAR</title>

<jsp:include page="../../partial/${armarHeader}2.jsp" />

<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">

<div class="container">
	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h2 class="">Instituciones Registradas</h2>
		<a href="registrarInstitucion?idAdmin=${idAdmin}"
			class="btn btn-success"> Registrar Institución</a>

	</div>
	<h6 class="mb-5">Vea todas las instituciones en el sistema
		asignar.</h6>

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
				<button type="button" class="btn btn-primary">Volver atrás</button>
			</a>
		</div>

	</div>
	<p class="mb-4">Realice el filtrado de la tabla para ver la
		información que necesita con mayor comodidad</p>


	<div class="my-3">
		<span class=" h6">Hospital </span><input class="mr-4" " type="radio"
			name="estado" id="hospital"> <span class=" h6">Hotel </span><input
			class="mr-4" " type="radio" name="estado" id="hotel"> <span
			class=" h6">Universidad </span><input class="mr-4" " type="radio"
			name="estado" id="universidad"> <span class=" h6">Club
		</span><input class="mr-4" " type="radio" name="estado" id="club"> <span
			class="h6">Restaurar </span><input class="mr-4" " type="radio"
			name="estado" id="restaurar">
	</div>

	<div class="form-row mb-3">
		<div class="col-md-12 col-lg-6">
			<label for="exampleInputEmail1">Nombre de la Institución</label> <input
				type="text" name="" class="form-control" id="inputNombre"
				aria-describedby="email"
				placeholder="Ingrese el nombre de la institución a buscar..."
				onkeyup="filtrarPorNombre()">
		</div>

		<div class="col-md-12 col-lg-6 ">
			<label for="exampleInputEmail1">CIUT de la Institución</label> <input
				type="text" name="" class="form-control" id="inputCUIT"
				aria-describedby="email"
				placeholder="Ingrese el CUIT de la institución a buscar..."
				onkeyup="filtrarPorCUIT()">
		</div>

	</div>

	<div class="table-responsive">

		<table id="myTable"
			class="table table-bordered table-hover responsive nowrap text-center">
			<tr class="text-center align-middle">

				<th style="vertical-align: middle; width: 16%"
					class="border border-secondary"
					onmouseover="this.style.backgroundColor='#dee2e6 ';"
					onmouseout="this.style.backgroundColor='white';">NOMBRE
					INSTITUCIÓN<img style="margin-top: 0.40rem;"
					class="bi bi-arrow-down-up float-right" alt="" src="img/sort.svg"
					width="10px" height="">

				</th>

				<th style="vertical-align: middle; width: 12%"
					class="border border-secondary"
					onmouseover="this.style.backgroundColor='#dee2e6 ';"
					onmouseout="this.style.backgroundColor='white';">CUIT <img
					style="margin-top: 0.40rem;"
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
					<c:if test="${institucion.getTipo().getDescripcion() == 'Hospital'}">
		            		class="hospital"
		               	</c:if>
					<c:if test="${institucion.getTipo().getDescripcion() == 'Hotel' }">
		            		class="hotel"
		               	</c:if>
					<c:if test="${institucion.getTipo().getDescripcion() == 'Club'}">
		            		class="club"
		               	</c:if>
					<c:if test="${institucion.getTipo().getDescripcion() == 'Universidad' }">
		            		class="universidad"
		               	</c:if>>


					<td class="align-middle"><c:out
							value="${institucion.getNombre()}" /></td>

					<td class="align-middle"><c:out
							value="${institucion.getNumeroDocumento()}" /></td>

					<td class="align-middle"><c:out
							value="${institucion.getDomicilio().getCalle()} ${institucion.getDomicilio().getNumero()}, 
							${institucion.getDomicilio().getLocalidad().getNombreLocalidad()}" /></td>


					<td class="align-middle"><c:out
							value="${institucion.getEmail()}" /></td>


					<td><a class="btn btn-outline-primary mb-2"
						href="detalleInstitucion?idInstitucion=${institucion.getId()}"
						role="button">Ver detalle</a>
			</c:forEach>

		</table>
	</div>

	<a href="admin" class="btn btn-primary mt-3"> Volver atrás</a>

</div>

</main>

<script src="js/bootstrap.bundle.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.9.0/feather.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
<script src="js/dashboard.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>

<script src="js/sort.js"></script>

<script>
	/*nombreTabla = document.getElementById('nombreTabla');
	iconoNombreTabla = document.getElementById('iconoNombreTabla');
	console.log(iconoNombreTabla);*/

	/*function alternarIcono() {
		iconoNombreTabla.className.baseVal = "feather feather-code";
		iconoNombreTabla.className.animVal = "feather feather-code";

	}*/

	//nombreTabla.onclick = hola();
</script>

<script>
	$('#restaurar').click(function() {
		$('.hospital').slideDown();
		$('.club').slideDown();
		$('.universidad').slideDown();
		$('.hotel').slideDown();
	});
	$('#hospital').click(function() {
		$('.hospital').slideDown();
		$('.club').slideUp();
		$('.universidad').slideUp();
		$('.hotel').slideUp();
	});
	$('#club').click(function() {
		$('.hospital').slideUp();
		$('.club').slideDown();
		$('.universidad').slideUp();
		$('.hotel').slideUp();
	});
	$('#universidad').click(function() {
		$('.hospital').slideUp();
		$('.club').slideDown();
		$('.universidad').slideUp();
		$('.hotel').slideUp();
	});
	$('#hotel').click(function() {
		$('.hospital').slideUp();
		$('.club').slideUp();
		$('.universidad').slideUp();
		$('.hotel').slideDown();
	});

	function filtrarPorNombre() {
		// Declare variables
		var input, filter, table, tr, td, i, txtValue;
		input = document.getElementById("inputNombre");
		filter = input.value.toUpperCase();
		table = document.getElementById("myTable");
		tr = table.getElementsByTagName("tr");

		// Loop through all table rows, and hide those who don't match the search query
		for (i = 0; i < tr.length; i++) {
			td = tr[i].getElementsByTagName("td")[0];
			if (td) {
				txtValue = td.textContent || td.innerText;
				if (txtValue.toUpperCase().indexOf(filter) > -1) {
					tr[i].style.display = "";
				} else {
					tr[i].style.display = "none";
				}
			}
		}
	}

	function filtrarPorTipoInstitucion() {
		// Declare variables
		var input, filter, table, tr, td, i, txtValue;
		input = document.getElementById("inputTipoInstitucion");
		filter = input.value.toUpperCase();
		table = document.getElementById("myTable");
		tr = table.getElementsByTagName("tr");

		// Loop through all table rows, and hide those who don't match the search query
		for (i = 0; i < tr.length; i++) {
			td = tr[i].getElementsByTagName("td")[1];
			if (td) {
				txtValue = td.textContent || td.innerText;
				if (txtValue.toUpperCase().indexOf(filter) > -1) {
					tr[i].style.display = "";
				} else {
					tr[i].style.display = "none";
				}
			}
		}
	}

	function filtrarPorCUIT() {
		// Declare variables
		var input, filter, table, tr, td, i, txtValue;
		input = document.getElementById("inputCUIT");
		filter = input.value.toUpperCase();
		table = document.getElementById("myTable");
		tr = table.getElementsByTagName("tr");

		// Loop through all table rows, and hide those who don't match the search query
		for (i = 0; i < tr.length; i++) {
			td = tr[i].getElementsByTagName("td")[2];
			if (td) {
				txtValue = td.textContent || td.innerText;
				if (txtValue.toUpperCase().indexOf(filter) > -1) {
					tr[i].style.display = "";
				} else {
					tr[i].style.display = "none";
				}
			}
		}
	}
</script>

</body>
</html>
