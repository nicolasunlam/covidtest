package ar.edu.unlam.tallerweb1.modelo.listas;

import java.util.List;

import ar.edu.unlam.tallerweb1.modelo.Cama;
import ar.edu.unlam.tallerweb1.modelo.Piso;
import ar.edu.unlam.tallerweb1.modelo.Sala;
import ar.edu.unlam.tallerweb1.modelo.Sector;

public class PisoDetallado {

	private Piso piso; 
	private List<Sector> listaSectores; 
	private List<Sala> listaSalas; 
	private List<Cama> listaCamasOcupadas;
	private List<Cama> listaCamasReservadas;
	private List<Cama> listaCamasDisponibles;
	
	public Piso getPiso() {
		return piso;
	}
	public void setPiso(Piso piso) {
		this.piso = piso;
	}
	public List<Sector> getListaSectores() {
		return listaSectores;
	}
	public void setListaSectores(List<Sector> listaSectores) {
		this.listaSectores = listaSectores;
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
