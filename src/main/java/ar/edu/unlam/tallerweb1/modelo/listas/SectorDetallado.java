package ar.edu.unlam.tallerweb1.modelo.listas;

import java.util.List;

import ar.edu.unlam.tallerweb1.modelo.Cama;
import ar.edu.unlam.tallerweb1.modelo.Sala;
import ar.edu.unlam.tallerweb1.modelo.Sector;

public class SectorDetallado {

	private Sector sector;
	private List<Sala> listaSalas; 
	private List<Cama> listaCamasOcupadas;
	private List<Cama> listaCamasReservadas;
	private List<Cama> listaCamasDisponibles;
	
	public Sector getSector() {
		return sector;
	}
	public void setSector(Sector sector) {
		this.sector = sector;
	}
	public List<Sala> getListaSalas() {
		return listaSalas;
	}
	public void setListaSalas(List<Sala> listaSalas) {
		this.listaSalas = listaSalas;
	}
	public List<Cama> getListaCamasOcupadas() {
		return listaCamasOcupadas;
	}
	public void setListaCamasOcupadas(List<Cama> listaCamasOcupadas) {
		this.listaCamasOcupadas = listaCamasOcupadas;
	}
	public List<Cama> getListaCamasReservadas() {
		return listaCamasReservadas;
	}
	public void setListaCamasReservadas(List<Cama> listaCamasReservadas) {
		this.listaCamasReservadas = listaCamasReservadas;
	}
	public List<Cama> getListaCamasDisponibles() {
		return listaCamasDisponibles;
	}
	public void setListaCamasDisponibles(List<Cama> listaCamasDisponibles) {
		this.listaCamasDisponibles = listaCamasDisponibles;
	}

}
