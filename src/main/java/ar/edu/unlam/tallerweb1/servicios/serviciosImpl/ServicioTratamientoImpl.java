package ar.edu.unlam.tallerweb1.servicios.serviciosImpl;

import ar.edu.unlam.tallerweb1.modelo.Tratamiento;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioTratamiento;
import ar.edu.unlam.tallerweb1.servicios.ServicioTratamiento;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ServicioTratamientoImpl implements ServicioTratamiento {

    @Autowired
    private RepositorioTratamiento repositorioTratamiento;

	@Override
	public void registrarTratamiento(Tratamiento tratamiento) {
		repositorioTratamiento.registrarTratamiento(tratamiento);
		
	}

	@Override
	public void actualizarTratamiento(Tratamiento tratamiento) {
		repositorioTratamiento.actualizarTratamiento(tratamiento);
	}


}
