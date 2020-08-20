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



		<div class="row justify-content-center h-100 my-5">
			<div class="col-sm-8 align-self-center">
				<div class="card shadow ">
					<div class="card-body" style="background-color: #F2F2F2;">

						<h3 class="text-center mt-2">
							Se registró exitosamente la sala tipo <span
								style="text-transform: lowercase; font-weight: bolder;">${tipoSala}</span>
						</h3>

						<div class="container text-center">
							<img src="img/right.png" style="width: 150px;" class="mt-5 mb-1"></img>
						</div>


						<div
							class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
							<h6 class="text-center my-4" style="line-height : 40px;">
								A continuación, seleccione <strong>"Volver"</strong> para ir al
								listado de todos los pisos de la institución, de lo contrario
								selecione <strong>"Registrar Sector"</strong> para agregar un
								sector nuevo a este piso
							</h6>

						</div>

						<div
							class="d-flex justify-content-around flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3">

							<a href="pisosInstitucion" class="btn btn-outline-danger">Volver</a>
							<a href="crearCamas?idSala=${idSala}"
								class="btn btn-outline-success">Registrar Camas</a>

						</div>
					</div>
				</div>
			</div>
		</div>



	</div>















	<%-- 	<div class="container">

		<div
			class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
			<h4>Detalle Sala</h4>

			<h4>Sala número: ${idSala}</h4>
			<h4>Sala descripcion: ${descripcion}</h4>
			<h4>Tipo sala: ${tipoSala}</h4>



			<h4 class="text-center">Usted registró efectivamente el piso
			${numeroPiso}</h4>

		</div>

		<a href="listarSalas" class="btn btn-success">Volver</a> <a
			href="crearCamas?idSala=${idSala}" class="btn btn-success">Registrar
			camas</a> --%>





	</body>
	</html>