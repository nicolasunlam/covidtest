<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>Disponibilidad De Camas</title>

<jsp:include page="../../partial/${armarHeader}2.jsp" />

<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">


	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h4>Confirmación</h4>

	</div>

	<div class="container">

		<h2 class="text-center my-5">A continuación, seleccione el campo
			en donde desea agregar más datos</h2>

		<form action="continuacionIngresoDatos" method="POST" role="form" class="form">
			<select class="custom-select my-1 mr-sm-2"
				id="inlineFormCustomSelectPref" name="eleccion">
				<option value="piso">Piso</option>
				<option value="sector">Sector</option>
				<option value="sala">Sala</option>
				<option value="camas">Camas</option>
			</select>

			<button type="submit" class="btn btn-primary my-4">Agregar</button>
		</form>

		<!-- Button trigger modal -->
		<div class="text-center">
			<button type="button" class="btn btn-primary my-5"
				data-toggle="modal" data-target="#exampleModal">Confirmar
				información ingresada</button>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Confirmación</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">Si usted desea seguir agregando más
						información al formulario de registro de institución, seleccione
						"Seguir agregando datos". Si no, seleccione "Confirmar y
						finalizar" para finalizar.</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Seguir agregando datos</button>
						<a type="button" class="btn btn-primary text-white" href="panel">Confirmar y
							finalizar</a>
					</div>
				</div>
			</div>
		</div>

	</div>

	</body>
	</html>