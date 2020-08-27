<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>Validar mapa</title>

<jsp:include page="../../partial/${armarHeader}2.jsp" />

<div class="container">

<div class="form-group">
	<c:if test="${not empty error}">
		<h4>
			<span>${error}</span>
		</h4>
		<br>
	</c:if>
</div>

<div class="progress my-1">
	<div class="progress-bar bg-success" role="progressbar"
		style="width: 100%" aria-valuenow="100" aria-valuemin="0"
		aria-valuemax="100">100%</div>
</div>

<div class="alert alert-success alert-dismissible fade show text-center"
	role="alert">
	<h5>Registro exitoso</h5>
	<button type="button" class="close" data-dismiss="alert"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
</div>


<div class="text-center mt-5">
	<img src="img/message.png" class="rounded" alt="no-virus" width="250"
		height="250">
</div>

<h1 class="text-center mt-3 mb-5">Por favor, revise su casilla de
	correo electrónico para completar el proceso de registro</h1>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

</div>

<jsp:include page="../../partial/footer.jsp" />

</body>

</html>