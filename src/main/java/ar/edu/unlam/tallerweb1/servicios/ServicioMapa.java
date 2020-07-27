package ar.edu.unlam.tallerweb1.servicios;

import ar.edu.unlam.tallerweb1.modelo.Institucion;
import ar.edu.unlam.tallerweb1.modelo.Paciente;

public interface ServicioMapa {

	public Double calcularDistanciaEntreDosPuntos(Double latitud1, Double longitud1, Double latitud2, Double longitud2);

	public Institucion calcularInstitucionMasCercana(Paciente paciente);

}
