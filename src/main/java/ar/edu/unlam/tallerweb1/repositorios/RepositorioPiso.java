package ar.edu.unlam.tallerweb1.repositorios;

import ar.edu.unlam.tallerweb1.modelo.Piso;

public interface RepositorioPiso {

    void registrarPiso(Piso piso);

    void actualizarPiso(Piso piso);

	Piso buscarPisoPorId(Long id);
}
