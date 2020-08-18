package ar.edu.unlam.tallerweb1.servicios;

import java.util.List;

import ar.edu.unlam.tallerweb1.modelo.Institucion;
import ar.edu.unlam.tallerweb1.modelo.Sala;
import ar.edu.unlam.tallerweb1.modelo.Sector;
import ar.edu.unlam.tallerweb1.modelo.listas.SalaCantidad;
import ar.edu.unlam.tallerweb1.modelo.listas.SalaConCamas;

public interface ServicioSala {

	public void registrarSala(Sala sala);

	public void actualizarSala(Sala sala);

	public Sala buscarSalaPorId(Long id);

	List<Sala> listarSalasPorSector(Sector sector);

	List<SalaCantidad> obtenerSalasConCantidadDeCamasDisponiblesDeUnaInstitucion(Institucion institucion);

	public SalaConCamas obtenerDetalleDeSala(Sala sala);
}
