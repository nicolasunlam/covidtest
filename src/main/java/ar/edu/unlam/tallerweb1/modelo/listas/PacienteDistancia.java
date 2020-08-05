package ar.edu.unlam.tallerweb1.modelo.listas;

import ar.edu.unlam.tallerweb1.modelo.Paciente;
import ar.edu.unlam.tallerweb1.modelo.Usuario;

public class PacienteDistancia {

	private Usuario usuario;
	private Double distancia;

	public PacienteDistancia(Usuario paciente, Double distancia) {

		this.usuario = paciente;
		this.distancia = distancia;
	}

	public Usuario getPaciente() {
		return usuario;
	}

	public void setPaciente(Usuario paciente) {
		this.usuario = paciente;
	}

	public Double getDistancia() {
		return distancia;
	}

	public void setDistancia(Double distancia) {
		this.distancia = distancia;
	}

}
