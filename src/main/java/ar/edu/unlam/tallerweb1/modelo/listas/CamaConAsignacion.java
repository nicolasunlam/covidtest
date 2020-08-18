package ar.edu.unlam.tallerweb1.modelo.listas;

import ar.edu.unlam.tallerweb1.modelo.Asignacion;
import ar.edu.unlam.tallerweb1.modelo.Cama;

public class CamaConAsignacion {	

	public CamaConAsignacion(Cama cama, Asignacion asignacion) {
		super();
		this.cama = cama;
		this.asignacion = asignacion;
	}

	private Cama cama;

	private Asignacion asignacion;

	public Cama getCama() {
		return cama;
	}

	public void setCama(Cama cama) {
		this.cama = cama;
	}

	public Asignacion getAsignacion() {
		return asignacion;
	}

	public void setAsignacion(Asignacion asignacion) {
		this.asignacion = asignacion;
	}

}
