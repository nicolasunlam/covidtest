<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous"></head>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  
<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>Trasladar Paciente</title>

<jsp:include page="../../partial/${armarHeader}2.jsp" />

<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">

<div class="container">

	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h2 class="">Trasladar Paciente</h2>
		
	</div>
		<p>A continuación se muestran los datos del paciente y sus requisitos para preparar su traslado.</p>
	
	<div class="my-4">
		
		<form action="trasladarAInstitucion" method="GET" role="form"
			class="contactForm">

			<div class="form-row d-flex justify-content-between flex-md-nowrap align-items-center pt-3 pb-2 mb-3">

				<div class="col-lg-1 col-md-2 col-sm-4">								
					
					<label for="" class=""> <svg width="100%"
							height="100%" viewBox="0 0 16 16" class="bi bi-person-circle"
							fill="currentColor" xmlns="http://www.w3.org/2000/svg">
	  					  <path
								d="M13.468 12.37C12.758 11.226 11.195 10 8 10s-4.757 1.225-5.468 2.37A6.987 6.987 0 0 0 8 15a6.987 6.987 0 0 0 5.468-2.63z" />
						  <path fill-rule="evenodd" d="M8 9a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
						  <path fill-rule="evenodd"
								d="M8 1a7 7 0 1 0 0 14A7 7 0 0 0 8 1zM0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8z" />
						</svg>
					</label>
				</div>

			<div class="col">

				<div class="">
					<label for="" class="h5">${paciente.getApellido()}, ${paciente.getNombre()}</label> 
				</div>
				<div class="">
					<label for="" class="h6 ">${paciente.getTipoDocumento().name()}: ${paciente.getNumeroDocumento()}</label>
				</div>
				<div class="">
					<label for="" class="h6 ">${paciente.getEmail()}</label>
				</div>
				
					<input name="idPaciente" type="hidden" value="${paciente.getId()}">

			</div>
		</div>
		
			<div class="my-2">
				<label for="" class="h6">Edad:
				</label> 
				<span
					class="">${paciente.getEdad()}
				</span>
			</div>
			
			<div class="my-2">
			
				<style>
					.circulo {
						display: inline-block;
						width: 15px;
						height: 15px;
						margin-left: 6px;
						background-color: #555;
					}
				</style>
			
				<label for="" class="h6">Prioridad: 
				</label> 
					<span class="">
						<c:if test="${paciente.getPrioridad() == 5 || paciente.getPrioridad() == 4}">
							<span>Baja</span>
							<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-heart-fill text-success" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
							  		<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
							</svg>
						</c:if>
						<c:if test="${paciente.getPrioridad() == 3}">
							<span>Media</span>
							<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-heart-fill text-warning" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
							  		<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
								</svg>
						</c:if>
						<c:if test="${paciente.getPrioridad() == 2 || paciente.getPrioridad() == 1}">
						<span>Alta</span>
								<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-heart-fill text-danger" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
							  		<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
								</svg>
						</c:if>
					</span>
			</div>
					
			<div class="my-2">
				<label for="" class="h6">Domicilio:
				</label> 
				<span
					class="">
					${paciente.getDomicilio().getLocalidad().getNombreLocalidad()}, 
					${paciente.getDomicilio().getLocalidad().getPartido().getNombrePartido()},
					${paciente.getDomicilio().getLocalidad().getPartido().getProvincia().getNombreProvincia().getValor()}.
				</span>
			</div>
			
			<div class="my-2">
				<c:if test="${paciente.getTieneEmbarazo() == true}">
				<label for="" class="h6">Embarazo:
				</label> <span
					class=""> En curso.
				</span>
				</c:if>
			</div>

			<div class="row">
				<div class="col-1">
				<label for="" class="h6">Enfermedades: 
				</label>
				</div>
				<div class="col">
				<span
					class="text-danger"> 
					<c:forEach
							items="${listaEnfermedades}" var="enfermedad">
							<ul class="mb-3">
							<li> ${enfermedad}.</li>
							</ul>
						</c:forEach>
				</span>
				</div>
			</div>

			<div class="">
			
				<c:if test="${paciente.getEsFumador() == true}">
				<label for="" class="h6">
				Fumador<c:if test="${paciente.getEsFumador() == true}">a
				</c:if>:
				</label>
				<span
					class="text-danger"> 
					Activ<c:if test="${paciente.getEsFumador() == true}">o</c:if><c:if test="${paciente.getEsFumador() == true}">a</c:if>.
				</span>
				</c:if>
				
			</div>

			<div
				class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
				<h4>Requisitos del traslado</h4>
			</div>
						<div class="form-group px-0">
			<p>Algunos de los siguientes requisitos para realizar el
					traslado han sido autocompletados en base a la condición del
					paciente. 
					<br>Puede modificarlos si lo desea.</p>
					</div>
			
			<div class="form-row">

			<div class="form-group col-lg-6 col-md-12">
				<label for="" class="h6 my-3">Tipo de Sala<span
					class="text-primary font-weight-bold">*</span></label> <select
					name="tipoSala" class="form-control br-radius-zero" required>
					<c:forEach items="${listaTipoSalas}" var="tipoSala">
						<option id="tipoSala" value="${tipoSala}"
							<c:if test="${tipoSala.getPrioridad() == paciente.getPrioridad()}">
								selected
						</c:if>>${tipoSala.getDescripcion()}
					</c:forEach>
				</select>
				<div class="validation"></div>
			</div>

			<div class="form-group col-lg-6 col-md-12">
				<label for="" class="h6 my-3">Tipo de Cama<span
					class="text-primary font-weight-bold">*</span></label> 
					
					<select
					name="tipoCama" class="form-control br-radius-zero" required>
					<c:forEach items="${listaTipoCamas}" var="tipoCama">

						<option id="tipoCama" value="${tipoCama}"
							<c:if test="${tipoCama.getPrioridad() == paciente.getPrioridad()}">
								selected
							</c:if>>${tipoCama.getDescripcion()}
					</c:forEach>
				</select>
				
				<div class="validation"></div>
			</div>
			
			</div>
			
			<div class="form-row">
			
			<div class="form-group col-lg-6 col-md-12">
				<label for="" class="h6 my-3">Motivo del traslado<span
					class="text-primary font-weight-bold">*</span></label> 
					<select name="motivoTraslado" class="form-control br-radius-zero" required>
					<option value="">Elija un motivo de traslado</option>
					<c:forEach items="${listaMotivoTraslado}" var="motivoTraslado">
						<option id="motivoTraslado" value="${motivoTraslado}">${motivoTraslado.getDescripcion()}</option>
					</c:forEach>
				</select>
				<div class="validation"></div>
			</div>
			
			<div class="form-group col-lg-6 col-md-12">
				<label for="" class="h6 my-3">Urgencia<span
					class="text-primary font-weight-bold">*</span></label> 
					<select name="urgencia" class="form-control br-radius-zero" required>
						<option id="urgencia"  value="Baja"
							<c:if test="${paciente.getPrioridad() == 5 || paciente.getPrioridad() == 4}">
							selected
							</c:if>
							><span class="circulo rounded-circle bg-success"></span>Baja
							
						<option id="urgencia" value="Media"
							<c:if test="${paciente.getPrioridad() == 3}">
							selected
							</c:if>
							><span class="circulo rounded-circle bg-warning"></span>Media
							
						<option id="urgencia" value="Alta"
							<c:if test="${paciente.getPrioridad() == 2 || paciente.getPrioridad() == 1}">
							selected
							</c:if>
							><span class="circulo rounded-circle bg-danger"></span>Alta
							
					</select>
				<div class="validation"></div>
			</div>

			</div>
			
		<div class="col-2">	
		<div class="row d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3">
			
			<div class="mr-4">
				<button type="submit" class="btn btn-outline-success">
					Siguiente</button>
			</div>
			
			<div class="">
				<button type="" class="btn btn-outline-danger">
					Cancelar</button>
			</div>
		
		</div>
		</div>
		
		<!-- <div class="col-xl-3 col-lg-5 col-md-8 col-sm-12">	
		<div class="row d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3">
			
			<div class="mr-4">

		<div class="">
				<button type="" class="btn btn-outline-danger">
					Cancelar</button>
			</div>

			</div>
			
			<div class="">
				<button type="" class="btn btn-outline-danger">
					Cancelar</button>
			</div>
		
		</div>
		</div> -->
	
		<div class="form-group my-2">
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
<script src="js/sort.js"></script>
<script src="../assets/dist/js/bootstrap.bundle.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.9.0/feather.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
        <script src="js/dashboard.js"></script></body>

</body>
</html>