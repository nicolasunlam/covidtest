package ar.edu.unlam.tallerweb1.modelo.listas;

import java.util.List;

import ar.edu.unlam.tallerweb1.modelo.Asignacion;
import ar.edu.unlam.tallerweb1.modelo.Paciente;

public class AsignacionPaciente {
	
	private Asignacion asignacion;
	private Paciente paciente;
	private List<String> enfermedades;
	
	public AsignacionPaciente(Asignacion asignacion, Paciente paciente) {
		this.asignacion = asignacion;
		this.paciente = paciente;
	}

	public AsignacionPaciente(Paciente paciente) {
		this.paciente = paciente;
	}
	
	public AsignacionPaciente() {
	}

	public Asignacion getAsignacion() {
		return asignacion;
	}

	public void setAsignacion(Asignacion asignacion) {
		this.asignacion = asignacion;
	}

	public Paciente getPaciente() {
		return paciente;
	}

	public void setPaciente(Paciente paciente) {
		this.paciente = paciente;
	}

	public List<String> getEnfermedades() {
		return enfermedades;
	}

	public void setEnfermedades(List<String> enfermedades) {
		this.enfermedades = enfermedades;
	}

}
