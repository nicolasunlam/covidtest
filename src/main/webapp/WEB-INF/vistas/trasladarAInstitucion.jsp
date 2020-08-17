<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>Trasladar Paciente</title>

<jsp:include page="../../partial/${armarHeader}2.jsp" />

<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">

<div class="container">

	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h2 class="">Trasladar Paciente</h2>

	</div>
		<h6 class="mb-5">Realice la solicitud del traslado del paciente a continuación</h6>
	
	
	<section class="">
		
	<article class="">		
	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center border-bottom w-50 ">
		<h5 class="">Paciente</h2>
		
	</div>
		<p class="mt-2">Datos del paciente a trasladar</p>
	
  	<div class="">

			<div class="form-row d-flex justify-content-between flex-md-nowrap align-items-center pb-2 mb-4">

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
					<label for="" class="h6 font-weight-bold">${paciente.getApellido()}, ${paciente.getNombre()}</label> 
				</div>
				<div class="">
					<label for="" class="p ">${paciente.getTipoDocumento().name()}: ${paciente.getNumeroDocumento()}</label>
				</div>
				<div class="">
					<label for="" class="p ">${paciente.getEmail()}</label>
				</div>

		</div>
		</article>
		
		<article class="">
			<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center border-bottom w-25 ">
				<h5 class="">Requisitos</h2>
			</div>
			
			<p class="mt-2">Requisitos necesarios para realizar el traslado</p>
		
			<div class="mt-2">
				<label for="" class="p">Tipo de cama:</label> 
				<span class="p">${tipoCama.getDescripcion()}.</span>
			</div>		
			<div class="">		
				<label for="" class="p">Tipo de sala:</label> 
				<span class="p">${tipoSala.getDescripcion()}.</span>
			</div>		
			<div class="">
				<label for="" class="p">Motivo del traslado:</label> 
				<span class="p">${motivoTraslado.getDescripcion()}.</span>
			</div>		
			<div class="mb-4">
				<label for="" class="p">Urgencia:</label> 
				<span class="p">${urgencia}.</span>
			</div>
		</article>

		</section>

	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center border-bottom">
		<h5 class="">Lista de Instituciones</h5>
				       
	</div>
		<p class="mt-2 mb-4">Datos de la instituciones para solicitar el traslado</p>

		  <div class="table-responsive">
		    
		    <table id="myTable" class="table table-bordered table-hover responsive nowrap text-center">
		        
		        <tr class="una bg-white">

		            <th style="vertical-align: middle; width: 16%" class="border border-secondary"
		            onmouseover="this.style.backgroundColor='#dee2e6 ';"
					onmouseout="this.style.backgroundColor='white';">NOMBRE 
		            
			            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-down-up float-right mt-1" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
						  <path fill-rule="evenodd" d="M11 3.5a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-1 0V4a.5.5 0 0 1 .5-.5z"/>
						  <path fill-rule="evenodd" d="M10.646 2.646a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L11 3.707 8.354 6.354a.5.5 0 1 1-.708-.708l3-3zm-9 7a.5.5 0 0 1 .708 0L5 12.293l2.646-2.647a.5.5 0 1 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 0 1 0-.708z"/>
						  <path fill-rule="evenodd" d="M5 2.5a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-1 0V3a.5.5 0 0 1 .5-.5z"/>
						</svg>
						
					</th>
		            <th style="vertical-align: middle;" class="border border-secondary" 
		            onmouseover="this.style.backgroundColor='#dee2e6 ';"
					onmouseout="this.style.backgroundColor='white';">TIPO 
		             			            
			            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-down-up float-right mt-1" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
						  <path fill-rule="evenodd" d="M11 3.5a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-1 0V4a.5.5 0 0 1 .5-.5z"/>
						  <path fill-rule="evenodd" d="M10.646 2.646a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L11 3.707 8.354 6.354a.5.5 0 1 1-.708-.708l3-3zm-9 7a.5.5 0 0 1 .708 0L5 12.293l2.646-2.647a.5.5 0 1 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 0 1 0-.708z"/>
						  <path fill-rule="evenodd" d="M5 2.5a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-1 0V3a.5.5 0 0 1 .5-.5z"/>
						</svg>
						
						</th>
		            <th style="vertical-align: middle;" class="border border-secondary" 
		            onmouseover="this.style.backgroundColor='#dee2e6';"
					onmouseout="this.style.backgroundColor='white';">UBICACIÓN
		            
			            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-down-up float-right mt-1" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
						  <path fill-rule="evenodd" d="M11 3.5a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-1 0V4a.5.5 0 0 1 .5-.5z"/>
						  <path fill-rule="evenodd" d="M10.646 2.646a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L11 3.707 8.354 6.354a.5.5 0 1 1-.708-.708l3-3zm-9 7a.5.5 0 0 1 .708 0L5 12.293l2.646-2.647a.5.5 0 1 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 0 1 0-.708z"/>
						  <path fill-rule="evenodd" d="M5 2.5a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-1 0V3a.5.5 0 0 1 .5-.5z"/>
						</svg>
						
		            </th>
		            <th style="vertical-align: middle;" class="border border-secondary" 
		            onmouseover="this.style.backgroundColor='#dee2e6';"
					onmouseout="this.style.backgroundColor='white';">DISTANCIA
		            
			            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-down-up float-right mt-1" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
						  <path fill-rule="evenodd" d="M11 3.5a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-1 0V4a.5.5 0 0 1 .5-.5z"/>
						  <path fill-rule="evenodd" d="M10.646 2.646a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L11 3.707 8.354 6.354a.5.5 0 1 1-.708-.708l3-3zm-9 7a.5.5 0 0 1 .708 0L5 12.293l2.646-2.647a.5.5 0 1 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 0 1 0-.708z"/>
						  <path fill-rule="evenodd" d="M5 2.5a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-1 0V3a.5.5 0 0 1 .5-.5z"/>
						</svg>
						
		            </th>
		            <th style="vertical-align: middle;" class="border border-secondary" 
		            onmouseover="this.style.backgroundColor='#dee2e6';"
					onmouseout="this.style.backgroundColor='white';">DISPONIBILIDAD <br>DE CAMAS
		            
			            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-down-up float-right mt-1" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
						  <path fill-rule="evenodd" d="M11 3.5a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-1 0V4a.5.5 0 0 1 .5-.5z"/>
						  <path fill-rule="evenodd" d="M10.646 2.646a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L11 3.707 8.354 6.354a.5.5 0 1 1-.708-.708l3-3zm-9 7a.5.5 0 0 1 .708 0L5 12.293l2.646-2.647a.5.5 0 1 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 0 1 0-.708z"/>
						  <path fill-rule="evenodd" d="M5 2.5a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-1 0V3a.5.5 0 0 1 .5-.5z"/>
						</svg>
		            
		            </th>
		            <th style="vertical-align: middle; width: 20%" class="border border-secondary" 
		            onmouseover="this.style.backgroundColor='#dee2e6';"
					onmouseout="this.style.backgroundColor='white';"> 
		            ACCIÓN</th>
		        </tr>
		        
		        <c:forEach items="${listaInstituciones}" var="institucion">
	
		            <tr 							               		
	               		<c:if test="${institucion.getCamaRequerida() != true || 
	               		institucion.getSalaRequerida() != true }">
		            		class="table-danger"
		               	</c:if>
		            >
		            	           		
					<form action="enviarSolicitud" method="GET">
		                  		
	               	<input type="hidden" value="${paciente.getId()}" name="idPaciente">
	               	<input type="hidden" value="${institucion.getInstitucion().getId()}" name="idInstitucionATrasladar">
	               	<input type="hidden" value="${motivoTraslado}" name="motivoTraslado">
	               	<input type="hidden" value="${urgencia}" name="urgencia">
	               	<input type="hidden" value="${Math.round(institucion.getDistancia())}" name="distanciaTraslado">
		            
		                <td style="vertical-align: middle;"><c:out value="${institucion.getInstitucion().getNombre()}"/></td>
		                <td style="vertical-align: middle;"><c:out value="${institucion.getInstitucion().getTipo().getDescripcion()}"/></td>
		                <td style="vertical-align: middle;"><c:out value="${institucion.getInstitucion().getDomicilio().getLocalidad().getNombreLocalidad()}"/></td>
		                <td style="vertical-align: middle;"><c:out value="${Math.round(institucion.getDistancia())} Km"/></td>
		                
		                <td style="vertical-align: middle; text-align:left; width:25%;" class="mx-auto">
			              
			               <div class="d-flex justify-content-center">
			               
			               <div>
			                
			               <c:forEach items="${institucion.getListaSala()}" var="lista" varStatus="loop">
	               			
	               				<c:if test="${institucion.getCamaRequerida()  == true && institucion.getSalaRequerida()  == true
	               				&& lista.getSala().getTipoSala() == tipoSala}">				               				               		
				               		<ul class="my-2 pl-3">
					               		<li
					               		<c:if test="${lista.getCantidad() >= 5}">
					               		class="text-success"
					               		</c:if>
					               		<c:if test="${lista.getCantidad() < 5}">
					               		class="text-danger"
					               		</c:if>
					               		>
						               		<c:out value="${lista.getCantidad()}"/> de
						               		<c:out value="${lista.getSala().getTipoSala().getDescripcion()}"/>.
	
						               		<c:forEach items="${lista.getListaCama()}" var="listaCamas">
							               		<ul class="my-2 pl-3 d-flex justify-content-between align-items-center">
							               		
							               		<c:if test="${listaCamas.getCama().tipoCama != tipoCama}">
							               		<p class="text-dark mb-0 ">
							               		</c:if>
							               		<c:if test="${listaCamas.getCama().tipoCama == tipoCama}">
							               		<p class="mb-0 text-dark font-weight-bold">
							               		</c:if>
							               	
            									${listaCamas.getCama().getTipoCama().getDescripcion()}: ${listaCamas.getCount()}. 
							                    </p>
							               	
												<span class="ml-5">
												  
												  <input type="radio" name="idCama" value="${listaCamas.getCama().getId()}" 
												  id="${listaCamas.getCama().getId()}"
												  onclick="javascript:elegirCama(${listaCamas.getCama().getId()}, '${listaCamas.getCama().getTipoCama().getDescripcion()}', 
												  '${institucion.getInstitucion().getId()}', '${lista.getSala().getTipoSala().getDescripcion()}')"
												  
												  <c:if test="${listaCamas.getCama().tipoCama == tipoCama}">
							               			 checked="checked"
							               		  </c:if>
												  
												  >
												
												</span>
							               		
							               		</ul>
					      					</c:forEach>
					      					</li>
									</ul>

				               	</c:if>
							
			      			</c:forEach>

			      			</div>
			      			
			      			</div>
			      			 	
			      			 <p  id="noTiene${institucion.getInstitucion().getId()}"
			               		 class="text-center my-0" style="font-size: 12px;">	
		               		
		               		<c:if test="${institucion.getCamaRequerida() != true && 
		               		institucion.getSalaRequerida() != true }">
			               		
	               					Esta institución <abbr class="font-weight-bold">NO TIENE</abbr> una sala de <abbr class="font-weight-bold">${tipoSala.getDescripcion()}</abbr> 
	               					ni una cama <abbr class="font-weight-bold">${tipoCama.getDescripcion()}</abbr> disponibles.				               	
				               	
				               	</c:if>
		               		<c:if test="${institucion.getCamaRequerida() == true && 
		               		institucion.getSalaRequerida() != true }">

	               					Esta institución <abbr class="font-weight-bold">NO TIENE</abbr> una sala de <abbr class="font-weight-bold">${tipoSala.getDescripcion()}</abbr>
	               					disponible con una cama <abbr class="font-weight-bold">${tipoCama.getDescripcion()}</abbr>.
               					
			               	</c:if>
			               	<c:if test="${institucion.getCamaRequerida() != true && 
               				institucion.getSalaRequerida() == true }">	

				               		Esta institución <abbr class="font-weight-bold">NO TIENE</abbr> una cama <abbr class="font-weight-bold">${tipoCama.getDescripcion()}</abbr> 
				               		disponible en una sala de <abbr class="font-weight-bold">${tipoSala.getDescripcion()}</abbr>.
			             
			               	</c:if>
			               	</p>
			               	
			               	<c:if test="${institucion.getCamaRequerida() != true || 
		               		institucion.getSalaRequerida() != true }">
			               	<div class="d-flex justify-content-center">
			               		 
			               		 <div  id="mostrarInfo${institucion.getInstitucion().getId()}" hidden>
			               		 
			               		 <c:forEach items="${institucion.getListaSala()}" var="lista" varStatus="loop">
	               						               				               		
				               			<ul class="my-2 pl-3">
						               		<li
						               		<c:if test="${lista.getCantidad() >= 5}">
						               		class="text-success"
						               		</c:if>
						               		<c:if test="${lista.getCantidad() < 5}">
						               		class="text-danger"
						               		</c:if>
						               		>
						               		<c:out value="${lista.getCantidad()}"/> de
						               		<c:out value="${lista.getSala().getTipoSala().getDescripcion()}"/>.
	
						               		<c:forEach items="${lista.getListaCama()}" var="listaCamas">
							               		<ul class="my-2 pl-3 d-flex justify-content-between align-items-center">
							               		
							               		<c:if test="${listaCamas.getCama().tipoCama != tipoCama}">
							               		<p class="text-dark mb-0 ">
							               		</c:if>
							               		<c:if test="${listaCamas.getCama().tipoCama == tipoCama}">
							               		<p class="mb-0 text-dark font-weight-bold">
							               		</c:if>
							               	
            									${listaCamas.getCama().getTipoCama().getDescripcion()}: ${listaCamas.getCount()}. 
							                    </p>
							               	
												<span class="ml-5">
												  
												  <input type="radio" name="idCama" id="activarBotones${institucion.getInstitucion().getId()}" value="${listaCamas.getCama().getId()}"
												  onclick="javascript:activarBotones(this, 'botonAccionUno${institucion.getInstitucion().getId()}', 'botonAccionDos${institucion.getInstitucion().getId()}')"
												  onChange="javascript:elegirCama('${listaCamas.getCama().getId()}', '${listaCamas.getCama().getTipoCama().getDescripcion()}', '${institucion.getInstitucion().getId()}', 
												  '${lista.getSala().getTipoSala().getDescripcion()}')">
												
												</span>
							               		
							               		</ul>
					      					</c:forEach>
					      					
					      					</li>
										</ul>
										
			      				</c:forEach>
			      				
			      				</div>
			      				
			               	</div>
			               	
			               	<div class="d-flex justify-content-center">
								<div class="custom-control custom-switch mt-2">
								  <input type="checkbox" class="custom-control-input" id="activarInfo${institucion.getInstitucion().getId()}" 
								  onclick="javascript:mostrarInfo(this, 'noTiene${institucion.getInstitucion().getId()}', 'mostrarInfo${institucion.getInstitucion().getId()}')">
								  <label class="custom-control-label" for="activarInfo${institucion.getInstitucion().getId()}" >Mostrar información</label>
								</div>
							</div>
							
			      			</c:if>
							
		                </td>
		               
		                <td style="vertical-align: middle;">
						
						<c:if test="${institucion.getCamaRequerida() == true && 
	               		institucion.getSalaRequerida() == true }">
		                
			                <!-- Button trigger modal -->
							<button type="button" class="btn btn-outline-success" data-toggle="modal" data-target="#modalSolicitud${institucion.getInstitucion().getId()}">
							  Solicitar Traslado
							</button>
							
							<button type="button" class="btn btn-outline-primary mt-3" data-toggle="modal" data-target="#modalDetalle${institucion.getInstitucion().getId()}">
							  Ver Detalle Institución
							</button>
						
		               	</c:if>	
		               	
		               	<c:if test="${institucion.getCamaRequerida() != true || 
	               		institucion.getSalaRequerida() != true }">
	               			
					  <button id="botonAccionUno${institucion.getInstitucion().getId()}" class="btn btn-outline-secondary" type="button" 
					  data-toggle="modal" data-target="#modalSolicitud${institucion.getInstitucion().getId()}" disabled>
					   Solicitar Traslado</button>
						
					 <button id="botonAccionDos${institucion.getInstitucion().getId()}" class="btn btn-outline-primary mt-3" type="button" 
					 data-toggle="modal" data-target="#modalDetalle${institucion.getInstitucion().getId()}">
					  Ver Detalle Institución</button>					  	
							
	               		</c:if>	
						
						<!-- Start Modal -->
						<div class="modal fade" id="modalSolicitud${institucion.getInstitucion().getId()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
						    <div class="modal-content  px-3">
						      <div class="modal-header pb-2">
						        <h5 class="modal-title" id="exampleModalLongTitleUno">Solicitud de traslado</h5		>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span class="bg-white" aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      <div class="modal-body text-left">
						        
						        <p class="p mt-2 mb-4" >
							        Se enviará la solicitud de traslado del paciente 
						        	<span class="font-weight-bold"> ${paciente.getNombre()} ${paciente.getApellido()} 
						        	(${paciente.getTipoDocumento().getDescripcion()}: ${paciente.getNumeroDocumento()}) </span> 
							        en una cama <span id="tipoCamaModal${institucion.getInstitucion().getId()}" class="font-weight-bold text-lowercase">${tipoCama.getDescripcion()}</span> 
							        en una sala de <span id="tipoSalaModal${institucion.getInstitucion().getId()}" class="font-weight-bold text-lowercase">${tipoSala.getDescripcion()}</span>
							        de la institución 
							        <span class="font-weight-bold">"${institucion.getInstitucion().getNombre()}"</span>
							        ubicada en la localidad de ${institucion.getInstitucion().getDomicilio().getLocalidad().getNombreLocalidad()} 
							        a ${Math.round(institucion.getDistancia())} km de distancia.
							    </p>   

						        <p class="mb-0 font-weight-lighter">Una vez autorizada la solicitud enviada, podrá realizar el traslado.</p>
						      </div>
						      
						      <div class="modal-footer">
						        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Volver</button>
						        <button type="submit" class="btn btn-outline-success">Enviar Solicitud</button>
						      </div>
						    </div>
						  </div>
						</div>
						<!-- End Modal -->
						
						<!-- Start Modal -->
						<div class="modal fade" id="modalDetalle${institucion.getInstitucion().getId()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
						    <div class="modal-content  px-3">
						      <div class="modal-header pb-2">
						        <h5 class="modal-title" id="exampleModalLongTitleUno">${institucion.getInstitucion().getNombre()}</h5		>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span class="bg-white" aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      <div class="modal-body text-left">
						        
						        <p class="p mt-2" >
							       Nombre de la institución: ${institucion.getInstitucion().getNombre()}.
							    </p>  
							    <p class="p mt-2" >
							       Tipo de institución: ${institucion.getInstitucion().getTipo().getDescripcion()}.
							    </p>  
							    <p class="p mt-2" >   
								    Dirección: ${institucion.getInstitucion().getDomicilio().getCalle()}  ${institucion.getInstitucion().getDomicilio().getNumero()}, 
								    ${institucion.getInstitucion().getDomicilio().getLocalidad().getNombreLocalidad()} 
									(${institucion.getInstitucion().getDomicilio().getLocalidad().getPartido().getNombrePartido()}), provincia de 
									${institucion.getInstitucion().getDomicilio().getLocalidad().getPartido().getProvincia().getNombreProvincia().getValor()}.
							    </p>   

						        <p class="mb-0 font-weight-lighter"></p>
						      </div>
						      
						      
							<!-- Load Leaflet from CDN-->
							<link rel="stylesheet"
								href="http://cdn.leafletjs.com/leaflet-0.7.3/leaflet.css" />
							<script src="http://cdn.leafletjs.com/leaflet-0.7.3/leaflet.js"></script>
							<style>
							#map {
								height: 400px;
								width:  calc(100% - 15px);
							}
							</style>
							
							<!-- Load Esri Leaflet from CDN -->
							<script
								src="http://cdn-geoweb.s3.amazonaws.com/esri-leaflet/1.0.0-rc.2/esri-leaflet.js"></script>
							
							<script
								src="http://cdn-geoweb.s3.amazonaws.com/esri-leaflet-geocoder/0.0.1-beta.5/esri-leaflet-geocoder.js"></script>
							<link rel="stylesheet" type="text/css"
								href="http://cdn-geoweb.s3.amazonaws.com/esri-leaflet-geocoder/0.0.1-beta.5/esri-leaflet-geocoder.css">
							
							<div id="map" class="mx-2 w-100">
							</div>


