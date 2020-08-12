<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>Disponibilidad De Camas</title>

<jsp:include page="../../partial/${armarHeader}2.jsp" />

<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">

	<div class="container-fluid">

		<h2 class="pb-2 mb-3 border-bottom">Disponibilidad De Camas
			Prueba</h2>


		<div class="container-fluid d-flex flex-row flex-wrap my-3 w-75">
			<c:forEach items="${listadoCamas}" var="cama">

				<div class="">
					<button href="" class="btn" type="button" data-trigger="hover"
						data-toggle="popover" title="Cama ${cama.getId()}"
						data-content="Tipo: ${cama.getTipoCama()}">
						<img alt="" src="img/cama-ver.png">
					</button>
				</div>
			</c:forEach>

		</div>

		<div class="container-fluid text-center my-5">
			<button class="btn btn-success" id="botonCrearCamaDisponible">Crear
				cama</button>
		</div>

		<div class="container-fluid d-flex flex-row flex-wrap w-75 my-3"
			id="contenedorCamas">
			<!--<div class="p-2 my-1 mx-1"><img src="img/cama-ro.png" alt=""></div>
    <div class="p-2 my-1 mx-1"><img src="img/cama-am.png" alt=""></div>
    <div class="p-2 my-1 mx-1"><img src="img/cama-ver.png" alt=""></div>!-->
		</div>

	</div>

</main>

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
<script src="../assets/dist/js/bootstrap.bundle.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.9.0/feather.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
<script src="js/dashboard.js"></script>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>
<script>
	window.onload = function() {

		$(function() {
			$('[data-toggle="popover"]').popover()
		});

		$(function() {
			$('.example-popover').popover({
				container : 'body'
			})
		});
	};
</script>


