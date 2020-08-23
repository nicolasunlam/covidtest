package ar.edu.unlam.tallerweb1.servicios.serviciosImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ar.edu.unlam.tallerweb1.modelo.Asignacion;
import ar.edu.unlam.tallerweb1.modelo.Institucion;
import ar.edu.unlam.tallerweb1.modelo.Paciente;
import ar.edu.unlam.tallerweb1.modelo.listas.AsignacionDistancia;
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

    /*----------------------------------- RESERVAS ----------------------------------*/

    @Override
    public Asignacion consultarReservaAsignacionPaciente(Paciente paciente) {

        return repositorioAsignacion.consultarReservaAsignacionPaciente(paciente);
    }

    /*-------- RESERVAS A SOLICITADAS ----------*/

	@Override
	public List<AsignacionDoble> reservasSolicitadasConAsignacionActualPorInstitucion(Institucion institucion) {
		 return repositorioAsignacion.reservasSolicitadasConAsignacionActualPorInstitucion(institucion);
	}

	@Override
	public List<AsignacionDoble> reservasSolicitadasPorTrasladoConAsignacionActualPorInstitucion(
			Institucion institucion) {
		 return repositorioAsignacion.reservasSolicitadasPorTrasladoConAsignacionActualPorInstitucion(institucion);
	}

//	@Override
//	public List<AsignacionDistancia> reservasSolicitadasPorInternacionPorInstitucion(
//			Institucion institucion) {
//		 return repositorioAsignacion.reservasSolicitadasPorInternacionPorInstitucion(institucion);
//	}

    /*-------- RESERVAS A RECIBIR ----------*/

	@Override
	public List<Asignacion> reservasARecibirPorInstitucion(Institucion institucion) {
		 return repositorioAsignacion.reservasARecibirPorInstitucion(institucion);
	}

	@Override
	public List<AsignacionDoble> reservasARecibirPorTrasladoConAsignacionActualPorInstitucion(Institucion institucion) {
		 return repositorioAsignacion.reservasARecibirPorTrasladoConAsignacionActualPorInstitucion(institucion);
	}

	@Override
	public List<AsignacionDistancia> reservasARecibirPorInternacionPorInstitucion(
			Institucion institucion) {
		 return repositorioAsignacion.reservasARecibirPorInternacionPorInstitucion(institucion);
	}

	@Override
	public List<AsignacionDoble> reservasARecibirConAsignacionActualPorInstitucion(Institucion institucion) {
		 return repositorioAsignacion.reservasARecibirConAsignacionActualPorInstitucion(institucion);
	}

}
