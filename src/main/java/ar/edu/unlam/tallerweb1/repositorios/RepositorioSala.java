package ar.edu.unlam.tallerweb1.repositorios;

import java.util.List;

import ar.edu.unlam.tallerweb1.modelo.Piso;
import ar.edu.unlam.tallerweb1.modelo.Sala;
import ar.edu.unlam.tallerweb1.modelo.Sector;

public interface RepositorioSala {

	void registrarSala(Sala sala);

	void actualizarSala(Sala sala);

	Sala buscarSalaPorId(Long id);

	List<Sala> listarSalasPorSector(Sector sector);

}
