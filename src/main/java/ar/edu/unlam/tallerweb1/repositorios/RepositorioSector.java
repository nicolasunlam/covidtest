package ar.edu.unlam.tallerweb1.repositorios;

import java.util.List;

import ar.edu.unlam.tallerweb1.modelo.Cama;
import ar.edu.unlam.tallerweb1.modelo.Piso;
import ar.edu.unlam.tallerweb1.modelo.Sector;

public interface RepositorioSector {

	void registrarSector(Sector sector);

	void actualizarSector(Sector sector);

	Sector buscarSectorPorId(Long id);

	List<Sector> consultarSectoresPorPiso(Piso piso);

	List<Cama> listarCamasDisponiblesPorSector(Sector sector);

	List<Cama> listarCamasReservadasPorSector(Sector sector);

	List<Cama> listarCamasOcupadasPorSector(Sector sector);
	
	

}
