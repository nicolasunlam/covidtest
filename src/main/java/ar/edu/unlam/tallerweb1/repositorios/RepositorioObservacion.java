package ar.edu.unlam.tallerweb1.repositorios;

import ar.edu.unlam.tallerweb1.modelo.Observacion;

public interface RepositorioObservacion {

	void registrarObservacion(Observacion observacion);

    void actualizarObservacion (Observacion observacion);
}
