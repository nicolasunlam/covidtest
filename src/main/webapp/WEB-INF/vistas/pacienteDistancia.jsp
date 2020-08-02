<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>Inserte titulo aquí</title>

<jsp:include page="../../partial/${armarHeader}2.jsp" />

<body>


	<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">

	<div class="container m-5">

		<h2>Instituciones mas cercanas</h2>

		<table
			class="table table-bordered table-hover responsive nowrap text-center align-middle">
			<tr>
				<td th scope="col">Nombre</td>
				<td th scope="col">Distancia</td>
				<td th scope="col">Ver detalle</td>
			<tr>
				<td class="align-middle">${nombre1}</td>
				<td class="align-middle">${distancia1}KM</td>
				<td>
				<div class="float-right" style="margin-right: 20px; margin-top: 5px; /* margin-left: -30px" */>
										
										<form action="detalleInstitucion">


											<input class="invisible" type="hidden" id="idInstitucion" name="idInstitucion"
												value="${id1}"> <input
												class="btn btn-primary" type="submit" value="Ver detalle institucion">

										</form>
										
								</td>
				
			</tr>
			<tr>
				<td class="align-middle">${nombre2}</td>
				<td class="align-middle">${distancia2}KM</td>
				<td>
				<div class="float-right" style="margin-right: 20px; margin-top: 5px; /* margin-left: -30px" */>
										
										<form action="detalleInstitucion">


											<input class="invisible" type="hidden" id="idInstitucion" name="idInstitucion"
												value="${id2}"> <input
												class="btn btn-primary" type="submit" value="Ver detalle institucion">

										</form>
										
								</td>
			</tr>
			<tr>
				<td class="align-middle">${nombre3}</td>
				<td class="align-middle">${distancia3}KM</td>
				<td>
				<div class="float-right" style="margin-right: 20px; margin-top: 5px; /* margin-left: -30px" */>
										
										<form action="detalleInstitucion">


											<input class="invisible" type="hidden" id="idInstitucion" name="idInstitucion"
												value="${id3}"> <input
												class="btn btn-primary" type="submit" value="Ver detalle institucion">

										</form>
										
								</td>
			</tr>

		</table>

	</div>

	</main>


	</div>
	</div>

	</main>


</body>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<script>
	function myFunction() {
		// Declare variables
		var input, filter, table, tr, td, i, txtValue;
		input = document.getElementById("myInput");
		filter = input.value.toUpperCase();
		table = document.getElementById("myTable");
		tr = table.getElementsByTagName("tr");

		// Loop through all table rows, and hide those who don't match the search query
		for (i = 0; i < tr.length; i++) {
			td = tr[i].getElementsByTagName("td")[3];
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








