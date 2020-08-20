<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>Disponibilidad De Camas</title>

<jsp:include page="../../partial/${armarHeader}2.jsp" />

<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">

	<div class="container">

		<div class="row justify-content-center h-100 my-5">
			<div class="col-sm-8 align-self-center">
				<div class="card shadow ">
					<div class="card-body" style="background-color: #F2F2F2;">

						<h3 class="text-center mt-2">Registrar camas</h3>


						<h5 class="mt-5 text-center">A continuación, ingrese la
							cantidad de camas a registrar</h5>

						<form action="crearCamaPorTipoSala" method="POST" role="form"
							class="contactForm my-5">


							<div class="form-group mb-5">
								<label for="cantidadDeCamas" class="h6 my-3">Cantidad de
									camas </label> <input type="number" name="cantidadDeCamas"
									class="form-control br-radius-zero" id="cantidadDeCamas"
									placeholder="Ingrese cantidad de camas" data-rule="minlen:1"
									data-msg="Ingrese cantidad de camas valido" />
								<div class="validation"></div>
							</div>


							<div class="form-group mt-5">
								<label for="tipoCama" class="h6 my-3">Tipo de cama</label> <select
									name="tipoCama" id="tipoCama"
									class="form-control br-radius-zero" required
									onchange="ShowSelected();">
									<option id="tipoCamaFIJA" value="FIJA">Fija
									<option id="tipoCamaARTICULADA_MANUAL"
										value="ARTICULADA_MANUAL">Articulada Manual
									<option id="tipoCamaARTICULADA_ELECTRICA"
										value="ARTICULADA_ELECTRICA">Articulada Electrica
								</select>
							</div>

							<input type="hidden" value="${idSala}" name="idSala"> <br>
							<div class="form-action text-center mt-5">
								<button type="submit" class="btn btn-outline-success">
									Registrar camas</button>
							</div>
							<div class="form-group">
								<c:if test="${not empty error}">
									<h6>
										<span>${error}</span>
									</h6>
									<br>
							</div>
							</c:if>
						</form>
					</div>
				</div>
			</div>
		</div>



	</div>










	<%-- 	<div class="container">

		<div
			class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
			<h4>Registrar camas</h4>

		</div>

		<div>

			<form action="crearCamaPorTipoSala" method="POST" role="form"
				class="contactForm">



				<div class="form-group">
					<label for="cantidadDeCamas" class="h6 my-3">Cantidad de
						camas<span class="text-primary font-weight-bold">*</span>
					</label> <input type="number" name="cantidadDeCamas"
						class="form-control br-radius-zero" id="cantidadDeCamas"
						placeholder="Ingrese cantidad de camas" data-rule="minlen:1"
						data-msg="Ingrese cantidad de camas valido" />
					<div class="validation"></div>
				</div>




				<div class="form-group">
					<label for="tipoCama" class="h6 my-3">Tipo de cama <span
						class="text-primary font-weight-bold">*</span></label> <select
						name="tipoCama" id="tipoCama" class="form-control br-radius-zero"
						required onchange="ShowSelected();">
						<option id="tipoCamaFIJA" value="FIJA">Fija
						<option id="tipoCamaARTICULADA_MANUAL" value="ARTICULADA_MANUAL">Articulada
							Manual
						<option id="tipoCamaARTICULADA_ELECTRICA"
							value="ARTICULADA_ELECTRICA">Articulada Electrica
					</select>
				</div>
				// <input type="hidden" value="${idSala}" name="idSala"> <br>
				<div class="form-action">
					<button type="submit" class="btn btn-outline-secondary">
						Registrar camas</button>
				</div>
				<br>
				<div class="form-group">
					<c:if test="${not empty error}">
						<h6>
							<span>${error}</span>
						</h6>
						<br>
				</div>
				</c:if>

			</form>

		</div>
	</div> --%>


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
<script>
	
</script>
</body>
</html>