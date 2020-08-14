<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>Detalle Piso</title>

<jsp:include page="../../partial/${armarHeader}2.jsp" />

<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">

	<div class="container">

		<div
			class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
			<h4>Detalle Sector</h4>
			
			<h4>Sector número: ${numeroSector}</h4>	
					
			
			<%-- <h4 class="text-center">Usted registró efectivamente el piso
			${numeroPiso}</h4> --%>

		</div>
		
		<a href="listarSectores" class="btn btn-success">Volver</a>
		
		<a href="crearSala?idSector=${idSector}" class="btn btn-success">Registrar Sala</a>

<%-- 		<div>

			<form action="registrarSala" method="POST" role="form"
				class="contactForm">


				<div class="form-group">
					<label for="tipoSala" class="h6 my-3">Tipo de sala <span
						class="text-primary font-weight-bold">*</span></label> <select
						name="tipoSala" id="tipoSala" class="form-control br-radius-zero"
						required onchange="ShowSelected();">
						<option id="tipoSalaTERAPIA_INTENSIVA" value="TERAPIA_INTENSIVA">Terapia
							intensiva
						<option id="tipoSalaTERAPIA_INTERMEDIA" value="TERAPIA_INTERMEDIA">Terapia
							intermedia
					</select>
				</div>

				<input type="hidden" value="${idSector}" name="idSector"> <br>
				<div class="form-action">
					<button type="submit" class="btn btn-outline-secondary">
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

		</div> --%>
	</div>



	</body>
	</html>