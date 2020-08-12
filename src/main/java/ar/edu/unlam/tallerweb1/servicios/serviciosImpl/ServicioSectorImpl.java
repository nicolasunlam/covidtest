package ar.edu.unlam.tallerweb1.servicios.serviciosImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ar.edu.unlam.tallerweb1.modelo.Piso;
import ar.edu.unlam.tallerweb1.modelo.Sector;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioPiso;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioSector;
import ar.edu.unlam.tallerweb1.servicios.ServicioSector;


@Service("servicioSector")
@Transactional
public class ServicioSectorImpl implements ServicioSector {
	
	@Autowired
    private RepositorioSector repositorioSector;

	@Override
    public void registrarSector(Sector sector) {
        repositorioSector.registrarSector(sector);
    }

    @Override
    public void actualizarSector(Sector sector) {
        repositorioSector.actualizarSector(sector);
    }


    @Override
	public Sector buscarSectorPorId(Long id) {
		return repositorioSector.buscarSectorPorId(id);
	}

	@Override
	public List<Sector> consultarSectoresPorPiso(Piso piso) {
		return repositorioSector.consultarSectoresPorPiso(piso);
	}




}
