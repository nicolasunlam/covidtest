<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>Disponibilidad De Camas</title>

<jsp:include page="../../partial/${armarHeader}2.jsp" />

<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">




	<div class="container">

		<%-- 		<div class="container-fluid mt-1 text-center">
			<div class="row">
				<div class="col-3"></div>
				<div class="col-6">
					<img src="img/hospital.png" class="rounded" alt="icono hospital"
						width="100" height="100">
					<h2 class="font-weight-bolder">${institucion.getNombre()}</h2>
				</div>
				<div class="col-3"></div>
			</div>
		</div> --%>

		<div class="mt-2 border-bottom">
			<h5>
				${institucion.getNombre()} /
				<c:if test="${piso.getNumeroPiso() == 0}">Planta Baja /
                                    </c:if>
				<c:if test="${piso.getNumeroPiso() != 0}">
                                        Piso ${piso.getNumeroPiso()} /
                                    </c:if>
				Registrar Sector

			</h5>

		</div>


		<div class="container">

			<div class="row justify-content-center h-100 my-5">
				<div class="col-sm-8 align-self-center">
					<div class="card shadow ">
						<div class="card-body" style="background-color: #F2F2F2;">

							<h3 class="text-center mt-2">Registrar sector</h3>


							<h5 class="mt-5 text-center">A continuación, registre el
								tipo de sector para el piso</h5>

							<form action="registrarSector" method="POST" role="form"
								class="contactForm my-5">

								<input type="hidden" value="${idPiso}" name="idPiso">



								<div class="form-group">
									<label for="tipoSector" class="h6 my-3">Tipo de sector
									</label> <select name="tipoSector" id="tipoSector"
										class="form-control br-radius-zero" required
										onchange="ShowSelected();">
										<option id="tipoSectorCIRUJIA" value="CIRUJIA">Sector
											cirujia
										<option id="tipoSectorDIALISIS" value="DIALISIS">Sector
											dialisis
									</select>
								</div>

								<ul>
									<c:forEach items="${sectores}" var="sector">
										<li>${sector.getId()}"</li>
										<li>${sector.getTipo()}"</li>
									</c:forEach>
								</ul>
								<input type="hidden" value="${idSector}" name="idSector">

								<div class="form-action text-center mt-5">
									<button type="submit" class="btn btn-outline-success">
										Registrar sector</button>
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
					</div>
				</div>
			</div>



		</div>


		<%-- 		<div
			class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
			<h4>Registrar sector</h4>

		</div>


		<h6 class="my-3 text-left">A continuación puede registrar un
			sector dentro del piso indicado</h6>




		<div>

			<form action="registrarSector" method="POST" role="form"
				class="contactForm">

				<input type="hidden" value="${idPiso}" name="idPiso">



				<div class="form-group">
					<label for="tipoSector" class="h6 my-3">Tipo de sector <span
						class="text-primary font-weight-bold">*</span></label> <select
						name="tipoSector" id="tipoSector"
						class="form-control br-radius-zero" required
						onchange="ShowSelected();">
						<option id="tipoSectorCIRUJIA" value="CIRUJIA">Sector
							cirujia
						<option id="tipoSectorDIALISIS" value="DIALISIS">Sector
							dialisis
					</select>
				</div>

				<ul>
					<c:forEach items="${sectores}" var="sector">
						<li>${sector.getId()}"</li>
						<li>${sector.getTipo()}"</li>
					</c:forEach>
				</ul>

				<br>
				<div class="form-action">
					<button type="submit" class="btn btn-outline-secondary">
						Registrar sector</button>
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

		</div> --%>
	</div>

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
	</html>