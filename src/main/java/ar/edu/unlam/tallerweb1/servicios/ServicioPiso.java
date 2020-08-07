package ar.edu.unlam.tallerweb1.servicios;

import ar.edu.unlam.tallerweb1.modelo.Piso;

public interface ServicioPiso {

    public void registrarPiso(Piso piso);

    public void actualizarPiso(Piso piso);
    
    public Piso buscarPisoPorId(Long id);

}
