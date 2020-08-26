package ar.edu.unlam.tallerweb1.servicios;

import java.util.List;

import ar.edu.unlam.tallerweb1.modelo.Cama;
import ar.edu.unlam.tallerweb1.modelo.Piso;
import ar.edu.unlam.tallerweb1.modelo.Sector;
import ar.edu.unlam.tallerweb1.modelo.listas.SectorConSalas;

public interface ServicioSector {

	public void registrarSector(Sector sector);

	public void actualizarSector(Sector sector);

	public Sector buscarSectorPorId(Long id);

	public List<Sector> consultarSectoresPorPiso(Piso piso);

	public SectorConSalas obtenerDetalleDeSector(Sector sector);
	
	public List<Cama> listarCamasDisponiblesPorSector(Sector sector);

	public List<Cama> listarCamasReservadasPorSector(Sector sector);

	public List<Cama> listarCamasOcupadasPorSector(Sector sector);
}
