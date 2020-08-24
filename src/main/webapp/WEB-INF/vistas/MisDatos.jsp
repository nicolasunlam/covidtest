<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>Mis Datos</title>

<jsp:include page="../../partial/${armarHeader}2.jsp" />

<style>
.display-5 {
	font-size: 2.5rem;
	font-weight: 300;
	line-height: 1.2;
}

p.lead {
	font-size: 1.05rem;
}
</style>
        
       


            <div class="container">
            
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h4 class="h4">Mis Datos</h4>
            </div>

               <%--  <div>

				<h6>Nombre del Paciente: ${paciente.getApellido()}, ${paciente.getNombre()}</h6>
			
				<h6 class="">Documento: ${paciente.getNumeroDocumento()} (${paciente.getTipoDocumento().name()})</h6>
			
				<h6 class="">Correo electrónico: ${paciente.getEmail()}</h6>

                    <br>

 
                  

                    <a href="consultarPaciente" class="btn btn-sm btn-outline-secondary">Volver atrás</a>
                    
                    <a href="bienvenido" class="btn btn-sm btn-outline-secondary">Inicio</a>

                </div>


                <div class="form-group"> --%>

<form method="post" action="guardarCambios" modelAttribute="paciente">
<div class="form-group">
    
    <input type="hidden" name="id" path="id" class="form-control" id="id" aria-describedby="id" placeholder="${paciente.getId()}">
    <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
  </div>
  <div class="form-group">
    <label for="nombre">Nombre</label>
    <input type="text" name="nombre" path="nombre" class="form-control" id="nombre" aria-describedby="nombre" placeholder="${paciente.getNombre()}">
    <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
  </div>
  <div class="form-group">
    <label for="apellido">Apellido</label>
    <input type="text" name="apellido" path="apellido"  class="form-control" id="apellido" placeholder="${paciente.getApellido()}">
  </div>
 <div class="form-group">
    <label for="exampleInputEmail1">Correo electrónico</label>
    <input type="email" name="email" path="email" class="form-control" id="email" aria-describedby="email" placeholder="${paciente.getEmail()}">
    <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
  </div>
  <button type="submit" class="btn btn-primary">Guardar cambios</button>
</form>

<%-- <form class="form-inline">
  <div class="form-group mb-2">
    <label for="staticEmail2" class="sr-only">Email</label>
    <input type="text" readonly class="form-control-plaintext" id="staticEmail2" value="email@example.com">
  </div>
  <div class="form-group mx-sm-3 mb-2">
    <label for="inputPassword2" class="sr-only">Password</label>
    <input type="password" class="form-control" id="inputPassword2" placeholder="Password">
  </div>
  <button type="submit" class="btn btn-primary mb-2">Confirm identity</button>
  <button type="submit" class="btn btn-primary mb-2">Confirm identity</button>
</form> --%>

	</div>
    </div>



    
<!-- Footer -->
<footer class="page-footer font-small mdb-color pt-4">

	<!-- Footer Links -->
	<div
		class="bg-whiteborder border-top border-bottom text-center text-md-left">
		<div class="container">
			<!-- Footer links -->
			<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-start text-center text-md-left mt-3 pb-3">

				<hr class="w-100 clearfix d-md-none">

				<!-- Grid column -->
				<div class="col-md-4 col-lg-3 col-xl-3 pl-md-0 mt-3">
					
					<h6 class="lead mb-4 text-center">
						<strong>Enlaces útiles</strong>
					<img src="img/iso-azul.svg" width="25" height=""
						class=" " alt="">
					</h6>
					<p class="lead mt-3 text-center">
						<a href="https://www.argentina.gob.ar/salud/coronavirus-COVID-19">Ministerio
							de Salud</a>
					</p class="lead">
					<p class="lead text-center">
						<a href="pacienteDistancia">Hospitales y establecimientos de
							salud</a>
					</p>
				</div>


				<div class="col-md-4 col-lg-3 col-xl-3 mt-3">
					<h6 class="lead mb-4 text-center">
						<strong>Ayuda teléfonica</strong>
					</h6>
					<p class="lead text-center">
						<i class="fas fa-home"></i> Llamá al <strong>120</strong>, es
						gratuito desde cualquier lugar del país y te atienden las 24
						horas.
					</p>


				</div>

				<!-- Grid column -->
				<div class="col-md-4 col-lg-3 col-xl-3 pr-lg-0 mt-3">

					<h6 class="lead mb-4 text-center">
						<strong>Whatsapp</strong>
					</h6>

					<p class="lead text-center">
						Escribí "Hola" al <strong>+54 9 11 2256-0566</strong> para que
						encuentres respuestas a las preguntas más frecuentes y recibas
						consejos de prevención.
					</p>


				</div>

			</div>
		</div>
	</div>

	<!-- Footer Links -->

</footer>
<!-- Footer -->

<script src="js/jquery-3.5.1.min.js"></script>
<script src="../assets/dist/js/bootstrap.bundle.js"></script>

</body>

</html>