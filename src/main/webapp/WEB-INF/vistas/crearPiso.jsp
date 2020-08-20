<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>Disponibilidad De Camas</title>

<jsp:include page="../../partial/${armarHeader}2.jsp" />

<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">

	<div class="container">

		<div class="callout callout-primary py-4">

			<div class="row justify-content-center h-100 my-5">
				<div class="col-sm-8 align-self-center">
					<div class="card shadow ">
						<div class="card-body" style="background-color: #F2F2F2;">

							<h3 class="text-center mt-2">Registrar piso</h3>

							<h5 class="mt-5 text-center">A continuación, ingrese el
								número de piso</h5>

							<form action="registrarPiso" method="POST" role="form"
								class="contactForm my-5">


								<div class="form-group">
									<label for="cantidadDeCamas" class="h6 my-3">Numero
										Piso</label> <input type="number" name="numeroPiso"
										class="form-control br-radius-zero" id="numeroPiso"
										data-rule="minlen:1" data-msg="Ingrese piso valido" />
									<div class="validation"></div>
								</div>

								<div
									class="d-flex justify-content-center flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3">
									<div class="form-action">
										<button type="submit" class="btn btn-outline-success">
											Registrar piso</button>
									</div>
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


		<%-- 	<div class="container">

		<div
			class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
			<h4>Registrar piso</h4>

		</div>

		<div>

			<form action="registrarPiso" method="POST" role="form"
				class="contactForm">

				<div class="form-group">
					<label for="cantidadDeCamas" class="h6 my-3">Numero Piso</label> <input
						type="number" name="numeroPiso"
						class="form-control br-radius-zero" id="numeroPiso"
						placeholder="Ingrese numero de piso" data-rule="minlen:1"
						data-msg="Ingrese piso valido" />
					<div class="validation"></div>
				</div>








				<br>
				<div
					class="d-flex justify-content-center flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3">
					<div class="form-action">
						<button type="submit" class="btn btn-outline-success">
							Registrar piso</button>
					</div>
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



		</body>
		</html>