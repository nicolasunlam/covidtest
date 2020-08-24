package ar.edu.unlam.tallerweb1.repositorios;

import ar.edu.unlam.tallerweb1.modelo.Asignacion;
import ar.edu.unlam.tallerweb1.modelo.Institucion;
import ar.edu.unlam.tallerweb1.modelo.Paciente;
import ar.edu.unlam.tallerweb1.modelo.listas.AsignacionDistancia;
import ar.edu.unlam.tallerweb1.modelo.listas.AsignacionDoble;

import java.util.List;

public interface RepositorioAsignacion {

    Asignacion consultarAsignacionPacienteInternado(Paciente paciente);

    void actualizarAsignacion(Asignacion asignacion);

	void eliminarAsignacion(Asignacion asignacion);

    Asignacion consultarAsignacionPorId(Long nro);

    List<Asignacion> obtenerAsignacionesActuales();

	Asignacion consultarReservaAsignacionPaciente(Paciente paciente);

	List<Asignacion> reservasARecibirPorInstitucion(Institucion institucion);

	List<AsignacionDoble> reservasSolicitadasConAsignacionActualPorInstitucion(Institucion institucion);

	List<AsignacionDoble> reservasSolicitadasPorTrasladoConAsignacionActualPorInstitucion(Institucion institucion);

//	List<AsignacionDistancia> reservasSolicitadasPorInternacionPorInstitucion(
//			Institucion institucion);

	List<AsignacionDoble> reservasARecibirPorTrasladoConAsignacionActualPorInstitucion(Institucion institucion);

	List<AsignacionDistancia> reservasARecibirPorInternacionPorInstitucion(Institucion institucion);

	List<AsignacionDoble> reservasARecibirConAsignacionActualPorInstitucion(Institucion institucion);

}
