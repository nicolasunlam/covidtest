package ar.edu.unlam.tallerweb1.modelo.listas;

import java.util.List;

import ar.edu.unlam.tallerweb1.modelo.Sala;

public class SalaCantidad {

	//Una sala, es decir un tipo de sala.
	private Sala sala;
	//Cantidad de camas para ese tipo de sala.
	private Long cantidad;
	//Lista de camas con su tipo y cantidad para ese tipo de sala.
	private List<CamaCantidad> listaCama;
	
	public SalaCantidad(Sala sala, Long cantidad, List<CamaCantidad> listaCama) {
		this.sala = sala;
		this.cantidad = cantidad;
		this.listaCama = listaCama;
	}
	
	public SalaCantidad(Sala sala, Long cantidad) {
		this.sala = sala;
		this.cantidad = cantidad;
	}

	public Sala getSala() {
		return sala;
	}

	public void setSala(Sala sala) {
		this.sala = sala;
	}

	public Long getCantidad() {
		return cantidad;
	}

	public void setCantidad(Long cantidad) {
		this.cantidad = cantidad;
	}

	public List<CamaCantidad> getListaCama() {
		return listaCama;
	}

	public void setListaCama(List<CamaCantidad> listaCama) {
		this.listaCama = listaCama;
	}

}
