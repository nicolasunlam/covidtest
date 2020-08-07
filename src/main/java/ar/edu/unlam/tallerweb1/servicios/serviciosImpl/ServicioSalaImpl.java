package ar.edu.unlam.tallerweb1.servicios.serviciosImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ar.edu.unlam.tallerweb1.modelo.Piso;
import ar.edu.unlam.tallerweb1.modelo.Sala;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioSala;
import ar.edu.unlam.tallerweb1.servicios.ServicioSala;

@Service("servicioSala")
@Transactional
public class ServicioSalaImpl implements ServicioSala {
	
	@Autowired
	RepositorioSala repositorioSala;

	@Override
	public void registrarSala(Sala sala) {
		repositorioSala.registrarSala(sala);
		

	}

	@Override
	public void actualizarSala(Sala sala) {
		repositorioSala.actualizarSala(sala);

	}

	@Override
	public Sala buscarSalaPorId(Long id) {
	
		return repositorioSala.buscarSalaPorId(id);
	}

}
