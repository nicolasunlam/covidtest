package ar.edu.unlam.tallerweb1.modelo.listas;

import java.util.List;

import ar.edu.unlam.tallerweb1.modelo.Piso;

public class PisoConSectores {

	private Piso piso;

	private List<SectorConSalas> listaDeSectores;

	public List<SectorConSalas> getListaDeSectores() {
		return listaDeSectores;
	}

	public void setListaDeSectores(List<SectorConSalas> listaDeSectores) {
		this.listaDeSectores = listaDeSectores;
	}

	public Piso getPiso() {
		return piso;
	}

	public void setPiso(Piso piso) {
		this.piso = piso;
	}

}
