package ar.edu.unlam.tallerweb1.servicios.serviciosImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ar.edu.unlam.tallerweb1.modelo.Asignacion;
import ar.edu.unlam.tallerweb1.modelo.Institucion;
import ar.edu.unlam.tallerweb1.modelo.Paciente;
import ar.edu.unlam.tallerweb1.modelo.listas.AsignacionDoble;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioAsignacion;
import ar.edu.unlam.tallerweb1.servicios.ServicioAsignacion;

@Service("servicioAsignacion")
@Transactional
public class ServicioAsignacionImpl implements ServicioAsignacion {

    @Autowired
    private RepositorioAsignacion repositorioAsignacion;


    @Override
    public Asignacion consultarAsignacionPacienteInternado(Paciente paciente) {

        return repositorioAsignacion.consultarAsignacionPacienteInternado(paciente);
    }

    @Override
    public void actualizarAsignacion(Asignacion asignacion) {

        repositorioAsignacion.actualizarAsignacion(asignacion);
    }
    

	@Override
	public void eliminarAsignacion(Asignacion asignacion) {
		 repositorioAsignacion.eliminarAsignacion(asignacion);	
		 }

    @Override
    public Asignacion consultarAsignacionPorId(Long nro) {

        return repositorioAsignacion.consultarAsignacionPorId(nro);
    }

    @Override
    public List<Asignacion> obtenerAsignacionesActuales() {
        return repositorioAsignacion.obtenerAsignacionesActuales();
    }

    @Override
    public Asignacion consultarReservaAsignacionPaciente(Paciente paciente) {

        return repositorioAsignacion.consultarReservaAsignacionPaciente(paciente);
    }

    @Override
    public List<Asignacion> asignacionesReservadasPorInstitucion(Institucion institucion) {

        return repositorioAsignacion.asignacionesReservadasPorInstitucion(institucion);
    }

    @Override
    public List<AsignacionDoble> asignacionesReservadasConAsignacionActualPorInstitucion(Institucion institucion) {

        return repositorioAsignacion.asignacionesReservadasConAsignacionActualPorInstitucion(institucion);
    }

}
