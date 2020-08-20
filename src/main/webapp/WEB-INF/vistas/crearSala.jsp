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

						<h3 class="text-center mt-2">Registrar sala</h3>


						<h5 class="mt-5 text-center">A continuación, registre el tipo
							de sala para el sector</h5>

						<form action="registrarSala" method="POST" role="form"
							class="contactForm my-5">


							<div class="form-group">
								<label for="tipoSala" class="h5 my-4">Tipo de sala</label> <select
									name="tipoSala" id="tipoSala"
									class="form-control br-radius-zero" required
									onchange="ShowSelected();">
									<option id="tipoSalaTERAPIA_INTENSIVA"
										value="TERAPIA_INTENSIVA">Terapia intensiva
									<option id="tipoSalaTERAPIA_INTERMEDIA"
										value="TERAPIA_INTERMEDIA">Terapia intermedia
								</select>
							</div>

							<input type="hidden" value="${idSector}" name="idSector">
							<br>
							<div class="form-action text-center mt-5">
								<button type="submit" class="btn btn-outline-success">
									Registrar sala</button>
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



	</body>
	</html>