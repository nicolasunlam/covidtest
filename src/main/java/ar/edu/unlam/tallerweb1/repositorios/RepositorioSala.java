package ar.edu.unlam.tallerweb1.repositorios;

import ar.edu.unlam.tallerweb1.modelo.Piso;
import ar.edu.unlam.tallerweb1.modelo.Sala;

public interface RepositorioSala {

	void registrarSala(Sala sala);

	void actualizarSala(Sala sala);

	Sala buscarSalaPorId(Long id);

}
