package ar.edu.unlam.tallerweb1.servicios;

import java.util.List;

import ar.edu.unlam.tallerweb1.modelo.Institucion;
import ar.edu.unlam.tallerweb1.modelo.Piso;
import ar.edu.unlam.tallerweb1.modelo.Sala;
import ar.edu.unlam.tallerweb1.modelo.Sector;

public interface ServicioSala {


    public void registrarSala(Sala sala);

    public void actualizarSala(Sala sala);
    
    public Sala buscarSalaPorId(Long id);
    
	List<Sala> listarSalasPorSector(Sector sector);
}
