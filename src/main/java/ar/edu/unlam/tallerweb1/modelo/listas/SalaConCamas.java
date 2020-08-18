package ar.edu.unlam.tallerweb1.modelo.listas;

import java.util.List;

import ar.edu.unlam.tallerweb1.modelo.Sala;

public class SalaConCamas {

	private Sala sala;

	private List<CamaConAsignacion> listaDeCamasConAsignacion;

	public List<CamaConAsignacion> getListaDeCamasConAsignacion() {
		return listaDeCamasConAsignacion;
	}

	public void setListaDeCamasConAsignacion(List<CamaConAsignacion> listaDeCamasConAsignacion) {
		this.listaDeCamasConAsignacion = listaDeCamasConAsignacion;
	}

	public Sala getSala() {
		return sala;
	}

	public void setSala(Sala sala) {
		this.sala = sala;
	}

}
