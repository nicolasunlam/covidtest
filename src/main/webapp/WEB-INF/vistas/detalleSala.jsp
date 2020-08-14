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
			<h4>Detalle Sala</h4>
			
			<h4>Sala número: ${idSala}</h4>	
			<h4>Sala descripcion: ${descripcion}</h4>	
			<h4>Tipo sala: ${tipoSala}</h4>	
			
					
			
			<%-- <h4 class="text-center">Usted registró efectivamente el piso
			${numeroPiso}</h4> --%>

		</div>
		
		<a href="listarSalas" class="btn btn-success">Volver</a>
		
		<a href="crearCamas?idSala=${idSala}" class="btn btn-success">Registrar camas</a>





	</body>
	</html>