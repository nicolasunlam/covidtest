package ar.edu.unlam.tallerweb1.servicios;

import java.util.List;

import ar.edu.unlam.tallerweb1.modelo.Institucion;
import ar.edu.unlam.tallerweb1.modelo.Paciente;
import ar.edu.unlam.tallerweb1.modelo.Usuario;
import ar.edu.unlam.tallerweb1.modelo.listas.UsuarioDistancia;

public interface ServicioMapa {

	public Double calcularDistanciaEntreDosPuntos(Double latitud1, Double longitud1, Double latitud2, Double longitud2);

	public Institucion calcularInstitucionMasCercana(Paciente paciente);

	List<UsuarioDistancia> calcularDistanciaDeUsuarioAInsituciones(Usuario usuario);

}