<script>
	var hospitales = [
			{
				"nombre" : "HOSPITAL GENERAL DE AGUDOS D. VELEZ SARSFIELD",
				"lat" : -34.6253368,
				"lon" : -58.50761514
			}, {
				"nombre" : "HOSPITAL MATERNO INFANTIL R. SARDA",
				"lat" : -34.634856308414967,
				"lon" : -58.402750627537664
			}

	];

	var map = L.map('map').setView([ ${institucion.getInstitucion().getLatitud()}, ${institucion.getInstitucion().getLongitud()} ],
			12);

	L
			.tileLayer(
					'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
					{
						attribution : '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
					}).addTo(map);

	/*let iconMarker = L.icon({
		iconUrl : 'img/red-cross.png',

	});

	for (var i = 0; i < hospitales.length; i++) {
		marker = new L.marker([ hospitales[i].lat, hospitales[i].lon ], {
			icon : iconMarker
		}).bindPopup(hospitales[i].nombre).addTo(map);
	};*/

	var searchControl = new L.esri.Controls.Geosearch().addTo(map);

	var results = new L.LayerGroup().addTo(map);

	let posicion;

	searchControl.on('results', function(data) {
		results.clearLayers();
		for (var i = data.results.length - 1; i >= 0; i--) {
			results.addLayer(L.marker(data.results[i].latlng));

			posicion = data.results[i].latlng;
			console.log(posicion.lat);
			console.log(posicion.lng);
			console.log(data.results[0].city);
			console.log(data.results[0].subregion);
			console.log(data.results[0]);

			document.getElementById("latitud").value = posicion.lat;
			document.getElementById("longitud").value = posicion.lng;

			//Array con toda la información del domicilio (calle, altura, localidad, etc.)
			var domicilioArray = data.results[0].text;
			
			//Array del domicilioArray separando elementos por las comas (la calle con su altura);
			var calle = domicilioArray.split(",");
			
			//Separar por espacios;
			var calleArray = calle[0].split(" ");
			
			//Último elemento del array (la altura de la calle);
			var alturaCalle = calleArray[calleArray.length - 1];
			
			//Eliminar el último elemento del array (la altura de la calle);
			calleArray.splice((calleArray.length - 1), 1);
			
			//Unir todos los elementos del array separándolos con un espacio;
			var nombreCalle = calleArray.join(' ');
			
			console.log("Nombre de la calle: " + nombreCalle);
			console.log("Altura de la calle: " + alturaCalle);
			
			document.getElementById("calle").value = nombreCalle;
			document.getElementById("numero").value = alturaCalle;
			document.getElementById("nombreLocalidad").value = data.results[0].city;
			document.getElementById("nombrePartido").value = data.results[0].subregion;
		}

	});
