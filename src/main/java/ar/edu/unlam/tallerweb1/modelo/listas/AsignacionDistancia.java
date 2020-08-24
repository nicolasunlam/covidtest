package ar.edu.unlam.tallerweb1.modelo.listas;

import ar.edu.unlam.tallerweb1.modelo.Asignacion;

public class AsignacionDistancia {
	
	private Asignacion asignacion;
	private Double distancia;
	
	public AsignacionDistancia(Asignacion asignacion, Double distancia) {
		this.asignacion = asignacion;
		this.distancia = distancia;
	}

	public AsignacionDistancia(Asignacion asignacion) {
		this.asignacion = asignacion;
	}

	public Asignacion getAsignacion() {
		return asignacion;
	}

	void setAsignacion(Asignacion asignacion) {
		this.asignacion = asignacion;
	}

	public Double getDistancia() {
		return distancia;
	}

	public void setDistancia(Double distancia) {
		this.distancia = distancia;
	}

}
