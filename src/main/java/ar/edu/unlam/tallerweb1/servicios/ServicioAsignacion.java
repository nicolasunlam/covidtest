package ar.edu.unlam.tallerweb1.servicios;

import ar.edu.unlam.tallerweb1.modelo.Asignacion;
import ar.edu.unlam.tallerweb1.modelo.Institucion;
import ar.edu.unlam.tallerweb1.modelo.Paciente;
import ar.edu.unlam.tallerweb1.modelo.listas.AsignacionDoble;

import java.util.List;

public interface ServicioAsignacion {

    public Asignacion consultarAsignacionPacienteInternado(Paciente paciente);

    public void actualizarAsignacion(Asignacion asignacion);

    public Asignacion consultarAsignacionPorId(Long nro);

	public void eliminarAsignacion(Asignacion asignacion);

    List<Asignacion> obtenerAsignacionesActuales();

	Asignacion consultarReservaAsignacionPaciente(Paciente paciente);

	List<Asignacion> asignacionesReservadasPorInstitucion(Institucion institucion);

	List<AsignacionDoble> asignacionesReservadasConAsignacionActualPorInstitucion(Institucion institucion);

}
