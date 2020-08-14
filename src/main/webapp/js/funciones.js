th = document.getElementsByTagName('th');

for (let c = 0; c < th.length; c++) {
	th[c].addEventListener('click', item(c))
}

function item(c) {

	return function() {
		sortTable(c)
	}
}

function sortTable(c) {
	var table, rows, switching, i, x, y, shouldSwitch;
	table = document.getElementById("myTable");
	switching = true;

	while (switching) {

		switching = false;
		rows = table.rows;

		for (i = 1; i < (rows.length - 1); i++) {
			
			shouldSwitch = false;

			x = rows[i].getElementsByTagName("TD")[c];
			y = rows[i + 1].getElementsByTagName("TD")[c];
			
			if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
				shouldSwitch = true;
				break;
			}
		}
		if (shouldSwitch) {
			rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
			switching = true;
		}
	}
}

function mostrarInfo(checkActivador, idNoTiene, idContenedorOculto) {
	
	var noTiene = document.getElementById(idNoTiene);
	var contenedorOculto = document.getElementById(idContenedorOculto);

	if (checkActivador.checked == true) {
		noTiene.hidden = true;
		contenedorOculto.hidden = false;
	} else {
		noTiene.hidden = false;
		contenedorOculto.hidden = true;
	}
}

function activarBotones(checkActivador, idBoton1, idBoton2){
	var boton1 = document.getElementById(idBoton1);
	var boton2 = document.getElementById(idBoton2);
	if(checkActivador.checked == true){
		boton1.disabled = false;
		boton2.disabled = false;
	}else{
		boton1.disabled= true;
		boton2.disabled = true;
	}
}