<script>
	var contenedorCamas = document.getElementById('contenedorCamas');
	var botonCrearCamaDisponible = document
			.getElementById('botonCrearCamaDisponible');
	var botonCrearCamaReservada = document
			.getElementById('botonCrearCamaReservada');
	var botonCrearCamaOcupada = document
			.getElementById('botonCrearCamaOcupada');

	//Evento click de botonCrear
	botonCrearCamaDisponible.addEventListener('click', agregarCamaDisponible);
	botonCrearCamaReservada.addEventListener('click', agregarCamaReservada);
	botonCrearCamaOcupada.addEventListener('click', agregarCamaOcupada);

	//Funcion para agregar una cama disponible
	function agregarCamaDisponible(e) {
		//for (i = 0; i < cantidadCamasDisponibles; i++) {

		e.preventDefault();

		var imagenCamaDisponible = document.createElement('img');
		var button = document.createElement('button');

		imagenCamaDisponible.src = "img/cama-ver.png";

		button.className = 'btn btn-outline-success border border-success p-2 my-1 mx-1';

		contenedorCamas.appendChild(button);

		button.appendChild(imagenCamaDisponible);

		//}
	};

	//Funcion para agregar una cama reservada
	function agregarCamaReservada(e) {

		//for (i = 0; i < cantidadCamasReservadas; i++) {
		e.preventDefault();

		var imagenCamaReservada = document.createElement('img');
		var button = document.createElement('button');

		imagenCamaReservada.src = "img/cama-am.png";

		button.className = 'btn btn-outline-warning border border-warning p-2 my-1 mx-1';

		contenedorCamas.appendChild(button);

		button.appendChild(imagenCamaReservada);

		//div.appendChild(document.createTextNode('Flex item'));
		//}
	};

	//Funcion para agregar una cama ocupada
	function agregarCamaOcupada(e) {

		//for (i = 0; i < cantidadCamasOcupadas; i++) {

		e.preventDefault();

		var imagenCamaOcupada = document.createElement('img');
		var button = document.createElement('button');

		imagenCamaOcupada.src = "img/cama-ro.png";

		button.className = 'btn btn-outline-danger border border-danger p-2 my-1 mx-1';

		contenedorCamas.appendChild(button);

		button.appendChild(imagenCamaOcupada);

		//div.appendChild(document.createTextNode('Flex item'));
		//}
	};

	//Funcion "automática" para crear todas las camas de una

	window.onload = agregarCamas;

	//Funcion para agregar todas las camas
	function agregarCamas(e) {
		for (i = 0; i < arrayCamasDisponibles.length; i++) {

			e.preventDefault();

			var imagenCamaDisponible = document.createElement('img');
			var button = document.createElement('button');

			imagenCamaDisponible.src = "img/cama-ver.png";

			button.className = 'btn btn-outline-success border border-success p-2 my-1 mx-1';

			contenedorCamas.appendChild(button);

			button.appendChild(imagenCamaDisponible);

			button.appendChild(document
					.createTextNode(arrayCamasDisponibles[i]));
			//<button type="button" class="btn btn-lg btn-danger" data-toggle="popover" title="Popover title" data-content="And here's some amazing content. It's very engaging. Right?">Click to toggle popover</button>
		}

		/*for (i = 0; i < cantidadCamasReservadas; i++) {
		  e.preventDefault();

		  var imagenCamaReservada = document.createElement('img');
		  var button = document.createElement('button');

		  imagenCamaReservada.src = "img/cama-am.png";

		  button.className = 'btn btn-outline-warning border border-warning p-2 my-1 mx-1';

		  contenedorCamas.appendChild(button);

		  button.appendChild(imagenCamaReservada);

		  //div.appendChild(document.createTextNode('Flex item'));
		}*/

		for (i = 0; i < cantidadCamasOcupadas; i++) {

			e.preventDefault();

			var imagenCamaOcupada = document.createElement('img');
			var button = document.createElement('button');

			imagenCamaOcupada.src = "img/cama-ro.png";

			button.className = 'btn btn-outline-danger border border-danger p-2 my-1 mx-1';

			contenedorCamas.appendChild(button);

			button.appendChild(imagenCamaOcupada);

			//div.appendChild(document.createTextNode('Flex item'));
		}

	};

	//Funcion para agregar camas disponibles
	function agregarCamasDisponibles(e) {
		for (i = 0; i < cantidadCamasDisponibles; i++) {

			e.preventDefault();

			var imagenCamaDisponible = document.createElement('img');
			var button = document.createElement('button');

			imagenCamaDisponible.src = "img/cama-ver.png";

			button.className = 'btn btn-outline-success border border-success p-2 my-1 mx-1';

			contenedorCamas.appendChild(button);

			button.appendChild(imagenCamaDisponible);

			//div.appendChild(document.createTextNode('Flex item'));
		}
	};

	//Funcion para agregar camas reservadas
	function agregarCamasReservadas(e) {

		for (i = 0; i < cantidadCamasReservadas; i++) {
			e.preventDefault();

			var imagenCamaReservada = document.createElement('img');
			var button = document.createElement('button');

			imagenCamaReservada.src = "img/cama-am.png";

			button.className = 'btn btn-outline-warning border border-warning p-2 my-1 mx-1';

			contenedorCamas.appendChild(button);

			button.appendChild(imagenCamaReservada);

			//div.appendChild(document.createTextNode('Flex item'));
		}
	};

	//Funcion para agregar camas ocupadas
	function agregarCamasOcupadas(e) {

		for (i = 0; i < cantidadCamas; i++) {

			e.preventDefault();

			var imagenCamaOcupada = document.createElement('img');
			var button = document.createElement('button');

			imagenCamaOcupada.src = "img/cama-ro.png";

			button.className = 'btn btn-outline-danger border border-danger p-2 my-1 mx-1';

			contenedorCamas.appendChild(button);

			button.appendChild(imagenCamaOcupada);

			//div.appendChild(document.createTextNode('Flex item'));
		}
	};
</script>
</body>
</html>
