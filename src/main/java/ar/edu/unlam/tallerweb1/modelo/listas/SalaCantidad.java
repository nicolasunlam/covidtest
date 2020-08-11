package ar.edu.unlam.tallerweb1.modelo.listas;

import ar.edu.unlam.tallerweb1.modelo.Sala;

public class SalaCantidad {

	private Sala sala;
	private Long cantidad;
	
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

}
