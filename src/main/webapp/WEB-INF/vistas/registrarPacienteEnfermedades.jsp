<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>Inserte titulo aquí</title>

<jsp:include page="../../partial/${armarHeader}2.jsp" />

<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">

<div class="container">

			<div class="mb-3">
				<div class="">
					<h3 class="text-center my-2">Complete el formulario con sus
						datos</h3>
				</div>
				<div class="">
					<form action="validarEnfermedades" method="POST"
						modelAttribute="paciente"
						class="d-flex justify-content-center flex-column justify-content-center">

						<div class="form-row mt-4">
							<div class="form-group col-6">
								<label for="estatura">Estatura</label> <small id="centimetros"
									class="text-muted"> (en centímetros) </small> <input
									type="number" name="estatura"
									class="form-control br-radius-zero" id="estatura" required />
							</div>
							<div class="form-group col-6">
								<label for="peso">Peso</label> <small id="kilos"
									class="text-muted"> (en kilogramos) </small> <input
									type="number" name="peso" class="form-control br-radius-zero"
									id="peso" required />
							</div>
						</div>


						<div class="form-group form-check my-4">
							<input type="checkbox" class="form-check-input"
								id="tieneEmbarazo" name="tieneEmbarazo"> <label
								class="form-check-label h6" for="tieneEmbarazo">Embarazada </label></label>
						</div>
						<div class="form-group form-check my-4">
							<input type="checkbox" class="form-check-input" id="esFumador"
								name="esFumador"> <label class="form-check-label h6"
								for="esFumador">¿Es o fue una persona que fuma o fumó
								habitualmente? </label></label>
						</div>
						<div class="form-group form-check my-4">
							<input type="checkbox" class="form-check-input"
								id="tieneDiabetes" name="tieneDiabetes"> <label
								class="form-check-label h6" for="tieneDiabetes">Tiene
								diabetes</label>
						</div>
						<div class="form-group form-check my-4">
							<input type="checkbox" class="form-check-input"
								id="tieneEnfHepatica" name="tieneEnfHepatica"> <label
								class="form-check-label h6" for="tieneEnfHepatica">Tiene
								alguna enfermedad hepática</label>
						</div>
						<div class="form-group form-check my-4">
							<input type="checkbox" class="form-check-input"
								id="tieneEnfRespiratoria" name="tieneEnfRespiratoria"> <label
								class="form-check-label h6" for="tieneEnfRespiratoria">Tiene
								alguna enfermedad respiratoria</label>
						</div>
						<div class="form-group form-check my-4">
							<input type="checkbox" class="form-check-input"
								id="tieneEnfRenal" name="tieneEnfRenal"> <label
								class="form-check-label h6" for="tieneEnfRenal">Tiene
								alguna enfermedad renal crónica</label>
						</div>
						<div class="form-group form-check my-4">
							<input type="checkbox" class="form-check-input"
								id="tieneEnfCardiologica" name="tieneEnfCardiologica"> <label
								class="form-check-label h6" for="tieneEnfCardiologica">Tiene
								alguna enfermedad cardiológica</label>
						</div>

						<div class="text-center">
							<button type="submit"
								class="btn btn-primary text-center mt-5 w-50"
								value="${paciente.getId()}">Siguiente</button>
						</div>

					</form>
				</div>
			</div>

</div>

</main>

</body>

</html>