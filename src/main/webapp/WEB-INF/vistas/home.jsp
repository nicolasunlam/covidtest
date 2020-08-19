<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>Bienvenido</title>

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

<section class="container">

	<div class="jumbotron mt-5"
		style="background-image: linear-gradient(to right, #09f, #007bff); color: #fff;">
		<h1 class="display-3 my-0">Asignar</h1>
		<h6 class="lead mt-3 pb-1">Sistema de asignación de camas para
			instituciones</h6>
		<hr class="my-4 bg-light">

		<p class="">
			<a class="text-white" href="login">Iniciá sesión</a> con tu cuenta
			para acceder a todas las funcionalidades de nuestra aplicación.
		</p>

		<p class="lead mb-0">
			<a class="btn btn-light btn-lg text-primary " role="button"
				href="login"> Iniciar sesión</a>
		</p>
	</div>

	<article
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center ">

		<div>
			<h2 class="display-4 display-5 pb-2 mb-3 border-bottom pt-3">Permiso
				de circulación</h2>
			<h6 class="lead">Genere un permiso de circulación en tres
				simples pasos</h6>
		</div>


		<div class="">
			<img src="img/permit.png" class="rounded" alt="no-virus" width="87"
				height="">
		</div>
	</article>

	<div class="my-4">
		<div class="form-group">
			<ul class="list-group border">
				<li
					class="list-group-item list-group-item-warning text-center active">
					<h5 class="text-center lead">¿Cómo genero un permiso de
						circulación?</h5>
				</li>
				<li
					class="list-group-item d-flex justify-content-between align-items-center my-2">
					<p class="lead">Hacé click en el botón "Realizar test", ubicado
						en la barra de navegación de esta página.</p> <span
					class="badge badge-primary badge-pill">1</span>
				</li>
				<li
					class="list-group-item d-flex justify-content-between align-items-center my-2">
					<p class="lead">Si tu test resulta negativo podrás generar el
						permiso.</p> <span class="badge badge-primary badge-pill">2</span>
				</li>
				<li
					class="list-group-item d-flex justify-content-between align-items-center mt-2">
					<p class="lead">Por último, hacé click en el botón "Generar
						permiso", ubicado en la barra de navegación de la parte superior
						de dicha página.</p> <span class="badge badge-primary badge-pill">3</span>
				</li>
			</ul>

		</div>
	</div>


	<h2 class="display-4 display-5 p-2 mb-3 mt-5 border-bottom">
		Consejos para prevenir el Coronavirus</h2>
	<p class="lead">Recomendaciones para el cuidado de todas y todos</p>

	<div class="container mb-5">

		<div class="row">

			<div class="col pl-0">

				<div class="container mt-5">
					<div class="row">
						<div class="col-xl-3 col-sm-12 pl-0">
							<img class="d-inline" src="img/handwash1.png" width="100"
								height="100" alt="Generic placeholder image">
						</div>
						<div class="col-xl-9 col-sm-12">
							<h4 class="lead d-inline">Lavarse las manos con jabón
								regularmente al menos por 20 segundos</h4>
						</div>
					</div>
				</div>

			</div>

			<div class="col pr-0">
				<div class="container mt-5">
					<div class="row">
						<div class="col-xl-3 col-sm-12  ">
							<img class="d-inline" src="img/nottouch.png" width="100"
								height="100" alt="Generic placeholder image">
						</div>
						<div class="col-xl-9 col-sm-12  pr-0">
							<h4 class="lead d-inline">No llevarse las manos a los ojos y
								la nariz</h4>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col pl-0">
				<div class="container mt-5">
					<div class="row">
						<div class="col-xl-3 col-sm-12 pl-0">
							<img class="d-inline" src="img/window.png" width="100"
								height="100" alt="Generic placeholder image">
						</div>
						<div class="col-xl-9 col-sm-12">
							<h4 class="lead d-inline">Ventilar los ambientes</h4>
						</div>
					</div>
				</div>
			</div>
			<div class="col pr-0">
				<div class="container mt-5">
					<div class="row">
						<div class="col-xl-3 col-sm-12  ">
							<img class="d-inline" src="img/clean.png" width="100"
								height="100" alt="Generic placeholder image">
						</div>
						<div class="col-xl-9 col-sm-12  pr-0">
							<h4 class="lead d-inline">Desinfectar los objetos que se
								usan con frecuencia</h4>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col pl-0">
				<div class="container mt-5">
					<div class="row">
						<div class="col-xl-3 col-sm-12 pl-0">
							<img class="d-inline" src="img/cough.png" width="100"
								height="100" alt="Generic placeholder image">
						</div>
						<div class="col-xl-9 col-sm-12">
							<h4 class="lead d-inline">Al estornudar o toser, hacerlo
								sobre el pliegue del codo</h4>
						</div>
					</div>
				</div>
			</div>
			<div class="col pr-0">
				<div class="container mt-5">
					<div class="row">
						<div class="col-xl-3 col-sm-12  ">
							<img class="d-inline" src="img/stayhome.png" width="100"
								height="100" alt="Generic placeholder image">
						</div>
						<div class="col-xl-9 col-sm-12  pr-0">
							<h4 class="lead d-inline">Permanecer en su hogar el mayor
								tiempo posible. Salir en casos extremos</h4>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col pl-0">
				<div class="container mt-5">
					<div class="row">
						<div class="col-xl-3 col-sm-12 pl-0">
							<img class="d-inline" src="img/physical.png" width="100"
								height="100" alt="Generic placeholder image">
						</div>
						<div class="col-xl-9 col-sm-12">
							<h4 class="lead d-inline">Mantener distancia de otras
								personas fueras de su hogar</h4>
						</div>
					</div>
				</div>
			</div>
			<div class="col pr-0">
				<div class="container mt-5">
					<div class="row">
						<div class="col-xl-3 col-sm-12">
							<img class="d-inline" src="img/medical-mask.png" width="100"
								height="100" alt="Generic placeholder image">
						</div>
						<div class="col-xl-9 col-sm-12 pr-0">
							<h4 class="lead d-inline">Cubrirse la boca y la nariz con
								barbijo o tapaboca al estar rodeado de personas</h4>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- <h2 class="text-center p-2 mb-3 mt-5 h1 border-top">
		<strong>El operativo DetectAR presente en los barrios
			bonaerenses</strong>
	</h2>


	<div class="container-fluid w-50 my-5">
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="img/carrousel1.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="img/carrousel2.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="img/carrousel3.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="img/carrousel4.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="img/carrousel5.jpg" class="d-block w-100" alt="...">
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>

	<div class="container-fluid my-5 text-justify">
		<div class="row">
			<div class=col-3></div>
			<div class=col-6>
				<h2 class="text-justify mb-4 mt-4 h4">
					A medida que los casos crecen, extendemos el DetectAR por todo el
					territorio. El objetivo del operativo, es identificar a los <strong>contactos
						estrechos convivientes</strong> de las personas recientemente <strong>confirmadas
						con COVID-19</strong>, hacer un seguimiento sostenido, para distanciarlos
					tempranamente si presentan síntomas y de esta forma mitigar la
					contagiosidad del virus.
				</h2>

				<h2 class="text-center my-5 h4">La iniciativa incluye
					hisopadores, y un equipo de salud que lleva adelante una estrategia
					de puerta a puerta en duplas. La búsqueda activa, y la detección
					temprana de persona con síntomas es la que más ha resultado en el
					mundo junto con el distanciamiento físico en pos de la contención
					de la transmisión del virus.</h2>

				<h2 class="text-center my-5 h4">
					El <strong>operativo DetectAR</strong> funciona en diferentes
					barrios de la provincia de Buenos Aires, donde está demostrando
					buenos resultados. En esta nueva etapa se estenderá a otros
					barrios, y continuará según la cantidad de casos registrada.
				</h2>
			</div>
			<div class=col-3></div>
		</div>
	</div> -->

</section>
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