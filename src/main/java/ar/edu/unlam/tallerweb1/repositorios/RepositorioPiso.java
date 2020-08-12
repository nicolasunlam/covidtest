package ar.edu.unlam.tallerweb1.repositorios;

import java.util.List;

import ar.edu.unlam.tallerweb1.modelo.Institucion;
import ar.edu.unlam.tallerweb1.modelo.Piso;

public interface RepositorioPiso {

	void registrarPiso(Piso piso);

	void actualizarPiso(Piso piso);

	Piso buscarPisoPorId(Long id);

	List<Piso> listarPisosPorInstitucion(Institucion institucion);
}
