package ar.edu.unlam.tallerweb1.modelo.listas;

import java.util.List;

import ar.edu.unlam.tallerweb1.modelo.Sala;
import ar.edu.unlam.tallerweb1.modelo.Sector;

public class SectorConSalas {

	private Sector sector;

	private List<SalaConCamas> listaDeSalas;

	public List<SalaConCamas> getListaDeSalas() {
		return listaDeSalas;
	}

	public void setListaDeSalas(List<SalaConCamas> listaSalasConDetalle) {
		this.listaDeSalas = listaSalasConDetalle;
	}

	public Sector getSector() {
		return sector;
	}

	public void setSector(Sector sector) {
		this.sector = sector;
	}

}
