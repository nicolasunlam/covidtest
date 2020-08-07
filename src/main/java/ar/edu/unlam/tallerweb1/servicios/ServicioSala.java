package ar.edu.unlam.tallerweb1.servicios;

import ar.edu.unlam.tallerweb1.modelo.Piso;
import ar.edu.unlam.tallerweb1.modelo.Sala;

public interface ServicioSala {


    public void registrarSala(Sala sala);

    public void actualizarSala(Sala sala);
    
    public Sala buscarSalaPorId(Long id);
}
