<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>Detalle Piso</title>

<jsp:include page="../../partial/${armarHeader}2.jsp" />

<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">

	<div class="container">

		<div class="alert alert-success alert-dismissible fade show mt-1 mb-4"
			role="alert">
			<h5 class="text-center">¡Registro exitoso!</h5>
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>

		<%-- 		<div
			class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
			<h4>Detalle Sector</h4>
			
			<h4>Sector número: ${numeroSector}</h4>	
					
			
			<h4 class="text-center">Usted registró efectivamente el piso
			${numeroPiso}</h4>

		</div> --%>
		<%-- 		
		<a href="listarSectores" class="btn btn-success">Volver</a>
		
		<a href="crearSala?idSector=${idSector}" class="btn btn-success">Registrar Sala</a> --%>

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

	<div class="container">



		<div class="row justify-content-center h-100 my-5">
			<div class="col-sm-8 align-self-center">
				<div class="card shadow ">
					<div class="card-body" style="background-color: #F2F2F2;">

						<h3 class="text-center mt-2">Se registró exitosamente el
							sector tipo <span
								style="text-transform: lowercase; font-weight: bolder;">${tipoSector}</span></h3>


						<div class="container text-center">
							<img src="img/right.png" style="width: 150px;" class="mt-5 mb-1"></img>
						</div>


						<div
							class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
							<h6 class="text-center my-4" style="line-height : 40px;">
								A continuación, seleccione <strong>"Volver"</strong> para ir al
								listado de todos los pisos de la institución, de lo contrario
								selecione <strong>"Registrar Sala"</strong> para agregar una
								nueva sala a este sector
							</h6>

						</div>

						<div
							class="d-flex justify-content-around flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3">

							<a href="pisosInstitucion" class="btn btn-outline-danger">Volver</a>
							<a href="crearSala?idSector=${idSector}" class="btn btn-success">Registrar
								Sala</a>

						</div>
					</div>
				</div>
			</div>
		</div>



	</div>



	</body>
	</html>