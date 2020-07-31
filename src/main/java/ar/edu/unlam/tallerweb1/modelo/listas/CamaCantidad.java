package ar.edu.unlam.tallerweb1.modelo.listas;

import ar.edu.unlam.tallerweb1.modelo.Cama;

public class CamaCantidad {

	private Cama cama;
	private Long count;
	
	public CamaCantidad(Cama cama, Long count) {
		this.cama = cama;
		this.count = count;
	}

	public Cama getCama() {
		return cama;
	}

	public void setCama(Cama cama) {
		this.cama = cama;
	}
	
	public Long getCount() {
		return count;
	}

	public void setCount(Long count) {
		this.count = count;
	}

}
