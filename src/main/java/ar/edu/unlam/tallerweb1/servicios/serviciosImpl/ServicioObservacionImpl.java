package ar.edu.unlam.tallerweb1.servicios.serviciosImpl;

import ar.edu.unlam.tallerweb1.modelo.Observacion;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioObservacion;
import ar.edu.unlam.tallerweb1.servicios.ServicioObservacion;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ServicioObservacionImpl implements ServicioObservacion {

    @Autowired
    private RepositorioObservacion repositorioObservacion;

	@Override
	public void registrarObservacion(Observacion observacion) {
		repositorioObservacion.registrarObservacion(observacion);
		
	}

	@Override
	public void actualizarObservacion(Observacion observacion) {
		repositorioObservacion.actualizarObservacion(observacion);
	}


}
