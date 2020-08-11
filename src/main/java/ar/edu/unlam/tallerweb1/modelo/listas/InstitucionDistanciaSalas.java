package ar.edu.unlam.tallerweb1.modelo.listas;


import java.util.Set;

import ar.edu.unlam.tallerweb1.modelo.Institucion;

public class InstitucionDistanciaSalas {

	private Institucion institucion;
	private Double distancia;
	private Set<SalaCantidad> listaSala;
	
	public InstitucionDistanciaSalas(Institucion institucion, Double distancia, Set<SalaCantidad> listaSala) {
		this.institucion = institucion;
		this.distancia = distancia;
		this.listaSala = listaSala;
	}

	public Institucion getInstitucion() {
		return institucion;
	}

	public void setInstitucion(Institucion institucion) {
		this.institucion = institucion;
	}

	public Double getDistancia() {
		return distancia;
	}

	public void setDistancia(Double distancia) {
		this.distancia = distancia;
	}

	public Set<SalaCantidad> getListaSala() {
		return listaSala;
	}

	public void setListaSala(Set<SalaCantidad> listaSala) {
		this.listaSala = listaSala;
	}
}
