package ar.edu.unlam.tallerweb1.servicios;

import java.util.List;

import ar.edu.unlam.tallerweb1.modelo.Piso;
import ar.edu.unlam.tallerweb1.modelo.Sector;

public interface ServicioSector {


    public void registrarSector(Sector sector);

    public void actualizarSector(Sector sector);
    
    public Sector buscarSectorPorId(Long id);

	public List<Sector> consultarSectoresPorPiso(Piso piso);
}