</script>

						      
						      <div class="modal-footer">
						        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Volver</button>
						      </div>
						    </div>
						  </div>
						</div>
						<!-- End Modal -->
						
						</td>
	        
					</form>
		            
		            </tr>	
		        
		        </c:forEach>

		
		    </table>
		</div>

		<div class="col-xl-3 col-lg-5 col-md-8 col-sm-12">	
			
			<div class="row d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3">
				
				<div class="mr-4">
	
					<div class="">
					<a href="trasladar?idPaciente=${paciente.getId()}">
						<button type="button" class="btn btn-outline-primary">
						Volver atrás</button>
					</a>
					</div>
	
				</div>
				
				<div class="">
				
				<a href="">
					<button type="button" class="btn btn-outline-danger">
					Cancelar</button>
				</a>
					
				</div>
			
			</div>
		</div>
	
		<div class="form-group my-2">
				<c:if test="${not empty error}">
					<h6>
						<span>${error}</span>
					</h6>
					<br>
			</div>
			</c:if>


	</div>
</div>


</main>

</div>
</div>

<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/funciones.js"></script>
<script src="js/sort.js"></script>
<script src="js/bootstrap.bundle.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/feather.min.js"></script>
<script src="js/Chart.min.js"></script>
<script src="js/dashboard.js"></script>
</body>
</html>