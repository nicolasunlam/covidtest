package ar.edu.unlam.tallerweb1.modelo.listas.ordenar;

import java.util.Comparator;

import ar.edu.unlam.tallerweb1.modelo.listas.CamaConAsignacion;

public class OrdenarPorIdCama implements Comparator<CamaConAsignacion> {

	@Override
	public int compare(CamaConAsignacion cama1, CamaConAsignacion cama2) {
		return cama1.getCama().getId().compareTo(cama2.getCama().getId());
	}

}
