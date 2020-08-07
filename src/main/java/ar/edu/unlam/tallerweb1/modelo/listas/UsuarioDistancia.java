package ar.edu.unlam.tallerweb1.modelo.listas;

import ar.edu.unlam.tallerweb1.modelo.Usuario;

public class UsuarioDistancia {

	private Usuario usuario;
	private Double distancia;

	public UsuarioDistancia(Usuario usuario, Double distancia) {

		this.usuario = usuario;
		this.distancia = distancia;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Double getDistancia() {
		return distancia;
	}

	public void setDistancia(Double distancia) {
		this.distancia = distancia;
	}

}
