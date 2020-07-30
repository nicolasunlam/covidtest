<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>Disponibilidad De Camas</title>

<jsp:include page="../../partial/${armarHeader}2.jsp" />

<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">

	<div class="container m-5">

		<h2 class="pb-2 mb-3 border-bottom">Disponibilidad De Camas
			Prueba</h2>
		<br>
		<div>

			<h6 class="">PASO 1: Elegir la cama en donde internar</h6>

		</div>
		<br>

		<h1 class="text-center">Camas</h1>

		<div class="container-fluid d-flex flex-row flex-wrap w-75 my-3"
			id="contenedorCamas"></div>

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
<script>window.jQuery || document.write('<script src="../assets/js/vendor/jquery.slim.min.js"><\/script>')</script>
<script src="../assets/dist/js/bootstrap.bundle.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.9.0/feather.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
<script src="js/dashboard.js"></script>
<script>

    var cantidadCamasDisponibles = ${cantidadCamasDisponibles};
    //var cantidadCamasReservadas = 3;
    var cantidadCamasOcupadas = ${cantidadCamasOcupadas};

    var contenedorCamas = document.getElementById('contenedorCamas');

    //Funcion "automática" para crear todas las camas de una

    window.onload = agregarCamas;

    //Funcion para agregar todas las camas
    function agregarCamas(e) {
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

  </script>
</body>
</html>
