package ar.edu.unlam.tallerweb1.servicios.serviciosImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ar.edu.unlam.tallerweb1.modelo.Piso;
import ar.edu.unlam.tallerweb1.modelo.Sala;
import ar.edu.unlam.tallerweb1.modelo.Sector;
import ar.edu.unlam.tallerweb1.modelo.listas.PisoConSectores;
import ar.edu.unlam.tallerweb1.modelo.listas.SalaConCamas;
import ar.edu.unlam.tallerweb1.modelo.listas.SectorConSalas;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioPiso;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioSector;
import ar.edu.unlam.tallerweb1.servicios.ServicioSector;
import ar.edu.unlam.tallerweb1.servicios.ServicioSala;

@Service("servicioSector")
@Transactional
public class ServicioSectorImpl implements ServicioSector {

	@Autowired
	private RepositorioSector repositorioSector;

	@Autowired
	private ServicioSala servicioSala;

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

	@Override
	public SectorConSalas obtenerDetalleDeSector(Sector sector) {
		List<Sala> listaSalas = servicioSala.listarSalasPorSector(sector);
		List<SalaConCamas> listaSalasConDetalle = new ArrayList<SalaConCamas>();
		for (int i = 0; i < listaSalas.size(); i++) {
			listaSalasConDetalle.add(servicioSala.obtenerDetalleDeSala(listaSalas.get(i)));
		}

		SectorConSalas sectorConSalas = new SectorConSalas();
		sectorConSalas.setSector(sector);
		sectorConSalas.setListaDeSalas(listaSalasConDetalle);

		return sectorConSalas;
	}

}
