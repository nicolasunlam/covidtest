package ar.edu.unlam.tallerweb1.modelo.listas.ordenar;

import java.util.Comparator;

import ar.edu.unlam.tallerweb1.modelo.listas.SalaCantidad;

public class OrdenarPorPrioridad implements Comparator<SalaCantidad> {

	@Override
	public int compare(SalaCantidad o1, SalaCantidad o2) {
		return o1.getSala().getTipoSala().getPrioridad().compareTo(o2.getSala().getTipoSala().getPrioridad());
	}

}
