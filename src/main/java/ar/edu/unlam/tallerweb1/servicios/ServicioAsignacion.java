package ar.edu.unlam.tallerweb1.servicios;

import ar.edu.unlam.tallerweb1.modelo.Asignacion;
import ar.edu.unlam.tallerweb1.modelo.Institucion;
import ar.edu.unlam.tallerweb1.modelo.Paciente;
import ar.edu.unlam.tallerweb1.modelo.listas.AsignacionDistancia;
import ar.edu.unlam.tallerweb1.modelo.listas.AsignacionDoble;

import java.util.List;

public interface ServicioAsignacion {

    public Asignacion consultarAsignacionPacienteInternado(Paciente paciente);

    public void actualizarAsignacion(Asignacion asignacion);

    public Asignacion consultarAsignacionPorId(Long nro);

	public void eliminarAsignacion(Asignacion asignacion);

    List<Asignacion> obtenerAsignacionesActuales();

    /*-------------------------------- RESERVAS --------------------------------*/
    
	Asignacion consultarReservaAsignacionPaciente(Paciente paciente);

    /*--------- RESERVAS SOLICITADAS -------*/

	List<AsignacionDoble> reservasSolicitadasConAsignacionActualPorInstitucion(Institucion institucion);

	List<AsignacionDoble> reservasSolicitadasPorTrasladoConAsignacionActualPorInstitucion(Institucion institucion);

//	List<AsignacionDistancia> reservasSolicitadasPorInternacionPorInstitucion(
//			Institucion institucion);

    /*--------- RESERVAS A RECIBIR -------*/

	List<Asignacion> reservasARecibirPorInstitucion(Institucion institucion);

	List<AsignacionDoble> reservasARecibirPorTrasladoConAsignacionActualPorInstitucion(Institucion institucion);

	List<AsignacionDistancia> reservasARecibirPorInternacionPorInstitucion(Institucion institucion);

	List<AsignacionDoble> reservasARecibirConAsignacionActualPorInstitucion(Institucion institucion);

}
